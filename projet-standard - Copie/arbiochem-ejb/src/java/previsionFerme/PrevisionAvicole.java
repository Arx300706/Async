package previsionFerme;

import utilitaire.UtilDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/** Projection des effectifs, pontes et eclosions par race et par lot. */
public final class PrevisionAvicole {
    private PrevisionAvicole() { }

    public static final class Configuration {
        private final int semaineDebutPonte;
        private final double oeufsParFemelleJour;
        private final int delaiEclosionJours;
        private final double tauxEclosion;

        public Configuration(int semaineDebutPonte, double oeufsParFemelleJour,
                             int delaiEclosionJours, double tauxEclosion) {
            if (semaineDebutPonte < 1 || semaineDebutPonte > 100) throw new IllegalArgumentException("Semaine de ponte invalide");
            if (!Double.isFinite(oeufsParFemelleJour) || oeufsParFemelleJour < 0 || oeufsParFemelleJour > 10)
                throw new IllegalArgumentException("Nombre d'oeufs par femelle invalide");
            if (delaiEclosionJours < 1 || delaiEclosionJours > 365) throw new IllegalArgumentException("Delai d'eclosion invalide");
            if (!Double.isFinite(tauxEclosion) || tauxEclosion < 0 || tauxEclosion > 100)
                throw new IllegalArgumentException("Taux d'eclosion invalide");
            this.semaineDebutPonte = semaineDebutPonte;
            this.oeufsParFemelleJour = oeufsParFemelleJour;
            this.delaiEclosionJours = delaiEclosionJours;
            this.tauxEclosion = tauxEclosion;
        }

        public int getSemaineDebutPonte() { return semaineDebutPonte; }
        public double getOeufsParFemelleJour() { return oeufsParFemelleJour; }
        public int getDelaiEclosionJours() { return delaiEclosionJours; }
        public double getTauxEclosion() { return tauxEclosion; }
    }

    public static final class LotProjection {
        private final String id;
        private final String nom;
        private final String idRace;
        private final String race;
        private final LocalDate dateEclosion;
        private final LocalDate dateArrivee;
        private final LocalDate dateCloture;
        private final long femellesInitiales;
        private final long malesInitiaux;
        private final long nonVentilesInitiaux;
        private final long morts;
        private final long perdus;
        private final long vivants;
        private final long femellesVivantes;
        private final long malesVivants;

        private LotProjection(ResultSet resultat) throws Exception {
            id = resultat.getString("id");
            nom = resultat.getString("nomlot");
            idRace = resultat.getString("idrace");
            race = resultat.getString("race");
            dateEclosion = toLocalDate(resultat.getDate("dateeclosion"));
            dateArrivee = toLocalDate(resultat.getDate("datearrivee"));
            dateCloture = toLocalDate(resultat.getDate("datecloture"));
            femellesInitiales = Math.max(0, Math.round(resultat.getDouble("femelles")));
            malesInitiaux = Math.max(0, Math.round(resultat.getDouble("males")));
            nonVentilesInitiaux = Math.max(0, Math.round(resultat.getDouble("non_ventiles")));
            morts = Math.max(0, Math.round(resultat.getDouble("morts")));
            perdus = Math.max(0, Math.round(resultat.getDouble("perdus")));
            long initial = getEffectifInitial();
            vivants = Math.max(0, initial - morts - perdus);
            if (initial == 0) {
                femellesVivantes = 0;
                malesVivants = 0;
            } else {
                femellesVivantes = Math.min(femellesInitiales, Math.round((double) femellesInitiales * vivants / initial));
                malesVivants = Math.min(malesInitiaux, Math.round((double) malesInitiaux * vivants / initial));
            }
        }

        public String getId() { return id; }
        public String getNom() { return nom; }
        public String getIdRace() { return idRace; }
        public String getRace() { return race; }
        public LocalDate getDateEclosion() { return dateEclosion; }
        public LocalDate getDateArrivee() { return dateArrivee; }
        public LocalDate getDateCloture() { return dateCloture; }
        public long getFemellesInitiales() { return femellesInitiales; }
        public long getMalesInitiaux() { return malesInitiaux; }
        public long getNonVentilesInitiaux() { return nonVentilesInitiaux; }
        public long getMorts() { return morts; }
        public long getPerdus() { return perdus; }
        public long getVivants() { return vivants; }
        public long getFemellesVivantes() { return femellesVivantes; }
        public long getMalesVivants() { return malesVivants; }
        public long getEffectifInitial() { return femellesInitiales + malesInitiaux + nonVentilesInitiaux; }

        public int getAgeSemaines(LocalDate date) {
            LocalDate debut = dateEclosion != null ? dateEclosion : dateArrivee;
            if (debut == null || date.isBefore(debut)) return 0;
            return (int) (ChronoUnit.DAYS.between(debut, date) / 7) + 1;
        }

        public boolean estActif(LocalDate date) {
            LocalDate debut = dateEclosion != null ? dateEclosion : dateArrivee;
            return debut != null && !date.isBefore(debut) && (dateCloture == null || !date.isAfter(dateCloture));
        }
    }

    public static final class RaceResume {
        private final String idRace;
        private final String race;
        private int nombreLots;
        private long femelles;
        private long males;
        private long morts;
        private long perdus;
        private long vivants;

        private RaceResume(String idRace, String race) {
            this.idRace = idRace;
            this.race = race;
        }

        private void ajouter(LotProjection lot) {
            nombreLots++;
            femelles += lot.getFemellesVivantes();
            males += lot.getMalesVivants();
            morts += lot.getMorts();
            perdus += lot.getPerdus();
            vivants += lot.getVivants();
        }

        public String getIdRace() { return idRace; }
        public String getRace() { return race; }
        public int getNombreLots() { return nombreLots; }
        public long getFemelles() { return femelles; }
        public long getMales() { return males; }
        public long getMorts() { return morts; }
        public long getPerdus() { return perdus; }
        public long getVivants() { return vivants; }
    }

    public static final class JourProjection {
        private final LocalDate date;
        private final long oeufs;
        private final long poussins;
        private final int lotsPondeurs;
        private final int nouveauxLots;

        private JourProjection(LocalDate date, long oeufs, long poussins, int lotsPondeurs, int nouveauxLots) {
            this.date = date;
            this.oeufs = oeufs;
            this.poussins = poussins;
            this.lotsPondeurs = lotsPondeurs;
            this.nouveauxLots = nouveauxLots;
        }

        public LocalDate getDate() { return date; }
        public long getOeufs() { return oeufs; }
        public long getPoussins() { return poussins; }
        public int getLotsPondeurs() { return lotsPondeurs; }
        public int getNouveauxLots() { return nouveauxLots; }
    }

    public static List<LotProjection> chargerLots(LocalDate dateBilan) throws Exception {
        String sql =
                "SELECT l.id, l.nomlot, NVL(l.idsouche, '-') idrace, NVL(s.val, 'Race non definie') race, " +
                "       l.dateeclosion, l.datearrivee, l.datecloture, " +
                "       CASE WHEN NVL(bat.total,0)>0 THEN bat.femelles " +
                "            WHEN NVL(tri.total,0)>0 THEN tri.femelles " +
                "            WHEN NVL(recsexe.total,0)>0 THEN recsexe.femelles ELSE 0 END femelles, " +
                "       CASE WHEN NVL(bat.total,0)>0 THEN bat.males " +
                "            WHEN NVL(tri.total,0)>0 THEN tri.males " +
                "            WHEN NVL(recsexe.total,0)>0 THEN recsexe.males ELSE 0 END males, " +
                "       CASE WHEN NVL(bat.total,0)>0 THEN bat.non_ventiles " +
                "            WHEN NVL(tri.total,0)>0 OR NVL(recsexe.total,0)>0 THEN 0 " +
                "            ELSE NVL(rec.total,0) END non_ventiles, " +
                "       NVL(suivi.morts,0) morts, NVL(suivi.perdus,0) perdus " +
                "FROM lot l " +
                "LEFT JOIN souche s ON s.id=l.idsouche " +
                "LEFT JOIN (SELECT idlot, " +
                " SUM(CASE WHEN idsexe='0' THEN NVL(effectif,0) ELSE 0 END) femelles, " +
                " SUM(CASE WHEN idsexe='1' THEN NVL(effectif,0) ELSE 0 END) males, " +
                " SUM(CASE WHEN idsexe IS NULL OR idsexe NOT IN ('0','1') THEN NVL(effectif,0) ELSE 0 END) non_ventiles, " +
                " SUM(NVL(effectif,0)) total FROM batimentdetail GROUP BY idlot) bat ON bat.idlot=l.id " +
                "LEFT JOIN (SELECT idlot, MAX(NVL(dispofemelle,0)) femelles, MAX(NVL(dispomale,0)) males, " +
                " MAX(NVL(dispofemelle,0))+MAX(NVL(dispomale,0)) total FROM triagebatimentparquet " +
                " WHERE NVL(etat,1)<>0 GROUP BY idlot) tri ON tri.idlot=l.id " +
                "LEFT JOIN (SELECT r.idlot, " +
                " SUM(CASE WHEN d.idsexe='0' THEN NVL(d.qte,0) ELSE 0 END) femelles, " +
                " SUM(CASE WHEN d.idsexe='1' THEN NVL(d.qte,0) ELSE 0 END) males, SUM(NVL(d.qte,0)) total " +
                " FROM receptionpoussinaeroport r JOIN receptionpoussinaeroportdetail d ON d.idmere=r.id " +
                " WHERE NVL(r.etat,1)<>0 GROUP BY r.idlot) recsexe ON recsexe.idlot=l.id " +
                "LEFT JOIN (SELECT idlot, SUM(NVL(qterecus,0)) total FROM receptionpoussinaeroport " +
                " WHERE NVL(etat,1)<>0 GROUP BY idlot) rec ON rec.idlot=l.id " +
                "LEFT JOIN (SELECT j.idlot, SUM(NVL(d.mortalite,0)) morts, SUM(NVL(d.culls,0)) perdus " +
                " FROM suivijournalier j JOIN suivijournalierdetail d ON d.idmere=j.id " +
                " WHERE TRUNC(j.daty)<=? AND NVL(j.etat,1)<>0 GROUP BY j.idlot) suivi ON suivi.idlot=l.id " +
                "WHERE NVL(l.etat,1)<>0 ORDER BY NVL(s.val,'Race non definie'), l.nomlot, l.id";

        List<LotProjection> lots = new ArrayList<>();
        try (Connection connexion = new UtilDB().GetConn();
             PreparedStatement statement = connexion.prepareStatement(sql)) {
            statement.setDate(1, java.sql.Date.valueOf(dateBilan));
            try (ResultSet resultat = statement.executeQuery()) {
                while (resultat.next()) lots.add(new LotProjection(resultat));
            }
        }
        return lots;
    }

    public static List<RaceResume> resumerParRace(List<LotProjection> lots, LocalDate date) {
        Map<String, RaceResume> groupes = new TreeMap<>();
        for (LotProjection lot : lots) {
            if (!lot.estActif(date)) continue;
            String cle = lot.getRace().toLowerCase() + "|" + lot.getIdRace();
            RaceResume resume = groupes.get(cle);
            if (resume == null) {
                resume = new RaceResume(lot.getIdRace(), lot.getRace());
                groupes.put(cle, resume);
            }
            resume.ajouter(lot);
        }
        return new ArrayList<>(groupes.values());
    }

    public static List<LotProjection> lotsPourRace(List<LotProjection> lots, String idRace, LocalDate date) {
        List<LotProjection> resultat = new ArrayList<>();
        for (LotProjection lot : lots) {
            if (lot.getIdRace().equals(idRace) && lot.estActif(date)) resultat.add(lot);
        }
        return resultat;
    }

    public static long oeufsPour(LotProjection lot, LocalDate date, Configuration configuration) {
        if (!lot.estActif(date) || lot.getAgeSemaines(date) < configuration.getSemaineDebutPonte()) return 0;
        return Math.max(0, Math.round(lot.getFemellesVivantes() * configuration.getOeufsParFemelleJour()));
    }

    public static long poussinsPourPonte(LotProjection lot, LocalDate datePonte, Configuration configuration) {
        return Math.max(0, Math.round(oeufsPour(lot, datePonte, configuration) * configuration.getTauxEclosion() / 100.0));
    }

    public static LocalDate dateDebutPonte(LotProjection lot, Configuration configuration) {
        LocalDate debut = lot.getDateEclosion() != null ? lot.getDateEclosion() : lot.getDateArrivee();
        return debut == null ? null : debut.plusDays((long) (configuration.getSemaineDebutPonte() - 1) * 7);
    }

    public static Map<LocalDate, JourProjection> prevoirMois(List<LotProjection> lots, String idRace,
                                                              YearMonth mois, Configuration configuration) {
        Map<LocalDate, JourProjection> resultat = new LinkedHashMap<>();
        for (int numero = 1; numero <= mois.lengthOfMonth(); numero++) {
            LocalDate date = mois.atDay(numero);
            LocalDate datePonteDesEclosions = date.minusDays(configuration.getDelaiEclosionJours());
            long oeufs = 0;
            long poussins = 0;
            int lotsPondeurs = 0;
            int nouveauxLots = 0;
            for (LotProjection lot : lots) {
                if (!lot.getIdRace().equals(idRace)) continue;
                long oeufsLot = oeufsPour(lot, date, configuration);
                if (oeufsLot > 0) {
                    oeufs += oeufsLot;
                    lotsPondeurs++;
                }
                long poussinsLot = poussinsPourPonte(lot, datePonteDesEclosions, configuration);
                if (poussinsLot > 0) {
                    poussins += poussinsLot;
                    nouveauxLots++;
                }
            }
            resultat.put(date, new JourProjection(date, oeufs, poussins, lotsPondeurs, nouveauxLots));
        }
        return resultat;
    }

    private static LocalDate toLocalDate(java.sql.Date date) {
        return date == null ? null : date.toLocalDate();
    }
}
