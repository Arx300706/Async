package ferme.configuration;

import java.sql.Connection;
import bean.ClassFille;

/**
 *
 * @author Safidy
 */
public class BatimentDetail extends ClassFille {
    private int actif = 1;
    public int getActif() { return actif; }
    public void setActif(int v) { actif = v; }
    @Override public void controler(Connection c) throws Exception {
        ferme.utils.ImportPoussin.quantite(capacite, true, "Capacit\u00e9 maximale");
        if (actif != 0 && actif != 1) throw new Exception("Actif : 0 ou 1");
        if (idSexe != null && !idSexe.isEmpty() && !idSexe.equals("0") && !idSexe.equals("1")) throw new Exception("Sexe autoris\u00e9 invalide");
        if (id != null && !id.isEmpty()) {
            ferme.utils.ImportPoussin.verrouiller(c, "BATIMENTDETAIL", id);
            double utilise = ferme.utils.ImportPoussin.somme(c, "SELECT NVL(SUM(d.QTE),0) QTE FROM TRIAGEBATIMENTPARQUETDETAIL d JOIN TRIAGEBATIMENTPARQUET t ON t.ID=d.IDMERE WHERE t.ETAT IN (1,11) AND d.IDCOMPARTIMENT=?", id);
            if (capacite < utilise) throw new Exception("La capacit\u00e9 ne peut pas \u00eatre inf\u00e9rieure aux quantit\u00e9s affect\u00e9es ou r\u00e9serv\u00e9es");
            if (idSexe != null && !idSexe.isEmpty() && ferme.utils.ImportPoussin.somme(c, "SELECT COUNT(*) QTE FROM TRIAGEBATIMENTPARQUETDETAIL d JOIN TRIAGEBATIMENTPARQUET t ON t.ID=d.IDMERE WHERE t.ETAT IN (1,11) AND d.IDCOMPARTIMENT=? AND d.IDSEXE<>?", id, idSexe) > 0)
                throw new Exception("Ce compartiment contient d\u00e9j\u00e0 un autre sexe");
            if (idLot != null && !idLot.isEmpty() && ferme.utils.ImportPoussin.somme(c, "SELECT COUNT(*) QTE FROM TRIAGEBATIMENTPARQUETDETAIL d JOIN TRIAGEBATIMENTPARQUET t ON t.ID=d.IDMERE WHERE t.ETAT IN (1,11) AND d.IDCOMPARTIMENT=? AND t.IDLOT<>?", id, idLot) > 0)
                throw new Exception("Ce compartiment contient deja un autre lot ou un autre age");
        }
        super.controler(c);
    }
    @Override public int updateObject(String u, Connection c) throws Exception { controler(c); return super.updateObject(u, c); }
    private String id;
    private String idMere;
    private String idParquet;
    private double surface;
    private double capacite;
    private String idLot;
    private String idSexe;
    private double effectif;
    private double densite;

    public BatimentDetail()throws Exception {
        super.setNomTable("BATIMENTDETAIL");
        this.setNomClasseMere("ferme.configuration.Batiment");
        this.setLiaisonMere("idMere");
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("BATF", "GETSEQBATIMENTDETAIL");
        this.setId(this.makePK(c));
    }

    @Override
    public String getTuppleID() {
        return id;
    }

    @Override
    public String getAttributIDName() {
        return "id";
    }

    @Override
    public String getNomClasseMere() {
        return "ferme.configuration.Batiment";
    }

    @Override
    public String getLiaisonMere() {
        return "idMere";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdMere() {
        return idMere;
    }

    public void setIdMere(String idMere) {
        this.idMere = idMere;
    }

    public String getIdParquet() {
        return idParquet;
    }

    public void setIdParquet(String idParquet) {
        this.idParquet = idParquet;
    }

    public double getSurface() {
        return surface;
    }

    public void setSurface(double surface) {
        this.surface = surface;
    }

    public double getCapacite() {
        return capacite;
    }

    public void setCapacite(double capacite) {
        this.capacite = capacite;
    }

    public String getIdLot() {
        return idLot;
    }

    public void setIdLot(String idLot) {
        this.idLot = idLot;
    }

    public String getIdSexe() {
        return idSexe;
    }

    public void setIdSexe(String idSexe) {
        this.idSexe = idSexe;
    }

    public double getEffectif() {
        return effectif;
    }

    public void setEffectif(double effectif) {
        this.effectif = effectif;
    }

    public double getDensite() {
        return densite;
    }

    public void setDensite(double densite) {
        this.densite = densite;
    }
}
