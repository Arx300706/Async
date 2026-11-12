package cinema;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import utilitaire.UtilDB;

/** Petites requetes SQL parametrees utilisees par les controles du module cinema. */
public final class CinemaUtil {
    private CinemaUtil() { }

    public static List<Map<String, Object>> lire(Connection c, String sql, Object... valeurs) throws Exception {
        boolean fermer = c == null;
        if (fermer) c = new UtilDB().GetConn();
        try (PreparedStatement p = c.prepareStatement(sql)) {
            for (int i = 0; i < valeurs.length; i++) p.setObject(i + 1, valeurs[i]);
            try (ResultSet r = p.executeQuery()) {
                List<Map<String, Object>> lignes = new ArrayList<>();
                int n = r.getMetaData().getColumnCount();
                while (r.next()) {
                    Map<String, Object> ligne = new LinkedHashMap<>();
                    for (int i = 1; i <= n; i++) {
                        int type = r.getMetaData().getColumnType(i);
                        Object v = (type == Types.DATE || type == Types.TIMESTAMP) ? r.getTimestamp(i) : r.getObject(i);
                        ligne.put(r.getMetaData().getColumnLabel(i).toUpperCase(Locale.ROOT), v);
                    }
                    lignes.add(ligne);
                }
                return lignes;
            }
        } finally {
            if (fermer) c.close();
        }
    }

    /** Premiere ligne ou null. */
    public static Map<String, Object> premier(Connection c, String sql, Object... valeurs) throws Exception {
        List<Map<String, Object>> l = lire(c, sql, valeurs);
        return l.isEmpty() ? null : l.get(0);
    }

    /** Valeur numerique de la premiere colonne de la premiere ligne (0 si aucune ligne). */
    public static double valeur(Connection c, String sql, Object... valeurs) throws Exception {
        Map<String, Object> l = premier(c, sql, valeurs);
        if (l == null || l.isEmpty()) return 0;
        Object v = l.values().iterator().next();
        return v == null ? 0 : ((Number) v).doubleValue();
    }

    public static double nombre(Map<String, Object> ligne, String colonne) {
        Object v = ligne.get(colonne.toUpperCase(Locale.ROOT));
        return v == null ? 0 : ((Number) v).doubleValue();
    }

    public static String texte(Map<String, Object> ligne, String colonne) {
        Object v = ligne.get(colonne.toUpperCase(Locale.ROOT));
        return v == null ? "" : v.toString();
    }

    public static Timestamp date(Map<String, Object> ligne, String colonne) {
        return (Timestamp) ligne.get(colonne.toUpperCase(Locale.ROOT));
    }

    public static boolean vide(String s) {
        return s == null || s.trim().isEmpty();
    }

    public static void requis(String valeur, String libelle) throws Exception {
        if (vide(valeur)) throw new Exception(libelle + " obligatoire");
    }

    /** Date + heure (HH:MM) en Timestamp. */
    public static Timestamp instant(java.sql.Date date, String heure) throws Exception {
        if (date == null) throw new Exception("Date obligatoire");
        if (heure == null || !heure.trim().matches("([01]?\\d|2[0-3]):[0-5]\\d"))
            throw new Exception("Heure obligatoire au format HH:MM (ex. 18:30)");
        String h = heure.trim();
        if (h.length() == 4) h = "0" + h;
        return Timestamp.valueOf(date.toLocalDate().atTime(java.time.LocalTime.parse(h)));
    }

    // ------------------------------------------------------------------
    // Plan de salle : rangees A, B, C ... et places 1..n par rangee.
    // Les places sont numerotees dans l'ordre jusqu'a la capacite
    // (la derniere rangee peut etre incomplete).
    // ------------------------------------------------------------------
    public static final String LETTRES = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public static int nombreRangees(double capacite, double parRangee) {
        if (parRangee <= 0 || capacite <= 0) return 0;
        return (int) Math.ceil(capacite / parRangee);
    }

    /** Code d'une place : rangee (0 = A) et numero (1..parRangee). */
    public static String codePlace(int rangee, int numero) {
        return LETTRES.charAt(rangee) + String.valueOf(numero);
    }

    /** Vrai si la place existe dans le plan de la salle. */
    public static boolean placeValide(String code, double capacite, double parRangee) {
        if (code == null || !code.matches("[A-Z][0-9]{1,3}")) return false;
        int rangee = LETTRES.indexOf(code.charAt(0));
        int numero = Integer.parseInt(code.substring(1));
        if (rangee < 0 || numero < 1 || numero > parRangee) return false;
        return rangee * parRangee + numero <= capacite;
    }

    /** Normalise un code saisi (" c7 " -> "C7"). */
    public static String normaliserPlace(String code) {
        return code == null ? null : code.trim().toUpperCase(java.util.Locale.ROOT);
    }

    /** Normalise une heure saisie (9:5 -> 09:05 non accepte ; 9:05 -> 09:05). */
    public static String heure(String heure) {
        if (heure == null) return null;
        String h = heure.trim();
        return h.length() == 4 ? "0" + h : h;
    }
}
