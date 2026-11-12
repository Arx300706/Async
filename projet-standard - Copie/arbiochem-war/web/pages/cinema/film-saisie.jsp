<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="affichage.PageInsert"%>
<%@page import="user.UserEJB"%>
<%@page import="cinema.Film"%>
<%
    try {
        UserEJB u = (UserEJB) session.getValue("u");
        boolean modif = request.getParameter("acte") != null;
        PageInsert pi = new PageInsert(new Film(), request, u);
        pi.setLien((String) session.getValue("lien"));
        pi.getFormu().getChamp("libelle").setLibelle("Titre");
        pi.getFormu().getChamp("durre").setLibelle("Dur&eacute;e (minutes)");
        pi.getFormu().getChamp("marque").setLibelle("R&eacute;alisateur");
        pi.getFormu().getChamp("style").setLibelle("Genre (Aventure, Thriller, Animation...)");
        pi.getFormu().getChamp("sousCategorie").setLibelle("Classification (Tous publics, -12, -16...)");
        pi.getFormu().getChamp("pv").setLibelle("Prix du billet sans place num&eacute;rot&eacute;e (tarif Standard)");
        pi.getFormu().getChamp("tva").setLibelle("TVA (%)");
        pi.getFormu().getChamp("tva").setDefaut("0");
        pi.getFormu().getChamp("photo").setLibelle("Affiche (URL ou chemin de l'image)");
        pi.getFormu().getChamp("actif").setLibelle("Actif (1 = oui, 0 = non)");
        pi.getFormu().getChamp("actif").setDefaut("1");
        pi.getFormu().getChamp("pu").setVisible(false);
        pi.getFormu().getChamp("unite").setVisible(false);
        pi.getFormu().getChamp("categorieIngredient").setVisible(false);
        pi.getFormu().getChamp("isAchat").setVisible(false);
        pi.getFormu().getChamp("isVente").setVisible(false);
        pi.getFormu().getChamp("daty").setVisible(false);
        pi.preparerDataFormu();
        pi.getFormu().makeHtmlInsertTabIndex();
%>
<div class="content-wrapper">
    <h1><%= modif ? "Modification d'un film" : "Nouveau film" %></h1>
    <p>Le film peut exister sans licence : il ne sera programmable qu'apr&egrave;s l'achat des droits (contrat vis&eacute; et copie r&eacute;ceptionn&eacute;e).</p>
    <form action="<%=pi.getLien()%>?but=apresTarif.jsp" method="post" name="AS_INGREDIENTS" id="AS_INGREDIENTS">
        <% out.println(pi.getFormu().getHtmlInsert()); %>
        <input name="acte" type="hidden" value="insert">
        <input name="bute" type="hidden" value="cinema/film-fiche.jsp">
        <input name="classe" type="hidden" value="cinema.Film">
        <input name="nomtable" type="hidden" value="AS_INGREDIENTS">
    </form>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=String.valueOf(e.getMessage()).replace("\"", "'")%>"); history.back();</script>
<% } %>
