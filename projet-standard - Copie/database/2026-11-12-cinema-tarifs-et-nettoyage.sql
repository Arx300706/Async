-- =====================================================================
-- Module cinema : tarifs par categorie de place
-- A executer avec ARBIOCHEMSTANDARD apres 2026-11-11-module-cinema.sql.
-- Les films, salles et seances du programme du 16/11/2026 au 30/11/2026
-- sont ensuite crees par le programme Java de chargement (ils passent par
-- les controles metier : licence, chevauchement, plan de salle).
-- =====================================================================
SET DEFINE OFF;

-- ---------------------------------------------------------------------
-- 1. Categories de place (aucune nouvelle table : produits AS_INGREDIENTS)
--    LIBELLE = categorie, PV = prix du billet, REFERENCE = rangees concernees,
--    COULEUR = couleur sur le plan de salle
-- ---------------------------------------------------------------------
MERGE INTO CATEGORIEINGREDIENT t USING (SELECT 'CATPLACE' id, 'Categorie de place' val, 'Tarif cinema selon la rangee' desce FROM dual) s
ON (t.id = s.id) WHEN NOT MATCHED THEN INSERT (id, val, desce, estachat, actif) VALUES (s.id, s.val, s.desce, 0, 1);

MERGE INTO AS_INGREDIENTS t
USING (SELECT 'IGPLACESTD' id, 'Standard' libelle, 15000 pv, 'AB' rangees, '#f1efe8' couleur FROM dual
       UNION ALL SELECT 'IGPLACECONF', 'Confort', 20000, 'C', '#e1f5ee' FROM dual
       UNION ALL SELECT 'IGPLACEVIP', 'VIP', 30000, 'D', '#faeeda' FROM dual) s
ON (t.id = s.id)
WHEN MATCHED THEN UPDATE SET t.libelle = s.libelle, t.pv = s.pv, t.reference = s.rangees, t.couleur = s.couleur
WHEN NOT MATCHED THEN INSERT (id, libelle, pv, reference, couleur, categorieingredient, actif, isvente, isachat, tva, daty)
VALUES (s.id, s.libelle, s.pv, s.rangees, s.couleur, 'CATPLACE', 1, 1, 0, 0, TRUNC(SYSDATE));

CREATE OR REPLACE VIEW V_TARIF_PLACE AS
SELECT ID, LIBELLE, PV, UPPER(REFERENCE) AS RANGEES, COULEUR, NVL(ACTIF, 1) AS ACTIF
  FROM AS_INGREDIENTS
 WHERE CATEGORIEINGREDIENT = 'CATPLACE';

-- Menu : tarifs des places
MERGE INTO MENUDYNAMIQUE m
USING (SELECT 'MENDYNCINE12' id, 'Tarifs des places' libelle, 'sell' icone,
              'module.jsp?but=cinema/tarif-liste.jsp&currentMenu=MENDYNCINE12' href, 11 rang, 2 niveau, 'MENDYNCINEMA' id_pere FROM dual) s
ON (m.id = s.id)
WHEN MATCHED THEN UPDATE SET m.libelle = s.libelle, m.icone = s.icone, m.href = s.href, m.rang = s.rang
WHEN NOT MATCHED THEN INSERT (id, libelle, icone, href, rang, niveau, id_pere)
VALUES (s.id, s.libelle, s.icone, s.href, s.rang, s.niveau, s.id_pere);

MERGE INTO USERMENU t
USING (SELECT 'UMMENDYNCINE12' AS ID, 'MENDYNCINE12' AS IDMENU FROM dual) s
ON (t.ID = s.ID)
WHEN NOT MATCHED THEN INSERT (ID, REFUSER, IDMENU, IDROLE, INTERDIT) VALUES (s.ID, '*', s.IDMENU, NULL, 0);

-- ---------------------------------------------------------------------
-- 2. (Retire) L'ancien nettoyage annulait toutes les seances a venir : il est remplace par
--    2026-11-12-cinema-garder-uniquement-programme.sql. Ce script peut donc etre rejoue sans risque.
-- ---------------------------------------------------------------------
COMMIT;
