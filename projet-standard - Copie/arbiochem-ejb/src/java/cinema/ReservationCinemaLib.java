package cinema;

import bean.ClassMAPTable;
import java.sql.Date;

/** Lecture seule sur la vue V_RESERVATION_CINEMA_LIB. */
public class ReservationCinemaLib extends ClassMAPTable {
    private String id;
    private String idMere;
    private String idClient;
    private String clientLib;
    private Date dateReservation;
    private int etatReservation;
    private String etatLib;
    private String idSeance;
    private String idFilm;
    private String filmLib;
    private String idSalle;
    private String salleLib;
    private Date dateDebut;
    private String place;
    private String heure;
    private double qte;
    private double pu;
    private double montant;

    public ReservationCinemaLib() {
        this.setNomTable("V_RESERVATION_CINEMA_LIB");
    }

    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getIdMere() { return idMere; }
    public void setIdMere(String idMere) { this.idMere = idMere; }
    public String getIdClient() { return idClient; }
    public void setIdClient(String idClient) { this.idClient = idClient; }
    public String getClientLib() { return clientLib; }
    public void setClientLib(String clientLib) { this.clientLib = clientLib; }
    public Date getDateReservation() { return dateReservation; }
    public void setDateReservation(Date dateReservation) { this.dateReservation = dateReservation; }
    public int getEtatReservation() { return etatReservation; }
    public void setEtatReservation(int etatReservation) { this.etatReservation = etatReservation; }
    public String getEtatLib() { return etatLib; }
    public void setEtatLib(String etatLib) { this.etatLib = etatLib; }
    public String getIdSeance() { return idSeance; }
    public void setIdSeance(String idSeance) { this.idSeance = idSeance; }
    public String getIdFilm() { return idFilm; }
    public void setIdFilm(String idFilm) { this.idFilm = idFilm; }
    public String getFilmLib() { return filmLib; }
    public void setFilmLib(String filmLib) { this.filmLib = filmLib; }
    public String getIdSalle() { return idSalle; }
    public void setIdSalle(String idSalle) { this.idSalle = idSalle; }
    public String getSalleLib() { return salleLib; }
    public void setSalleLib(String salleLib) { this.salleLib = salleLib; }
    public Date getDateDebut() { return dateDebut; }
    public void setDateDebut(Date dateDebut) { this.dateDebut = dateDebut; }
    public String getHeure() { return heure; }
    public void setHeure(String heure) { this.heure = heure; }
    public double getQte() { return qte; }
    public void setQte(double qte) { this.qte = qte; }
    public double getPu() { return pu; }
    public void setPu(double pu) { this.pu = pu; }
    public double getMontant() { return montant; }
    public void setMontant(double montant) { this.montant = montant; }
    public String getPlace() { return place; }
    public void setPlace(String place) { this.place = place; }
}
