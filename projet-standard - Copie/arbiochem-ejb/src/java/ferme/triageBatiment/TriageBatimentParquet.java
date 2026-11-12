package ferme.triageBatiment;

import bean.ClassMAPTable;
import bean.ClassMere;
import ferme.utils.ConstanteFerme;
import bean.CGenUtil;

import java.sql.Connection;
import java.sql.Date;
import utilitaire.UtilDB;
import ferme.utils.ImportPoussin;
import bean.ClassFille;
import java.util.Map;
import java.sql.Statement;
import java.sql.PreparedStatement;

public class TriageBatimentParquet extends ClassMere {
    private String id;
    private Date daty;
    private String idlot;
    private int dispomale;
    private int dispofemelle,etat;
    private String idReceptionPoulailler, idTransfertPoulet;
    public String getIdReceptionPoulailler() { return idReceptionPoulailler; }
    public void setIdReceptionPoulailler(String v) { idReceptionPoulailler = v; }
    public String getIdTransfertPoulet() { return idTransfertPoulet; }
    public void setIdTransfertPoulet(String v) { idTransfertPoulet = v; }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getDaty() {
        return daty;
    }

    public void setDaty(Date daty) {
        this.daty = daty;
    }

    public String getIdlot() {
        return idlot;
    }

    public void setIdlot(String idlot) {
        this.idlot = idlot;
    }

    public int getEtat() {
        return etat;
    }

    public void setEtat(int etat) {
        this.etat = etat;
    }

    public int getDispomale() {
        return dispomale;
    }

    public void setDispomale(int dispomale) {
        this.dispomale = dispomale;
    }

    public int getDispofemelle() {
        return dispofemelle;
    }

    public void setDispofemelle(int dispofemelle) {
        this.dispofemelle = dispofemelle;
    }



    public TriageBatimentParquet() throws Exception {
        this.setNomTable("TRIAGEBATIMENTPARQUET");
        this.setNomClasseFille("ferme.triageBatiment.TriageBatimentParquetDetail");
        this.setLiaisonFille("idmere");
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("TB","getseq_triagebatimentparquet");
        this.setId(makePK(c));
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
    public ClassMAPTable createObject(String u, Connection c) throws Exception {
        // Les anciens triages sans transfert continuent leur fonctionnement.
        if ((idTransfertPoulet == null || idTransfertPoulet.trim().isEmpty()) &&
                (idReceptionPoulailler == null || idReceptionPoulailler.trim().isEmpty())) return super.createObject(u, c);
        controler(c);
        if (idTransfertPoulet != null && !idTransfertPoulet.trim().isEmpty()) {
            if (!ImportPoussin.lire(c, "SELECT ID FROM TRIAGEBATIMENTPARQUET WHERE IDTRANSFERTPOULET=?", idTransfertPoulet).isEmpty())
                throw new Exception("Ce transfert possede deja un triage");
        } else if (!ImportPoussin.lire(c, "SELECT ID FROM TRIAGEBATIMENTPARQUET WHERE IDRECEPTIONPOULAILLER=?", idReceptionPoulailler).isEmpty()) {
            throw new Exception("Ce remplissage existe deja : ajouter des lignes depuis sa fiche");
        }
//        TriageBatimentParquetDetail[] triageBatimentParquetDetails = (TriageBatimentParquetDetail[]) this.getFille();
//        double quantiteMale = this.getDispomale();
//        double quantiteFemelle = this.getDispofemelle();
//
//        double sommeMale = 0;
//        double sommeFemelle = 0;
//
//        for (int i = 0; i < triageBatimentParquetDetails.length; i++) {
//            String idsexe = triageBatimentParquetDetails[i].getIdsexe();
//            double qte = triageBatimentParquetDetails[i].getQte();
//
//            if (ConstanteFerme.IDSEXEMALE.equals(idsexe)) {
//                sommeMale += qte;
//            } else if (ConstanteFerme.IDSEXEFEMELLE.equals(idsexe)) {
//                sommeFemelle += qte;
//            } else {
//                throw new Exception("Sexe non reconnu pour la ligne de d\u00E9tail: " + idsexe);
//            }
//        }
//
//        if (sommeMale != quantiteMale) {
//            throw new Exception("La quantit\u00E9 totale des m\u00E2les tri\\u00E9s (" + sommeMale
//                    + ") ne correspond pas \u00E0 la quantit\u00E9 disponible male (" + quantiteMale + ")");
//        }
//
//        if (sommeFemelle != quantiteFemelle) {
//            throw new Exception("La quantit\u00E9 totale des femelles tri\u00E9es (" + sommeFemelle
//                    + ") ne correspond pas \u00E0 la quantit\u00E9 disponible femelle (" + quantiteFemelle + ")");
//        }

        return super.createObject(u, c);
    }
    @Override public void controler(Connection c) throws Exception {
        if (idTransfertPoulet != null && !idTransfertPoulet.trim().isEmpty()) {
            Map<String, Object> transfert = ImportPoussin.verrouiller(c, "TRANSFERTPOULET", idTransfertPoulet);
            ImportPoussin.valide(transfert, "Le transfert vers le poulailler");
            Map<String, Object> reception = ImportPoussin.une(c,
                    "SELECT * FROM RECEPTIONPOUSSINAEROPORT WHERE ID=?", transfert.get("IDRECEPTIONAEROPORT"));
            Map<String, Object> bc = ImportPoussin.une(c,
                    "SELECT * FROM AS_BONDECOMMANDE WHERE ID=?", reception.get("IDBC"));
            ImportPoussin.requis(idlot, "Lot");
            Map<String, Object> lot = ImportPoussin.une(c, "SELECT * FROM LOT WHERE ID=?", idlot);
            String souche = ImportPoussin.texte(bc, "IDSOUCHE");
            if (!souche.isEmpty() && !souche.equals(ImportPoussin.texte(lot, "IDSOUCHE")))
                throw new Exception("La race du lot doit correspondre a la commande");
            String destination = ImportPoussin.texte(bc, "IDMAGASIN");
            if (!destination.isEmpty() && !destination.equals(ImportPoussin.texte(lot, "IDFERME")))
                throw new Exception("Le lot doit appartenir au poulailler de destination");
            Date eclosion = ImportPoussin.date(lot, "DATEECLOSION");
            Date arrivee = ImportPoussin.date(reception, "DATY");
            if (eclosion == null || arrivee == null) throw new Exception("Dates du lot et de la reception obligatoires");
            long age = java.time.temporal.ChronoUnit.DAYS.between(eclosion.toLocalDate(), arrivee.toLocalDate());
            if (age != (long) ImportPoussin.nombre(bc, "AGEJOURS"))
                throw new Exception("L'age du lot (" + age + " jours) ne correspond pas a la commande");
            if (ImportPoussin.somme(c,
                    "SELECT COUNT(*) QTE FROM TRIAGEBATIMENTPARQUET WHERE IDLOT=? AND ETAT IN (1,11)", idlot) > 0)
                throw new Exception("Ce lot a deja ete utilise dans un triage");
            if (ImportPoussin.somme(c,
                    "SELECT COUNT(*) QTE FROM BATIMENTDETAIL WHERE IDLOT=? AND NVL(EFFECTIF,0)>0", idlot) > 0)
                throw new Exception("Ce lot est deja utilise dans un compartiment");
            if (ImportPoussin.somme(c,
                    "SELECT COUNT(*) QTE FROM TRIAGEQUALITEPOUSSIN WHERE IDLOT=? AND ETAT IN (1,11)", idlot) > 0)
                throw new Exception("Ce lot a deja ete utilise dans le triage historique");
            double capaciteLot = ImportPoussin.somme(c,
                    "SELECT NVL(SUM(d.QTE),0) QTE FROM RECEPTIONPOUSSINAEROPORT r JOIN RECEPTIONPOUSSINAEROPORTDETAIL d ON d.IDMERE=r.ID WHERE r.IDLOT=? AND r.ETAT IN (1,11) AND d.IDQUALITEPOUSSIN=?",
                    idlot, ConstanteFerme.qualiteConforme);
            if (capaciteLot < ImportPoussin.nombre(transfert, "NBVIVANTS"))
                throw new Exception("La capacite disponible du lot (" + Math.round(capaciteLot) + ") est insuffisante pour le transfert");
            ImportPoussin.quantite(dispomale, true, "Males restants apres le trajet");
            ImportPoussin.quantite(dispofemelle, true, "Femelles restantes apres le trajet");
            if (daty == null || daty.before(ImportPoussin.date(transfert, "DATY")))
                throw new Exception("Date de triage anterieure a l'arrivee du transfert");
            return;
        }
        if (idReceptionPoulailler == null || idReceptionPoulailler.trim().isEmpty()) { super.controler(c); return; }
        Map<String, Object> r2 = ImportPoussin.verrouiller(c, "RECEPTIONPOUSSINPOULAILLER", idReceptionPoulailler);
        ImportPoussin.valide(r2, "La r\u00e9ception au poulailler");
        Map<String, Object> r1 = ImportPoussin.une(c, "SELECT * FROM RECEPTIONPOUSSINAEROPORT WHERE ID=?", r2.get("IDRECEPTIONAEROPORT"));
        String lot = ImportPoussin.texte(r1, "IDLOT");
        if (idlot != null && !idlot.isEmpty() && !idlot.equals(lot)) throw new Exception("Le lot doit correspondre \u00e0 la r\u00e9ception");
        idlot = lot;
        dispomale = (int) ImportPoussin.nombre(r2, "NBVIVANTSMALE");
        dispofemelle = (int) ImportPoussin.nombre(r2, "NBVIVANTSFEMELLE");
        if (daty == null || daty.before(ImportPoussin.date(r2, "DATY"))) throw new Exception("Date de remplissage ant\u00e9rieure \u00e0 la r\u00e9ception");
    }
    @Override public void createObjectFilleBatch(String u, Statement st) throws Exception {
        // Inserer et controler chaque ligne dans la transaction APJ, afin que la
        // ligne suivante voie les quantites deja reservees par ce formulaire.
        createObjectFille(u, st.getConnection());
    }
    @Override public int updateObject(String u, Connection c) throws Exception {
        Map<String, Object> ancien = ImportPoussin.brouillon(c, "TRIAGEBATIMENTPARQUET", id);
        if (!ImportPoussin.texte(ancien, "IDTRANSFERTPOULET").isEmpty()) {
            ImportPoussin.immuable(ancien, "IDTRANSFERTPOULET", idTransfertPoulet);
            ImportPoussin.immuable(ancien, "IDLOT", idlot);
            etat = 1;
            controler(c);
            return super.updateObject(u, c);
        }
        if (ImportPoussin.texte(ancien, "IDRECEPTIONPOULAILLER").isEmpty()) return super.updateObject(u, c);
        ImportPoussin.immuable(ancien, "IDRECEPTIONPOULAILLER", idReceptionPoulailler);
        ImportPoussin.immuable(ancien, "IDLOT", idlot);
        etat = 1; controler(c); return super.updateObject(u, c);
    }
    @Override public Object validerObject(String u, Connection c) throws Exception {
        Map<String, Object> ancien = ImportPoussin.brouillon(c, "TRIAGEBATIMENTPARQUET", id);
        if (!ImportPoussin.texte(ancien, "IDTRANSFERTPOULET").isEmpty()) {
            controler(c);
            Map<String, Object> transfert = ImportPoussin.verrouiller(c, "TRANSFERTPOULET", idTransfertPoulet);
            double affecte = ImportPoussin.somme(c, "SELECT NVL(SUM(QTE),0) QTE FROM TRIAGEBATIMENTPARQUETDETAIL WHERE IDMERE=?", id);
            double males = ImportPoussin.somme(c, "SELECT NVL(SUM(QTE),0) QTE FROM TRIAGEBATIMENTPARQUETDETAIL WHERE IDMERE=? AND IDSEXE=?", id, ConstanteFerme.IDSEXEMALE);
            double femelles = ImportPoussin.somme(c, "SELECT NVL(SUM(QTE),0) QTE FROM TRIAGEBATIMENTPARQUETDETAIL WHERE IDMERE=? AND IDSEXE=?", id, ConstanteFerme.IDSEXEFEMELLE);
            ImportPoussin.equilibre(ImportPoussin.nombre(transfert, "NBVIVANTS"), affecte,
                    "Tous les survivants doivent etre affectes avant la validation");
            ImportPoussin.equilibre(dispomale, males, "Affectation des males");
            ImportPoussin.equilibre(dispofemelle, femelles, "Affectation des femelles");
            TriageBatimentParquetDetail filtre = new TriageBatimentParquetDetail(); filtre.setIdmere(id);
            TriageBatimentParquetDetail[] lignes = (TriageBatimentParquetDetail[]) CGenUtil.rechercher(filtre, null, null, c, " ORDER BY IDCOMPARTIMENT, ID");
            for (TriageBatimentParquetDetail ligne : lignes) ligne.controler(c);
            setFille(lignes);
            Object resultat = super.validerObject(u, c);
            try (PreparedStatement p = c.prepareStatement("UPDATE BATIMENTDETAIL SET IDLOT=?, IDSEXE=?, EFFECTIF=NVL(EFFECTIF,0)+? WHERE ID=?")) {
                for (TriageBatimentParquetDetail ligne : lignes) {
                    p.setString(1, idlot); p.setString(2, ligne.getIdsexe());
                    p.setInt(3, ligne.getQte()); p.setString(4, ligne.getIdCompartiment()); p.addBatch();
                }
                p.executeBatch();
            }
            ImportPoussin.audit("TRIAGEBATIMENTPARQUET", "Triage et affectation", u, id, c);
            return resultat;
        }
        if (ImportPoussin.texte(ancien, "IDRECEPTIONPOULAILLER").isEmpty()) return super.validerObject(u, c);
        controler(c);
        Map<String, Object> r2 = ImportPoussin.verrouiller(c, "RECEPTIONPOUSSINPOULAILLER", idReceptionPoulailler);
        double affecte = ImportPoussin.somme(c, "SELECT NVL(SUM(QTE),0) QTE FROM TRIAGEBATIMENTPARQUETDETAIL WHERE IDMERE=?", id);
        ImportPoussin.equilibre(ImportPoussin.nombre(r2, "NBVIVANTS"), affecte, "Tous les vivants doivent \u00eatre affect\u00e9s avant la validation");
        TriageBatimentParquetDetail filtre = new TriageBatimentParquetDetail(); filtre.setIdmere(id);
        TriageBatimentParquetDetail[] lignes = (TriageBatimentParquetDetail[]) CGenUtil.rechercher(filtre, null, null, c, " ORDER BY IDCOMPARTIMENT, ID");
        for (TriageBatimentParquetDetail ligne : lignes) ligne.controler(c);
        setFille(lignes);
        return super.validerObject(u, c);
    }
    @Override public void controlerDelete(Connection c) throws Exception {
        Map<String, Object> ancien = ImportPoussin.brouillon(c, "TRIAGEBATIMENTPARQUET", id);
        if (ImportPoussin.texte(ancien, "IDRECEPTIONPOULAILLER").isEmpty()) { super.controlerDelete(c); return; }
        super.controlerDelete(c);
    }
    @Override public void controlerAnnulationVisa(Connection c) throws Exception {
        Map<String, Object> ancien = ImportPoussin.verrouiller(c, "TRIAGEBATIMENTPARQUET", id);
        if (ImportPoussin.texte(ancien, "IDRECEPTIONPOULAILLER").isEmpty() && ImportPoussin.texte(ancien, "IDTRANSFERTPOULET").isEmpty()) { super.controlerAnnulationVisa(c); return; }
        throw new Exception("Le remplissage valid\u00e9 est verrouill\u00e9");
    }
    @Override public Object annulerObject(String u, Connection c) throws Exception {
        Map<String, Object> ancien = ImportPoussin.verrouiller(c, "TRIAGEBATIMENTPARQUET", id);
        if (ImportPoussin.texte(ancien, "IDRECEPTIONPOULAILLER").isEmpty() && ImportPoussin.texte(ancien, "IDTRANSFERTPOULET").isEmpty()) return super.annulerObject(u, c);
        if (ImportPoussin.nombre(ancien, "ETAT") != 1) throw new Exception("Le remplissage d'importation valid\u00e9 est verrouill\u00e9");
        return super.annulerObject(u, c);
    }
    public double getDisponnible(String idLot,String idSexe,Connection c)throws Exception{
        if (idLot != null) return getDisponnibleLib(idLot, idSexe, ConstanteFerme.qualiteConforme, c);
        boolean canClose=false;
        try{
            if(c==null){
                c=new UtilDB().GetConn();
                canClose=true;
            }
            TriageLotSexeQualite t = new TriageLotSexeQualite();
            t.setIdLot(idLot);
            t.setIdsexe(idSexe);
            t.setIdqualite(ConstanteFerme.qualiteConforme);
            TriageLotSexeQualite[] r = (TriageLotSexeQualite[])CGenUtil.rechercher(t, null, null, c, "");
            if(r!=null && r.length>0){
                return r[0].getQte();
            }
            return 0;
        } catch(Exception e){
            throw e;
        } finally {
            if(canClose){
                c.close();
            }
        }
    }

    public double getDisponnibleLib(String idLot,String idSexe, String idQualite,Connection c)throws Exception{
        boolean canClose=false;
        try{
            if(c==null){
                c=new UtilDB().GetConn();
                canClose=true;
            }
            TriageLotSexeQualiteLib t = new TriageLotSexeQualiteLib();
            t.setIdLot(idLot);
            t.setIdSexe(idSexe);
            t.setIdQualite(idQualite);
            TriageLotSexeQualiteLib[] r = (TriageLotSexeQualiteLib[])CGenUtil.rechercher(t, null, null, c, "");
            if(r!=null && r.length>0){
                return r[0].getQte();
            }
            return 0;
        } catch(Exception e){
            throw e;
        } finally {
            if(canClose){
                c.close();
            }
        }
    }
}

