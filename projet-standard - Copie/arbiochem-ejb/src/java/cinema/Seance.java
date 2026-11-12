package cinema;

import bean.ClassEtat;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * Seance de cinema, stockee dans PLANNING.
 *  REFOBJET = film, IDMACHINE = salle, DATEDEBUT + HEURE = debut,
 *  DUREE = duree film + nettoyage (minutes), DATEFIN = jour de fin,
 *  IDSOURCE = contrat (AS_BONDECOMMANDE) qui autorise la seance,
 *  IDTYPEMAINTENANCE = SEANCE CINEMA.
 * Etats : 1 = creee, 11 = programmee (reservable), 0 = annulee.
 */
public class Seance extends ClassEtat {
    private String id;
    private String refObjet;
    private int estPeriodique;
    private String idTypeMaintenance;
    private String idMachine;
    private Date dateDebut;
    private Date dateFin;
    private String duree;
    private int etat;
    private String heure;
    private String idSource;

    public Seance() {
        this.setNomTable("PLANNING");
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("SEA", "GETSEQPLANNING");
        this.setId(makePK(c));
    }

    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    /** Tous les controles metier d'une seance (creation, modification, visa). */
    public void verifier(Connection c) throws Exception {
        CinemaUtil.requis(refObjet, "Film");
        CinemaUtil.requis(idMachine, "Salle");
        setHeure(CinemaUtil.heure(heure));
        Timestamp debut = CinemaUtil.instant(dateDebut, heure);

        // 1. salle existante, active, de type salle de cinema (verrou : serialise les seances d'une salle)
        Map<String, Object> salle = CinemaUtil.premier(c, "SELECT * FROM MAGASIN2 WHERE ID=? FOR UPDATE", idMachine);
        if (salle == null || !ConstanteCinema.TYPE_MAGASIN_SALLE.equals(CinemaUtil.texte(salle, "IDTYPEMAGASIN")))
            throw new Exception("Salle de cin\u00e9ma introuvable");
        if (salle.get("ACTIF") != null && CinemaUtil.nombre(salle, "ACTIF") != 1) throw new Exception("La salle n'est pas active");
        if (CinemaUtil.nombre(salle, "CAPACITE") <= 0) throw new Exception("La salle n'a pas de capacit\u00e9");

        //    film existant, actif
        Map<String, Object> film = CinemaUtil.premier(c, "SELECT LIBELLE, ACTIF, DURRE, CATEGORIEINGREDIENT FROM AS_INGREDIENTS WHERE ID=?", refObjet);
        if (film == null || !ConstanteCinema.CATEGORIE_FILM.equals(CinemaUtil.texte(film, "CATEGORIEINGREDIENT")))
            throw new Exception("Film introuvable");
        if (film.get("ACTIF") != null && CinemaUtil.nombre(film, "ACTIF") != 1) throw new Exception("Le film n'est pas actif");
        double dureeFilm = CinemaUtil.nombre(film, "DURRE");
        if (dureeFilm <= 0) throw new Exception("La dur\u00e9e du film n'est pas renseign\u00e9e");

        // 2. dans le futur
        if (!debut.after(new Timestamp(System.currentTimeMillis())))
            throw new Exception("La s\u00e9ance doit \u00eatre programm\u00e9e dans le futur");

        // 3. licence valide a la date de la seance et seances restantes
        Map<String, Object> ancienne = CinemaUtil.vide(id) ? null
                : CinemaUtil.premier(c, "SELECT IDSOURCE, ETAT FROM PLANNING WHERE ID=?", id);
        List<Map<String, Object>> licences = CinemaUtil.lire(c,
                "SELECT IDBC FROM V_FILM_LICENCE WHERE IDFILM=? AND DATEDEBUTDROITS IS NOT NULL "
                        + "AND DATEDEBUTDROITS<=TRUNC(?) AND DATEFINDROITS>=TRUNC(?) ORDER BY DATEFINDROITS, IDBC",
                refObjet, debut, debut);
        String contrat = null;
        for (Map<String, Object> l : licences) {
            String idbc = CinemaUtil.texte(l, "IDBC");
            // verrou du contrat : deux utilisateurs ne consomment pas la derniere seance en meme temps
            CinemaUtil.premier(c, "SELECT ID FROM AS_BONDECOMMANDE WHERE ID=? FOR UPDATE", idbc);
            double restantes = CinemaUtil.valeur(c, "SELECT SEANCESRESTANTES FROM V_FILM_LICENCE WHERE IDBC=?", idbc);
            if (ancienne != null && idbc.equals(CinemaUtil.texte(ancienne, "IDSOURCE"))
                    && CinemaUtil.nombre(ancienne, "ETAT") != ConstanteCinema.ETAT_ANNULE) restantes += 1; // la seance elle-meme
            if (restantes > 0) { contrat = idbc; break; }
        }
        if (contrat == null) {
            if (licences.isEmpty())
                throw new Exception("Le cin\u00e9ma n'a pas les droits de diffusion du film \u00ab " + CinemaUtil.texte(film, "LIBELLE") + " \u00bb \u00e0 cette date");
            throw new Exception("Toutes les s\u00e9ances autoris\u00e9es par la licence du film \u00ab " + CinemaUtil.texte(film, "LIBELLE") + " \u00bb sont d\u00e9j\u00e0 programm\u00e9es");
        }
        setIdSource(contrat);

        // 4. duree et fin
        int minutes = (int) dureeFilm + ConstanteCinema.NETTOYAGE_MINUTES;
        setDuree(String.valueOf(minutes));
        Timestamp fin = new Timestamp(debut.getTime() + minutes * 60000L);
        setDateFin(new Date(fin.getTime()));

        // 5. pas de chevauchement dans la meme salle
        Map<String, Object> conflit = CinemaUtil.premier(c,
                "SELECT ID, FILMLIB, HEURE FROM V_SEANCE_CINEMA_LIB WHERE IDSALLE=? AND ETAT<>0 AND ID<>? "
                        + "AND DATEHEUREDEBUT < ? AND DATEHEUREFIN > ?",
                idMachine, CinemaUtil.vide(id) ? "-" : id, fin, debut);
        if (conflit != null)
            throw new Exception("La salle est d\u00e9j\u00e0 occup\u00e9e par la s\u00e9ance " + CinemaUtil.texte(conflit, "ID")
                    + " (" + CinemaUtil.texte(conflit, "FILMLIB") + " \u00e0 " + CinemaUtil.texte(conflit, "HEURE") + ")");

        // 6. type seance
        setIdTypeMaintenance(ConstanteCinema.TYPE_SEANCE);
        setEstPeriodique(0);
    }

    @Override
    public void controler(Connection c) throws Exception {
        if (etat == 0) etat = ConstanteCinema.ETAT_CREE;
        verifier(c);
        super.controler(c);
    }

    @Override
    public int updateObject(String u, Connection c) throws Exception {
        if (!CinemaUtil.vide(id)) {
            Map<String, Object> enBase = CinemaUtil.premier(c, "SELECT ETAT FROM PLANNING WHERE ID=?", id);
            if (enBase != null && CinemaUtil.nombre(enBase, "ETAT") != ConstanteCinema.ETAT_CREE)
                throw new Exception("Seule une s\u00e9ance cr\u00e9\u00e9e (non programm\u00e9e, non annul\u00e9e) peut \u00eatre modifi\u00e9e");
        }
        verifier(c);
        return super.updateObject(u, c);
    }

    @Override
    public Object validerObject(String u, Connection c) throws Exception {
        verifier(c);
        return super.validerObject(u, c);
    }

    /** Refuse l'annulation si des places sont deja reservees. */
    @Override
    public void controleAnnuler(Connection c) throws Exception {
        CinemaUtil.premier(c, "SELECT ID FROM PLANNING WHERE ID=? FOR UPDATE", id);
        double reservees = CinemaUtil.valeur(c, "SELECT NVL(SUM(PLACESRESERVEES),0) FROM V_SEANCE_PLACES_RESERVEES WHERE IDSEANCE=?", id);
        if (reservees > 0)
            throw new Exception("Impossible d'annuler : " + (long) reservees + " place(s) sont r\u00e9serv\u00e9es. Annulez d'abord les r\u00e9servations.");
        super.controleAnnuler(c);
    }

    @Override
    public String[] getMotCles() { return new String[]{"id", "heure"}; }

    @Override
    public String[] getValMotCles() { return new String[]{"id", "heure"}; }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getRefObjet() { return refObjet; }
    public void setRefObjet(String refObjet) { this.refObjet = refObjet; }
    public int getEstPeriodique() { return estPeriodique; }
    public void setEstPeriodique(int estPeriodique) { this.estPeriodique = estPeriodique; }
    public String getIdTypeMaintenance() { return idTypeMaintenance; }
    public void setIdTypeMaintenance(String idTypeMaintenance) { this.idTypeMaintenance = idTypeMaintenance; }
    public String getIdMachine() { return idMachine; }
    public void setIdMachine(String idMachine) { this.idMachine = idMachine; }
    public Date getDateDebut() { return dateDebut; }
    public void setDateDebut(Date dateDebut) { this.dateDebut = dateDebut; }
    public Date getDateFin() { return dateFin; }
    public void setDateFin(Date dateFin) { this.dateFin = dateFin; }
    public String getDuree() { return duree; }
    public void setDuree(String duree) { this.duree = duree; }
    @Override
    public int getEtat() { return etat; }
    @Override
    public void setEtat(int etat) { this.etat = etat; }
    public String getHeure() { return heure; }
    public void setHeure(String heure) { this.heure = heure; }
    public String getIdSource() { return idSource; }
    public void setIdSource(String idSource) { this.idSource = idSource; }
}
