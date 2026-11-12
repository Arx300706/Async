package ferme.triageBatiment;

public class TriageBatimentParquetLib extends TriageBatimentParquet{
    String idLotLib,idSoucheLib,etatLib, ecartFemelle, ecartMale, numeroBon, idMagasinLib;
    int nbVivants, nbMortsTrajet, nbPerdusTrajet;
    double qteAffectee, resteAffecter;
    public TriageBatimentParquetLib() throws Exception {
        this.setNomTable("TRIAGEBATIMENTPARQUET_LIB");
    }

    public String getIdLotLib() {
        return idLotLib;
    }

    public void setIdLotLib(String idLotLib) {
        this.idLotLib = idLotLib;
    }

    public String getIdSoucheLib() {
        return idSoucheLib;
    }

    public String getEtatLib() {
        return etatLib;
    }

    public void setEtatLib(String etatLib) {
        this.etatLib = etatLib;
    }

    public void setIdSoucheLib(String idSoucheLib) {
        this.idSoucheLib = idSoucheLib;
    }

    public String getEcartFemelle() {
        return ecartFemelle;
    }

    public void setEcartFemelle(String ecartFemelle) {
        this.ecartFemelle = ecartFemelle;
    }

    public String getEcartMale() {
        return ecartMale;
    }

    public void setEcartMale(String ecartMale) {
        this.ecartMale = ecartMale;
    }
    public String getNumeroBon() { return numeroBon; } public void setNumeroBon(String v) { numeroBon=v; }
    public String getIdMagasinLib() { return idMagasinLib; } public void setIdMagasinLib(String v) { idMagasinLib=v; }
    public int getNbVivants() { return nbVivants; } public void setNbVivants(int v) { nbVivants=v; }
    public int getNbMortsTrajet() { return nbMortsTrajet; } public void setNbMortsTrajet(int v) { nbMortsTrajet=v; }
    public int getNbPerdusTrajet() { return nbPerdusTrajet; } public void setNbPerdusTrajet(int v) { nbPerdusTrajet=v; }
    public double getQteAffectee() { return qteAffectee; } public void setQteAffectee(double v) { qteAffectee=v; }
    public double getResteAffecter() { return resteAffecter; } public void setResteAffecter(double v) { resteAffecter=v; }
}
