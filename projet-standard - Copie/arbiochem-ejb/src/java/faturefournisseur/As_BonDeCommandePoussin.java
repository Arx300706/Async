package faturefournisseur;

import bean.*;
import ferme.utils.ImportPoussin;
import java.sql.*;
import java.util.Map;

/** Specialisation du bon fournisseur existant : meme table et memes lignes. */
public class As_BonDeCommandePoussin extends As_BonDeCommande {
    private String idLot, idSouche, paysDestination, aeroportDestination;
    private int ageJours, nbMaleRequis, nbFemelleRequis;
    // Le moteur Page APJ sait convertir java.sql.Date depuis les formulaires.
    // Oracle convertit ensuite ces dates en TIMESTAMP dans les colonnes de suivi.
    private java.sql.Date dateDepartPrevue, dateDepartReelle, dateArriveePrevue, dateArriveeReelle;

    public As_BonDeCommandePoussin() throws Exception { super(); }
    public String getIdLot() { return idLot; }
    public void setIdLot(String v) { idLot = v; }
    public String getIdSouche() { return idSouche; }
    public void setIdSouche(String v) { idSouche = v; }
    public String getPaysDestination() { return paysDestination; }
    public void setPaysDestination(String v) { paysDestination = v; }
    public String getAeroportDestination() { return aeroportDestination; }
    public void setAeroportDestination(String v) { aeroportDestination = v; }
    public int getAgeJours() { return ageJours; }
    public void setAgeJours(int v) { ageJours = v; }
    public int getNbMaleRequis() { return nbMaleRequis; }
    public void setNbMaleRequis(int v) { nbMaleRequis = v; }
    public int getNbFemelleRequis() { return nbFemelleRequis; }
    public void setNbFemelleRequis(int v) { nbFemelleRequis = v; }
    public java.sql.Date getDateDepartPrevue() { return dateDepartPrevue; }
    public void setDateDepartPrevue(java.sql.Date v) { dateDepartPrevue = v; }
    public java.sql.Date getDateDepartReelle() { return dateDepartReelle; }
    public void setDateDepartReelle(java.sql.Date v) { dateDepartReelle = v; }
    public java.sql.Date getDateArriveePrevue() { return dateArriveePrevue; }
    public void setDateArriveePrevue(java.sql.Date v) { dateArriveePrevue = v; }
    public java.sql.Date getDateArriveeReelle() { return dateArriveeReelle; }
    public void setDateArriveeReelle(java.sql.Date v) { dateArriveeReelle = v; }

    @Override public void controler(Connection c) throws Exception {
        ImportPoussin.requis(idSouche, "Race");
        ImportPoussin.requis(getFournisseur(), "Fournisseur");
        ImportPoussin.requis(getIdMagasin(), "Poulailler de destination");
        ImportPoussin.requis(paysDestination, "Pays de destination");
        ImportPoussin.requis(aeroportDestination, "A\u00e9roport");
        ImportPoussin.quantite(ageJours, true, "Age en jours");
        ImportPoussin.quantite(nbMaleRequis, true, "Nombre de m\u00e2les demand\u00e9s");
        ImportPoussin.quantite(nbFemelleRequis, true, "Nombre de femelles demand\u00e9es");
        if (getDaty() == null || dateDepartPrevue == null || dateArriveePrevue == null)
            throw new Exception("Dates de commande et de transport pr\u00e9vu obligatoires");
        if (dateDepartPrevue.before(getDaty())) throw new Exception("D\u00e9part pr\u00e9vu ant\u00e9rieur \u00e0 la date de commande");
        if (dateArriveePrevue.before(dateDepartPrevue)) throw new Exception("Arriv\u00e9e pr\u00e9vue ant\u00e9rieure au d\u00e9part");
        if (dateDepartReelle != null && dateArriveeReelle != null && dateArriveeReelle.before(dateDepartReelle))
            throw new Exception("Arriv\u00e9e r\u00e9elle ant\u00e9rieure au d\u00e9part");
        ClassFille[] lignes = getFille();
        if (lignes == null || lignes.length == 0) {
            As_BonDeCommande_Fille filtre = new As_BonDeCommande_Fille(); filtre.setIdbc(getId());
            lignes = (As_BonDeCommande_Fille[]) CGenUtil.rechercher(filtre, null, null, c, "");
        }
        if (lignes.length != 1) throw new Exception("Un bon de poussins doit contenir une seule ligne de commande");
        As_BonDeCommande_Fille f = (As_BonDeCommande_Fille) lignes[0];
        ImportPoussin.requis(f.getProduit(), "Article command\u00e9");
        ImportPoussin.quantite(f.getQuantite(), false, "Nombre command\u00e9");
        if (!Double.isFinite(f.getPu()) || f.getPu() < 0) throw new Exception("Prix unitaire positif ou nul obligatoire");
        f.setMontant(f.getQuantite() * f.getPu());
        super.controler(c);
    }

    @Override public ClassMAPTable createObject(String u, Connection c) throws Exception {
        controler(c);
        return super.createObject(u, c);
    }


    @Override public int updateObject(String u, Connection c) throws Exception {
        if ("Expedition".equals(getActionValidation())) {
            expedier(u, dateDepartReelle, c); return 1;
        }
        ImportPoussin.brouillon(c, "AS_BONDECOMMANDE", getId());
        controler(c);
        // UserEJB.updateObjectMultiple() traite ensuite les lignes filles.
        return super.updateObject(u, c);
    }

    @Override public Object validerObject(String u, Connection c) throws Exception {
        ImportPoussin.brouillon(c, "AS_BONDECOMMANDE", getId());
        controler(c);
        return super.validerObject(u, c);
    }

    /** Seule la logistique peut etre renseignee apres validation, via une action explicite. */
    public void expedier(String u, java.sql.Date depart, Connection c) throws Exception {
        Map<String, Object> bc = ImportPoussin.verrouiller(c, "AS_BONDECOMMANDE", getId());
        ImportPoussin.valide(bc, "La commande");
        if (depart == null) throw new Exception("Date et heure de d\u00e9part obligatoires");
        if (bc.get("DATEDEPARTREELLE") != null || !ImportPoussin.lire(c, "SELECT ID FROM RECEPTIONPOUSSINAEROPORT WHERE IDBC=?", getId()).isEmpty())
            throw new Exception("Le d\u00e9part a d\u00e9j\u00e0 \u00e9t\u00e9 enregistr\u00e9");
        try (PreparedStatement p = c.prepareStatement("UPDATE AS_BONDECOMMANDE SET DATEDEPARTREELLE=? WHERE ID=?")) {
            p.setDate(1, depart); p.setString(2, getId()); p.executeUpdate();
        }
        ImportPoussin.audit("AS_BONDECOMMANDE", "Expedition", u, getId(), c);
    }
}
