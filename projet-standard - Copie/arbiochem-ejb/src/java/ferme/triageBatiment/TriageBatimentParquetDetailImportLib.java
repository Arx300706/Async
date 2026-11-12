package ferme.triageBatiment;

/** Lecture des lignes de remplissage et de la capacite restante. */
public class TriageBatimentParquetDetailImportLib extends TriageBatimentParquetDetail {
    private String idBatimentLib, idParquetLib, idSexeLib;
    private double capaciteMax, occupe, resteCapacite;
    public TriageBatimentParquetDetailImportLib() throws Exception { setNomTable("TRIAGEBPARQDET_IMPORTLIB"); }
    public String getIdBatimentLib() { return idBatimentLib; } public void setIdBatimentLib(String v) { idBatimentLib=v; }
    public String getIdParquetLib() { return idParquetLib; } public void setIdParquetLib(String v) { idParquetLib=v; }
    public String getIdSexeLib() { return idSexeLib; } public void setIdSexeLib(String v) { idSexeLib=v; }
    public double getCapaciteMax() { return capaciteMax; } public void setCapaciteMax(double v) { capaciteMax=v; }
    public double getOccupe() { return occupe; } public void setOccupe(double v) { occupe=v; }
    public double getResteCapacite() { return resteCapacite; } public void setResteCapacite(double v) { resteCapacite=v; }
}
