package ferme.triageBatiment;

/** Lecture de TRIAGEBPARQ_IMPORT_LIB. */
public class TriageBatimentParquetImportLib extends TriageBatimentParquet {
    private String idReceptionAeroport, idBc, numeroBon, idSoucheLib, idMagasinLib, etatLib;
    private int ageJours, nbVivants, nbMortsTrajet, nbPerdusTrajet;
    private double qteAffectee, resteAffecter;
    public TriageBatimentParquetImportLib() throws Exception { setNomTable("TRIAGEBPARQ_IMPORT_LIB"); }
    public String getIdReceptionAeroport() { return idReceptionAeroport; } public void setIdReceptionAeroport(String v) { idReceptionAeroport=v; }
    public String getIdBc() { return idBc; } public void setIdBc(String v) { idBc=v; }
    public String getNumeroBon() { return numeroBon; } public void setNumeroBon(String v) { numeroBon=v; }
    public String getIdSoucheLib() { return idSoucheLib; } public void setIdSoucheLib(String v) { idSoucheLib=v; }
    public String getIdMagasinLib() { return idMagasinLib; } public void setIdMagasinLib(String v) { idMagasinLib=v; }
    public String getEtatLib() { return etatLib; } public void setEtatLib(String v) { etatLib=v; }
    public int getAgeJours() { return ageJours; } public void setAgeJours(int v) { ageJours=v; }
    public int getNbVivants() { return nbVivants; } public void setNbVivants(int v) { nbVivants=v; }
    public int getNbMortsTrajet() { return nbMortsTrajet; } public void setNbMortsTrajet(int v) { nbMortsTrajet=v; }
    public int getNbPerdusTrajet() { return nbPerdusTrajet; } public void setNbPerdusTrajet(int v) { nbPerdusTrajet=v; }
    public double getQteAffectee() { return qteAffectee; } public void setQteAffectee(double v) { qteAffectee=v; }
    public double getResteAffecter() { return resteAffecter; } public void setResteAffecter(double v) { resteAffecter=v; }
}
