package cinema;

import bean.ClassMAPTable;
import java.sql.Date;

/** Lecture seule sur la vue V_SEANCE_PLACES_DISPO. */
public class SeancePlacesDispo extends ClassMAPTable {
    private String id;
    private String idFilm;
    private String filmLib;
    private String photo;
    private double durre;
    private double prixBillet;
    private String realisateur;
    private String genre;
    private String classification;
    private String idSalle;
    private String salleLib;
    private double capacite;
    private double placesParRangee;
    private Date dateDebut;
    private String heure;
    private String duree;
    private Date dateFin;
    private int etat;
    private String etatLib;
    private String idContrat;
    private String idDistributeur;
    private String distributeurLib;
    private double placesReservees;
    private double placesDispo;
    private double tauxRemplissage;
    private String seanceLib;

    public SeancePlacesDispo() {
        this.setNomTable("V_SEANCE_PLACES_DISPO");
    }

    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getIdFilm() { return idFilm; }
    public void setIdFilm(String idFilm) { this.idFilm = idFilm; }
    public String getFilmLib() { return filmLib; }
    public void setFilmLib(String filmLib) { this.filmLib = filmLib; }
    public String getPhoto() { return photo; }
    public void setPhoto(String photo) { this.photo = photo; }
    public double getDurre() { return durre; }
    public void setDurre(double durre) { this.durre = durre; }
    public double getPrixBillet() { return prixBillet; }
    public void setPrixBillet(double prixBillet) { this.prixBillet = prixBillet; }
    public String getIdSalle() { return idSalle; }
    public void setIdSalle(String idSalle) { this.idSalle = idSalle; }
    public String getSalleLib() { return salleLib; }
    public void setSalleLib(String salleLib) { this.salleLib = salleLib; }
    public double getCapacite() { return capacite; }
    public void setCapacite(double capacite) { this.capacite = capacite; }
    public Date getDateDebut() { return dateDebut; }
    public void setDateDebut(Date dateDebut) { this.dateDebut = dateDebut; }
    public String getHeure() { return heure; }
    public void setHeure(String heure) { this.heure = heure; }
    public String getDuree() { return duree; }
    public void setDuree(String duree) { this.duree = duree; }
    public Date getDateFin() { return dateFin; }
    public void setDateFin(Date dateFin) { this.dateFin = dateFin; }
    public int getEtat() { return etat; }
    public void setEtat(int etat) { this.etat = etat; }
    public String getEtatLib() { return etatLib; }
    public void setEtatLib(String etatLib) { this.etatLib = etatLib; }
    public String getIdContrat() { return idContrat; }
    public void setIdContrat(String idContrat) { this.idContrat = idContrat; }
    public String getIdDistributeur() { return idDistributeur; }
    public void setIdDistributeur(String idDistributeur) { this.idDistributeur = idDistributeur; }
    public String getDistributeurLib() { return distributeurLib; }
    public void setDistributeurLib(String distributeurLib) { this.distributeurLib = distributeurLib; }
    public double getPlacesReservees() { return placesReservees; }
    public void setPlacesReservees(double placesReservees) { this.placesReservees = placesReservees; }
    public double getPlacesDispo() { return placesDispo; }
    public void setPlacesDispo(double placesDispo) { this.placesDispo = placesDispo; }
    public double getTauxRemplissage() { return tauxRemplissage; }
    public void setTauxRemplissage(double tauxRemplissage) { this.tauxRemplissage = tauxRemplissage; }
    public String getSeanceLib() { return seanceLib; }
    public void setSeanceLib(String seanceLib) { this.seanceLib = seanceLib; }
    public double getPlacesParRangee() { return placesParRangee; }
    public void setPlacesParRangee(double placesParRangee) { this.placesParRangee = placesParRangee; }
    public String getRealisateur() { return realisateur; }
    public void setRealisateur(String v) { this.realisateur = v; }
    public String getGenre() { return genre; }
    public void setGenre(String v) { this.genre = v; }
    public String getClassification() { return classification; }
    public void setClassification(String v) { this.classification = v; }
}
