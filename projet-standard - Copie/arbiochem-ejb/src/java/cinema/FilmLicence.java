package cinema;

import bean.ClassMAPTable;
import java.sql.Date;

/** Lecture seule sur la vue V_FILM_LICENCE. */
public class FilmLicence extends ClassMAPTable {
    private String id;
    private String idbc;
    private String reference;
    private Date dateContrat;
    private String idFournisseur;
    private String fournisseurLib;
    private String idFilm;
    private String filmLib;
    private Date dateDebutDroits;
    private Date dateFinDroits;
    private double seancesAchetees;
    private double seancesProgrammees;
    private double seancesRestantes;
    private double montantAchat;
    private String statut;

    public FilmLicence() {
        this.setNomTable("V_FILM_LICENCE");
    }

    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getIdbc() { return idbc; }
    public void setIdbc(String idbc) { this.idbc = idbc; }
    public String getReference() { return reference; }
    public void setReference(String reference) { this.reference = reference; }
    public Date getDateContrat() { return dateContrat; }
    public void setDateContrat(Date dateContrat) { this.dateContrat = dateContrat; }
    public String getIdFournisseur() { return idFournisseur; }
    public void setIdFournisseur(String idFournisseur) { this.idFournisseur = idFournisseur; }
    public String getFournisseurLib() { return fournisseurLib; }
    public void setFournisseurLib(String fournisseurLib) { this.fournisseurLib = fournisseurLib; }
    public String getIdFilm() { return idFilm; }
    public void setIdFilm(String idFilm) { this.idFilm = idFilm; }
    public String getFilmLib() { return filmLib; }
    public void setFilmLib(String filmLib) { this.filmLib = filmLib; }
    public Date getDateDebutDroits() { return dateDebutDroits; }
    public void setDateDebutDroits(Date dateDebutDroits) { this.dateDebutDroits = dateDebutDroits; }
    public Date getDateFinDroits() { return dateFinDroits; }
    public void setDateFinDroits(Date dateFinDroits) { this.dateFinDroits = dateFinDroits; }
    public double getSeancesAchetees() { return seancesAchetees; }
    public void setSeancesAchetees(double seancesAchetees) { this.seancesAchetees = seancesAchetees; }
    public double getSeancesProgrammees() { return seancesProgrammees; }
    public void setSeancesProgrammees(double seancesProgrammees) { this.seancesProgrammees = seancesProgrammees; }
    public double getSeancesRestantes() { return seancesRestantes; }
    public void setSeancesRestantes(double seancesRestantes) { this.seancesRestantes = seancesRestantes; }
    public double getMontantAchat() { return montantAchat; }
    public void setMontantAchat(double montantAchat) { this.montantAchat = montantAchat; }
    public String getStatut() { return statut; }
    public void setStatut(String statut) { this.statut = statut; }
}
