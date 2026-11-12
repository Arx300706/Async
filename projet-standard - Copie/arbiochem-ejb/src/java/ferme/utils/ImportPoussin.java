package ferme.utils;

import java.sql.*;
import java.util.*;
import bean.ClassMAPTable;
import historique.MapHistorique;
import utilitaire.UtilDB;

/** Controles du parcours d'importation. Les ecritures restent celles d'APJ. */
public final class ImportPoussin {
    private ImportPoussin() { }

    public static List<Map<String, Object>> lire(Connection c, String sql, Object... valeurs) throws Exception {
        boolean fermer = c == null;
        if (fermer) c = new UtilDB().GetConn();
        try (PreparedStatement p = c.prepareStatement(sql)) {
            for (int i = 0; i < valeurs.length; i++) p.setObject(i + 1, valeurs[i]);
            try (ResultSet r = p.executeQuery()) {
                List<Map<String, Object>> lignes = new ArrayList<>();
                while (r.next()) {
                    Map<String, Object> ligne = new LinkedHashMap<>();
                    for (int i = 1; i <= r.getMetaData().getColumnCount(); i++) {
                        int type = r.getMetaData().getColumnType(i);
                        Object valeur = type == Types.DATE ? r.getDate(i) : type == Types.TIMESTAMP ? r.getTimestamp(i) : r.getObject(i);
                        ligne.put(r.getMetaData().getColumnLabel(i).toUpperCase(Locale.ROOT), valeur);
                    }
                    lignes.add(ligne);
                }
                return lignes;
            }
        } finally { if (fermer) c.close(); }
    }

    public static Map<String, Object> une(Connection c, String sql, Object... valeurs) throws Exception {
        List<Map<String, Object>> lignes = lire(c, sql, valeurs);
        if (lignes.size() != 1) throw new Exception("Document absent ou relation ambigu\u00eb");
        return lignes.get(0);
    }

    public static double nombre(Map<String, Object> ligne, String colonne) {
        Object n = ligne.get(colonne.toUpperCase(Locale.ROOT));
        return n == null ? 0 : ((Number) n).doubleValue();
    }

    public static String texte(Map<String, Object> ligne, String colonne) {
        Object n = ligne.get(colonne.toUpperCase(Locale.ROOT));
        return n == null ? "" : n.toString();
    }

    public static java.sql.Date date(Map<String, Object> ligne, String colonne) throws Exception {
        Object valeur = ligne.get(colonne.toUpperCase(Locale.ROOT));
        if (valeur == null) return null;
        if (valeur instanceof java.sql.Date) return (java.sql.Date) valeur;
        if (valeur instanceof java.util.Date) return new java.sql.Date(((java.util.Date) valeur).getTime());
        throw new Exception("Date invalide pour " + colonne);
    }

    public static Timestamp horodatage(Map<String, Object> ligne, String colonne) throws Exception {
        Object valeur = ligne.get(colonne.toUpperCase(Locale.ROOT));
        if (valeur == null) return null;
        if (valeur instanceof Timestamp) return (Timestamp) valeur;
        if (valeur instanceof java.util.Date) return new Timestamp(((java.util.Date) valeur).getTime());
        throw new Exception("Date et heure invalides pour " + colonne);
    }

    public static void requis(String valeur, String libelle) throws Exception {
        if (valeur == null || valeur.trim().isEmpty()) throw new Exception(libelle + " obligatoire");
    }

    public static void quantite(double valeur, boolean zero, String libelle) throws Exception {
        if (!Double.isFinite(valeur) || valeur < 0 || (!zero && valeur == 0) || valeur != Math.rint(valeur))
            throw new Exception(libelle + " : saisir un nombre entier " + (zero ? "positif ou nul" : "strictement positif"));
    }

    public static void equilibre(double attendu, double constate, String libelle) throws Exception {
        if (attendu != constate) throw new Exception(libelle + " : \u00e9cart de " + (constate - attendu));
    }

    public static Map<String, Object> verrouiller(Connection c, String table, String id) throws Exception {
        // Aucun nom de table provenant d'une requete HTTP.
        if (!Arrays.asList("AS_BONDECOMMANDE", "RECEPTIONPOUSSINAEROPORT", "RECEPTIONPOUSSINPOULAILLER",
                "TRANSFERTPOULET", "TRIAGEBATIMENTPARQUET", "BATIMENTDETAIL").contains(table)) throw new Exception("Table non autoris\u00e9e");
        requis(id, "R\u00e9f\u00e9rence");
        return une(c, "SELECT * FROM " + table + " WHERE ID=? FOR UPDATE", id);
    }

    public static Map<String, Object> brouillon(Connection c, String table, String id) throws Exception {
        Map<String, Object> ancien = verrouiller(c, table, id);
        if (nombre(ancien, "ETAT") != 1) throw new Exception("Les informations d'un document valid\u00e9 ou annul\u00e9 sont verrouill\u00e9es");
        return ancien;
    }

    public static void valide(Map<String, Object> document, String libelle) throws Exception {
        if (nombre(document, "ETAT") != 11) throw new Exception(libelle + " doit \u00eatre valid\u00e9e");
    }

    public static void immuable(Map<String, Object> ancien, String colonne, String valeur) throws Exception {
        if (!texte(ancien, colonne).equals(valeur == null ? "" : valeur))
            throw new Exception("La liaison avec l'\u00e9tape pr\u00e9c\u00e9dente ne peut pas changer");
    }

    public static double somme(Connection c, String sql, Object... params) throws Exception {
        return nombre(une(c, sql, params), "QTE");
    }

    public static String age(int jours) {
        if (jours < 0) throw new IllegalArgumentException("Age n\u00e9gatif");
        String texte = jours + " jour" + (jours == 1 ? "" : "s");
        if (jours < 7) return texte;
        int semaines = jours / 7, reste = jours % 7;
        return texte + " (" + semaines + " semaine" + (semaines == 1 ? "" : "s")
                + (reste == 0 ? "" : " + " + reste + " jour" + (reste == 1 ? "" : "s")) + ")";
    }

    public static Timestamp instant(java.sql.Date date, String heure) throws Exception {
        if (date == null) throw new Exception("Date obligatoire");
        try { return Timestamp.valueOf(date.toLocalDate().atTime(java.time.LocalTime.parse(heure))); }
        catch (Exception e) { throw new Exception("Heure obligatoire au format HH:mm"); }
    }

    public static void chronologie(Timestamp avant, Timestamp apres, String libelle) throws Exception {
        if (avant != null && apres != null && apres.before(avant)) throw new Exception(libelle + " ant\u00e9rieure \u00e0 l'\u00e9tape pr\u00e9c\u00e9dente");
    }

    /** Protege aussi les routes generiques de commande et de detail. */
    public static boolean commandeImport(Connection c, String id, boolean modification) throws Exception {
        if (id == null || id.isEmpty()) return false;
        Map<String, Object> bc = verrouiller(c, "AS_BONDECOMMANDE", id);
        boolean importer = !texte(bc, "IDSOUCHE").isEmpty()
                || !texte(bc, "PAYSDESTINATION").isEmpty()
                || !texte(bc, "AEROPORTDESTINATION").isEmpty();
        if (importer && modification && nombre(bc, "ETAT") != 1)
            throw new Exception("Le bon fournisseur valid\u00e9 est verrouill\u00e9");
        return importer;
    }

    public static void protegerFille(Connection c, String tableFille, String id, String parent, String tableMere) throws Exception {
        if (id != null && !id.isEmpty()) {
            if (!Arrays.asList("AS_BONDECOMMANDE_FILLE", "RECEPTIONPOUSSINAEROPORTDETAIL", "TRIAGEBATIMENTPARQUETDETAIL").contains(tableFille))
                throw new Exception("Table non autoris\u00e9e");
            List<Map<String, Object>> existantes = lire(c, "SELECT " + (tableFille.equals("AS_BONDECOMMANDE_FILLE") ? "IDBC" : "IDMERE")
                    + " AS PARENT FROM " + tableFille + " WHERE ID=?", id);
            if (!existantes.isEmpty()) {
                String precedent = texte(existantes.get(0), "PARENT");
                if (parent != null && !parent.isEmpty() && !precedent.equals(parent))
                    throw new Exception("La ligne ne peut pas changer de document");
                parent = precedent;
            }
        }
        if (tableMere.equals("AS_BONDECOMMANDE")) commandeImport(c, parent, true);
        else brouillon(c, tableMere, parent);
    }

    public static void verifierLigneCommande(Connection c, String id, String idbc, double qte, double pu) throws Exception {
        protegerFille(c, "AS_BONDECOMMANDE_FILLE", id, idbc, "AS_BONDECOMMANDE");
        if (commandeImport(c, idbc, false)) {
            quantite(qte, false, "Nombre command\u00e9");
            if (!Double.isFinite(pu) || pu < 0) throw new Exception("Prix unitaire positif ou nul obligatoire");
        }
    }

    public static void audit(String table, String action, String user, String id, Connection c) throws Exception {
        new MapHistorique(table, action, user, id, c).insertToTable(c);
    }

    public static String html(Object value) {
        return value == null ? "" : value.toString().replace("&", "&amp;").replace("<", "&lt;")
                .replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
    }
}
