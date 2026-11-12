<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="affichage.PageInsert"%>
<%@page import="user.UserEJB"%>
<%@page import="cinema.Salle"%>
<%
    try {
        UserEJB u = (UserEJB) session.getValue("u");
        boolean modif = request.getParameter("acte") != null;
        PageInsert pi = new PageInsert(new Salle(), request, u);
        pi.setLien((String) session.getValue("lien"));
        pi.getFormu().getChamp("val").setLibelle("Nom de la salle");
        pi.getFormu().getChamp("desce").setLibelle("Description");
        pi.getFormu().getChamp("capacite").setLibelle("Capacit&eacute; (places)");
        pi.getFormu().getChamp("compteur").setLibelle("Places par rang&eacute;e (plan de salle)");
        pi.getFormu().getChamp("compteur").setDefaut("10");
        pi.getFormu().getChamp("actif").setLibelle("Active (1 = oui, 0 = non)");
        pi.getFormu().getChamp("actif").setDefaut("1");
        pi.getFormu().getChamp("idTypeMagasin").setVisible(false);
        pi.preparerDataFormu();
        pi.getFormu().makeHtmlInsertTabIndex();
%>
<div class="content-wrapper">
    <h1><%= modif ? "Modification d'une salle" : "Nouvelle salle de cin&eacute;ma" %></h1>
    <form action="<%=pi.getLien()%>?but=apresTarif.jsp" method="post" name="MAGASIN2" id="MAGASIN2">
        <% out.println(pi.getFormu().getHtmlInsert()); %>
        <input name="acte" type="hidden" value="insert">
        <input name="bute" type="hidden" value="cinema/salle-fiche.jsp">
        <input name="classe" type="hidden" value="cinema.Salle">
        <input name="nomtable" type="hidden" value="MAGASIN2">
    </form>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=String.valueOf(e.getMessage()).replace("\"", "'")%>"); history.back();</script>
<% } %>
