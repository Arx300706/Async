package ferme.receptionaeroport;

import java.sql.Timestamp;

/** Lecture de RPA_IMPORT_LIB pour le parcours d'importation. */
public class ReceptionPoussinAeroportImportLib extends ReceptionPoussinAeroport {
    private String numeroBon, fournisseurLib, idSoucheLib, conformite, etatLib;
    private int ageJours, nbMaleRequis, nbFemelleRequis, nbVivantsMale, nbVivantsFemelle;
    private double quantiteCommandee, ecart;
    private Timestamp dateDepartPrevue, dateDepartReelle, dateArriveePrevue;
    public ReceptionPoussinAeroportImportLib() throws Exception { setNomTable("RPA_IMPORT_LIB"); }
    public String getNumeroBon() { return numeroBon; } public void setNumeroBon(String v) { numeroBon=v; }
    public String getFournisseurLib() { return fournisseurLib; } public void setFournisseurLib(String v) { fournisseurLib=v; }
    public String getIdSoucheLib() { return idSoucheLib; } public void setIdSoucheLib(String v) { idSoucheLib=v; }
    public String getConformite() { return conformite; } public void setConformite(String v) { conformite=v; }
    public String getEtatLib() { return etatLib; } public void setEtatLib(String v) { etatLib=v; }
    public int getAgeJours() { return ageJours; } public void setAgeJours(int v) { ageJours=v; }
    public int getNbMaleRequis() { return nbMaleRequis; } public void setNbMaleRequis(int v) { nbMaleRequis=v; }
    public int getNbFemelleRequis() { return nbFemelleRequis; } public void setNbFemelleRequis(int v) { nbFemelleRequis=v; }
    public int getNbVivantsMale() { return nbVivantsMale; } public void setNbVivantsMale(int v) { nbVivantsMale=v; }
    public int getNbVivantsFemelle() { return nbVivantsFemelle; } public void setNbVivantsFemelle(int v) { nbVivantsFemelle=v; }
    public double getQuantiteCommandee() { return quantiteCommandee; } public void setQuantiteCommandee(double v) { quantiteCommandee=v; }
    public double getEcart() { return ecart; } public void setEcart(double v) { ecart=v; }
    public Timestamp getDateDepartPrevue() { return dateDepartPrevue; } public void setDateDepartPrevue(Timestamp v) { dateDepartPrevue=v; }
    public Timestamp getDateDepartReelle() { return dateDepartReelle; } public void setDateDepartReelle(Timestamp v) { dateDepartReelle=v; }
    public Timestamp getDateArriveePrevue() { return dateArriveePrevue; } public void setDateArriveePrevue(Timestamp v) { dateArriveePrevue=v; }
}
