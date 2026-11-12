package cinema;

/**
 * Identifiants des lignes de parametrage du module cinema
 * (inserees par database/2026-11-11-module-cinema.sql).
 */
public final class ConstanteCinema {
    private ConstanteCinema() { }

    public static final String TYPE_FOURNISSEUR_DISTRIBUTEUR = "TPFCINE";
    public static final String TYPE_MAGASIN_SALLE = "TYPMGSALLE";
    public static final String CATEGORIE_FILM = "CATFILM";
    public static final String TYPE_SEANCE = "TMSEANCE";
    public static final String CLIENT_PASSAGE = "CLIPASSAGE";
    public static final String MAGASIN_FILMS = "MAGSTOCKFILM";

    /** Temps de nettoyage de la salle ajoute apres chaque film (minutes). */
    public static final int NETTOYAGE_MINUTES = 15;

    public static final int ETAT_ANNULE = 0;
    public static final int ETAT_CREE = 1;
    public static final int ETAT_VISE = 11;
}
