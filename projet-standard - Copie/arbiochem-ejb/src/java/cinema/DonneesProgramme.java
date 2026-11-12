package cinema;

import faturefournisseur.As_BonDeCommande_Fille;
import java.sql.Connection;
import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Donnees du module cinema : programme de diffusion du 16/11/2026 au 30/11/2026.
 *
 *  Film                     Realisateur           Genre      Duree  Classification  Salle   Jours et heures
 *  Les Gardiens du Baobab   Hery Rakotomalala     Aventure   115    Tous publics    A       lundi 14h 20h, jeudi 14h 17h 20h, dimanche 15h
 *  Nuit sur Analamanga      Fanja Andriamanana    Thriller   105    -12             B       lundi 14h 17h 20h, mardi 18h, vendredi 17h 20h
 *  Le Petit Lemurien        Tojo Randrianarisoa   Animation   90    Tous publics    C       mardi 14h, mercredi 14h 17h, samedi 10h 14h 17h
 *
 * Salles A, B, C : 20 places (rangees A a D, 5 places). Tarifs par rangee : voir V_TARIF_PLACE.
 * Chaque film a un contrat de 20 seances (droits jusqu'au 31/12/2026), vise et receptionne.
 * Idempotent : ne recree pas ce qui existe deja. Aucune reservation n'est creee.
 *
 * Prerequis SQL : 2026-11-11-module-cinema.sql puis 2026-11-12-cinema-tarifs-et-nettoyage.sql.
 * Lancement : java -cp "WEB-INF/lib/*" cinema.DonneesProgramme [url jdbc] [utilisateur] [mot de passe]
 */
public final class DonneesProgramme {
    private DonneesProgramme() { }

    public static final String DISTRIBUTEUR = "FRNCINE01";
    public static final LocalDate DEBUT = LocalDate.of(2026, 11, 16);
    public static final LocalDate FIN = LocalDate.of(2026, 11, 30);

    /** titre, realisateur, genre, duree (min), classification, salle */
    public static final Object[][] FILMS = {
            {"Les Gardiens du Baobab", "Hery Rakotomalala", "Aventure", 115, "Tous publics", "Salle A"},
            {"Nuit sur Analamanga", "Fanja Andriamanana", "Thriller", 105, "-12", "Salle B"},
            {"Le Petit L\u00e9murien", "Tojo Randrianarisoa", "Animation", 90, "Tous publics", "Salle C"}};

    /** Programme hebdomadaire de chaque film (meme ordre que FILMS). */
    public static Map<DayOfWeek, String[]> programme(int film) {
        Map<DayOfWeek, String[]> p = new LinkedHashMap<>();
        if (film == 0) {
            p.put(DayOfWeek.MONDAY, new String[]{"14:00", "20:00"});
            p.put(DayOfWeek.THURSDAY, new String[]{"14:00", "17:00", "20:00"});
            p.put(DayOfWeek.SUNDAY, new String[]{"15:00"});
        } else if (film == 1) {
            p.put(DayOfWeek.MONDAY, new String[]{"14:00", "17:00", "20:00"});
            p.put(DayOfWeek.TUESDAY, new String[]{"18:00"});
            p.put(DayOfWeek.FRIDAY, new String[]{"17:00", "20:00"});
        } else {
            p.put(DayOfWeek.TUESDAY, new String[]{"14:00"});
            p.put(DayOfWeek.WEDNESDAY, new String[]{"14:00", "17:00"});
            p.put(DayOfWeek.SATURDAY, new String[]{"10:00", "14:00", "17:00"});
        }
        return p;
    }

    /** Charge salles, films, licences et seances dans la transaction c (sans commit). Retourne le nombre de seances creees. */
    public static int charger(Connection c, String u) throws Exception {
        if (CinemaUtil.premier(c, "SELECT ID FROM FOURNISSEUR WHERE ID=?", DISTRIBUTEUR) == null) {
            try (java.sql.PreparedStatement p = c.prepareStatement(
                    "INSERT INTO FOURNISSEUR(ID,NOM,COMPTE,IDTYPEFOURNISSEUR,ESTACTIF,DEVISE,ECHEANCE) VALUES(?,?,'401700',?,1,'AR',30)")) {
                p.setString(1, DISTRIBUTEUR);
                p.setString(2, "Cin\u00e9 Distribution Madagascar");
                p.setString(3, ConstanteCinema.TYPE_FOURNISSEUR_DISTRIBUTEUR);
                p.executeUpdate();
            }
        }
        Map<String, String> salles = new LinkedHashMap<>();
        for (String nom : new String[]{"Salle A", "Salle B", "Salle C"}) {
            String id = id(c, "SELECT ID FROM MAGASIN2 WHERE VAL=? AND IDTYPEMAGASIN=?", nom, ConstanteCinema.TYPE_MAGASIN_SALLE);
            if (id == null) {
                Salle s = new Salle();
                s.setVal(nom); s.setCapacite(20); s.setCompteur(5);
                s.setDesce("20 places : A-B Standard, C Confort, D VIP");
                id = ((Salle) s.createObject(u, c)).getId();
            }
            salles.put(nom, id);
        }
        int crees = 0;
        Date auj = new Date(System.currentTimeMillis());
        for (int k = 0; k < FILMS.length; k++) {
            Object[] f = FILMS[k];
            String film = id(c, "SELECT ID FROM AS_INGREDIENTS WHERE LIBELLE=? AND CATEGORIEINGREDIENT=?", f[0], ConstanteCinema.CATEGORIE_FILM);
            Film x = new Film();
            x.setLibelle((String) f[0]); x.setMarque((String) f[1]); x.setStyle((String) f[2]);
            x.setDurre((Integer) f[3]); x.setSousCategorie((String) f[4]); x.setPv(15000); x.setActif(1);
            if (film == null) film = ((Film) x.createObject(u, c)).getId();
            else { x.setId(film); x.updateObject(u, c); }

            if (id(c, "SELECT IDBC FROM V_FILM_LICENCE WHERE IDFILM=? AND STATUT IN ('ACTIVE','A VENIR') AND DATEFINDROITS>=?", film, Date.valueOf(FIN)) == null) {
                ContratFilm ct = new ContratFilm();
                ct.setFournisseur(DISTRIBUTEUR); ct.setDaty(auj); ct.setDateLimite(Date.valueOf("2026-12-31"));
                ct.setIdDevise("AR"); ct.setEtat(1);
                ct.setDesignation("Droits de diffusion - " + f[0]); ct.setReference("CTR-" + film);
                As_BonDeCommande_Fille l = new As_BonDeCommande_Fille();
                l.setProduit(film); l.setQuantite(20); l.setPu(50000); l.setIdDevise("AR"); l.setTauxDeChange(1);
                ct.setFille(new As_BonDeCommande_Fille[]{l});
                ct = (ContratFilm) ct.createObject(u, c);
                ContratFilm v = new ContratFilm();
                v.setId(ct.getId());
                v = (ContratFilm) bean.CGenUtil.getMereAvecFille(v, c, null);
                v.validerObject(u, c);
                ct.genererReception(auj, u, c);
            }

            String salle = salles.get((String) f[5]);
            Map<DayOfWeek, String[]> prog = programme(k);
            for (LocalDate d = DEBUT; !d.isAfter(FIN); d = d.plusDays(1)) {
                String[] heures = prog.get(d.getDayOfWeek());
                if (heures == null) continue;
                for (String h : heures) {
                    if (id(c, "SELECT ID FROM PLANNING WHERE IDTYPEMAINTENANCE=? AND ETAT<>0 AND IDMACHINE=? AND REFOBJET=? AND TRUNC(DATEDEBUT)=? AND HEURE=?",
                            ConstanteCinema.TYPE_SEANCE, salle, film, Date.valueOf(d), h) != null) continue;
                    Seance s = new Seance();
                    s.setRefObjet(film); s.setIdMachine(salle); s.setDateDebut(Date.valueOf(d)); s.setHeure(h);
                    s = (Seance) s.createObject(u, c);
                    ((Seance) new Seance().getById(s.getId(), "PLANNING", c)).validerObject(u, c);
                    crees++;
                }
            }
        }
        return crees;
    }

    private static String id(Connection c, String sql, Object... p) throws Exception {
        Map<String, Object> l = CinemaUtil.premier(c, sql, p);
        return l == null ? null : l.values().iterator().next().toString();
    }

    public static void main(String[] args) throws Exception {
        String url = args.length > 0 ? args[0] : "jdbc:oracle:thin:@127.0.0.1:1521:EE";
        String user = args.length > 1 ? args[1] : "arbiochemstandard";
        String mdp = args.length > 2 ? args[2] : "arbiochemstandard";
        Class.forName("oracle.jdbc.OracleDriver");
        try (Connection c = java.sql.DriverManager.getConnection(url, user, mdp)) {
            c.setAutoCommit(false);
            try {
                int n = charger(c, "1060");
                c.commit();
                System.out.println(n + " seance(s) creee(s). Programme du " + DEBUT + " au " + FIN + " charge.");
            } catch (Exception e) {
                c.rollback();
                throw e;
            }
        }
    }
}
