package ferme.lot;

import utilitaire.UtilDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Donnees cumulees d'un lot a une date donnee. */
public class LotCalendrier {
    private final String id;
    private final String nomLot;
    private final String race;
    private final LocalDate dateArrivee;
    private final long effectifInitial;
    private final long nombreMorts;
    private final long nombrePerdus;

    public LotCalendrier(String id, String nomLot, String race, LocalDate dateArrivee,
                         long effectifInitial, long nombreMorts, long nombrePerdus) {
        this.id = id;
        this.nomLot = nomLot;
        this.race = race;
        this.dateArrivee = dateArrivee;
        this.effectifInitial = effectifInitial;
        this.nombreMorts = nombreMorts;
        this.nombrePerdus = nombrePerdus;
    }

    public String getId() { return id; }
    public String getNomLot() { return nomLot; }
    public String getRace() { return race; }
    public LocalDate getDateArrivee() { return dateArrivee; }
    public long getEffectifInitial() { return effectifInitial; }
    public long getNombreMorts() { return nombreMorts; }
    public long getNombrePerdus() { return nombrePerdus; }

    public static List<LotCalendrier> rechercher(LocalDate date) throws Exception {
        String sql =
                "SELECT l.id, l.nomlot, NVL(s.val, '-') race, " +
                "       NVL(l.datearrivee, l.dateeclosion) date_arrivee, " +
                "       CASE WHEN NVL(tri.effectif, 0) > 0 THEN tri.effectif " +
                "            WHEN NVL(bat.effectif, 0) > 0 THEN bat.effectif " +
                "            ELSE NVL(rec.effectif, 0) END effectif_initial, " +
                "       NVL(suivi.morts, 0) nombre_morts, " +
                "       NVL(suivi.perdus, 0) nombre_perdus " +
                "FROM lot l " +
                "LEFT JOIN souche s ON s.id = l.idsouche " +
                "LEFT JOIN ( " +
                "    SELECT idlot, MAX(NVL(dispomale, 0) + NVL(dispofemelle, 0)) effectif " +
                "    FROM triagebatimentparquet " +
                "    WHERE TRUNC(daty) <= ? AND NVL(etat, 1) <> 0 " +
                "    GROUP BY idlot " +
                ") tri ON tri.idlot = l.id " +
                "LEFT JOIN ( " +
                "    SELECT idlot, SUM(NVL(effectif, 0)) effectif " +
                "    FROM batimentdetail GROUP BY idlot " +
                ") bat ON bat.idlot = l.id " +
                "LEFT JOIN ( " +
                "    SELECT idlot, MAX(NVL(qterecus, 0)) effectif " +
                "    FROM receptionpoussinaeroport " +
                "    WHERE TRUNC(daty) <= ? AND NVL(etat, 1) <> 0 " +
                "    GROUP BY idlot " +
                ") rec ON rec.idlot = l.id " +
                "LEFT JOIN ( " +
                "    SELECT j.idlot, SUM(NVL(d.mortalite, 0)) morts, SUM(NVL(d.culls, 0)) perdus " +
                "    FROM suivijournalier j " +
                "    JOIN suivijournalierdetail d ON d.idmere = j.id " +
                "    WHERE TRUNC(j.daty) <= ? AND NVL(j.etat, 1) <> 0 " +
                "    GROUP BY j.idlot " +
                ") suivi ON suivi.idlot = l.id " +
                "WHERE TRUNC(NVL(l.datearrivee, l.dateeclosion)) <= ? " +
                "  AND (l.datecloture IS NULL OR TRUNC(l.datecloture) >= ?) " +
                "  AND NVL(l.etat, 1) <> 0 " +
                "ORDER BY l.nomlot, l.id";

        java.sql.Date dateSql = java.sql.Date.valueOf(date);
        List<LotCalendrier> resultats = new ArrayList<>();
        try (Connection connexion = new UtilDB().GetConn();
             PreparedStatement statement = connexion.prepareStatement(sql)) {
            for (int i = 1; i <= 5; i++) statement.setDate(i, dateSql);
            try (ResultSet resultat = statement.executeQuery()) {
                while (resultat.next()) {
                    java.sql.Date arrivee = resultat.getDate("date_arrivee");
                    resultats.add(new LotCalendrier(
                            resultat.getString("id"),
                            resultat.getString("nomlot"),
                            resultat.getString("race"),
                            arrivee == null ? null : arrivee.toLocalDate(),
                            Math.round(resultat.getDouble("effectif_initial")),
                            Math.round(resultat.getDouble("nombre_morts")),
                            Math.round(resultat.getDouble("nombre_perdus"))));
                }
            }
        }
        return resultats;
    }

    public static Map<LocalDate, Integer> compterParJour(YearMonth mois) throws Exception {
        String sql =
                "SELECT NVL(datearrivee, dateeclosion) date_debut, datecloture date_fin " +
                "FROM lot " +
                "WHERE TRUNC(NVL(datearrivee, dateeclosion)) <= ? " +
                "  AND (datecloture IS NULL OR TRUNC(datecloture) >= ?) " +
                "  AND NVL(etat, 1) <> 0";
        LocalDate debutMois = mois.atDay(1);
        LocalDate finMois = mois.atEndOfMonth();
        Map<LocalDate, Integer> comptes = new LinkedHashMap<>();
        for (LocalDate jour = debutMois; !jour.isAfter(finMois); jour = jour.plusDays(1)) {
            comptes.put(jour, 0);
        }

        try (Connection connexion = new UtilDB().GetConn();
             PreparedStatement statement = connexion.prepareStatement(sql)) {
            statement.setDate(1, java.sql.Date.valueOf(finMois));
            statement.setDate(2, java.sql.Date.valueOf(debutMois));
            try (ResultSet resultat = statement.executeQuery()) {
                while (resultat.next()) {
                    LocalDate debut = resultat.getDate("date_debut").toLocalDate();
                    java.sql.Date finSql = resultat.getDate("date_fin");
                    LocalDate fin = finSql == null ? finMois : finSql.toLocalDate();
                    LocalDate premierJour = debut.isAfter(debutMois) ? debut : debutMois;
                    LocalDate dernierJour = fin.isBefore(finMois) ? fin : finMois;
                    for (LocalDate jour = premierJour; !jour.isAfter(dernierJour); jour = jour.plusDays(1)) {
                        comptes.put(jour, comptes.get(jour) + 1);
                    }
                }
            }
        }
        return comptes;
    }
}
