package faturefournisseur;

/** Lecture de la vue de suivi d'un bon fournisseur de poussins. */
public class As_BonDeCommandePoussinLib extends As_BonDeCommandePoussin {
    private String fournisseurLib, idLotLib, idSoucheLib, ageLib, idMagasinLib, statut;
    private String idReceptionAeroport, idTransfertPoulet, idTriage;
    private double quantiteCommandee, pu, montant;
    private int nbMortsAeroport, nbPerdusAeroport, nbVivantsAeroport;
    private int nbMortsTrajet, nbPerdusTrajet, nbVivantsTransfert, nbVivantsMaleTriage, nbVivantsFemelleTriage;

    public As_BonDeCommandePoussinLib() throws Exception { setNomTable("AS_BONDECOMMANDE_POUSSIN_LIB"); }
    public String getFournisseurLib() { return fournisseurLib; } public void setFournisseurLib(String v) { fournisseurLib=v; }
    public String getIdLotLib() { return idLotLib; } public void setIdLotLib(String v) { idLotLib=v; }
    public String getIdSoucheLib() { return idSoucheLib; } public void setIdSoucheLib(String v) { idSoucheLib=v; }
    public String getAgeLib() { return ageLib; } public void setAgeLib(String v) { ageLib=v; }
    public String getIdMagasinLib() { return idMagasinLib; } public void setIdMagasinLib(String v) { idMagasinLib=v; }
    public String getStatut() { return statut; } public void setStatut(String v) { statut=v; }
    public String getIdReceptionAeroport() { return idReceptionAeroport; } public void setIdReceptionAeroport(String v) { idReceptionAeroport=v; }
    public String getIdTransfertPoulet() { return idTransfertPoulet; } public void setIdTransfertPoulet(String v) { idTransfertPoulet=v; }
    public String getIdTriage() { return idTriage; } public void setIdTriage(String v) { idTriage=v; }
    public double getQuantiteCommandee() { return quantiteCommandee; } public void setQuantiteCommandee(double v) { quantiteCommandee=v; }
    public double getPu() { return pu; } public void setPu(double v) { pu=v; }
    public double getMontant() { return montant; } public void setMontant(double v) { montant=v; }
    public int getNbMortsAeroport() { return nbMortsAeroport; } public void setNbMortsAeroport(int v) { nbMortsAeroport=v; }
    public int getNbPerdusAeroport() { return nbPerdusAeroport; } public void setNbPerdusAeroport(int v) { nbPerdusAeroport=v; }
    public int getNbVivantsAeroport() { return nbVivantsAeroport; } public void setNbVivantsAeroport(int v) { nbVivantsAeroport=v; }
    public int getNbMortsTrajet() { return nbMortsTrajet; } public void setNbMortsTrajet(int v) { nbMortsTrajet=v; }
    public int getNbPerdusTrajet() { return nbPerdusTrajet; } public void setNbPerdusTrajet(int v) { nbPerdusTrajet=v; }
    public int getNbVivantsTransfert() { return nbVivantsTransfert; } public void setNbVivantsTransfert(int v) { nbVivantsTransfert=v; }
    public int getNbVivantsMaleTriage() { return nbVivantsMaleTriage; } public void setNbVivantsMaleTriage(int v) { nbVivantsMaleTriage=v; }
    public int getNbVivantsFemelleTriage() { return nbVivantsFemelleTriage; } public void setNbVivantsFemelleTriage(int v) { nbVivantsFemelleTriage=v; }
}
