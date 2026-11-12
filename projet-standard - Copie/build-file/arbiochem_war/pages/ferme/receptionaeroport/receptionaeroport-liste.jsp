<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="affichage.PageRecherche" %><%@ page import="ferme.receptionaeroport.ReceptionPoussinAeroportImportLib" %>
<% try{
    ReceptionPoussinAeroportImportLib base=new ReceptionPoussinAeroportImportLib();
    String[] criteres={"numeroBon","fournisseurLib","idSoucheLib","conformite","daty"};String[] dates={"daty"};
    String[] cols={"id","numeroBon","fournisseurLib","idSoucheLib","ageJours","quantiteCommandee","daty","heureArrive","nbMorts","nbPerdus","qteRecus","conformite","etatLib"};
    PageRecherche pr=new PageRecherche(base,request,criteres,dates,3,cols,cols.length);pr.setUtilisateur((user.UserEJB)session.getValue("u"));pr.setLien((String)session.getValue("lien"));pr.setTitre("Réceptions à l'aéroport");pr.setApres("ferme/receptionaeroport/receptionaeroport-liste.jsp");
    pr.getFormu().getChamp("numeroBon").setLibelle("N° commande");pr.getFormu().getChamp("fournisseurLib").setLibelle("Fournisseur");pr.getFormu().getChamp("idSoucheLib").setLibelle("Race");pr.getFormu().getChamp("daty1").setLibelle("Du");pr.getFormu().getChamp("daty2").setLibelle("Au");
    pr.getFormu().setAnotherButton("<a class=\"btn btn-primary pull-right btn-small\" href=\"module.jsp?but=ferme/importpoussin/commande-liste.jsp\"><i class=\"material-symbols-rounded\">receipt_long</i> Choisir une commande</a>");
    pr.creerObjetPage(cols,new String[]{"quantiteCommandee","nbMorts","nbPerdus","qteRecus"});pr.getTableau().setLien(new String[]{pr.getLien()+"?but=ferme/receptionaeroport/receptionaeroport-fiche.jsp"});pr.getTableau().setColonneLien(new String[]{"id"});pr.getTableau().setAttLien(new String[]{"id"});
    pr.getTableau().setLibelleAffiche(new String[]{"Réception","Commande","Fournisseur","Race","Âge (jours)","Commandés","Date","Heure","Morts","Perdus","Vivants","Contrôle","État"});
%><div class="content-wrapper"><section class="content-header"><h1><%=pr.getTitre()%></h1></section><section class="content"><form action="<%=pr.getLien()%>?but=<%=pr.getApres()%>" method="post"><%out.println(pr.getFormu().getHtmlEnsemble());%></form><%out.println(pr.getTableauRecap().getHtml());out.println(pr.getTableau().getHtml());out.println(pr.getBasPage());%></section></div>
<%}catch(Exception e){e.printStackTrace();%><script>alert('<%=e.getMessage()%>');history.back();</script><%}%>
