package cinema;

import bean.ClassMAPTable;
import java.sql.Date;

/** Lecture seule sur la vue V_RENTABILITE_FILM. */
public class RentabiliteFilm extends ClassMAPTable {
    private String id;
    private String idFilm;
    private String filmLib;
    private double coutAchat;
    private double recette;
    private double marge;
    private double spectateurs;
    private double nbSeances;

    public RentabiliteFilm() {
        this.setNomTable("V_RENTABILITE_FILM");
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
    public double getCoutAchat() { return coutAchat; }
    public void setCoutAchat(double coutAchat) { this.coutAchat = coutAchat; }
    public double getRecette() { return recette; }
    public void setRecette(double recette) { this.recette = recette; }
    public double getMarge() { return marge; }
    public void setMarge(double marge) { this.marge = marge; }
    public double getSpectateurs() { return spectateurs; }
    public void setSpectateurs(double spectateurs) { this.spectateurs = spectateurs; }
    public double getNbSeances() { return nbSeances; }
    public void setNbSeances(double nbSeances) { this.nbSeances = nbSeances; }
}
