<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cinema.ReservationCinemaVue"%>
<%@page import="affichage.PageRecherche"%>
<%
    try {
        String listeCrt[] = {"clientLib", "etatLib", "daty"};
        String listeInt[] = {"daty"};
        String libEntete[] = {"id", "daty", "clientLib", "nbPlaces", "montant", "paye", "resteAPayer", "etatLib"};
        PageRecherche pr = new PageRecherche(new ReservationCinemaVue(), request, listeCrt, listeInt, 3, libEntete, libEntete.length);
        pr.setUtilisateur((user.UserEJB) session.getValue("u"));
        pr.setLien((String) session.getValue("lien"));
        pr.getFormu().getChamp("clientLib").setLibelle("Client");
        pr.getFormu().getChamp("etatLib").setLibelle("&Eacute;tat (CREEE, VISEE, ANNULEE)");
        pr.getFormu().getChamp("daty1").setLibelle("Du");
        pr.getFormu().getChamp("daty2").setLibelle("Au");
        pr.setApres("cinema/reservation-liste.jsp");
        pr.getFormu().setAnotherButton("<a class=\"btn btn-primary pull-right btn-small\" href=\"module.jsp?but=cinema/reservation-saisie.jsp\"><i class=\"material-symbols-rounded\">add</i> Nouvelle r&eacute;servation</a>");
        pr.creerObjetPage(libEntete, new String[]{"nbPlaces", "montant", "paye", "resteAPayer"});
%>
<div class="content-wrapper">
    <section class="content-header"><h1>R&eacute;servations</h1></section>
    <section class="content">
        <form action='<%=pr.getLien() + "?but=cinema/reservation-liste.jsp"%>' method="post" name="liste" id="liste">
            <% out.println(pr.getFormu().getHtmlEnsemble()); %>
        </form>
        <%
            pr.getTableau().setLien(new String[]{pr.getLien() + "?but=cinema/reservation-fiche.jsp"});
            pr.getTableau().setColonneLien(new String[]{"id"});
            pr.getTableau().setAttLien(new String[]{"id"});
            pr.getTableau().setLibelleAffiche(new String[]{"R&eacute;servation", "Date", "Client", "Places", "Montant", "Pay&eacute;", "Reste &agrave; payer", "&Eacute;tat"});
            out.println(pr.getTableauRecap().getHtml());
            out.println(pr.getTableau().getHtml());
            out.println(pr.getBasPage());
        %>
    </section>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=String.valueOf(e.getMessage()).replace("\"", "'")%>"); history.back();</script>
<% } %>
