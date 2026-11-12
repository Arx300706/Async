package cinema;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

/**
 * Promotions du cinema selon l'heure de la seance (vue V_PROMOTION_CINEMA).
 * Stockees dans AS_INGREDIENTS (categorie CATPROMO) : REFERENCE = heure de debut (HH:MM), PV = taux de reduction (%).
 * Exemple : "Promotion soiree", 20:00, 50 % => toute seance qui commence a 20h00 ou plus tard a le billet a moitie prix.
 */
public final class Promotion {
    private Promotion() { }

    public static final String CATEGORIE = "CATPROMO";

    /** Promotions actives. */
    public static List<Map<String, Object>> actives(Connection c) throws Exception {
        return CinemaUtil.lire(c, "SELECT ID, LIBELLE, HEUREDEBUT, TAUX FROM V_PROMOTION_CINEMA WHERE ACTIF=1 ORDER BY HEUREDEBUT");
    }

    /** Toutes les promotions (actives ou non), pour la page de parametrage. */
    public static List<Map<String, Object>> toutes(Connection c) throws Exception {
        return CinemaUtil.lire(c, "SELECT ID, LIBELLE, HEUREDEBUT, TAUX, ACTIF FROM V_PROMOTION_CINEMA ORDER BY HEUREDEBUT");
    }

    /** Promotion (la plus forte) qui s'applique a une seance commencant a cette heure (HH:MM), ou null. */
    public static Map<String, Object> pourHeure(List<Map<String, Object>> promotions, String heure) {
        if (heure == null || heure.trim().isEmpty()) return null;
        String h = CinemaUtil.heure(heure);
        Map<String, Object> meilleure = null;
        for (Map<String, Object> p : promotions) {
            String debut = CinemaUtil.heure(CinemaUtil.texte(p, "HEUREDEBUT"));
            if (h.compareTo(debut) >= 0 && (meilleure == null || CinemaUtil.nombre(p, "TAUX") > CinemaUtil.nombre(meilleure, "TAUX")))
                meilleure = p;
        }
        return meilleure;
    }

    /** Taux de reduction (%) pour une seance commencant a cette heure (0 si aucune promotion). */
    public static double taux(List<Map<String, Object>> promotions, String heure) {
        Map<String, Object> p = pourHeure(promotions, heure);
        return p == null ? 0 : CinemaUtil.nombre(p, "TAUX");
    }

    /** Prix apres reduction, arrondi a l'ariary. */
    public static double appliquer(double prix, double taux) {
        if (taux <= 0) return prix;
        return Math.round(prix * (100 - taux) / 100.0);
    }

    /** Modifie une promotion (heure de debut, taux, active). */
    public static void modifier(String id, String heureDebut, double taux, boolean active, Connection c) throws Exception {
        CinemaUtil.requis(id, "Promotion");
        String h = CinemaUtil.heure(heureDebut);
        if (h == null || !h.matches("([01]\\d|2[0-3]):[0-5]\\d")) throw new Exception("Heure de d\u00e9but au format HH:MM (ex. 20:00)");
        if (taux <= 0 || taux >= 100) throw new Exception("Le taux de r\u00e9duction doit \u00eatre entre 1 et 99 %");
        try (java.sql.PreparedStatement p = c.prepareStatement(
                "UPDATE AS_INGREDIENTS SET REFERENCE=?, PV=?, ACTIF=? WHERE ID=? AND CATEGORIEINGREDIENT=?")) {
            p.setString(1, h);
            p.setDouble(2, taux);
            p.setInt(3, active ? 1 : 0);
            p.setString(4, id);
            p.setString(5, CATEGORIE);
            if (p.executeUpdate() != 1) throw new Exception("Promotion introuvable");
        }
    }
}
