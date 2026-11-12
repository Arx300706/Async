-- =====================================================================
-- Module cinema : effacer les donnees de test
--   - toutes les reservations de cinema (et leurs places)
--   - leurs paiements (mouvements de caisse) et les ecritures comptables de ces paiements
--   - les factures des billets (FACTURECLIENT / FACTURECLIENTDETAILS)
--   - les factures des distributeurs des contrats de films, leurs paiements et ecritures
-- Conserve : films, salles, tarifs, caisses, contrats, receptions, seances.
-- Les ensembles sont memorises AVANT les suppressions.
-- A executer avec ARBIOCHEMSTANDARD. IRREVERSIBLE.
-- =====================================================================
SET SERVEROUTPUT ON;

DECLARE
    TYPE t_ids IS TABLE OF VARCHAR2(100);
    v_resa t_ids;   -- reservations de cinema
    v_mvt  t_ids;   -- paiements (billets + distributeurs)
    v_ecr  t_ids;   -- ecritures comptables de ces paiements et des factures distributeurs
    v_fcb  t_ids;   -- factures des billets
    v_fcf  t_ids;   -- factures des distributeurs
    PROCEDURE info(p VARCHAR2, n NUMBER) IS BEGIN DBMS_OUTPUT.PUT_LINE(RPAD(p, 42) || n); END;
BEGIN
    SELECT DISTINCT rd.IDMERE BULK COLLECT INTO v_resa
      FROM RESERVATIONDETAILS rd JOIN PLANNING p ON p.ID = rd.IDPRODUIT AND p.IDTYPEMAINTENANCE = 'TMSEANCE';
    SELECT f.ID BULK COLLECT INTO v_fcb
      FROM FACTURECLIENT f WHERE f.IDRESERVATION IN (SELECT rd.IDMERE FROM RESERVATIONDETAILS rd
                                                      JOIN PLANNING p ON p.ID = rd.IDPRODUIT AND p.IDTYPEMAINTENANCE = 'TMSEANCE');
    SELECT f.ID BULK COLLECT INTO v_fcf
      FROM FACTUREFOURNISSEUR f WHERE f.IDBC IN (SELECT ID FROM V_CONTRAT_FILM);
    SELECT m.ID BULK COLLECT INTO v_mvt
      FROM MOUVEMENTCAISSE m
     WHERE m.IDOP IN (SELECT rd.IDMERE FROM RESERVATIONDETAILS rd JOIN PLANNING p ON p.ID = rd.IDPRODUIT AND p.IDTYPEMAINTENANCE = 'TMSEANCE')
        OR m.IDORIGINE IN (SELECT ID FROM FACTUREFOURNISSEUR WHERE IDBC IN (SELECT ID FROM V_CONTRAT_FILM));
    SELECT e.ID BULK COLLECT INTO v_ecr
      FROM COMPTA_ECRITURE e
     WHERE e.IDOBJET IN (SELECT m.ID FROM MOUVEMENTCAISSE m
                          WHERE m.IDOP IN (SELECT rd.IDMERE FROM RESERVATIONDETAILS rd JOIN PLANNING p ON p.ID = rd.IDPRODUIT AND p.IDTYPEMAINTENANCE = 'TMSEANCE')
                             OR m.IDORIGINE IN (SELECT ID FROM FACTUREFOURNISSEUR WHERE IDBC IN (SELECT ID FROM V_CONTRAT_FILM)))
        OR e.IDOBJET IN (SELECT ID FROM FACTUREFOURNISSEUR WHERE IDBC IN (SELECT ID FROM V_CONTRAT_FILM));

    -- 1. Ecritures comptables (paiements + factures distributeurs visees)
    FORALL i IN 1 .. v_ecr.COUNT DELETE FROM COMPTA_SOUS_ECRITURE WHERE IDMERE = v_ecr(i);
    info('Sous-ecritures comptables', SQL%ROWCOUNT);
    FORALL i IN 1 .. v_ecr.COUNT DELETE FROM COMPTA_ECRITURE WHERE ID = v_ecr(i);
    info('Ecritures comptables', SQL%ROWCOUNT);

    -- 2. Paiements
    FORALL i IN 1 .. v_mvt.COUNT DELETE FROM LIAISONPAIEMENT WHERE ID1 = v_mvt(i);
    FORALL i IN 1 .. v_mvt.COUNT DELETE FROM MVTCAISSEPREVISION WHERE ID1 = v_mvt(i);
    FORALL i IN 1 .. v_mvt.COUNT DELETE FROM MOUVEMENTCAISSE WHERE ID = v_mvt(i);
    info('Paiements (mouvements de caisse)', SQL%ROWCOUNT);

    -- 3. Factures des billets
    FORALL i IN 1 .. v_fcb.COUNT DELETE FROM FACTURECLIENTDETAILS WHERE IDFACTURECLIENT = v_fcb(i);
    FORALL i IN 1 .. v_fcb.COUNT DELETE FROM FACTURECLIENT WHERE ID = v_fcb(i);
    info('Factures des billets', SQL%ROWCOUNT);

    -- 4. Factures des distributeurs (les receptions restent, sans lien de facture)
    FORALL i IN 1 .. v_fcf.COUNT DELETE FROM LIAISONPAIEMENT WHERE ID2 = v_fcf(i);
    FORALL i IN 1 .. v_fcf.COUNT UPDATE AS_BONDELIVRAISON SET IDFACTUREFOURNISSEUR = NULL WHERE IDFACTUREFOURNISSEUR = v_fcf(i);
    FORALL i IN 1 .. v_fcf.COUNT DELETE FROM FACTUREFOURNISSEURFILLE WHERE IDFACTUREFOURNISSEUR = v_fcf(i);
    FORALL i IN 1 .. v_fcf.COUNT DELETE FROM FACTUREFOURNISSEUR WHERE ID = v_fcf(i);
    info('Factures des distributeurs', SQL%ROWCOUNT);

    -- 5. Reservations et places
    FORALL i IN 1 .. v_resa.COUNT DELETE FROM RESERVATIONDETAILS WHERE IDMERE = v_resa(i);
    info('Places reservees / vendues', SQL%ROWCOUNT);
    FORALL i IN 1 .. v_resa.COUNT DELETE FROM RESERVATION WHERE ID = v_resa(i);
    info('Reservations', SQL%ROWCOUNT);

    COMMIT;
END;
/

-- Verification (tout doit etre a 0, sauf les seances, films et contrats)
SELECT 'Reservations cinema' AS QUOI, COUNT(*) AS NB FROM V_RESERVATION_CINEMA
UNION ALL SELECT 'Places occupees', COUNT(*) FROM V_SEANCE_PLACES_OCCUPEES
UNION ALL SELECT 'Factures billets', COUNT(*) FROM V_FACTURE_BILLET
UNION ALL SELECT 'Factures distributeurs', COUNT(*) FROM FACTUREFOURNISSEUR WHERE IDBC IN (SELECT ID FROM V_CONTRAT_FILM)
UNION ALL SELECT 'Films', COUNT(*) FROM AS_INGREDIENTS WHERE CATEGORIEINGREDIENT = 'CATFILM'
UNION ALL SELECT 'Seances', COUNT(*) FROM PLANNING WHERE IDTYPEMAINTENANCE = 'TMSEANCE';
