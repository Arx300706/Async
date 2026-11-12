-- =====================================================================
-- Module cinema : factures des billets vendus
-- Aucune nouvelle table : FACTURECLIENT (IDRESERVATION = reservation) et
-- FACTURECLIENTDETAILS (une ligne par billet : IDPRODUIT = seance).
-- A executer avec ARBIOCHEMSTANDARD apres 2026-11-11-module-cinema.sql.
-- =====================================================================
SET DEFINE OFF;

-- Numerotation (les sequences SEQFACTURECLIENT / SEQFACTURECLIENTDETAILS existent deja)
CREATE OR REPLACE FUNCTION GETSEQFACTURECLIENT RETURN NUMBER IS
   retour NUMBER;
BEGIN
   SELECT SEQFACTURECLIENT.NEXTVAL INTO retour FROM DUAL;
   RETURN retour;
END;
/

CREATE OR REPLACE FUNCTION GETSEQFACTURECLIENTDETAILS RETURN NUMBER IS
   retour NUMBER;
BEGIN
   SELECT SEQFACTURECLIENTDETAILS.NEXTVAL INTO retour FROM DUAL;
   RETURN retour;
END;
/

-- Produits factures (FACTURECLIENTDETAILS.IDPRODUIT doit exister dans PRODUIT) :
-- un produit par categorie de place (meme ID que le tarif) + un billet generique (place non numerotee)
MERGE INTO PRODUIT t
USING (SELECT ID, 'Billet ' || LIBELLE AS VAL, PV FROM V_TARIF_PLACE
       UNION ALL SELECT 'BILLETCINEMA', 'Billet cinema', 15000 FROM dual) s
ON (t.ID = s.ID)
WHEN MATCHED THEN UPDATE SET t.VAL = s.VAL, t.PUVENTE = s.PV
WHEN NOT MATCHED THEN INSERT (ID, VAL, DESCE, PUVENTE, ISVENTE, ISACHAT) VALUES (s.ID, s.VAL, 'Module cinema', s.PV, 1, 0);

-- Une ligne par facture de billets : montant, paye (paiements de la reservation), reste
CREATE OR REPLACE VIEW V_FACTURE_BILLET AS
SELECT f.ID,
       f.DATY,
       f.IDRESERVATION,
       f.IDCLIENT,
       c.NOM                                   AS CLIENTLIB,
       f.DESIGNATION,
       f.ETAT,
       CASE f.ETAT WHEN 0 THEN 'ANNULEE' WHEN 11 THEN 'EMISE' ELSE 'CREEE' END AS ETATLIB,
       NVL(d.NBBILLETS, 0)                     AS NBBILLETS,
       NVL(d.MONTANT, 0)                       AS MONTANT,
       NVL(r.PAYE, 0)                          AS PAYE,
       NVL(d.MONTANT, 0) - NVL(r.PAYE, 0)      AS RESTEAPAYER
FROM FACTURECLIENT f
JOIN V_RESERVATION_CINEMA r ON r.ID = f.IDRESERVATION
LEFT JOIN CLIENT c ON c.ID = f.IDCLIENT
LEFT JOIN (SELECT IDFACTURECLIENT, SUM(QTE) AS NBBILLETS, SUM(QTE * NVL(PU, 0)) AS MONTANT
             FROM FACTURECLIENTDETAILS GROUP BY IDFACTURECLIENT) d ON d.IDFACTURECLIENT = f.ID;

-- Une ligne par billet facture
CREATE OR REPLACE VIEW V_FACTURE_BILLET_LIB AS
SELECT d.ID,
       d.IDFACTURECLIENT,
       d.IDPRODUIT,
       p.VAL                  AS PRODUITLIB,
       d.DESIGNATION,
       d.QTE,
       d.PU,
       d.QTE * NVL(d.PU, 0)   AS MONTANT
FROM FACTURECLIENTDETAILS d
LEFT JOIN PRODUIT p ON p.ID = d.IDPRODUIT
WHERE d.IDFACTURECLIENT IN (SELECT ID FROM V_FACTURE_BILLET);

-- Menu : factures
MERGE INTO MENUDYNAMIQUE m
USING (SELECT 'MENDYNCINE13' id, 'Factures' libelle, 'receipt_long' icone,
              'module.jsp?but=cinema/facture-liste.jsp&currentMenu=MENDYNCINE13' href, 12 rang, 2 niveau, 'MENDYNCINEMA' id_pere FROM dual) s
ON (m.id = s.id)
WHEN MATCHED THEN UPDATE SET m.libelle = s.libelle, m.icone = s.icone, m.href = s.href, m.rang = s.rang
WHEN NOT MATCHED THEN INSERT (id, libelle, icone, href, rang, niveau, id_pere)
VALUES (s.id, s.libelle, s.icone, s.href, s.rang, s.niveau, s.id_pere);

MERGE INTO USERMENU t
USING (SELECT 'UMMENDYNCINE13' AS ID, 'MENDYNCINE13' AS IDMENU FROM dual) s
ON (t.ID = s.ID)
WHEN NOT MATCHED THEN INSERT (ID, REFUSER, IDMENU, IDROLE, INTERDIT) VALUES (s.ID, '*', s.IDMENU, NULL, 0);

COMMIT;
