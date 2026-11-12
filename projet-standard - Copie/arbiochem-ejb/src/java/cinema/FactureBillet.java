package cinema;

import bean.ClassFille;
import bean.ClassMere;
import java.sql.Connection;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Facture des billets d'une reservation de cinema (table FACTURECLIENT, IDRESERVATION = reservation).
 * Les lignes sont dans FACTURECLIENTDETAILS (une ligne par billet, IDPRODUIT = produit de la categorie de place,
 * la seance et la place sont dans DESIGNATION).
 * Une facture est emise (etat 11) des que la reservation est visee ; une reservation n'a qu'une facture.
 */
public class FactureBillet extends ClassMere {
    /** Produit d'un billet sans categorie de place (PRODUIT.ID). */
    public static final String PRODUIT_BILLET = "BILLETCINEMA";

    private String id;
    private String idClient;
    private Date daty;
    private String designation;
    private Date dateEcheancePaiement;
    private int etat;
    private double tva;
    private String idReservation;

    public FactureBillet() throws Exception {
        this.setNomTable("FACTURECLIENT");
        this.setNomClasseFille("cinema.FactureBilletDetail");
        this.setLiaisonFille("idFactureClient");
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("FCB", "GETSEQFACTURECLIENT");
        this.setId(makePK(c));
    }

    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    @Override
    public String getNomClasseFille() { return "cinema.FactureBilletDetail"; }

    @Override
    public String getLiaisonFille() { return "idFactureClient"; }

    /** Id de la facture (non annulee) d'une reservation, ou null. */
    public static String idFacture(String idReservation, Connection c) throws Exception {
        Map<String, Object> l = CinemaUtil.premier(c, "SELECT ID FROM FACTURECLIENT WHERE IDRESERVATION=? AND NVL(ETAT,1)<>0", idReservation);
        return l == null ? null : CinemaUtil.texte(l, "ID");
    }

    /**
     * Cree la facture des billets d'une reservation visee (idempotent : rend la facture existante).
     * @return id de la facture
     */
    public static String facturer(String idReservation, String u, Connection c) throws Exception {
        boolean ouvert = false;
        try {
            if (c == null) {
                c = new utilitaire.UtilDB().GetConn();
                c.setAutoCommit(false);
                ouvert = true;
            }
            Map<String, Object> r = CinemaUtil.premier(c, "SELECT ID, ETAT, IDCLIENT FROM RESERVATION WHERE ID=? FOR UPDATE", idReservation);
            if (r == null) throw new Exception("R\u00e9servation introuvable");
            if (CinemaUtil.nombre(r, "ETAT") != ConstanteCinema.ETAT_VISE)
                throw new Exception("Seule une r\u00e9servation vis\u00e9e (billets vendus) peut \u00eatre factur\u00e9e");
            String existante = idFacture(idReservation, c);
            if (existante != null) return existante;

            List<Map<String, Object>> billets = CinemaUtil.lire(c,
                    "SELECT IDSEANCE, FILMLIB, SALLELIB, DATEDEBUT, HEURE, PLACE, QTE, PU FROM V_RESERVATION_CINEMA_LIB WHERE IDMERE=? ORDER BY DATEDEBUT, HEURE, PLACE",
                    idReservation);
            if (billets.isEmpty()) throw new Exception("Aucun billet dans la r\u00e9servation " + idReservation);
            List<Map<String, Object>> tarifs = TarifPlace.tous(c);
            List<Map<String, Object>> promotions = Promotion.actives(c);
            SimpleDateFormat jour = new SimpleDateFormat("dd/MM/yyyy");
            List<ClassFille> lignes = new ArrayList<>();
            for (Map<String, Object> b : billets) {
                String place = CinemaUtil.texte(b, "PLACE");
                Map<String, Object> tarif = TarifPlace.pourPlace(tarifs, place);
                StringBuilder lib = new StringBuilder("Billet ").append(CinemaUtil.texte(b, "FILMLIB"))
                        .append(" - ").append(CinemaUtil.texte(b, "SALLELIB"))
                        .append(" - ").append(CinemaUtil.date(b, "DATEDEBUT") == null ? "" : jour.format(CinemaUtil.date(b, "DATEDEBUT")))
                        .append(" ").append(CinemaUtil.texte(b, "HEURE"));
                if (!place.isEmpty()) lib.append(" - place ").append(place);
                if (tarif != null) lib.append(" (").append(CinemaUtil.texte(tarif, "LIBELLE")).append(")");
                Map<String, Object> promo = Promotion.pourHeure(promotions, CinemaUtil.texte(b, "HEURE"));
                if (promo != null && tarif != null && CinemaUtil.nombre(b, "PU") < CinemaUtil.nombre(tarif, "PV"))
                    lib.append(" - ").append(CinemaUtil.texte(promo, "LIBELLE")).append(" -").append((long) CinemaUtil.nombre(promo, "TAUX")).append("%");
                FactureBilletDetail d = new FactureBilletDetail();
                // produit facture : categorie de la place (PRODUIT, meme ID que le tarif), sinon billet generique
                d.setIdProduit(tarif != null ? CinemaUtil.texte(tarif, "ID") : PRODUIT_BILLET);
                d.setDesignation(lib.toString());
                d.setQte(CinemaUtil.nombre(b, "QTE"));
                d.setPu(CinemaUtil.nombre(b, "PU"));
                d.setRemises(0);
                d.setTva(0);
                lignes.add(d);
            }
            FactureBillet f = new FactureBillet();
            f.setIdClient(CinemaUtil.texte(r, "IDCLIENT"));
            f.setIdReservation(idReservation);
            f.setDaty(utilitaire.Utilitaire.dateDuJourSql());
            f.setDateEcheancePaiement(utilitaire.Utilitaire.dateDuJourSql());
            f.setDesignation("Billets de cin\u00e9ma - r\u00e9servation " + idReservation);
            f.setTva(0);
            f.setEtat(ConstanteCinema.ETAT_VISE); // facture emise
            f.setFille(lignes);
            f = (FactureBillet) f.createObject(u, c);
            if (ouvert) c.commit();
            return f.getId();
        } catch (Exception e) {
            if (ouvert && c != null) c.rollback();
            throw e;
        } finally {
            if (ouvert && c != null) c.close();
        }
    }

    /** Facture toutes les reservations visees qui n'ont pas encore de facture. @return nombre de factures creees */
    public static int facturerBilletsVendus(String u, Connection c) throws Exception {
        int n = 0;
        for (Map<String, Object> r : CinemaUtil.lire(c,
                "SELECT r.ID FROM V_RESERVATION_CINEMA r WHERE r.ETAT=11 "
                        + "AND NOT EXISTS (SELECT 1 FROM FACTURECLIENT f WHERE f.IDRESERVATION=r.ID AND NVL(f.ETAT,1)<>0) ORDER BY r.ID")) {
            facturer(CinemaUtil.texte(r, "ID"), u, c);
            n++;
        }
        return n;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getIdClient() { return idClient; }
    public void setIdClient(String idClient) { this.idClient = idClient; }
    public Date getDaty() { return daty; }
    public void setDaty(Date daty) { this.daty = daty; }
    public String getDesignation() { return designation; }
    public void setDesignation(String designation) { this.designation = designation; }
    public Date getDateEcheancePaiement() { return dateEcheancePaiement; }
    public void setDateEcheancePaiement(Date dateEcheancePaiement) { this.dateEcheancePaiement = dateEcheancePaiement; }
    @Override
    public int getEtat() { return etat; }
    @Override
    public void setEtat(int etat) { this.etat = etat; }
    public double getTva() { return tva; }
    public void setTva(double tva) { this.tva = tva; }
    public String getIdReservation() { return idReservation; }
    public void setIdReservation(String idReservation) { this.idReservation = idReservation; }
}
