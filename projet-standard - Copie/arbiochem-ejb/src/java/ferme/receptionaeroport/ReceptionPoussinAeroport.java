package ferme.receptionaeroport;

import java.sql.Connection;
import bean.ClassMere;
import java.sql.Date;
import bean.ClassMAPTable;
import bean.ClassFille;
import bean.CGenUtil;
import ferme.utils.ImportPoussin;
import ferme.utils.ConstanteFerme;
import java.sql.PreparedStatement;
import java.util.Map;
/**
 *
 * @author Safidy
 */
public class ReceptionPoussinAeroport extends ClassMere {
    private String id,idLot,remarque, heureDepart, heureArrive;
    private Date daty;
    private double qteRecus;
    private int nbrCartonMale,nbrCartonFemelle,etat;
    private String idBc;
    private int nbMorts, nbPerdus;
    public String getIdBc() { return idBc; }
    public void setIdBc(String v) { idBc = v; }
    public int getNbMorts() { return nbMorts; }
    public void setNbMorts(int v) { nbMorts = v; }
    public int getNbPerdus() { return nbPerdus; }
    public void setNbPerdus(int v) { nbPerdus = v; }
    public ReceptionPoussinAeroport()throws Exception {
        super.setNomTable("receptionPoussinAeroport");
        this.setNomClasseFille("ferme.receptionaeroport.ReceptionPoussinAeroportDetail");
        this.setLiaisonFille("idMere");
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("RPA", "GETSEQRECEPTIONPOUSSINAEROPORT");
        this.setId(this.makePK(c));
    }
    @Override
    public String getTuppleID() {
        return id;
    }

    public int getNbrCartonMale() {
        return nbrCartonMale;
    }

    public int getEtat() {
        return etat;
    }

    public void setEtat(int etat) {
        this.etat = etat;
    }

    public void setNbrCartonMale(int nbrCartonMale) {
        this.nbrCartonMale = nbrCartonMale;
    }

    public int getNbrCartonFemelle() {
        return nbrCartonFemelle;
    }

    public void setNbrCartonFemelle(int nbrCartonFemelle) {
        this.nbrCartonFemelle = nbrCartonFemelle;
    }

    @Override
    public String getAttributIDName() {
        return "id";
    }

    @Override
    public String getNomClasseFille() {
        return "ferme.receptionaeroport.ReceptionPoussinAeroportDetail";
    }

    @Override
    public String getLiaisonFille() {
        return "idMere";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdLot() {
        return idLot;
    }

    public void setIdLot(String idLot) {
        this.idLot = idLot;
    }

    public String getRemarque() {
        return remarque;
    }

    public void setRemarque(String remarque) {
        this.remarque = remarque;
    }

    public Date getDaty() {
        return daty;
    }

    public void setDaty(Date daty) {
        this.daty = daty;
    }

    public double getQteRecus() {
        return qteRecus;
    }

    public void setQteRecus(double qteRecus) {
        this.qteRecus = qteRecus;
    }

    public String getHeureDepart() {
        return heureDepart;
    }

    public void setHeureDepart(String heureDepart) {
        this.heureDepart = heureDepart;
    }

    public String getHeureArrive() {
        return heureArrive;
    }

    public void setHeureArrive(String heureArrive) {
        this.heureArrive = heureArrive;
    }

    @Override
    public ClassMAPTable createObject(String u, Connection c) throws Exception {
        ImportPoussin.requis(idBc, "Bon fournisseur");
        controler(c);
        if (!ImportPoussin.lire(c, "SELECT ID FROM RECEPTIONPOUSSINAEROPORT WHERE IDBC=?", idBc).isEmpty())
            throw new Exception("Ce bon poss\u00e8de d\u00e9j\u00e0 sa r\u00e9ception a\u00e9roport");
        return super.createObject(u, c);
    }

    @Override public void controler(Connection c) throws Exception {
        if (idBc == null || idBc.isEmpty()) { checkDetails(c, false, 0, 0); return; }
        Map<String, Object> bc = ImportPoussin.verrouiller(c, "AS_BONDECOMMANDE", idBc);
        ImportPoussin.valide(bc, "La commande");
        String lotCommande = ImportPoussin.texte(bc, "IDLOT");
        if (!lotCommande.isEmpty()) {
            if (idLot != null && !idLot.isEmpty() && !idLot.equals(lotCommande)) throw new Exception("Le lot doit correspondre \u00e0 la commande");
            idLot = lotCommande;
        }
        // Le lot est choisi apres le transport, pendant le triage. Les anciens
        // dossiers qui possedent deja un lot continuent toutefois d'etre controles.
        if (idLot != null && !idLot.isEmpty()) {
            Map<String, Object> lot = ImportPoussin.une(c, "SELECT * FROM LOT WHERE ID=?", idLot);
            String soucheCommande = ImportPoussin.texte(bc, "IDSOUCHE");
            if (!soucheCommande.isEmpty() && !soucheCommande.equals(ImportPoussin.texte(lot, "IDSOUCHE")))
                throw new Exception("La race du lot doit correspondre \u00e0 la commande");
            String fermeCommande = ImportPoussin.texte(bc, "IDMAGASIN");
            if (!fermeCommande.isEmpty() && !fermeCommande.equals(ImportPoussin.texte(lot, "IDFERME")))
                throw new Exception("Le poulailler du lot doit correspondre \u00e0 la commande");
        }
        ImportPoussin.quantite(nbMorts, true, "Morts \u00e0 l'a\u00e9roport");
        ImportPoussin.quantite(nbPerdus, true, "Perdus \u00e0 l'a\u00e9roport");
        double commande = ImportPoussin.somme(c, "SELECT NVL(SUM(QUANTITE),0) QTE FROM AS_BONDECOMMANDE_FILLE WHERE IDBC=?", idBc);
        ImportPoussin.quantite(commande, false, "Quantit\u00e9 command\u00e9e");
        qteRecus = commande - nbMorts - nbPerdus;
        ImportPoussin.quantite(qteRecus, true, "Vivants \u00e0 l'a\u00e9roport");
        if (bc.get("DATEDEPARTREELLE") == null) throw new Exception("Enregistrer l'exp\u00e9dition du bon avant la r\u00e9ception");
        ImportPoussin.chronologie(ImportPoussin.horodatage(bc, "DATEDEPARTREELLE"), ImportPoussin.instant(daty, heureArrive), "R\u00e9ception a\u00e9roport");
        // Le comptage par sexe est effectue apres le transfert, au moment du triage.
    }

    private void checkDetails(Connection c, boolean importation, double malesCommandes,
            double femellesCommandees) throws Exception {
        ReceptionPoussinAeroportDetail[] details = (ReceptionPoussinAeroportDetail[]) getFille();
        if (details == null) {
            ReceptionPoussinAeroportDetail filtre = new ReceptionPoussinAeroportDetail(); filtre.setIdMere(id);
            details = (ReceptionPoussinAeroportDetail[]) CGenUtil.rechercher(filtre, null, null, c, "");
        }
        double somme = 0, males = 0, femelles = 0;
        int lignesMale = 0, lignesFemelle = 0;
        for (ReceptionPoussinAeroportDetail d : details) {
            ImportPoussin.quantite(d.getQte(), importation, "Quantit\u00e9 en d\u00e9tail");
            if (importation && (!ConstanteFerme.qualiteConforme.equals(d.getIdQualitePoussin()) ||
                    !(ConstanteFerme.IDSEXEMALE.equals(d.getIdSexe()) || ConstanteFerme.IDSEXEFEMELLE.equals(d.getIdSexe()))))
                throw new Exception("R\u00e9partir uniquement les vivants conformes par sexe dans les d\u00e9tails");
            if (ConstanteFerme.IDSEXEMALE.equals(d.getIdSexe())) { males += d.getQte(); lignesMale++; }
            if (ConstanteFerme.IDSEXEFEMELLE.equals(d.getIdSexe())) { femelles += d.getQte(); lignesFemelle++; }
            somme += d.getQte();
        }
        if (importation && (lignesMale != 1 || lignesFemelle != 1))
            throw new Exception("R1 doit contenir exactement une ligne M\u00e2le et une ligne Femelle");
        if (importation && males > malesCommandes)
            throw new Exception("Les m\u00e2les vivants d\u00e9passent le nombre demand\u00e9");
        if (importation && femelles > femellesCommandees)
            throw new Exception("Les femelles vivantes d\u00e9passent le nombre demand\u00e9");
        ImportPoussin.equilibre(qteRecus, somme, "R\u00e9partition des vivants");
    }

    @Override public int updateObject(String u, Connection c) throws Exception {
        Map<String, Object> ancien = ImportPoussin.brouillon(c, "RECEPTIONPOUSSINAEROPORT", id);
        ImportPoussin.immuable(ancien, "IDBC", idBc);
        ImportPoussin.immuable(ancien, "IDLOT", idLot);
        etat = 1; controler(c);
        // UserEJB.updateObjectMultiple() traite ensuite les lignes filles.
        return super.updateObject(u, c);
    }

    @Override public Object validerObject(String u, Connection c) throws Exception {
        ImportPoussin.brouillon(c, "RECEPTIONPOUSSINAEROPORT", id);
        controler(c);
        Object resultat = super.validerObject(u, c);
        if (idBc != null && !idBc.isEmpty()) {
            try (PreparedStatement p = c.prepareStatement("UPDATE AS_BONDECOMMANDE SET DATEARRIVEEREELLE=? WHERE ID=?")) {
                p.setTimestamp(1, ImportPoussin.instant(daty, heureArrive)); p.setString(2, idBc); p.executeUpdate();
            }
            ImportPoussin.audit("AS_BONDECOMMANDE", "Arrivee aeroport", u, idBc, c);
        }
        return resultat;
    }
    @Override public void controlerDelete(Connection c) throws Exception {
        ImportPoussin.brouillon(c, "RECEPTIONPOUSSINAEROPORT", id); super.controlerDelete(c);
    }
    @Override public void controlerAnnulationVisa(Connection c) throws Exception { throw new Exception("La r\u00e9ception valid\u00e9e est verrouill\u00e9e"); }
    @Override public Object annulerObject(String u, Connection c) throws Exception {
        ImportPoussin.brouillon(c, "RECEPTIONPOUSSINAEROPORT", id); return super.annulerObject(u, c);
    }

    public void checkQteFille()throws Exception {
        ReceptionPoussinAeroportDetail[] fille = (ReceptionPoussinAeroportDetail[]) this.getFille();
        if (fille == null) throw new Exception("D\u00e9tails de r\u00e9ception obligatoires");
        double qteFille = 0;
        for (ReceptionPoussinAeroportDetail f : fille) {
            qteFille += f.getQte();
        }
        if (this.getQteRecus() != qteFille)
            throw new Exception("La quantit\u00e9 totale en d\u00e9tails : (" + qteFille + ") est diff\u00e9rente de la quantit\u00e9 re\u00e7ue : (" + this.getQteRecus() + ")");
    }
}
