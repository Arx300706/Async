package ferme.transfertpoulet;

import java.sql.Connection;

/**
 *
 * @author Safidy
 */
public class TransfertPouletLib extends TransfertPoulet {
    private String idLotLib, idsouchelib, etatLib, numeroBon, fournisseurLib, idMagasin, idMagasinLib;
    private String heureReceptionAeroport;
    private java.sql.Date dateReceptionAeroport;
    private int ageJours, nbMortsAeroport, nbPerdusAeroport, nbVivantsAeroport;
    private double quantiteCommandee;
    public TransfertPouletLib()throws Exception{
        super.setNomTable("transfertPoulet_lib");
    }

    public String getIdLotLib() {
        return idLotLib;
    }

    public void setIdLotLib(String idLotLib) {
        this.idLotLib = idLotLib;
    }

    public String getIdsouchelib() {
        return idsouchelib;
    }

    public void setIdsouchelib(String idsouchelib) {
        this.idsouchelib = idsouchelib;
    }

    public String getEtatLib() {
        return etatLib;
    }

    public void setEtatLib(String etatLib) {
        this.etatLib = etatLib;
    }
    public String getNumeroBon() { return numeroBon; } public void setNumeroBon(String v) { numeroBon=v; }
    public String getFournisseurLib() { return fournisseurLib; } public void setFournisseurLib(String v) { fournisseurLib=v; }
    public String getIdMagasin() { return idMagasin; } public void setIdMagasin(String v) { idMagasin=v; }
    public String getIdMagasinLib() { return idMagasinLib; } public void setIdMagasinLib(String v) { idMagasinLib=v; }
    public String getHeureReceptionAeroport() { return heureReceptionAeroport; } public void setHeureReceptionAeroport(String v) { heureReceptionAeroport=v; }
    public java.sql.Date getDateReceptionAeroport() { return dateReceptionAeroport; } public void setDateReceptionAeroport(java.sql.Date v) { dateReceptionAeroport=v; }
    public int getAgeJours() { return ageJours; } public void setAgeJours(int v) { ageJours=v; }
    public int getNbMortsAeroport() { return nbMortsAeroport; } public void setNbMortsAeroport(int v) { nbMortsAeroport=v; }
    public int getNbPerdusAeroport() { return nbPerdusAeroport; } public void setNbPerdusAeroport(int v) { nbPerdusAeroport=v; }
    public int getNbVivantsAeroport() { return nbVivantsAeroport; } public void setNbVivantsAeroport(int v) { nbVivantsAeroport=v; }
    public double getQuantiteCommandee() { return quantiteCommandee; } public void setQuantiteCommandee(double v) { quantiteCommandee=v; }
}
