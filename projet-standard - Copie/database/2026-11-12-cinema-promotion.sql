-- =====================================================================
-- Module cinema : promotion soiree
--   Les seances qui commencent a partir de 20h00 ont 50 % de reduction sur le billet.
-- Aucune nouvelle table : produit AS_INGREDIENTS de categorie CATPROMO
--   LIBELLE = nom, REFERENCE = heure de debut (HH:MM), PV = pourcentage de reduction, ACTIF = 1/0.
-- A executer avec ARBIOCHEMSTANDARD. Rejouable.
-- =====================================================================
SET DEFINE OFF;

MERGE INTO CATEGORIEINGREDIENT t USING (SELECT 'CATPROMO' id, 'Promotion cinema' val, 'Reduction selon l heure de la seance' desce FROM dual) s
ON (t.id = s.id) WHEN NOT MATCHED THEN INSERT (id, val, desce, estachat, actif) VALUES (s.id, s.val, s.desce, 0, 1);

MERGE INTO AS_INGREDIENTS t
USING (SELECT 'IGPROMOSOIR' id, 'Promotion soiree' libelle, '20:00' heure, 50 taux FROM dual) s
ON (t.id = s.id)
WHEN NOT MATCHED THEN INSERT (id, libelle, reference, pv, categorieingredient, actif, isvente, isachat, tva, daty)
VALUES (s.id, s.libelle, s.heure, s.taux, 'CATPROMO', 1, 0, 0, 0, TRUNC(SYSDATE));

-- Promotions : HEUREDEBUT au format HH:MM, TAUX en %
CREATE OR REPLACE VIEW V_PROMOTION_CINEMA AS
SELECT ID, LIBELLE, REFERENCE AS HEUREDEBUT, PV AS TAUX, NVL(ACTIF, 1) AS ACTIF
  FROM AS_INGREDIENTS
 WHERE CATEGORIEINGREDIENT = 'CATPROMO';

COMMIT;
