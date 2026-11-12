<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="affichage.*" %><%@ page import="user.UserEJB" %><%@ page import="faturefournisseur.*" %>
<%@ page import="magasin.Magasin" %><%@ page import="caisse.Devise" %><%@ page import="ferme.configuration.Souche" %>
<% try {
    UserEJB u=(UserEJB)session.getValue("u"); int n=1;
    // PageInsertMultiple construit les champs declares par sa classe mere. On utilise donc
    // le bon fournisseur existant pour ses champs communs, puis on ajoute ceux de l'import.
    // Le POST reste traite par As_BonDeCommandePoussin (champ "classe" en bas de page).
    As_BonDeCommande mere=new As_BonDeCommande(); As_BonDeCommande_Fille fille=new As_BonDeCommande_Fille();
    fille.setNomTable("AS_BONDECOMMANDE_FILLE_CPL");
    String lienAction = (String) session.getAttribute("lien");
    if (lienAction == null || lienAction.trim().isEmpty()) {
        lienAction = "module.jsp";
        session.setAttribute("lien", lienAction);
    }
    PageInsertMultiple pi=new PageInsertMultiple(mere,fille,request,n,u); pi.setLien(lienAction);
    pi.getFormu().ajouterChamp(new String[]{"idSouche","ageJours","nbMaleRequis","nbFemelleRequis","paysDestination","aeroportDestination","dateDepartPrevue","dateArriveePrevue"});
    Liste[] entetes=new Liste[3];
    entetes[0]=new Liste("idDevise",new Devise(),"val","id"); entetes[0].setDefaut("AR");
    Magasin magasin=new Magasin(); magasin.setNomTable("MAGASIN2"); entetes[1]=new Liste("idMagasin",magasin,"val","id"); entetes[1].setApresW(" and actif=1");
    entetes[2]=new Liste("idSouche",new Souche(),"val","id"); pi.getFormu().changerEnChamp(entetes);
    pi.getFormu().getChamp("etat").setVisible(false); pi.getFormu().getChamp("idDevise").setVisible(false);
    pi.getFormu().getChamp("modepaiement").setVisible(false); pi.getFormu().getChamp("service").setVisible(false); pi.getFormu().getChamp("iddmdachat").setVisible(false); pi.getFormu().getChamp("refproforma").setVisible(false); pi.getFormu().getChamp("remise").setVisible(false); pi.getFormu().getChamp("dateLimite").setVisible(false); pi.getFormu().getChamp("designation").setVisible(false);
    pi.getFormu().getChamp("reference").setLibelle("Référence fournisseur (facultative)"); pi.getFormu().getChamp("daty").setLibelle("Date de commande");
    pi.getFormu().getChamp("fournisseur").setLibelle("Fournisseur"); pi.getFormu().getChamp("fournisseur").setPageAppelCompleteAWhere("faturefournisseur.Fournisseur","id","Fournisseur", "", "", " and estActif = 1");
    pi.getFormu().getChamp("fournisseur").setPageAppelInsert("fournisseur/fournisseur-saisie.jsp","fournisseur;fournisseurlibelle","id;nom");
    pi.getFormu().getChamp("idSouche").setLibelle("Race / souche"); pi.getFormu().getChamp("idMagasin").setLibelle("Poulailler de destination");
    pi.getFormu().getChamp("ageJours").setLibelle("Âge à l'arrivée (jours)"); pi.getFormu().getChamp("paysDestination").setLibelle("Pays de destination"); pi.getFormu().getChamp("aeroportDestination").setLibelle("Aéroport de destination");
    pi.getFormu().getChamp("nbMaleRequis").setLibelle("Mâles demandés"); pi.getFormu().getChamp("nbFemelleRequis").setLibelle("Femelles demandées");
    pi.getFormu().getChamp("dateDepartPrevue").setLibelle("Départ prévu"); pi.getFormu().getChamp("dateArriveePrevue").setLibelle("Arrivée prévue"); pi.getFormu().getChamp("ageJours").setType("number"); pi.getFormu().getChamp("ageJours").setDefaut("1");
    pi.getFormu().getChamp("nbMaleRequis").setType("number"); pi.getFormu().getChamp("nbMaleRequis").setDefaut("0"); pi.getFormu().getChamp("nbMaleRequis").setAutre("min='0' step='1'");
    pi.getFormu().getChamp("nbFemelleRequis").setType("number"); pi.getFormu().getChamp("nbFemelleRequis").setDefaut("0"); pi.getFormu().getChamp("nbFemelleRequis").setAutre("min='0' step='1'");
    pi.getFormufle().getChampMulitple("id").setVisible(false); pi.getFormufle().getChampMulitple("idbc").setVisible(false); pi.getFormufle().getChampMulitple("montant").setVisible(false); pi.getFormufle().getChampMulitple("unite").setVisible(false); pi.getFormufle().getChampMulitple("idDevise").setVisible(false); pi.getFormufle().getChampMulitple("tva").setVisible(false); pi.getFormufle().getChampMulitple("remise").setVisible(false); pi.getFormufle().getChampMulitple("tauxDeChange").setVisible(false);
    Champ.setPageAppelCompleteAWhere(pi.getFormufle().getChampFille("produit"),"produits.IngredientsLib","id","ST_INGREDIENTSAUTOACHAT_CPL","pu;libelle","pu;produitLib"," and (upper(libelle) like upper('%poussin%') or upper(libelle) like upper('%poulet%'))");
    Champ.setPageAppelInsert(pi.getFormufle().getChampFille("produit"),"produits/as-ingredients-saisie.jsp","id;libelle");
    pi.getFormufle().getChamp("produit_0").setLibelle("Article commandé"); pi.getFormufle().getChamp("produitLib_0").setLibelle("Désignation"); pi.getFormufle().getChamp("quantite_0").setLibelle("Nombre de poussins"); pi.getFormufle().getChamp("pu_0").setLibelle("Prix unitaire");
    pi.getFormufle().getChamp("quantite_0").setAutre("min='1' step='1'");
    pi.getFormufle().getChamp("idDevise_0").setDefaut("AR"); pi.getFormufle().getChamp("tva_0").setDefaut("0"); pi.getFormufle().getChamp("remise_0").setDefaut("0"); pi.getFormufle().getChamp("tauxDeChange_0").setDefaut("1");
    pi.getFormufle().setColOrdre(new String[]{"produit","produitLib","quantite","pu"}); pi.preparerDataFormu(); pi.getFormu().makeHtmlInsertTabIndex(); pi.getFormufle().makeHtmlInsertTableauIndex();
%>
<div class="content-wrapper"><h1>Commande fournisseur de poussins</h1><form class="container" action="<%=pi.getLien()%>?but=apresMultiple.jsp" method="post"><% out.println(pi.getFormu().getHtmlInsert()); %><div class="box box-default"><div class="box-header"><h3 class="box-title">Ligne de commande</h3></div><div class="box-body"><% out.println(pi.getFormufle().getHtmlTableauInsert()); %><strong>Total : <span id="totalImport">0.00</span></strong></div></div>
<input type="hidden" name="acte" value="insert"><input type="hidden" name="bute" value="ferme/importpoussin/commande-fiche.jsp"><input type="hidden" name="classe" value="faturefournisseur.As_BonDeCommandePoussin"><input type="hidden" name="classefille" value="faturefournisseur.As_BonDeCommande_Fille"><input type="hidden" name="nomtable" value="AS_BONDECOMMANDE_FILLE"><input type="hidden" name="nombreLigne" value="1"><input type="hidden" name="colonneMere" value="idbc"></form></div>
<script>
function totalImport(){var q=parseFloat(document.getElementById('quantite_0').value)||0,p=parseFloat(document.getElementById('pu_0').value)||0;document.getElementById('totalImport').innerHTML=(q*p).toFixed(2);}
['quantite_0','pu_0'].forEach(function(id){var e=document.getElementById(id);if(e)e.addEventListener('input',totalImport);});
totalImport();
</script>
<% } catch(Exception e){e.printStackTrace();%><script>alert('<%=e.getMessage()%>');history.back();</script><% } %>
