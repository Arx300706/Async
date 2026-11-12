package cinema;

import bean.ClassFille;
import bean.ClassMAPTable;
import bean.ClassMere;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Reservation de places (table RESERVATION).
 * Les lignes (RESERVATIONDETAILS) portent l'id de la seance dans IDPRODUIT.
 */
public class ReservationCinema extends ClassMere {
    private String id;
    private String idClient;
    private Date daty;
    private String remarque;
    private int etat;

    public ReservationCinema() throws Exception {
        this.setNomTable("RESERVATION");
        this.setNomClasseFille("cinema.ReservationCinemaDetail");
        this.setLiaisonFille("idMere");
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("RES", "GETSEQRESERVATION");
        this.setId(makePK(c));
    }

    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    @Override
    public String getNomClasseFille() { return "cinema.ReservationCinemaDetail"; }

    @Override
    public String getLiaisonFille() { return "idMere"; }

    /**
     * Controle une liste de lignes de reservation.
     * Verrouille chaque seance (SELECT ... FOR UPDATE) avant de relire les places disponibles :
     * deux guichets ne peuvent pas vendre les dernieres places en meme temps.
     * @param lignes lignes a controler (pas encore en base, ou en base mais a exclure du decompte)
     * @param dejaComptees true si les lignes sont deja en base et comptees dans les vues
     */
    public static void verifierLignes(Connection c, List<ReservationCinemaDetail> lignes, boolean dejaComptees) throws Exception {
        if (lignes.isEmpty()) throw new Exception("Choisir au moins une s\u00e9ance");
        Map<String, Double> demandees = new HashMap<>();
        for (ReservationCinemaDetail l : lignes) {
            CinemaUtil.requis(l.getIdProduit(), "S\u00e9ance");
            if (l.getQte() <= 0 || l.getQte() != Math.rint(l.getQte()))
                throw new Exception("Le nombre de places doit \u00eatre un entier strictement positif");
            demandees.merge(l.getIdProduit(), l.getQte(), Double::sum);
        }
        Map<String, Map<String, Object>> seances = new HashMap<>();
        for (Map.Entry<String, Double> e : demandees.entrySet()) {
            String idSeance = e.getKey();
            Map<String, Object> verrou = CinemaUtil.premier(c,
                    "SELECT ID FROM PLANNING WHERE ID=? AND IDTYPEMAINTENANCE=? FOR UPDATE", idSeance, ConstanteCinema.TYPE_SEANCE);
            if (verrou == null) throw new Exception("S\u00e9ance " + idSeance + " introuvable");
            Map<String, Object> s = CinemaUtil.premier(c, "SELECT * FROM V_SEANCE_PLACES_DISPO WHERE ID=?", idSeance);
            if (CinemaUtil.nombre(s, "ETAT") != ConstanteCinema.ETAT_VISE)
                throw new Exception("La s\u00e9ance " + idSeance + " n'est pas programm\u00e9e (elle doit \u00eatre vis\u00e9e)");
            Timestamp debut = CinemaUtil.date(s, "DATEHEUREDEBUT");
            if (debut == null || !debut.after(new Timestamp(System.currentTimeMillis())))
                throw new Exception("La s\u00e9ance " + idSeance + " (" + CinemaUtil.texte(s, "FILMLIB") + ") est d\u00e9j\u00e0 pass\u00e9e");
            double dispo = CinemaUtil.nombre(s, "PLACESDISPO");
            if (dejaComptees) dispo += e.getValue();
            if (e.getValue() > dispo)
                throw new Exception("Plus assez de places pour \u00ab " + CinemaUtil.texte(s, "FILMLIB") + " \u00bb du "
                        + debut.toString().substring(0, 16) + " : " + (long) Math.max(dispo, 0) + " place(s) restante(s), "
                        + e.getValue().longValue() + " demand\u00e9e(s)");
            seances.put(idSeance, s);
        }
        // Places numerotees (plan de salle) : code de la place dans REMARQUE, une place = une ligne de QTE 1
        java.util.Set<String> choisies = new java.util.HashSet<>();
        for (ReservationCinemaDetail l : lignes) {
            if (CinemaUtil.vide(l.getRemarque())) continue;
            String place = CinemaUtil.normaliserPlace(l.getRemarque());
            l.setRemarque(place);
            Map<String, Object> s = seances.get(l.getIdProduit());
            if (l.getQte() != 1) throw new Exception("Une place num\u00e9rot\u00e9e (" + place + ") correspond \u00e0 un seul billet");
            if (!CinemaUtil.placeValide(place, CinemaUtil.nombre(s, "CAPACITE"), CinemaUtil.nombre(s, "PLACESPARRANGEE")))
                throw new PlaceInexistanteException(l.getIdProduit(), place, CinemaUtil.texte(s, "SALLELIB"));
            if (!choisies.add(l.getIdProduit() + "|" + place))
                throw new PlaceEnDoubleException(l.getIdProduit(), place);
            Map<String, Object> prise = CinemaUtil.premier(c,
                    "SELECT IDRESERVATION, ETATRESERVATION FROM V_SEANCE_PLACES_OCCUPEES WHERE IDSEANCE=? AND PLACE=? AND IDRESERVATION<>?",
                    l.getIdProduit(), place, dejaComptees && !CinemaUtil.vide(l.getIdMere()) ? l.getIdMere() : "-");
            if (prise != null)
                throw new PlaceDejaPriseException(l.getIdProduit(), place, CinemaUtil.texte(prise, "IDRESERVATION"),
                        CinemaUtil.nombre(prise, "ETATRESERVATION") >= ConstanteCinema.ETAT_VISE);
        }
        // Prix : tarif de la categorie de la place (Standard, Confort, VIP selon la rangee),
        // sinon prix du billet du film ; date / heure = celles de la seance
        // puis promotion selon l'heure de la seance (ex. -50 % a partir de 20h00)
        List<Map<String, Object>> tarifs = TarifPlace.tous(c);
        List<Map<String, Object>> promotions = Promotion.actives(c);
        for (ReservationCinemaDetail l : lignes) {
            Map<String, Object> s = seances.get(l.getIdProduit());
            double prix = TarifPlace.prix(tarifs, l.getRemarque(), CinemaUtil.nombre(s, "PRIXBILLET"));
            l.setPu(Promotion.appliquer(prix, Promotion.taux(promotions, CinemaUtil.texte(s, "HEURE"))));
            Timestamp d = CinemaUtil.date(s, "DATEDEBUT");
            l.setDaty(d == null ? null : new Date(d.getTime()));
            l.setHeure(CinemaUtil.texte(s, "HEURE"));
            if (l.getEtat() == 0) l.setEtat(ConstanteCinema.ETAT_CREE);
        }
    }

    @Override
    public ClassMAPTable createObject(String u, Connection c) throws Exception {
        if (CinemaUtil.vide(idClient)) setIdClient(ConstanteCinema.CLIENT_PASSAGE);
        if (daty == null) setDaty(utilitaire.Utilitaire.dateDuJourSql());
        if (etat == 0) setEtat(ConstanteCinema.ETAT_CREE);
        // on ignore les lignes vides du formulaire
        List<ReservationCinemaDetail> lignes = new ArrayList<>();
        ClassFille[] f = getFille();
        if (f != null) {
            for (ClassFille x : f) {
                ReservationCinemaDetail d = (ReservationCinemaDetail) x;
                if (d != null && !CinemaUtil.vide(d.getIdProduit())) lignes.add(d);
            }
        }
        verifierLignes(c, lignes, false);
        setFille(new ArrayList<ClassFille>(lignes));
        return super.createObject(u, c);
    }

    @Override
    public Object validerObject(String u, Connection c) throws Exception {
        // les places sont deja comptees (etat 1) : on verifie que les seances sont toujours a venir et programmees
        List<ReservationCinemaDetail> lignes = new ArrayList<>();
        ClassFille[] f = getFille();
        if (f == null || f.length == 0) f = getFille(null, c, " and idMere='" + id.replace("'", "''") + "'");
        if (f != null) for (ClassFille x : f) lignes.add((ReservationCinemaDetail) x);
        verifierLignes(c, lignes, true);
        Object resultat = super.validerObject(u, c);
        // Billets vendus : la facture est emise dans la meme transaction
        FactureBillet.facturer(id, u, c);
        return resultat;
    }

    /**
     * Vente au guichet sur plan de salle : une ligne par place choisie.
     * Si idCaisse est renseigne, la reservation est visee et payee en totalite dans la meme transaction.
     * @return id de la reservation
     */
    public static String reserverPlaces(String idSeance, String[] places, String idClient, String remarque,
                                        String idCaisse, String u, Connection c) throws Exception {
        boolean ouvert = false;
        try {
            if (c == null) {
                c = new utilitaire.UtilDB().GetConn();
                c.setAutoCommit(false);
                ouvert = true;
            }
            CinemaUtil.requis(idSeance, "S\u00e9ance");
            if (places == null || places.length == 0) throw new Exception("Cliquez sur au moins une place libre du plan");
            if (!CinemaUtil.vide(idClient)) {
                idClient = idClient.trim();
                if (CinemaUtil.premier(c, "SELECT ID FROM CLIENT WHERE ID=?", idClient) == null)
                    throw new Exception("Client " + idClient + " introuvable (laisser vide pour le client passage)");
            }
            ReservationCinema r = new ReservationCinema();
            r.setIdClient(idClient);
            r.setRemarque(remarque);
            List<ReservationCinemaDetail> lignes = new ArrayList<>();
            for (String p : places) {
                if (CinemaUtil.vide(p)) continue;
                ReservationCinemaDetail d = new ReservationCinemaDetail();
                d.setIdProduit(idSeance);
                d.setQte(1);
                d.setRemarque(p);
                lignes.add(d);
            }
            if (lignes.isEmpty()) throw new Exception("Cliquez sur au moins une place libre du plan");
            r.setFille(new ArrayList<ClassFille>(lignes));
            r = (ReservationCinema) r.createObject(u, c);
            String idReservation = r.getId();
            if (!CinemaUtil.vide(idCaisse)) {
                ReservationCinema enBase = new ReservationCinema();
                enBase.setId(idReservation);
                enBase = (ReservationCinema) bean.CGenUtil.getMereAvecFille(enBase, c, null);
                enBase.validerObject(u, c);
                double montant = CinemaUtil.valeur(c, "SELECT RESTEAPAYER FROM V_RESERVATION_CINEMA WHERE ID=?", idReservation);
                if (montant > 0) payer(idReservation, montant, idCaisse, null, u, c);
            }
            if (ouvert) c.commit();
            return idReservation;
        } catch (Exception e) {
            if (ouvert && c != null) c.rollback();
            throw e;
        } finally {
            if (ouvert && c != null) c.close();
        }
    }

    /**
     * Paiement client : mouvement de caisse (CREDIT, IDOP = reservation) vise.
     * Refuse un montant superieur au reste a payer.
     */
    public static String payer(String idReservation, double montant, String idCaisse, String idModePaiement, String u, Connection c) throws Exception {
        boolean ouvert = false;
        try {
            if (c == null) {
                c = new utilitaire.UtilDB().GetConn();
                c.setAutoCommit(false);
                ouvert = true;
            }
            Map<String, Object> r = CinemaUtil.premier(c, "SELECT ID, ETAT, IDCLIENT FROM RESERVATION WHERE ID=? FOR UPDATE", idReservation);
            if (r == null) throw new Exception("R\u00e9servation introuvable");
            if (CinemaUtil.nombre(r, "ETAT") != ConstanteCinema.ETAT_VISE) throw new Exception("La r\u00e9servation doit \u00eatre vis\u00e9e avant le paiement");
            double reste = CinemaUtil.valeur(c, "SELECT RESTEAPAYER FROM V_RESERVATION_CINEMA WHERE ID=?", idReservation);
            if (montant <= 0) throw new Exception("Le montant doit \u00eatre strictement positif");
            if (montant > reste + 0.001) throw new Exception("Le montant (" + montant + ") d\u00e9passe le reste \u00e0 payer (" + reste + ")");
            CinemaUtil.requis(idCaisse, "Caisse");

            caisse.MvtCaisse m = new caisse.MvtCaisse();
            m.setDaty(utilitaire.Utilitaire.dateDuJourSql());
            m.setDesignation("Paiement r\u00e9servation cin\u00e9ma " + idReservation);
            m.setIdCaisse(idCaisse);
            m.setCredit(montant);
            m.setDebit(0);
            m.setIdOp(idReservation);
            // IDORIGINE laisse vide : pas d ecriture de vente a lettrer (le lien se fait par IDOP, comme RESERVATION_LIB)
            m.setIdTiers(CinemaUtil.texte(r, "IDCLIENT"));
            m.setIdDevise("AR");
            m.setTaux(1);
            m.setCompte(utils.ConstanteAsync.COMPTE_REGROUPEMENT);
            if (!CinemaUtil.vide(idModePaiement)) m.setIdModePaiement(idModePaiement);
            m.setEtat(ConstanteCinema.ETAT_CREE);
            m = (caisse.MvtCaisse) m.createObject(u, c);
            caisse.MvtCaisse enBase = (caisse.MvtCaisse) new caisse.MvtCaisse().getById(m.getId(), "MOUVEMENTCAISSE", c);
            enBase.validerObject(u, c);
            if (ouvert) c.commit();
            return m.getId();
        } catch (Exception e) {
            if (ouvert && c != null) c.rollback();
            throw e;
        } finally {
            if (ouvert && c != null) c.close();
        }
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getIdClient() { return idClient; }
    public void setIdClient(String idClient) { this.idClient = idClient; }
    public Date getDaty() { return daty; }
    public void setDaty(Date daty) { this.daty = daty; }
    public String getRemarque() { return remarque; }
    public void setRemarque(String remarque) { this.remarque = remarque; }
    @Override
    public int getEtat() { return etat; }
    @Override
    public void setEtat(int etat) { this.etat = etat; }
}
