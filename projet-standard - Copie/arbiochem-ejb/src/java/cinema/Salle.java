package cinema;

import bean.ClassMAPTable;
import java.sql.Connection;
import java.util.Map;

/** Salle de cinema = ligne de MAGASIN2 de type SALLE CINEMA. */
public class Salle extends ClassMAPTable {
    private String id;
    private String val;
    private String desce;
    private String idTypeMagasin;
    private double capacite;
    private int actif = 1;
    /** MAGASIN2.COMPTEUR = nombre de places par rangee (plan de salle). */
    private double compteur;

    public Salle() {
        this.setNomTable("MAGASIN2");
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("MAG", "GETSEQMAGASIN");
        this.setId(makePK(c));
    }

    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    private void verifier(Connection c) throws Exception {
        CinemaUtil.requis(val, "Nom de la salle");
        if (capacite <= 0 || capacite != Math.rint(capacite))
            throw new Exception("La capacit\u00e9 doit \u00eatre un nombre entier de places strictement positif");
        if (actif != 0 && actif != 1) throw new Exception("Actif : 0 ou 1");
        if (compteur <= 0) compteur = Math.min(10, capacite);
        if (compteur != Math.rint(compteur) || compteur > capacite)
            throw new Exception("Places par rang\u00e9e : entier entre 1 et la capacit\u00e9");
        if (CinemaUtil.nombreRangees(capacite, compteur) > CinemaUtil.LETTRES.length())
            throw new Exception("Plan trop grand : 26 rang\u00e9es maximum (A \u00e0 Z). Augmentez le nombre de places par rang\u00e9e.");
        setIdTypeMagasin(ConstanteCinema.TYPE_MAGASIN_SALLE);
        if (!CinemaUtil.vide(id)) {
            // Plus grand nombre de places deja reservees sur une seance a venir de cette salle
            double maxReserve = CinemaUtil.valeur(c,
                    "SELECT NVL(MAX(PLACESRESERVEES),0) FROM V_SEANCE_PLACES_DISPO WHERE IDSALLE=? AND ETAT<>0 AND DATEHEUREDEBUT>=SYSDATE", id);
            if (capacite < maxReserve)
                throw new Exception("Capacit\u00e9 impossible : " + (long) maxReserve
                        + " places sont d\u00e9j\u00e0 r\u00e9serv\u00e9es sur une s\u00e9ance \u00e0 venir de cette salle");
            // les places deja vendues doivent exister dans le nouveau plan
            for (Map<String, Object> o : CinemaUtil.lire(c,
                    "SELECT DISTINCT o.PLACE FROM V_SEANCE_PLACES_OCCUPEES o JOIN V_SEANCE_CINEMA_LIB s ON s.ID=o.IDSEANCE "
                            + "WHERE s.IDSALLE=? AND s.ETAT<>0 AND s.DATEHEUREDEBUT>=SYSDATE", id)) {
                String place = CinemaUtil.texte(o, "PLACE");
                if (!CinemaUtil.placeValide(place, capacite, compteur))
                    throw new Exception("Nouveau plan impossible : la place " + place + " est d\u00e9j\u00e0 vendue sur une s\u00e9ance \u00e0 venir");
            }
        }
    }

    @Override
    public void controler(Connection c) throws Exception {
        verifier(c);
        super.controler(c);
    }

    @Override
    public int updateObject(String u, Connection c) throws Exception {
        verifier(c);
        return super.updateObject(u, c);
    }

    @Override
    public String[] getMotCles() { return new String[]{"id", "val"}; }

    @Override
    public String[] getValMotCles() { return new String[]{"id", "val"}; }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getVal() { return val; }
    public void setVal(String val) { this.val = val; }
    public String getDesce() { return desce; }
    public void setDesce(String desce) { this.desce = desce; }
    public String getIdTypeMagasin() { return idTypeMagasin; }
    public void setIdTypeMagasin(String idTypeMagasin) { this.idTypeMagasin = idTypeMagasin; }
    public double getCapacite() { return capacite; }
    public void setCapacite(double capacite) { this.capacite = capacite; }
    public double getCompteur() { return compteur; }
    public void setCompteur(double compteur) { this.compteur = compteur; }
    public int getActif() { return actif; }
    public void setActif(int actif) { this.actif = actif; }
}
