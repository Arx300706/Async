package cinema;

import bean.ClassFille;
import java.sql.Connection;

/** Ligne de facture de billets (FACTURECLIENTDETAILS) : un billet, IDPRODUIT = seance. */
public class FactureBilletDetail extends ClassFille {
    private String id;
    private String idFactureClient;
    private double qte;
    private double pu;
    private double remises;
    private double tva;
    private String compte;
    private String idProduit;
    private String designation;

    public FactureBilletDetail() throws Exception {
        this.setNomTable("FACTURECLIENTDETAILS");
        this.setNomClasseMere("cinema.FactureBillet");
        this.setLiaisonMere("idFactureClient");
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("FCBD", "GETSEQFACTURECLIENTDETAILS");
        this.setId(makePK(c));
    }

    @Override
    public String getTuppleID() { return id; }

    @Override
    public String getAttributIDName() { return "id"; }

    @Override
    public String getNomClasseMere() { return "cinema.FactureBillet"; }

    @Override
    public String getLiaisonMere() { return "idFactureClient"; }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getIdFactureClient() { return idFactureClient; }
    public void setIdFactureClient(String idFactureClient) { this.idFactureClient = idFactureClient; }
    public double getQte() { return qte; }
    public void setQte(double qte) { this.qte = qte; }
    public double getPu() { return pu; }
    public void setPu(double pu) { this.pu = pu; }
    public double getRemises() { return remises; }
    public void setRemises(double remises) { this.remises = remises; }
    public double getTva() { return tva; }
    public void setTva(double tva) { this.tva = tva; }
    public String getCompte() { return compte; }
    public void setCompte(String compte) { this.compte = compte; }
    public String getIdProduit() { return idProduit; }
    public void setIdProduit(String idProduit) { this.idProduit = idProduit; }
    public String getDesignation() { return designation; }
    public void setDesignation(String designation) { this.designation = designation; }
}
