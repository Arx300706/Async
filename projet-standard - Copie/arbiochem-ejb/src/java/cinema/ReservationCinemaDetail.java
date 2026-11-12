package cinema;

import bean.ClassFille;
import java.sql.Connection;
import java.sql.Date;
import java.util.Collections;

/** Ligne de reservation : IDPRODUIT = id de la seance, QTE = nombre de places. */
public class ReservationCinemaDetail extends ClassFille {
    private String id;
    private String idMere;
    private String idProduit;
    private double qte;
    private Date daty;
    private double pu;
    private String remarque;
    private int etat;
    private String heure;

    public ReservationCinemaDetail() throws Exception {
        this.setNomTable("RESERVATIONDETAILS");
        this.setNomClasseMere("cinema.ReservationCinema");
        this.setLiaisonMere("idMere");
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("RESD", "GETSEQRESERVATIONDETAILS");
        this.setId(makePK(c));
    }

    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    @Override
    public String getNomClasseMere() { return "cinema.ReservationCinema"; }

    @Override
    public String getLiaisonMere() { return "idMere"; }

    /** Ajout d'une ligne seule a une reservation existante. */
    @Override
    public void controler(Connection c) throws Exception {
        if (!CinemaUtil.vide(idMere)) {
            java.util.Map<String, Object> mere = CinemaUtil.premier(c, "SELECT ETAT FROM RESERVATION WHERE ID=? FOR UPDATE", idMere);
            if (mere == null) throw new Exception("R\u00e9servation introuvable");
            if (CinemaUtil.nombre(mere, "ETAT") != ConstanteCinema.ETAT_CREE)
                throw new Exception("On ne peut ajouter des places qu'\u00e0 une r\u00e9servation non vis\u00e9e et non annul\u00e9e");
        }
        ReservationCinema.verifierLignes(c, Collections.singletonList(this), false);
        super.controler(c);
    }

    @Override
    public int updateObject(String u, Connection c) throws Exception {
        throw new Exception("Modification impossible : annulez la r\u00e9servation et cr\u00e9ez-en une nouvelle");
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getIdMere() { return idMere; }
    public void setIdMere(String idMere) { this.idMere = idMere; }
    public String getIdProduit() { return idProduit; }
    public void setIdProduit(String idProduit) { this.idProduit = idProduit; }
    public double getQte() { return qte; }
    public void setQte(double qte) { this.qte = qte; }
    public Date getDaty() { return daty; }
    public void setDaty(Date daty) { this.daty = daty; }
    public double getPu() { return pu; }
    public void setPu(double pu) { this.pu = pu; }
    public String getRemarque() { return remarque; }
    public void setRemarque(String remarque) { this.remarque = remarque; }
    @Override
    public int getEtat() { return etat; }
    @Override
    public void setEtat(int etat) { this.etat = etat; }
    public String getHeure() { return heure; }
    public void setHeure(String heure) { this.heure = heure; }
}
