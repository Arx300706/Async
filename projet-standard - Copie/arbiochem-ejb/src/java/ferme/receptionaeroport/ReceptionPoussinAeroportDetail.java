package ferme.receptionaeroport;

import java.sql.Connection;
import bean.ClassFille;

/**
 *
 * @author Safidy
 */
public class ReceptionPoussinAeroportDetail extends ClassFille {
    @Override public void controler(Connection c) throws Exception {
        ferme.utils.ImportPoussin.protegerFille(c, "RECEPTIONPOUSSINAEROPORTDETAIL", id, idMere, "RECEPTIONPOUSSINAEROPORT");
        ferme.utils.ImportPoussin.quantite(qte, false, "Quantit\u00e9 re\u00e7ue");
        java.util.Map<String, Object> mere = ferme.utils.ImportPoussin.verrouiller(c, "RECEPTIONPOUSSINAEROPORT", idMere);
        if (!ferme.utils.ImportPoussin.texte(mere, "IDBC").isEmpty()) {
            if (!ferme.utils.ConstanteFerme.qualiteConforme.equals(idQualitePoussin) ||
                    !(ferme.utils.ConstanteFerme.IDSEXEMALE.equals(idSexe) || ferme.utils.ConstanteFerme.IDSEXEFEMELLE.equals(idSexe)))
                throw new Exception("Sexe ou qualit\u00e9 des vivants invalide");
            double autres = ferme.utils.ImportPoussin.somme(c, "SELECT NVL(SUM(QTE),0) QTE FROM RECEPTIONPOUSSINAEROPORTDETAIL WHERE IDMERE=? AND (? IS NULL OR ID<>?)", idMere, id, id);
            if (autres + qte > ferme.utils.ImportPoussin.nombre(mere, "QTERECUS")) throw new Exception("La r\u00e9partition d\u00e9passe les vivants disponibles");
        }
        super.controler(c);
    }
    @Override public int updateObject(String u, Connection c) throws Exception { controler(c); return super.updateObject(u, c); }
    @Override public void controlerDelete(Connection c) throws Exception {
        ferme.utils.ImportPoussin.protegerFille(c, "RECEPTIONPOUSSINAEROPORTDETAIL", id, idMere, "RECEPTIONPOUSSINAEROPORT");
        super.controlerDelete(c);
    }
    private String id,idMere,idQualitePoussin,idSexe;
    private double qte;

    public ReceptionPoussinAeroportDetail()throws Exception {
        super.setNomTable("receptionPoussinAeroportDetail");
        this.setNomClasseMere("ferme.receptionaeroport.ReceptionPoussinAeroport");
        this.setLiaisonMere("idMere");
    }

    @Override
    public void construirePK(Connection c) throws Exception {
        this.preparePk("RPAF", "GETSEQRECEPTIONPOUSSINAEDETAIL");
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
        return "ferme.receptionaeroport.ReceptionPoussinAeroport";
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

    public String getIdQualitePoussin() {
        return idQualitePoussin;
    }

    public void setIdQualitePoussin(String idQualitePoussin) {
        this.idQualitePoussin = idQualitePoussin;
    }

    public String getIdSexe() {
        return idSexe;
    }

    public void setIdSexe(String idSexe) {
        this.idSexe = idSexe;
    }

    public double getQte() {
        return qte;
    }

    public void setQte(double qte) {
        this.qte = qte;
    }
}
