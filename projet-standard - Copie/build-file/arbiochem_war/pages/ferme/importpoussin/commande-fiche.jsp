<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="affichage.PageConsulte" %><%@ page import="faturefournisseur.As_BonDeCommandePoussinLib" %><%@ page import="utilitaire.ConstanteEtat" %><%@ page import="user.UserEJB" %>
<% try {
    UserEJB u=(UserEJB)session.getValue("u"); String lien=(String)session.getValue("lien");
    PageConsulte pc=new PageConsulte(new As_BonDeCommandePoussinLib(),request,u); pc.setTitre("Suivi d'une commande de poussins"); As_BonDeCommandePoussinLib b=(As_BonDeCommandePoussinLib)pc.getBase(); String id=b.getId();
    String[] cache={"etat","idDevise","modepaiement","service","iddmdachat","refproforma","remise","dateLimite","designation","fournisseur","idLot","idLotLib","idSouche","idMagasin"};
    for(String c:cache) if(pc.getChampByName(c)!=null) pc.getChampByName(c).setVisible(false);
    pc.getChampByName("reference").setLibelle("Référence fournisseur"); pc.getChampByName("fournisseurLib").setLibelle("Fournisseur"); pc.getChampByName("idSoucheLib").setLibelle("Race"); pc.getChampByName("ageLib").setLibelle("Âge"); pc.getChampByName("idMagasinLib").setLibelle("Poulailler"); pc.getChampByName("nbMaleRequis").setLibelle("Mâles demandés"); pc.getChampByName("nbFemelleRequis").setLibelle("Femelles demandées"); pc.getChampByName("quantiteCommandee").setLibelle("Quantité commandée"); pc.getChampByName("dateDepartPrevue").setLibelle("Départ prévu"); pc.getChampByName("dateArriveePrevue").setLibelle("Arrivée prévue"); pc.getChampByName("dateDepartReelle").setLibelle("Départ réel"); pc.getChampByName("dateArriveeReelle").setLibelle("Arrivée réelle"); pc.getChampByName("statut").setLibelle("Étape");
    pc.setOrdre(new String[]{"reference","daty","fournisseurLib","idSoucheLib","ageLib","idMagasinLib","paysDestination","aeroportDestination","dateDepartPrevue","dateArriveePrevue","nbMaleRequis","nbFemelleRequis","quantiteCommandee","pu","montant","dateDepartReelle","dateArriveeReelle","statut","remarque"});
%>
<div class="content-wrapper"><h1 class="box-title"><a href="<%=lien%>?but=ferme/importpoussin/commande-liste.jsp"><i class="fa fa-angle-left"></i></a> <%=pc.getTitre()%></h1><div class="row m-0"><div class="col-md-3"></div><div class="col-md-6"><div class="box-fiche"><div class="box"><div class="box-body"><% out.println(pc.getHtml()); %><div class="box-footer">
<% if(b.getEtat()<ConstanteEtat.getEtatValider()){ %>
<a class="btn btn-primary pull-right" href="<%=lien%>?but=apresTarif.jsp&id=<%=id%>&acte=valider&bute=ferme/importpoussin/commande-fiche.jsp&classe=faturefournisseur.As_BonDeCommandePoussin">Valider</a>
<a class="btn btn-secondary pull-right" style="margin-right:10px" href="<%=lien%>?but=ferme/importpoussin/commande-modif.jsp&id=<%=id%>">Modifier</a>
<a class="btn btn-danger" href="<%=lien%>?but=apresTarif.jsp&id=<%=id%>&acte=delete&bute=ferme/importpoussin/commande-liste.jsp&classe=faturefournisseur.As_BonDeCommandePoussin">Supprimer</a>
<% } else if(b.getDateDepartReelle()==null) { %>
<a class="btn btn-primary pull-right" href="<%=lien%>?but=ferme/importpoussin/expedition-saisie.jsp&id=<%=id%>">Enregistrer l'expédition</a>
    <% } else if(b.getIdReceptionAeroport()==null || b.getIdReceptionAeroport().isEmpty()) { %>
    <a class="btn btn-primary pull-right" href="<%=lien%>?but=ferme/receptionaeroport/receptionaeroport-saisie.jsp&idBc=<%=id%>">Réceptionner à l'aéroport</a>
    <% } else { %><a class="btn btn-secondary pull-right" href="<%=lien%>?but=ferme/receptionaeroport/receptionaeroport-fiche.jsp&id=<%=b.getIdReceptionAeroport()%>">Voir la réception aéroport</a><% } %>
<a class="btn btn-info" href="<%=lien%>?but=ferme/importpoussin/trace-liste.jsp&idBon=<%=id%>">Traçabilité</a>
</div></div></div></div></div></div></div>
<% } catch(Exception e){e.printStackTrace();%><script>alert('<%=e.getMessage()%>');history.back();</script><% } %>
