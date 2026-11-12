-- =====================================================================
-- Module Salle de cinema
-- Aucune nouvelle table : lignes de parametrage + vues uniquement.
-- A executer avec l'utilisateur ARBIOCHEMSTANDARD.
-- =====================================================================
SET DEFINE OFF;

-- ---------------------------------------------------------------------
-- 1. Parametrage
-- ---------------------------------------------------------------------
MERGE INTO TYPEFOURNISSEUR t USING (SELECT 'TPFCINE' id, 'Distributeur film' val, 'Distributeur de films (droits de diffusion)' desce FROM dual) s
ON (t.id = s.id) WHEN NOT MATCHED THEN INSERT (id, val, desce) VALUES (s.id, s.val, s.desce);

MERGE INTO TYPEMAGASIN t USING (SELECT 'TYPMGSALLE' id, 'Salle cinema' val, 'Salle de projection' desce FROM dual) s
ON (t.id = s.id) WHEN NOT MATCHED THEN INSERT (id, val, desce) VALUES (s.id, s.val, s.desce);

MERGE INTO CATEGORIEINGREDIENT t USING (SELECT 'CATFILM' id, 'Film' val, 'Film (droits de diffusion)' desce FROM dual) s
ON (t.id = s.id) WHEN NOT MATCHED THEN INSERT (id, val, desce, estachat, actif) VALUES (s.id, s.val, s.desce, 1, 1);

MERGE INTO TYPEMAINTENANCE t USING (SELECT 'TMSEANCE' id, 'Seance cinema' val, 'Seance de projection (module cinema)' desce FROM dual) s
ON (t.id = s.id) WHEN NOT MATCHED THEN INSERT (id, val, desce) VALUES (s.id, s.val, s.desce);

MERGE INTO CLIENT t USING (SELECT 'CLIPASSAGE' id, 'Client passage' nom FROM dual) s
ON (t.id = s.id) WHEN NOT MATCHED THEN INSERT (id, nom, compte, estactif, actif) VALUES (s.id, s.nom, '411000', 1, 1);
UPDATE CLIENT SET COMPTE = '411000' WHERE ID = 'CLIPASSAGE' AND COMPTE IS NULL;

-- Magasin de reception des copies de films (DCP)
MERGE INTO MAGASIN2 t USING (SELECT 'MAGSTOCKFILM' id, 'Stock films' val FROM dual) s
ON (t.id = s.id) WHEN NOT MATCHED THEN INSERT (id, val, desce, idtypemagasin, actif) VALUES (s.id, s.val, 'Reception des copies de films', 'TYPMG000002', 1);

COMMIT;

-- ---------------------------------------------------------------------
-- 2. Licences (contrat = bon de commande vise, un seul film)
--    debut des droits = date du premier bon de livraison vise
--    fin des droits   = AS_BONDECOMMANDE.DATELIMITE
--    seances achetees = AS_BONDECOMMANDE_FILLE.QUANTITE
-- ---------------------------------------------------------------------
CREATE OR REPLACE VIEW V_FILM_LICENCE AS
SELECT bc.ID                              AS ID,
       bc.ID                              AS IDBC,
       bc.REFERENCE                       AS REFERENCE,
       bc.DATY                            AS DATECONTRAT,
       bc.FOURNISSEUR                     AS IDFOURNISSEUR,
       f.NOM                              AS FOURNISSEURLIB,
       bf.PRODUIT                         AS IDFILM,
       i.LIBELLE                          AS FILMLIB,
       bl.DATEDEBUT                       AS DATEDEBUTDROITS,
       bc.DATELIMITE                      AS DATEFINDROITS,
       bf.SEANCES                         AS SEANCESACHETEES,
       NVL(p.NB, 0)                       AS SEANCESPROGRAMMEES,
       bf.SEANCES - NVL(p.NB, 0)          AS SEANCESRESTANTES,
       bf.MONTANT                         AS MONTANTACHAT,
       CASE
           WHEN bl.DATEDEBUT IS NULL                 THEN 'EN ATTENTE'
           WHEN TRUNC(SYSDATE) > bc.DATELIMITE       THEN 'EXPIREE'
           WHEN bf.SEANCES - NVL(p.NB, 0) <= 0       THEN 'EPUISEE'
           WHEN TRUNC(SYSDATE) < bl.DATEDEBUT        THEN 'A VENIR'
           ELSE 'ACTIVE'
       END                                AS STATUT
FROM AS_BONDECOMMANDE bc
JOIN (SELECT IDBC, MIN(PRODUIT) PRODUIT, SUM(QUANTITE) SEANCES, SUM(QUANTITE * NVL(PU, 0)) MONTANT
        FROM AS_BONDECOMMANDE_FILLE
       GROUP BY IDBC
      HAVING COUNT(DISTINCT PRODUIT) = 1) bf ON bf.IDBC = bc.ID
JOIN AS_INGREDIENTS i ON i.ID = bf.PRODUIT AND i.CATEGORIEINGREDIENT = 'CATFILM'
LEFT JOIN FOURNISSEUR f ON f.ID = bc.FOURNISSEUR
LEFT JOIN (SELECT IDBC, MIN(DATY) DATEDEBUT FROM AS_BONDELIVRAISON WHERE ETAT >= 11 GROUP BY IDBC) bl ON bl.IDBC = bc.ID
LEFT JOIN (SELECT IDSOURCE, COUNT(*) NB FROM PLANNING
            WHERE IDTYPEMAINTENANCE = 'TMSEANCE' AND ETAT IN (1, 11)
            GROUP BY IDSOURCE) p ON p.IDSOURCE = bc.ID
WHERE bc.ETAT >= 11;

-- Tous les contrats de films (meme non vises) avec reception et facture liees
CREATE OR REPLACE VIEW V_CONTRAT_FILM AS
SELECT bc.ID,
       bc.REFERENCE,
       bc.DESIGNATION,
       bc.DATY,
       bc.DATELIMITE,
       bc.FOURNISSEUR,
       f.NOM                               AS FOURNISSEURLIB,
       bc.ETAT,
       CASE WHEN bc.ETAT = 0 THEN 'ANNULE' WHEN bc.ETAT >= 11 THEN 'VISE' ELSE 'CREE' END AS ETATLIB,
       bf.PRODUIT                          AS IDFILM,
       i.LIBELLE                           AS FILMLIB,
       bf.SEANCES                          AS SEANCESACHETEES,
       bf.PU                               AS PU,
       bf.MONTANT                          AS MONTANT,
       bl.ID                               AS IDRECEPTION,
       bl.DATY                             AS DATEDEBUTDROITS,
       ff.ID                               AS IDFACTURE,
       l.STATUT                            AS STATUTLICENCE
FROM AS_BONDECOMMANDE bc
JOIN (SELECT IDBC, MIN(PRODUIT) PRODUIT, SUM(QUANTITE) SEANCES, MAX(PU) PU, SUM(QUANTITE * NVL(PU, 0)) MONTANT
        FROM AS_BONDECOMMANDE_FILLE GROUP BY IDBC) bf ON bf.IDBC = bc.ID
JOIN AS_INGREDIENTS i ON i.ID = bf.PRODUIT AND i.CATEGORIEINGREDIENT = 'CATFILM'
LEFT JOIN FOURNISSEUR f ON f.ID = bc.FOURNISSEUR
LEFT JOIN (SELECT IDBC, MIN(ID) ID, MIN(DATY) DATY FROM AS_BONDELIVRAISON WHERE ETAT >= 11 GROUP BY IDBC) bl ON bl.IDBC = bc.ID
LEFT JOIN (SELECT IDBC, MAX(ID) ID FROM FACTUREFOURNISSEUR WHERE ETAT >= 1 AND IDBC IS NOT NULL GROUP BY IDBC) ff ON ff.IDBC = bc.ID
LEFT JOIN V_FILM_LICENCE l ON l.IDBC = bc.ID;

-- ---------------------------------------------------------------------
-- 3. Seances (PLANNING filtre sur le type SEANCE CINEMA)
-- ---------------------------------------------------------------------
CREATE OR REPLACE VIEW V_SEANCE_CINEMA_LIB AS
SELECT p.ID,
       p.REFOBJET                         AS IDFILM,
       i.LIBELLE                          AS FILMLIB,
       i.PHOTO                            AS PHOTO,
       i.DURRE                            AS DURRE,
       i.PV                               AS PRIXBILLET,
       i.MARQUE                           AS REALISATEUR,
       i.STYLE                            AS GENRE,
       i.SOUSCATEGORIE                    AS CLASSIFICATION,
       p.IDMACHINE                        AS IDSALLE,
       m.VAL                              AS SALLELIB,
       NVL(m.CAPACITE, 0)                 AS CAPACITE,
       NVL(m.COMPTEUR, 0)                 AS PLACESPARRANGEE,
       p.DATEDEBUT,
       p.HEURE,
       p.DUREE,
       p.DATEFIN,
       p.ETAT,
       CASE p.ETAT WHEN 0 THEN 'ANNULEE' WHEN 1 THEN 'CREEE' WHEN 11 THEN 'PROGRAMMEE' END AS ETATLIB,
       p.IDSOURCE                         AS IDCONTRAT,
       bc.FOURNISSEUR                     AS IDDISTRIBUTEUR,
       f.NOM                              AS DISTRIBUTEURLIB,
       TO_DATE(TO_CHAR(p.DATEDEBUT, 'YYYY-MM-DD') || ' ' || p.HEURE, 'YYYY-MM-DD HH24:MI') AS DATEHEUREDEBUT,
       TO_DATE(TO_CHAR(p.DATEDEBUT, 'YYYY-MM-DD') || ' ' || p.HEURE, 'YYYY-MM-DD HH24:MI')
           + NVL(TO_NUMBER(p.DUREE), 0) / 1440 AS DATEHEUREFIN
FROM PLANNING p
LEFT JOIN AS_INGREDIENTS i    ON i.ID = p.REFOBJET
LEFT JOIN MAGASIN2 m          ON m.ID = p.IDMACHINE
LEFT JOIN AS_BONDECOMMANDE bc ON bc.ID = p.IDSOURCE
LEFT JOIN FOURNISSEUR f       ON f.ID = bc.FOURNISSEUR
WHERE p.IDTYPEMAINTENANCE = 'TMSEANCE';

CREATE OR REPLACE VIEW V_SEANCE_PLACES_RESERVEES AS
SELECT rd.IDPRODUIT AS IDSEANCE,
       SUM(rd.QTE)  AS PLACESRESERVEES
FROM RESERVATIONDETAILS rd
JOIN RESERVATION r ON r.ID = rd.IDMERE
JOIN PLANNING p    ON p.ID = rd.IDPRODUIT AND p.IDTYPEMAINTENANCE = 'TMSEANCE'
WHERE r.ETAT IN (1, 11)
  AND NVL(rd.ETAT, 1) <> 0
GROUP BY rd.IDPRODUIT;

CREATE OR REPLACE VIEW V_SEANCE_PLACES_DISPO AS
SELECT s.*,
       NVL(r.PLACESRESERVEES, 0)                   AS PLACESRESERVEES,
       s.CAPACITE - NVL(r.PLACESRESERVEES, 0)      AS PLACESDISPO,
       CASE WHEN s.CAPACITE > 0
            THEN ROUND(NVL(r.PLACESRESERVEES, 0) / s.CAPACITE * 100, 2)
            ELSE 0 END                             AS TAUXREMPLISSAGE,
       s.FILMLIB || ' - ' || TO_CHAR(s.DATEHEUREDEBUT, 'DD/MM/YYYY HH24:MI') || ' - ' || s.SALLELIB
           || ' (' || (s.CAPACITE - NVL(r.PLACESRESERVEES, 0)) || ' places)' AS SEANCELIB
FROM V_SEANCE_CINEMA_LIB s
LEFT JOIN V_SEANCE_PLACES_RESERVEES r ON r.IDSEANCE = s.ID;

-- Films qui vont etre diffuses
CREATE OR REPLACE VIEW V_FILMS_A_VENIR AS
SELECT s.IDFILM                AS ID,
       s.IDFILM                AS IDFILM,
       MAX(s.FILMLIB)          AS FILMLIB,
       MAX(s.PHOTO)            AS PHOTO,
       MAX(s.DURRE)            AS DURRE,
       MAX(s.PRIXBILLET)       AS PRIXBILLET,
       MAX(s.REALISATEUR)      AS REALISATEUR,
       MAX(s.GENRE)            AS GENRE,
       MAX(s.CLASSIFICATION)   AS CLASSIFICATION,
       COUNT(*)                AS NBSEANCES,
       MIN(s.DATEHEUREDEBUT)   AS PROCHAINESEANCE,
       TO_CHAR(MIN(s.DATEHEUREDEBUT), 'DD/MM/YYYY HH24:MI') AS PROCHAINESEANCELIB,
       SUM(s.PLACESDISPO)      AS PLACESDISPO
FROM V_SEANCE_PLACES_DISPO s
WHERE s.ETAT = 11
  AND s.DATEHEUREDEBUT >= SYSDATE
GROUP BY s.IDFILM;

-- ---------------------------------------------------------------------
-- 4. Reservations
-- ---------------------------------------------------------------------
CREATE OR REPLACE VIEW V_RESERVATION_CINEMA_LIB AS
SELECT rd.ID,
       rd.IDMERE,
       r.IDCLIENT,
       c.NOM                    AS CLIENTLIB,
       r.DATY                   AS DATERESERVATION,
       r.ETAT                   AS ETATRESERVATION,
       CASE r.ETAT WHEN 0 THEN 'ANNULEE' WHEN 1 THEN 'CREEE' WHEN 11 THEN 'VISEE' END AS ETATLIB,
       rd.IDPRODUIT             AS IDSEANCE,
       s.IDFILM,
       s.FILMLIB,
       s.IDSALLE,
       s.SALLELIB,
       s.DATEDEBUT,
       s.HEURE,
       s.DATEHEUREDEBUT,
       rd.REMARQUE              AS PLACE,
       rd.QTE,
       rd.PU,
       rd.QTE * NVL(rd.PU, 0)   AS MONTANT
FROM RESERVATIONDETAILS rd
JOIN RESERVATION r          ON r.ID = rd.IDMERE
JOIN V_SEANCE_CINEMA_LIB s  ON s.ID = rd.IDPRODUIT
LEFT JOIN CLIENT c          ON c.ID = r.IDCLIENT;

-- Une ligne par reservation de cinema, avec paye / reste a payer
CREATE OR REPLACE VIEW V_RESERVATION_CINEMA AS
SELECT r.ID,
       r.IDCLIENT,
       c.NOM                                  AS CLIENTLIB,
       r.DATY,
       r.REMARQUE,
       r.ETAT,
       CASE r.ETAT WHEN 0 THEN 'ANNULEE' WHEN 1 THEN 'CREEE' WHEN 11 THEN 'VISEE' END AS ETATLIB,
       d.NBPLACES,
       d.MONTANT,
       NVL(m.PAYE, 0)                         AS PAYE,
       d.MONTANT - NVL(m.PAYE, 0)             AS RESTEAPAYER
FROM RESERVATION r
JOIN (SELECT rd.IDMERE, SUM(rd.QTE) NBPLACES, SUM(rd.QTE * NVL(rd.PU, 0)) MONTANT
        FROM RESERVATIONDETAILS rd
        JOIN PLANNING p ON p.ID = rd.IDPRODUIT AND p.IDTYPEMAINTENANCE = 'TMSEANCE'
       WHERE NVL(rd.ETAT, 1) <> 0
       GROUP BY rd.IDMERE) d ON d.IDMERE = r.ID
LEFT JOIN CLIENT c ON c.ID = r.IDCLIENT
LEFT JOIN (SELECT IDOP, SUM(NVL(CREDIT, 0)) PAYE FROM MOUVEMENTCAISSE
            WHERE ETAT >= 11 AND IDOP IS NOT NULL GROUP BY IDOP) m ON m.IDOP = r.ID;

-- ---------------------------------------------------------------------
-- 5. Rentabilite par film
-- ---------------------------------------------------------------------
CREATE OR REPLACE VIEW V_RENTABILITE_FILM AS
SELECT i.ID,
       i.ID                                        AS IDFILM,
       i.LIBELLE                                   AS FILMLIB,
       NVL(l.COUT, 0)                              AS COUTACHAT,
       NVL(v.RECETTE, 0)                           AS RECETTE,
       NVL(v.RECETTE, 0) - NVL(l.COUT, 0)          AS MARGE,
       NVL(v.SPECTATEURS, 0)                       AS SPECTATEURS,
       NVL(s.NBSEANCES, 0)                         AS NBSEANCES
FROM AS_INGREDIENTS i
LEFT JOIN (SELECT IDFILM, SUM(MONTANTACHAT) COUT FROM V_FILM_LICENCE GROUP BY IDFILM) l ON l.IDFILM = i.ID
LEFT JOIN (SELECT IDFILM, SUM(MONTANT) RECETTE, SUM(QTE) SPECTATEURS
             FROM V_RESERVATION_CINEMA_LIB WHERE ETATRESERVATION = 11 GROUP BY IDFILM) v ON v.IDFILM = i.ID
LEFT JOIN (SELECT REFOBJET, COUNT(*) NBSEANCES FROM PLANNING
            WHERE IDTYPEMAINTENANCE = 'TMSEANCE' AND ETAT = 11 GROUP BY REFOBJET) s ON s.REFOBJET = i.ID
WHERE i.CATEGORIEINGREDIENT = 'CATFILM';

-- ---------------------------------------------------------------------
-- 6. Le module maintenance ne doit pas afficher les seances
-- ---------------------------------------------------------------------
DECLARE
    v VARCHAR2(32767);
BEGIN
    SELECT TEXT INTO v FROM USER_VIEWS WHERE VIEW_NAME = 'PLANNING_CPL';
    IF INSTR(v, 'TMSEANCE') = 0 THEN
        v := REPLACE(v, CHR(10) || 'GROUP BY P.ID',
                     CHR(10) || 'WHERE NVL(P.IDTYPEMAINTENANCE, ''-'') <> ''TMSEANCE''' || CHR(10) || 'GROUP BY P.ID');
        EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW PLANNING_CPL AS ' || v;
    END IF;
END;
/

-- ---------------------------------------------------------------------
-- 7. Menu
-- ---------------------------------------------------------------------
MERGE INTO MENUDYNAMIQUE m
USING (
    SELECT 'MENDYNCINEMA' id, 'Cinema' libelle, 'movie' icone, '#' href, 9 rang, 1 niveau, CAST(NULL AS VARCHAR2(50)) id_pere FROM dual
    UNION ALL SELECT 'MENDYNCINE01', 'Distributeurs', 'local_shipping', 'module.jsp?but=cinema/distributeur-liste.jsp&currentMenu=MENDYNCINE01', 1, 2, 'MENDYNCINEMA' FROM dual
    UNION ALL SELECT 'MENDYNCINE02', 'Contrats de films', 'contract', 'module.jsp?but=cinema/contrat-liste.jsp&currentMenu=MENDYNCINE02', 2, 2, 'MENDYNCINEMA' FROM dual
    UNION ALL SELECT 'MENDYNCINE03', 'Licences', 'verified', 'module.jsp?but=cinema/licence-liste.jsp&currentMenu=MENDYNCINE03', 3, 2, 'MENDYNCINEMA' FROM dual
    UNION ALL SELECT 'MENDYNCINE04', 'Salles', 'meeting_room', 'module.jsp?but=cinema/salle-liste.jsp&currentMenu=MENDYNCINE04', 4, 2, 'MENDYNCINEMA' FROM dual
    UNION ALL SELECT 'MENDYNCINE05', 'Films', 'theaters', 'module.jsp?but=cinema/film-liste.jsp&currentMenu=MENDYNCINE05', 5, 2, 'MENDYNCINEMA' FROM dual
    UNION ALL SELECT 'MENDYNCINE06', 'Seances', 'schedule', 'module.jsp?but=cinema/seance-liste.jsp&currentMenu=MENDYNCINE06', 6, 2, 'MENDYNCINEMA' FROM dual
    UNION ALL SELECT 'MENDYNCINE07', 'Reservations', 'confirmation_number', 'module.jsp?but=cinema/reservation-liste.jsp&currentMenu=MENDYNCINE07', 7, 2, 'MENDYNCINEMA' FROM dual
    UNION ALL SELECT 'MENDYNCINE08', 'Programme', 'event', 'module.jsp?but=cinema/programme.jsp&currentMenu=MENDYNCINE08', 8, 2, 'MENDYNCINEMA' FROM dual
    UNION ALL SELECT 'MENDYNCINE09', 'Places disponibles', 'event_seat', 'module.jsp?but=cinema/places-dispo.jsp&currentMenu=MENDYNCINE09', 9, 2, 'MENDYNCINEMA' FROM dual
    UNION ALL SELECT 'MENDYNCINE10', 'Rentabilite', 'trending_up', 'module.jsp?but=cinema/rentabilite-film.jsp&currentMenu=MENDYNCINE10', 10, 2, 'MENDYNCINEMA' FROM dual
) s
ON (m.id = s.id)
WHEN MATCHED THEN UPDATE SET m.libelle = s.libelle, m.icone = s.icone, m.href = s.href, m.rang = s.rang, m.niveau = s.niveau, m.id_pere = s.id_pere
WHEN NOT MATCHED THEN INSERT (id, libelle, icone, href, rang, niveau, id_pere)
VALUES (s.id, s.libelle, s.icone, s.href, s.rang, s.niveau, s.id_pere);

COMMIT;
-- Autorisation d'affichage du menu Cinema (le menu n'affiche que les entrees presentes dans USERMENU)
MERGE INTO USERMENU t
USING (SELECT 'UM' || m.ID AS ID, m.ID AS IDMENU FROM MENUDYNAMIQUE m WHERE m.ID = 'MENDYNCINEMA' OR m.ID_PERE = 'MENDYNCINEMA') s
ON (t.ID = s.ID)
WHEN NOT MATCHED THEN INSERT (ID, REFUSER, IDMENU, IDROLE, INTERDIT) VALUES (s.ID, '*', s.IDMENU, NULL, 0);

COMMIT;

-- =====================================================================
-- 8. Plan de salle : places numerotees
--    MAGASIN2.COMPTEUR = nombre de places par rangee (rangees A, B, C ...)
--    RESERVATIONDETAILS.REMARQUE = code de la place (ex. C7), QTE = 1
-- =====================================================================
CREATE OR REPLACE VIEW V_SEANCE_PLACES_OCCUPEES AS
SELECT rd.IDPRODUIT AS IDSEANCE,
       rd.REMARQUE  AS PLACE,
       rd.IDMERE    AS IDRESERVATION,
       r.ETAT       AS ETATRESERVATION,
       r.IDCLIENT
FROM RESERVATIONDETAILS rd
JOIN RESERVATION r ON r.ID = rd.IDMERE
JOIN PLANNING p    ON p.ID = rd.IDPRODUIT AND p.IDTYPEMAINTENANCE = 'TMSEANCE'
WHERE r.ETAT IN (1, 11)
  AND NVL(rd.ETAT, 1) <> 0
  AND rd.REMARQUE IS NOT NULL;

-- Disposition par defaut des salles existantes : 10 places par rangee
UPDATE MAGASIN2 SET COMPTEUR = LEAST(10, CAPACITE)
 WHERE IDTYPEMAGASIN = 'TYPMGSALLE' AND NVL(COMPTEUR, 0) <= 0 AND CAPACITE > 0;

-- =====================================================================
-- 9. Caisses du cinema (avec compte comptable, obligatoire pour encaisser)
-- =====================================================================
MERGE INTO COMPTA_COMPTE t
USING (SELECT 'COMCCINE01' id, '530101' compte, 'CAISSE CINEMA GUICHET 1' libelle FROM dual
       UNION ALL SELECT 'COMCCINE02', '530102', 'CAISSE CINEMA GUICHET 2' FROM dual
       UNION ALL SELECT 'COMCCINE03', '530103', 'CAISSE CINEMA MOBILE MONEY' FROM dual) s
ON (t.compte = s.compte)
WHEN NOT MATCHED THEN INSERT (id, compte, libelle, typecompte, classy, idjournal)
VALUES (s.id, s.compte, s.libelle, '1', '5', 'COMP000075');

MERGE INTO CAISSE t
USING (SELECT 'CAICINE01' id, 'Caisse Cinema Guichet 1' val, 'CINEMA' desce, 'TCA003' idtypecaisse, 'CTC003' idcategoriecaisse, '530101' compte FROM dual
       UNION ALL SELECT 'CAICINE02', 'Caisse Cinema Guichet 2', 'CINEMA', 'TCA003', 'CTC003', '530102' FROM dual
       UNION ALL SELECT 'CAICINE03', 'Caisse Cinema Mobile Money', 'CINEMA', 'TCA002', 'CTC004', '530103' FROM dual) s
ON (t.id = s.id)
WHEN NOT MATCHED THEN INSERT (id, val, desce, idtypecaisse, idpoint, etat, idcategoriecaisse, compte, iddevise, estrib, actif)
VALUES (s.id, s.val, s.desce, s.idtypecaisse, 'PNT000084', 11, s.idcategoriecaisse, s.compte, 'AR', 0, 1);

-- =====================================================================
-- 10. Menu : vente de billets sur plan de salle
-- =====================================================================
MERGE INTO MENUDYNAMIQUE m
USING (SELECT 'MENDYNCINE11' id, 'Vente de billets' libelle, 'event_seat' icone,
              'module.jsp?but=cinema/reservation-places.jsp&currentMenu=MENDYNCINE11' href, 0 rang, 2 niveau, 'MENDYNCINEMA' id_pere FROM dual) s
ON (m.id = s.id)
WHEN MATCHED THEN UPDATE SET m.libelle = s.libelle, m.icone = s.icone, m.href = s.href, m.rang = s.rang, m.niveau = s.niveau, m.id_pere = s.id_pere
WHEN NOT MATCHED THEN INSERT (id, libelle, icone, href, rang, niveau, id_pere)
VALUES (s.id, s.libelle, s.icone, s.href, s.rang, s.niveau, s.id_pere);

MERGE INTO USERMENU t
USING (SELECT 'UM' || m.ID AS ID, m.ID AS IDMENU FROM MENUDYNAMIQUE m WHERE m.ID = 'MENDYNCINEMA' OR m.ID_PERE = 'MENDYNCINEMA') s
ON (t.ID = s.ID)
WHEN NOT MATCHED THEN INSERT (ID, REFUSER, IDMENU, IDROLE, INTERDIT) VALUES (s.ID, '*', s.IDMENU, NULL, 0);

COMMIT;
