SET DEFINE OFF;

MERGE INTO MENUDYNAMIQUE m
USING (
    SELECT 'MENDYN_PREVISION_AVICOLE' id,
           'Calendrier avicole' libelle,
           'calendar_month' icone,
           'module.jsp?but=previsionFerme/prevision-avicole.jsp&currentMenu=MENDYN_PREVISION_AVICOLE' href,
           7 rang,
           2 niveau,
           'MENDYN1787645470804268' id_pere
    FROM dual
) source
ON (m.id = source.id)
WHEN MATCHED THEN UPDATE SET
    m.libelle = source.libelle,
    m.icone = source.icone,
    m.href = source.href,
    m.rang = source.rang,
    m.niveau = source.niveau,
    m.id_pere = source.id_pere
WHEN NOT MATCHED THEN INSERT (id, libelle, icone, href, rang, niveau, id_pere)
VALUES (source.id, source.libelle, source.icone, source.href, source.rang, source.niveau, source.id_pere);

COMMIT;
