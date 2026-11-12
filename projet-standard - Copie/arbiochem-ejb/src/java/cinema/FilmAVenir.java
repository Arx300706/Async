package cinema;

import bean.ClassMAPTable;
import java.sql.Date;

/** Lecture seule sur la vue V_FILMS_A_VENIR. */
public class FilmAVenir extends ClassMAPTable {
    private String id;
    private String idFilm;
    private String filmLib;
    private String photo;
    private double durre;
    private double prixBillet;
    private String realisateur;
    private String genre;
    private String classification;
    private double nbSeances;
    private String prochaineSeanceLib;
    private double placesDispo;

    public FilmAVenir() {
        this.setNomTable("V_FILMS_A_VENIR");
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
    public double getNbSeances() { return nbSeances; }
    public void setNbSeances(double nbSeances) { this.nbSeances = nbSeances; }
    public String getProchaineSeanceLib() { return prochaineSeanceLib; }
    public void setProchaineSeanceLib(String prochaineSeanceLib) { this.prochaineSeanceLib = prochaineSeanceLib; }
    public double getPlacesDispo() { return placesDispo; }
    public void setPlacesDispo(double placesDispo) { this.placesDispo = placesDispo; }
    public String getRealisateur() { return realisateur; }
    public void setRealisateur(String v) { this.realisateur = v; }
    public String getGenre() { return genre; }
    public void setGenre(String v) { this.genre = v; }
    public String getClassification() { return classification; }
    public void setClassification(String v) { this.classification = v; }
}
