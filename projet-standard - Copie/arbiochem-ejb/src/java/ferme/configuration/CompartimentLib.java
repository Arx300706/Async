package ferme.configuration;

/** Vue des compartiments existants, avec occupation calculee. */
public class CompartimentLib extends BatimentDetail {
    private String idBatimentLib, idParquetLib, idSexeLib, libelle;
    private double occupe, resteCapacite;
    public CompartimentLib() throws Exception { setNomTable("BATDETAIL_COMPARTIMENT_LIB"); }
    public String getIdBatimentLib() { return idBatimentLib; } public void setIdBatimentLib(String v) { idBatimentLib=v; }
    public String getIdParquetLib() { return idParquetLib; } public void setIdParquetLib(String v) { idParquetLib=v; }
    public String getIdSexeLib() { return idSexeLib; } public void setIdSexeLib(String v) { idSexeLib=v; }
    public String getLibelle() { return libelle; } public void setLibelle(String v) { libelle=v; }
    public double getOccupe() { return occupe; } public void setOccupe(double v) { occupe=v; }
    public double getResteCapacite() { return resteCapacite; } public void setResteCapacite(double v) { resteCapacite=v; }
}
