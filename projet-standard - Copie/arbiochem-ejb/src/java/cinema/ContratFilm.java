package cinema;

import bean.CGenUtil;
import bean.ClassFille;
import faturefournisseur.As_BonDeCommande;
import faturefournisseur.As_BonDeCommande_Fille;
import faturefournisseur.As_BonDeLivraison;
import faturefournisseur.As_BonDeLivraison_Fille;
import java.sql.Connection;
import java.sql.Date;
import java.util.Map;
import utilitaire.UtilDB;

/**
 * Contrat de droits de diffusion = bon de commande fournisseur (AS_BONDECOMMANDE).
 *  - DATY        : date du contrat
 *  - DATELIMITE  : fin des droits
 *  - fille unique: PRODUIT = film, QUANTITE = nombre de seances autorisees, PU = prix par seance
 * La reception (AS_BONDELIVRAISON visee) donne la date de debut des droits.
 */
public class ContratFilm extends As_BonDeCommande {

    public ContratFilm() {
        super();
    }

    /** Recupere les lignes : celles en memoire (creation) ou celles en base (visa). */
    private As_BonDeCommande_Fille[] lignes(Connection c) throws Exception {
        ClassFille[] f = this.getFille();
        if (f != null && f.length > 0) {
            As_BonDeCommande_Fille[] res = new As_BonDeCommande_Fille[f.length];
            for (int i = 0; i < f.length; i++) res[i] = (As_BonDeCommande_Fille) f[i];
            return res;
        }
        if (CinemaUtil.vide(getId())) return new As_BonDeCommande_Fille[0];
        As_BonDeCommande_Fille crt = new As_BonDeCommande_Fille();
        return (As_BonDeCommande_Fille[]) CGenUtil.rechercher(crt, null, null, c, " and idbc='" + getId().replace("'", "''") + "'");
    }

    public void verifierContrat(Connection c) throws Exception {
        // 1. distributeur de films
        CinemaUtil.requis(getFournisseur(), "Distributeur");
        Map<String, Object> frn = CinemaUtil.premier(c, "SELECT IDTYPEFOURNISSEUR FROM FOURNISSEUR WHERE ID=?", getFournisseur());
        if (frn == null) throw new Exception("Distributeur introuvable");
        if (!ConstanteCinema.TYPE_FOURNISSEUR_DISTRIBUTEUR.equals(CinemaUtil.texte(frn, "IDTYPEFOURNISSEUR")))
            throw new Exception("Le fournisseur doit \u00eatre de type \u00ab Distributeur film \u00bb");
        // 2. periode des droits
        if (getDaty() == null) throw new Exception("Date du contrat obligatoire");
        if (getDateLimite() == null) throw new Exception("Date de fin des droits obligatoire");
        if (!getDateLimite().after(getDaty())) throw new Exception("La date de fin des droits doit \u00eatre post\u00e9rieure \u00e0 la date du contrat");
        // 3. une seule ligne, un film
        As_BonDeCommande_Fille[] l = lignes(c);
        int nb = 0;
        As_BonDeCommande_Fille ligne = null;
        for (As_BonDeCommande_Fille f : l) {
            if (f == null || CinemaUtil.vide(f.getProduit())) continue;
            nb++;
            ligne = f;
        }
        if (nb != 1) throw new Exception("Un contrat de droits doit contenir exactement un film (" + nb + " ligne(s) saisie(s))");
        Map<String, Object> film = CinemaUtil.premier(c, "SELECT CATEGORIEINGREDIENT, LIBELLE FROM AS_INGREDIENTS WHERE ID=?", ligne.getProduit());
        if (film == null || !ConstanteCinema.CATEGORIE_FILM.equals(CinemaUtil.texte(film, "CATEGORIEINGREDIENT")))
            throw new Exception("Le produit du contrat doit \u00eatre un film");
        if (ligne.getQuantite() <= 0 || ligne.getQuantite() != Math.rint(ligne.getQuantite()))
            throw new Exception("Le nombre de s\u00e9ances autoris\u00e9es doit \u00eatre un entier strictement positif");
        if (ligne.getPu() < 0) throw new Exception("Le prix par s\u00e9ance ne peut pas \u00eatre n\u00e9gatif");
        // 4. pas d'autre contrat vise sur une periode qui chevauche pour ce film
        double doublon = CinemaUtil.valeur(c,
                "SELECT COUNT(*) FROM V_FILM_LICENCE WHERE IDFILM=? AND IDBC<>? AND DATECONTRAT<=? AND DATEFINDROITS>=?",
                ligne.getProduit(), getId() == null ? "-" : getId(), getDateLimite(), getDaty());
        if (doublon > 0)
            throw new Exception("Un autre contrat vis\u00e9 couvre d\u00e9j\u00e0 le film \u00ab " + CinemaUtil.texte(film, "LIBELLE") + " \u00bb sur cette p\u00e9riode");
    }

    @Override
    public void controler(Connection c) throws Exception {
        super.controler(c);
        if (CinemaUtil.vide(getIdMagasin())) setIdMagasin(ConstanteCinema.MAGASIN_FILMS);
        if (CinemaUtil.vide(getIdDevise())) setIdDevise("AR");
        verifierContrat(c);
    }

    @Override
    public Object validerObject(String u, Connection c) throws Exception {
        verifierContrat(c);
        return super.validerObject(u, c);
    }

    // ------------------------------------------------------------------
    // Reception de la copie = bon de livraison vise -> les droits commencent
    // ------------------------------------------------------------------
    public String genererReception(Date debutDroits, String u, Connection c) throws Exception {
        boolean ouvert = false;
        try {
            if (c == null) {
                c = new UtilDB().GetConn();
                c.setAutoCommit(false);
                ouvert = true;
            }
            Map<String, Object> bc = CinemaUtil.premier(c, "SELECT * FROM AS_BONDECOMMANDE WHERE ID=? FOR UPDATE", getId());
            if (bc == null) throw new Exception("Contrat introuvable");
            if (CinemaUtil.nombre(bc, "ETAT") < ConstanteCinema.ETAT_VISE) throw new Exception("Le contrat doit \u00eatre vis\u00e9 avant la r\u00e9ception");
            if (CinemaUtil.valeur(c, "SELECT COUNT(*) FROM V_FILM_LICENCE WHERE IDBC=?", getId()) == 0)
                throw new Exception("Ce bon de commande n'est pas un contrat de film");
            if (CinemaUtil.valeur(c, "SELECT COUNT(*) FROM AS_BONDELIVRAISON WHERE IDBC=? AND ETAT>=1", getId()) > 0)
                throw new Exception("La copie de ce film a d\u00e9j\u00e0 \u00e9t\u00e9 r\u00e9ceptionn\u00e9e");
            if (debutDroits == null) throw new Exception("Date de d\u00e9but des droits obligatoire");
            java.sql.Timestamp dateContrat = CinemaUtil.date(bc, "DATY");
            java.sql.Timestamp fin = CinemaUtil.date(bc, "DATELIMITE");
            if (debutDroits.getTime() < dateContrat.getTime())
                throw new Exception("Le d\u00e9but des droits ne peut pas pr\u00e9c\u00e9der la date du contrat");
            if (debutDroits.getTime() > fin.getTime())
                throw new Exception("Le d\u00e9but des droits doit \u00eatre ant\u00e9rieur ou \u00e9gal \u00e0 la fin des droits (" + fin.toString().substring(0, 10) + ")");

            As_BonDeCommande_Fille crt = new As_BonDeCommande_Fille();
            As_BonDeCommande_Fille[] lignes = (As_BonDeCommande_Fille[]) CGenUtil.rechercher(crt, null, null, c, " and idbc='" + getId().replace("'", "''") + "'");

            As_BonDeLivraison bl = new As_BonDeLivraison();
            bl.setIdbc(getId());
            bl.setDaty(debutDroits);
            bl.setIdFournisseur(CinemaUtil.texte(bc, "FOURNISSEUR"));
            bl.setMagasin(CinemaUtil.vide(CinemaUtil.texte(bc, "IDMAGASIN")) ? ConstanteCinema.MAGASIN_FILMS : CinemaUtil.texte(bc, "IDMAGASIN"));
            bl.setRemarque("R\u00e9ception de la copie du film (d\u00e9but des droits)");
            bl.setEtat(ConstanteCinema.ETAT_CREE);
            As_BonDeLivraison_Fille[] filles = new As_BonDeLivraison_Fille[lignes.length];
            for (int i = 0; i < lignes.length; i++) {
                As_BonDeLivraison_Fille f = new As_BonDeLivraison_Fille();
                f.setIdbc_fille(lignes[i].getId());
                f.setProduit(lignes[i].getProduit());
                f.setQuantite(lignes[i].getQuantite());
                f.setPu(lignes[i].getPu());
                f.setUnite(lignes[i].getUnite());
                filles[i] = f;
            }
            bl.setFille(filles);
            bl = (As_BonDeLivraison) bl.createObject(u, c);
            // Visa direct : la licence devient active
            As_BonDeLivraison enBase = new As_BonDeLivraison();
            enBase.setId(bl.getId());
            enBase = (As_BonDeLivraison) CGenUtil.getMereAvecFille(enBase, c, null);
            enBase.validerObject(u, c);
            if (ouvert) c.commit();
            return bl.getId();
        } catch (Exception e) {
            if (ouvert && c != null) c.rollback();
            throw e;
        } finally {
            if (ouvert && c != null) c.close();
        }
    }

    // ------------------------------------------------------------------
    // Facture du distributeur (FACTUREFOURNISSEUR), PAS une vente.
    // On n'utilise ni As_BonDeCommande.genererFacture(u, c) (cree une VENTE)
    // ni FactureFournisseur.genererAPartirLivraison (remet le BL a l'etat 1,
    // ce qui desactiverait la licence).
    // ------------------------------------------------------------------
    public String genererFactureFournisseur(String u, Connection c) throws Exception {
        boolean ouvert = false;
        try {
            if (c == null) {
                c = new UtilDB().GetConn();
                c.setAutoCommit(false);
                ouvert = true;
            }
            Map<String, Object> bc = CinemaUtil.premier(c, "SELECT * FROM AS_BONDECOMMANDE WHERE ID=? FOR UPDATE", getId());
            if (bc == null) throw new Exception("Contrat introuvable");
            if (CinemaUtil.nombre(bc, "ETAT") < ConstanteCinema.ETAT_VISE) throw new Exception("Le contrat doit \u00eatre vis\u00e9");
            String idBl = getIdReception(getId(), c);
            if (idBl == null) throw new Exception("R\u00e9ceptionnez d'abord la copie du film");
            if (getIdFacture(getId(), c) != null) throw new Exception("Ce contrat est d\u00e9j\u00e0 factur\u00e9");

            As_BonDeCommande_Fille crt = new As_BonDeCommande_Fille();
            As_BonDeCommande_Fille[] lignes = (As_BonDeCommande_Fille[]) CGenUtil.rechercher(crt, null, null, c, " and idbc='" + getId().replace("'", "''") + "'");

            faturefournisseur.FactureFournisseur fact = new faturefournisseur.FactureFournisseur();
            fact.setIdFournisseur(CinemaUtil.texte(bc, "FOURNISSEUR"));
            fact.setIdModePaiement(CinemaUtil.vide(CinemaUtil.texte(bc, "MODEPAIEMENT")) ? null : CinemaUtil.texte(bc, "MODEPAIEMENT"));
            fact.setDaty(utilitaire.Utilitaire.dateDuJourSql());
            fact.setIdDevise("AR");
            fact.setTaux(1);
            fact.setIdMagasin(CinemaUtil.texte(bc, "IDMAGASIN"));
            fact.setIdBc(getId());
            fact.setReference(CinemaUtil.texte(bc, "REFERENCE"));
            fact.setIdtypefacture(utils.ConstanteSocobis.TYPE_FACTURE);
            fact.setDesignation("Droits de diffusion - contrat " + getId());
            fact.setEtat(ConstanteCinema.ETAT_CREE);
            faturefournisseur.FactureFournisseurDetails[] details = new faturefournisseur.FactureFournisseurDetails[lignes.length];
            for (int i = 0; i < lignes.length; i++) {
                faturefournisseur.FactureFournisseurDetails d = new faturefournisseur.FactureFournisseurDetails();
                d.setIdProduit(lignes[i].getProduit());
                d.setQte(lignes[i].getQuantite());
                d.setPu(lignes[i].getPu());
                d.setTva(lignes[i].getTva());
                d.setIdbcDetail(lignes[i].getId());
                d.setIdDevise("AR");
                d.setTauxDeChange(1);
                d.setDesignation("Droits de diffusion");
                details[i] = d;
            }
            fact.setFille(details);
            fact.createObject(u, c);
            // lien BL -> facture, sans toucher a l'etat du BL
            try (java.sql.PreparedStatement p = c.prepareStatement("UPDATE AS_BONDELIVRAISON SET IDFACTUREFOURNISSEUR=? WHERE ID=?")) {
                p.setString(1, fact.getId());
                p.setString(2, idBl);
                p.executeUpdate();
            }
            if (ouvert) c.commit();
            return fact.getId();
        } catch (Exception e) {
            if (ouvert && c != null) c.rollback();
            throw e;
        } finally {
            if (ouvert && c != null) c.close();
        }
    }

    /** Id du bon de livraison vise de ce contrat (null si pas encore receptionne). */
    public static String getIdReception(String idContrat, Connection c) throws Exception {
        Map<String, Object> l = CinemaUtil.premier(c, "SELECT ID FROM AS_BONDELIVRAISON WHERE IDBC=? AND ETAT>=11 ORDER BY DATY", idContrat);
        return l == null ? null : CinemaUtil.texte(l, "ID");
    }

    /** Id de la facture fournisseur non annulee de ce contrat (null si aucune). */
    public static String getIdFacture(String idContrat, Connection c) throws Exception {
        Map<String, Object> l = CinemaUtil.premier(c,
                "SELECT ID FROM FACTUREFOURNISSEUR WHERE IDBC=? AND ETAT>=1", idContrat);
        return l == null ? null : CinemaUtil.texte(l, "ID");
    }
}
