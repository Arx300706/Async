package ferme.triageBatiment;

import bean.ClassFille;
import java.sql.Connection;
import ferme.utils.ImportPoussin;
import ferme.utils.ConstanteFerme;
import java.util.Map;

public class TriageBatimentParquetDetail extends ClassFille {
    private String id;
    private String idmere;
    private String idbatiment;
    private String idparquet;
    private String idsexe;
    private String idqualite;
    private int qte;
    private String idCompartiment, remarque;
    private int sante;
    public String getIdCompartiment() { return idCompartiment; }
    public void setIdCompartiment(String v) { idCompartiment = v; }
    public String getRemarque() { return remarque; }
    public void setRemarque(String v) { remarque = v; }
    public int getSante() { return sante; }
    public void setSante(int v) { sante = v; }

    @Override public void controler(Connection c) throws Exception {
        ImportPoussin.protegerFille(c, "TRIAGEBATIMENTPARQUETDETAIL", id, idmere, "TRIAGEBATIMENTPARQUET");
        Map<String, Object> mere = ImportPoussin.verrouiller(c, "TRIAGEBATIMENTPARQUET", idmere);
        String transfertId = ImportPoussin.texte(mere, "IDTRANSFERTPOULET");
        String r2Id = ImportPoussin.texte(mere, "IDRECEPTIONPOULAILLER");
        if (r2Id.isEmpty() && transfertId.isEmpty()) { super.controler(c); return; }
        Map<String, Object> source;
        Map<String, Object> destination;
        if (!transfertId.isEmpty()) {
            source = ImportPoussin.verrouiller(c, "TRANSFERTPOULET", transfertId);
            ImportPoussin.valide(source, "Le transfert vers le poulailler");
            destination = ImportPoussin.une(c, "SELECT bc.IDMAGASIN FROM AS_BONDECOMMANDE bc JOIN RECEPTIONPOUSSINAEROPORT r ON r.IDBC=bc.ID JOIN TRANSFERTPOULET t ON t.IDRECEPTIONAEROPORT=r.ID WHERE t.ID=?", transfertId);
        } else {
            source = ImportPoussin.verrouiller(c, "RECEPTIONPOUSSINPOULAILLER", r2Id);
            ImportPoussin.valide(source, "La reception au poulailler");
            destination = ImportPoussin.une(c, "SELECT b.IDMAGASIN FROM AS_BONDECOMMANDE b JOIN RECEPTIONPOUSSINAEROPORT r ON r.IDBC=b.ID JOIN RECEPTIONPOUSSINPOULAILLER p ON p.IDRECEPTIONAEROPORT=r.ID WHERE p.ID=?", r2Id);
        }
        ImportPoussin.requis(idCompartiment, "Compartiment");
        Map<String, Object> compartiment = ImportPoussin.verrouiller(c, "BATIMENTDETAIL", idCompartiment);
        if (ImportPoussin.nombre(compartiment, "ACTIF") != 1) throw new Exception("Ce compartiment est inactif");
        idbatiment = ImportPoussin.texte(compartiment, "IDMERE");
        idparquet = ImportPoussin.texte(compartiment, "IDPARQUET");
        if (ImportPoussin.somme(c, "SELECT COUNT(*) QTE FROM BATIMENTDETAIL WHERE IDMERE=? AND IDPARQUET=? AND ACTIF=1", idbatiment, idparquet) != 1)
            throw new Exception("Configuration du compartiment en double : conserver une seule ligne active pour ce b\u00e2timent et parquet");
        Map<String, Object> batiment = ImportPoussin.une(c, "SELECT IDFERME FROM BATIMENT WHERE ID=?", idbatiment);
        if (!ImportPoussin.texte(destination, "IDMAGASIN").equals(ImportPoussin.texte(batiment, "IDFERME"))) throw new Exception("Choisir un compartiment du poulailler de destination");
        ImportPoussin.quantite(qte, false, "Nombre de poulets");
        if (!(ConstanteFerme.IDSEXEMALE.equals(idsexe) || ConstanteFerme.IDSEXEFEMELLE.equals(idsexe))) throw new Exception("Sexe invalide");
        String autorise = ImportPoussin.texte(compartiment, "IDSEXE");
        if (!autorise.isEmpty() && !autorise.equals(idsexe)) throw new Exception("Sexe incompatible avec ce compartiment");
        if (sante < 1 || sante > 10) throw new Exception("La sant\u00e9 doit \u00eatre un entier de 1 \u00e0 10");
        idqualite = ConstanteFerme.qualiteConforme;
        double total = ImportPoussin.somme(c, "SELECT NVL(SUM(QTE),0) QTE FROM TRIAGEBATIMENTPARQUETDETAIL WHERE IDMERE=? AND (? IS NULL OR ID<>?)", idmere, id, id);
        if (total + qte > ImportPoussin.nombre(source, "NBVIVANTS")) throw new Exception("Le total affecte depasse les survivants du transfert");
        double parSexe = ImportPoussin.somme(c, "SELECT NVL(SUM(QTE),0) QTE FROM TRIAGEBATIMENTPARQUETDETAIL WHERE IDMERE=? AND IDSEXE=? AND (? IS NULL OR ID<>?)", idmere, idsexe, id, id);
        double disponibleSexe = ImportPoussin.nombre(mere, ConstanteFerme.IDSEXEMALE.equals(idsexe) ? "DISPOMALE" : "DISPOFEMELLE");
        if (parSexe + qte > disponibleSexe) throw new Exception("Le total de ce sexe d\u00e9passe les vivants re\u00e7us au poulailler");
        double reserve = ImportPoussin.somme(c, "SELECT NVL(SUM(d.QTE),0) QTE FROM TRIAGEBATIMENTPARQUETDETAIL d JOIN TRIAGEBATIMENTPARQUET t ON t.ID=d.IDMERE WHERE t.ETAT IN (1,11) AND d.IDCOMPARTIMENT=? AND (? IS NULL OR d.ID<>?)", idCompartiment, id, id);
        double capacite = ImportPoussin.nombre(compartiment, "CAPACITE");
        if (capacite <= 0 || reserve + qte > capacite) throw new Exception("Capacit\u00e9 du compartiment d\u00e9pass\u00e9e : reste " + Math.max(0, capacite - reserve));
        String lotTriage = ImportPoussin.texte(mere, "IDLOT");
        String lotCompartiment = ImportPoussin.texte(compartiment, "IDLOT");
        if (!lotCompartiment.isEmpty() && !lotCompartiment.equals(lotTriage))
            throw new Exception("Ce compartiment contient deja un autre lot ou un autre age");
        if (ImportPoussin.somme(c, "SELECT COUNT(*) QTE FROM TRIAGEBATIMENTPARQUETDETAIL d JOIN TRIAGEBATIMENTPARQUET t ON t.ID=d.IDMERE WHERE t.ETAT IN (1,11) AND d.IDCOMPARTIMENT=? AND t.IDLOT<>? AND (? IS NULL OR d.ID<>?)", idCompartiment, lotTriage, id, id) > 0)
            throw new Exception("Un compartiment ne peut pas melanger des lots ou des ages differents");
        if (ImportPoussin.somme(c, "SELECT COUNT(*) QTE FROM TRIAGEBATIMENTPARQUETDETAIL d JOIN TRIAGEBATIMENTPARQUET t ON t.ID=d.IDMERE WHERE t.ETAT IN (1,11) AND d.IDCOMPARTIMENT=? AND d.IDSEXE<>? AND (? IS NULL OR d.ID<>?)", idCompartiment, idsexe, id, id) > 0)
            throw new Exception("Un compartiment ne peut pas melanger les males et les femelles");
        super.controler(c);
    }
    @Override public int updateObject(String u, Connection c) throws Exception { controler(c); return super.updateObject(u, c); }
    @Override public void controlerDelete(Connection c) throws Exception {
        ImportPoussin.protegerFille(c, "TRIAGEBATIMENTPARQUETDETAIL", id, idmere, "TRIAGEBATIMENTPARQUET"); super.controlerDelete(c);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdmere() {
        return idmere;
    }

    public void setIdmere(String idmere) {
        this.idmere = idmere;
    }

    public String getIdbatiment() {
        return idbatiment;
    }

    public void setIdbatiment(String idbatiment) {
        this.idbatiment = idbatiment;
    }

    public String getIdparquet() {
        return idparquet;
    }

    public void setIdparquet(String idparquet) {
        this.idparquet = idparquet;
    }

    public String getIdsexe() {
        return idsexe;
    }

    public void setIdsexe(String idsexe) {
        this.idsexe = idsexe;
    }

    public String getIdqualite() {
        return idqualite;
    }

    public void setIdqualite(String idqualite) {
        this.idqualite = idqualite;
    }

    public int getQte() {
        return qte;
    }

    public void setQte(int qte) {
        this.qte = qte;
    }


    @Override
    public String getNomClasseMere() {
        return "ferme.triageBatiment.TriageBatimentParquet";
    }

    @Override
    public String getLiaisonMere() {
        return "idmere";
    }

    public TriageBatimentParquetDetail() throws Exception {
        this.setNomTable("TRIAGEBATIMENTPARQUETDETAIL");
        this.setNomClasseMere("ferme.triageBatiment.TriageBatimentParquet");
        this.setLiaisonMere("idmere");
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("TBD","getseq_triagebatparquetdetail");
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
}

