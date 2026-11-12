package cinema;

import bean.ClassMAPTable;
import java.sql.Date;

/** Lecture seule sur la vue V_RESERVATION_CINEMA. */
public class ReservationCinemaVue extends ClassMAPTable {
    private String id;
    private String idClient;
    private String clientLib;
    private Date daty;
    private String remarque;
    private int etat;
    private String etatLib;
    private double nbPlaces;
    private double montant;
    private double paye;
    private double resteAPayer;

    public ReservationCinemaVue() {
        this.setNomTable("V_RESERVATION_CINEMA");
    }

    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getIdClient() { return idClient; }
    public void setIdClient(String idClient) { this.idClient = idClient; }
    public String getClientLib() { return clientLib; }
    public void setClientLib(String clientLib) { this.clientLib = clientLib; }
    public Date getDaty() { return daty; }
    public void setDaty(Date daty) { this.daty = daty; }
    public String getRemarque() { return remarque; }
    public void setRemarque(String remarque) { this.remarque = remarque; }
    public int getEtat() { return etat; }
    public void setEtat(int etat) { this.etat = etat; }
    public String getEtatLib() { return etatLib; }
    public void setEtatLib(String etatLib) { this.etatLib = etatLib; }
    public double getNbPlaces() { return nbPlaces; }
    public void setNbPlaces(double nbPlaces) { this.nbPlaces = nbPlaces; }
    public double getMontant() { return montant; }
    public void setMontant(double montant) { this.montant = montant; }
    public double getPaye() { return paye; }
    public void setPaye(double paye) { this.paye = paye; }
    public double getResteAPayer() { return resteAPayer; }
    public void setResteAPayer(double resteAPayer) { this.resteAPayer = resteAPayer; }
}
