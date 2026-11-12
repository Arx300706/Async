package cinema;

import bean.ClassMAPTable;
import java.sql.Date;

/** Lecture seule sur la vue V_CONTRAT_FILM. */
public class ContratFilmLib extends ClassMAPTable {
    private String id;
    private String reference;
    private String designation;
    private Date daty;
    private Date dateLimite;
    private String fournisseur;
    private String fournisseurLib;
    private int etat;
    private String etatLib;
    private String idFilm;
    private String filmLib;
    private double seancesAchetees;
    private double pu;
    private double montant;
    private String idReception;
    private Date dateDebutDroits;
    private String idFacture;
    private String statutLicence;

    public ContratFilmLib() {
        this.setNomTable("V_CONTRAT_FILM");
    }

    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getReference() { return reference; }
    public void setReference(String reference) { this.reference = reference; }
    public String getDesignation() { return designation; }
    public void setDesignation(String designation) { this.designation = designation; }
    public Date getDaty() { return daty; }
    public void setDaty(Date daty) { this.daty = daty; }
    public Date getDateLimite() { return dateLimite; }
    public void setDateLimite(Date dateLimite) { this.dateLimite = dateLimite; }
    public String getFournisseur() { return fournisseur; }
    public void setFournisseur(String fournisseur) { this.fournisseur = fournisseur; }
    public String getFournisseurLib() { return fournisseurLib; }
    public void setFournisseurLib(String fournisseurLib) { this.fournisseurLib = fournisseurLib; }
    public int getEtat() { return etat; }
    public void setEtat(int etat) { this.etat = etat; }
    public String getEtatLib() { return etatLib; }
    public void setEtatLib(String etatLib) { this.etatLib = etatLib; }
    public String getIdFilm() { return idFilm; }
    public void setIdFilm(String idFilm) { this.idFilm = idFilm; }
    public String getFilmLib() { return filmLib; }
    public void setFilmLib(String filmLib) { this.filmLib = filmLib; }
    public double getSeancesAchetees() { return seancesAchetees; }
    public void setSeancesAchetees(double seancesAchetees) { this.seancesAchetees = seancesAchetees; }
    public double getPu() { return pu; }
    public void setPu(double pu) { this.pu = pu; }
    public double getMontant() { return montant; }
    public void setMontant(double montant) { this.montant = montant; }
    public String getIdReception() { return idReception; }
    public void setIdReception(String idReception) { this.idReception = idReception; }
    public Date getDateDebutDroits() { return dateDebutDroits; }
    public void setDateDebutDroits(Date dateDebutDroits) { this.dateDebutDroits = dateDebutDroits; }
    public String getIdFacture() { return idFacture; }
    public void setIdFacture(String idFacture) { this.idFacture = idFacture; }
    public String getStatutLicence() { return statutLicence; }
    public void setStatutLicence(String statutLicence) { this.statutLicence = statutLicence; }
}
