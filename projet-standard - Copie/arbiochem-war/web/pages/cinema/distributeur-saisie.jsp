<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="affichage.PageInsert"%>
<%@page import="user.UserEJB"%>
<%@page import="faturefournisseur.Fournisseur"%>
<%@page import="mg.cnaps.compta.ConstanteCompta"%>
<%
    try {
        UserEJB u = (UserEJB) session.getValue("u");
        PageInsert pi = new PageInsert(new Fournisseur(), request, u);
        pi.setLien((String) session.getValue("lien"));
        pi.getFormu().getChamp("nom").setLibelle("Nom du distributeur");
        pi.getFormu().getChamp("nif").setLibelle("NIF");
        pi.getFormu().getChamp("stat").setLibelle("STAT");
        pi.getFormu().getChamp("mail").setLibelle("Mail");
        pi.getFormu().getChamp("contact").setLibelle("Contact");
        pi.getFormu().getChamp("devise").setDefaut("AR");
        pi.getFormu().getChamp("compte").setLibelle("Compte g&eacute;n&eacute;ral");
        pi.getFormu().getChamp("compte").setDefaut(ConstanteCompta.compte_fournisseur);
        pi.getFormu().getChamp("idTypeFournisseur").setLibelle("Type");
        pi.getFormu().getChamp("idTypeFournisseur").setDefaut(cinema.ConstanteCinema.TYPE_FOURNISSEUR_DISTRIBUTEUR);
        pi.getFormu().getChamp("idTypeFournisseur").setAutre("readonly");
        pi.getFormu().getChamp("estActif").setDefaut("1");
        pi.getFormu().getChamp("estActif").setLibelle("Actif (1 = oui)");
        pi.getFormu().getChamp("compteauxiliaire").setVisible(false);
        pi.preparerDataFormu();
        pi.getFormu().makeHtmlInsertTabIndex();
%>
<div class="content-wrapper">
    <h1>Saisie d'un distributeur de films</h1>
    <form action="<%=pi.getLien()%>?but=apresTarif.jsp" method="post" name="FOURNISSEUR" id="FOURNISSEUR">
        <% out.println(pi.getFormu().getHtmlInsert()); %>
        <input name="acte" type="hidden" value="insert">
        <input name="bute" type="hidden" value="cinema/distributeur-liste.jsp">
        <input name="classe" type="hidden" value="faturefournisseur.Fournisseur">
        <input name="nomtable" type="hidden" value="FOURNISSEUR">
    </form>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=String.valueOf(e.getMessage()).replace("\"", "'")%>"); history.back();</script>
<% } %>
