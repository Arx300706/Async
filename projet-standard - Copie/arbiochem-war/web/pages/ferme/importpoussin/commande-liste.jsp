<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="affichage.PageRecherche" %>
<%@ page import="faturefournisseur.As_BonDeCommandePoussinLib" %>
<% try {
    As_BonDeCommandePoussinLib base = new As_BonDeCommandePoussinLib();
    String[] criteres = {"fournisseurLib", "idSoucheLib", "statut", "daty"};
    String[] dates = {"daty"};
    String[] colonnes = {"id", "reference", "daty", "fournisseurLib", "idSoucheLib", "ageLib", "idMagasinLib", "nbMaleRequis", "nbFemelleRequis", "quantiteCommandee", "pu", "montant", "statut"};
    PageRecherche pr = new PageRecherche(base, request, criteres, dates, 3, colonnes, colonnes.length);
    pr.setUtilisateur((user.UserEJB) session.getValue("u")); pr.setLien((String) session.getValue("lien"));
    pr.setTitre("Commandes de poussins importés"); pr.setApres("ferme/importpoussin/commande-liste.jsp");
    pr.getFormu().getChamp("fournisseurLib").setLibelle("Fournisseur");
    pr.getFormu().getChamp("idSoucheLib").setLibelle("Race");
    pr.getFormu().getChamp("statut").setLibelle("Statut"); pr.getFormu().getChamp("daty1").setLibelle("Date du"); pr.getFormu().getChamp("daty2").setLibelle("au");
    pr.getFormu().setAnotherButton("<a class=\"btn btn-primary pull-right btn-small\" href=\"module.jsp?but=ferme/importpoussin/commande-saisie.jsp\"><i class=\"material-symbols-rounded\">add</i> Nouvelle commande</a><a class=\"btn btn-info pull-right btn-small\" style=\"margin-right:8px\" href=\"module.jsp?but=ferme/receptionaeroport/receptionaeroport-liste.jsp\"><i class=\"material-symbols-rounded\">flight_land</i> Réceptions aéroport</a>");
    pr.creerObjetPage(colonnes, new String[]{"nbMaleRequis", "nbFemelleRequis", "quantiteCommandee", "montant"});
    String fiche=pr.getLien()+"?but=ferme/importpoussin/commande-fiche.jsp";
    pr.getTableau().setLien(new String[]{fiche,fiche});
    pr.getTableau().setColonneLien(new String[]{"id","statut"}); pr.getTableau().setAttLien(new String[]{"id","id"}); pr.getTableau().setValeurLien(new String[]{"id","id"});
    pr.getTableau().setLibelleAffiche(new String[]{"N° bon", "Référence", "Date", "Fournisseur", "Race", "Âge", "Poulailler", "Mâles", "Femelles", "Total", "PU", "Montant", "Suivi"});
%>
<div class="content-wrapper"><section class="content-header"><h1><%=pr.getTitre()%></h1></section><section class="content">
<form action="<%=pr.getLien()%>?but=<%=pr.getApres()%>" method="post"><% out.println(pr.getFormu().getHtmlEnsemble()); %></form>
<% out.println(pr.getTableauRecap().getHtml()); out.println(pr.getTableau().getHtml()); out.println(pr.getBasPage()); %>
</section></div>
<% } catch (Exception e) { e.printStackTrace(); %><script>alert('<%=e.getMessage()%>');history.back();</script><% } %>
