package ferme.transfertpoulet;

import java.sql.Connection;
import bean.ClassMere;
import bean.ClassMAPTable;
import java.sql.Date;
import java.util.Map;
import ferme.utils.ImportPoussin;

/**
 *
 * @author Safidy
 */
public class TransfertPoulet extends ClassMere {
    private String id;
    private String remarque,idLot;
    private Date daty;
    private String idReceptionAeroport, heureArrive, idControleur, idChauffeur, idVehicule;
    private int nbMorts, nbPerdus, nbVivants;

    public TransfertPoulet()throws Exception {
        super.setNomTable("TRANSFERTPOULET");
        this.setNomClasseFille("ferme.transfertpoulet.TransfertPouletDetail");
        this.setLiaisonFille("idMere");
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("TRSP", "GETSEQTRANSFERTPOULET");
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
    public String getNomClasseFille() {
        return "ferme.transfertpoulet.TransfertPouletDetail";
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

    public String getRemarque() {
        return remarque;
    }

    public void setRemarque(String remarque) {
        this.remarque = remarque;
    }

    public String getIdLot() {
        return idLot;
    }

    public void setIdLot(String idLot) {
        this.idLot = idLot;
    }

    public Date getDaty() {
        return daty;
    }

    public void setDaty(Date daty) {
        this.daty = daty;
    }

    public String getIdReceptionAeroport() { return idReceptionAeroport; }
    public void setIdReceptionAeroport(String v) { idReceptionAeroport = v; }
    public String getHeureArrive() { return heureArrive; }
    public void setHeureArrive(String v) { heureArrive = v; }
    public String getIdControleur() { return idControleur; }
    public void setIdControleur(String v) { idControleur = v; }
    public String getIdChauffeur() { return idChauffeur; }
    public void setIdChauffeur(String v) { idChauffeur = v; }
    public String getIdVehicule() { return idVehicule; }
    public void setIdVehicule(String v) { idVehicule = v; }
    public int getNbMorts() { return nbMorts; }
    public void setNbMorts(int v) { nbMorts = v; }
    public int getNbPerdus() { return nbPerdus; }
    public void setNbPerdus(int v) { nbPerdus = v; }
    public int getNbVivants() { return nbVivants; }
    public void setNbVivants(int v) { nbVivants = v; }

    @Override
    public void controler(Connection c) throws Exception {
        if (idReceptionAeroport == null || idReceptionAeroport.trim().isEmpty()) {
            super.controler(c);
            return;
        }
        Map<String, Object> reception = ImportPoussin.verrouiller(c, "RECEPTIONPOUSSINAEROPORT", idReceptionAeroport);
        ImportPoussin.valide(reception, "La reception aeroport");
        if (ImportPoussin.texte(reception, "IDBC").isEmpty())
            throw new Exception("La reception aeroport doit etre liee a une commande fournisseur");
        if (daty == null) throw new Exception("Date d'arrivee au poulailler obligatoire");
        ImportPoussin.requis(heureArrive, "Heure d'arrivee au poulailler");
        ImportPoussin.requis(idVehicule, "Vehicule");
        ImportPoussin.requis(idChauffeur, "Chauffeur");
        ImportPoussin.requis(idControleur, "Controleur");
        ImportPoussin.quantite(nbMorts, true, "Morts durant le trajet");
        ImportPoussin.quantite(nbPerdus, true, "Perdus durant le trajet");
        double vivantsAeroport = ImportPoussin.nombre(reception, "QTERECUS");
        nbVivants = (int) vivantsAeroport - nbMorts - nbPerdus;
        ImportPoussin.quantite(nbVivants, true, "Vivants apres le transfert");
        ImportPoussin.equilibre(vivantsAeroport, (double) nbMorts + nbPerdus + nbVivants,
                "Comptage du transfert");
        ImportPoussin.chronologie(
                ImportPoussin.instant(ImportPoussin.date(reception, "DATY"), ImportPoussin.texte(reception, "HEUREARRIVE")),
                ImportPoussin.instant(daty, heureArrive), "Arrivee au poulailler");
        String lotReception = ImportPoussin.texte(reception, "IDLOT");
        if (!lotReception.isEmpty()) idLot = lotReception;
    }

    @Override
    public ClassMAPTable createObject(String u, Connection c) throws Exception {
        if (idReceptionAeroport == null || idReceptionAeroport.trim().isEmpty()) return super.createObject(u, c);
        controler(c);
        if (!ImportPoussin.lire(c, "SELECT ID FROM TRANSFERTPOULET WHERE IDRECEPTIONAEROPORT=?", idReceptionAeroport).isEmpty())
            throw new Exception("Cette reception aeroport possede deja un transfert");
        return super.createObject(u, c);
    }

    @Override
    public int updateObject(String u, Connection c) throws Exception {
        if (idReceptionAeroport == null || idReceptionAeroport.trim().isEmpty()) return super.updateObject(u, c);
        Map<String, Object> ancien = ImportPoussin.brouillon(c, "TRANSFERTPOULET", id);
        ImportPoussin.immuable(ancien, "IDRECEPTIONAEROPORT", idReceptionAeroport);
        controler(c);
        return super.updateObject(u, c);
    }

    @Override
    public Object validerObject(String u, Connection c) throws Exception {
        if (idReceptionAeroport == null || idReceptionAeroport.trim().isEmpty()) return super.validerObject(u, c);
        ImportPoussin.brouillon(c, "TRANSFERTPOULET", id);
        controler(c);
        return super.validerObject(u, c);
    }

    @Override
    public void controlerDelete(Connection c) throws Exception {
        if (idReceptionAeroport != null && !idReceptionAeroport.trim().isEmpty())
            ImportPoussin.brouillon(c, "TRANSFERTPOULET", id);
        super.controlerDelete(c);
    }
}
