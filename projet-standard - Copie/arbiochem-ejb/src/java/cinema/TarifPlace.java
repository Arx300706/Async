package cinema;

import bean.ClassMAPTable;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

/**
 * Categorie de place (Standard, Confort, VIP...) lue dans V_TARIF_PLACE.
 * Stockee dans AS_INGREDIENTS (categorie CATPLACE) : PV = prix, REFERENCE = rangees (ex. "AB"), COULEUR = couleur du plan.
 */
public class TarifPlace extends ClassMAPTable {
    public static final String CATEGORIE = "CATPLACE";

    private String id;
    private String libelle;
    private double pv;
    private String rangees;
    private String couleur;
    private int actif;

    public TarifPlace() {
        this.setNomTable("V_TARIF_PLACE");
    }

    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    /** Tarifs actifs. */
    public static List<Map<String, Object>> tous(Connection c) throws Exception {
        return CinemaUtil.lire(c, "SELECT ID, LIBELLE, PV, RANGEES, COULEUR FROM V_TARIF_PLACE WHERE ACTIF=1 ORDER BY PV, LIBELLE");
    }

    /** Tarif (ligne de V_TARIF_PLACE) qui couvre la rangee de la place, ou null. */
    public static Map<String, Object> pourPlace(List<Map<String, Object>> tarifs, String place) {
        if (place == null || place.isEmpty()) return null;
        String rangee = place.substring(0, 1).toUpperCase(java.util.Locale.ROOT);
        for (Map<String, Object> t : tarifs) {
            if (CinemaUtil.texte(t, "RANGEES").contains(rangee)) return t;
        }
        return null;
    }

    /** Prix d'une place : tarif de sa rangee, sinon prix par defaut (prix du billet du film). */
    public static double prix(List<Map<String, Object>> tarifs, String place, double defaut) {
        Map<String, Object> t = pourPlace(tarifs, place);
        return t == null ? defaut : CinemaUtil.nombre(t, "PV");
    }

    /** Modifie le prix et les rangees d'une categorie (controle : une rangee n'appartient qu'a une categorie). */
    public static void modifier(String id, double pv, String rangees, Connection c) throws Exception {
        CinemaUtil.requis(id, "Cat\u00e9gorie");
        if (pv <= 0) throw new Exception("Le prix doit \u00eatre strictement positif");
        rangees = rangees == null ? "" : rangees.toUpperCase(java.util.Locale.ROOT).replaceAll("[^A-Z]", "");
        if (rangees.isEmpty()) throw new Exception("Indiquer au moins une rang\u00e9e (lettres A \u00e0 Z, ex. AB)");
        for (Map<String, Object> autre : CinemaUtil.lire(c, "SELECT ID, LIBELLE, RANGEES FROM V_TARIF_PLACE WHERE ACTIF=1 AND ID<>?", id)) {
            for (char r : rangees.toCharArray()) {
                if (CinemaUtil.texte(autre, "RANGEES").indexOf(r) >= 0)
                    throw new Exception("La rang\u00e9e " + r + " appartient d\u00e9j\u00e0 \u00e0 la cat\u00e9gorie " + CinemaUtil.texte(autre, "LIBELLE"));
            }
        }
        try (java.sql.PreparedStatement p = c.prepareStatement(
                "UPDATE AS_INGREDIENTS SET PV=?, REFERENCE=? WHERE ID=? AND CATEGORIEINGREDIENT=?")) {
            p.setDouble(1, pv);
            p.setString(2, rangees);
            p.setString(3, id);
            p.setString(4, CATEGORIE);
            if (p.executeUpdate() != 1) throw new Exception("Cat\u00e9gorie introuvable");
        }
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getLibelle() { return libelle; }
    public void setLibelle(String libelle) { this.libelle = libelle; }
    public double getPv() { return pv; }
    public void setPv(double pv) { this.pv = pv; }
    public String getRangees() { return rangees; }
    public void setRangees(String rangees) { this.rangees = rangees; }
    public String getCouleur() { return couleur; }
    public void setCouleur(String couleur) { this.couleur = couleur; }
    public int getActif() { return actif; }
    public void setActif(int actif) { this.actif = actif; }
}
