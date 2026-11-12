package cinema;

import bean.ClassMAPTable;
import java.sql.Connection;
import java.sql.Date;

/**
 * Film = ligne de AS_INGREDIENTS de categorie FILM.
 * LIBELLE = titre, DURRE = duree en minutes, PV = prix du billet, PHOTO = affiche.
 */
public class Film extends ClassMAPTable {
    private String id;
    private String libelle;
    private double durre;
    private String photo;
    private double pv;
    private double pu;
    private double tva;
    private String unite;
    private String categorieIngredient;
    private int isAchat = 1;
    private int isVente = 1;
    private int actif = 1;
    private Date daty;
    /** MARQUE = realisateur, STYLE = genre, SOUSCATEGORIE = classification (Tous publics, -12...). */
    private String marque;
    private String style;
    private String sousCategorie;

    public Film() {
        this.setNomTable("AS_INGREDIENTS");
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("IG", "getSeqIngredients");
        this.setId(makePK(c));
    }

    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    private void verifier() throws Exception {
        CinemaUtil.requis(libelle, "Titre du film");
        if (durre <= 0 || durre != Math.rint(durre)) throw new Exception("La dur\u00e9e (en minutes) doit \u00eatre un entier strictement positif");
        if (pv <= 0) throw new Exception("Le prix du billet doit \u00eatre strictement positif");
        if (tva < 0) throw new Exception("TVA invalide");
        if (actif != 0 && actif != 1) throw new Exception("Actif : 0 ou 1");
        setCategorieIngredient(ConstanteCinema.CATEGORIE_FILM);
        setIsAchat(1);
        setIsVente(1);
        if (daty == null) setDaty(utilitaire.Utilitaire.dateDuJourSql());
    }

    @Override
    public void controler(Connection c) throws Exception {
        verifier();
        super.controler(c);
    }

    @Override
    public int updateObject(String u, Connection c) throws Exception {
        verifier();
        return super.updateObject(u, c);
    }

    @Override
    public String[] getMotCles() { return new String[]{"id", "libelle"}; }

    @Override
    public String[] getValMotCles() { return new String[]{"id", "libelle"}; }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getLibelle() { return libelle; }
    public void setLibelle(String libelle) { this.libelle = libelle; }
    public double getDurre() { return durre; }
    public void setDurre(double durre) { this.durre = durre; }
    public String getPhoto() { return photo; }
    public void setPhoto(String photo) { this.photo = photo; }
    public double getPv() { return pv; }
    public void setPv(double pv) { this.pv = pv; }
    public double getPu() { return pu; }
    public void setPu(double pu) { this.pu = pu; }
    public double getTva() { return tva; }
    public void setTva(double tva) { this.tva = tva; }
    public String getUnite() { return unite; }
    public void setUnite(String unite) { this.unite = unite; }
    public String getCategorieIngredient() { return categorieIngredient; }
    public void setCategorieIngredient(String categorieIngredient) { this.categorieIngredient = categorieIngredient; }
    public int getIsAchat() { return isAchat; }
    public void setIsAchat(int isAchat) { this.isAchat = isAchat; }
    public int getIsVente() { return isVente; }
    public void setIsVente(int isVente) { this.isVente = isVente; }
    public int getActif() { return actif; }
    public void setActif(int actif) { this.actif = actif; }
    public String getMarque() { return marque; }
    public void setMarque(String marque) { this.marque = marque; }
    public String getStyle() { return style; }
    public void setStyle(String style) { this.style = style; }
    public String getSousCategorie() { return sousCategorie; }
    public void setSousCategorie(String sousCategorie) { this.sousCategorie = sousCategorie; }
    public Date getDaty() { return daty; }
    public void setDaty(Date daty) { this.daty = daty; }
}
