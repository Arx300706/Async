<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cinema.SeancePlacesDispo"%>
<%@page import="affichage.PageRecherche"%>
<%
    try {
        String listeCrt[] = {"filmLib", "salleLib", "etatLib", "dateDebut"};
        String listeInt[] = {"dateDebut"};
        String libEntete[] = {"id", "filmLib", "salleLib", "dateDebut", "heure", "duree", "capacite", "placesReservees", "placesDispo", "etatLib", "idContrat"};
        PageRecherche pr = new PageRecherche(new SeancePlacesDispo(), request, listeCrt, listeInt, 3, libEntete, libEntete.length);
        pr.setUtilisateur((user.UserEJB) session.getValue("u"));
        pr.setLien((String) session.getValue("lien"));
        pr.getFormu().getChamp("filmLib").setLibelle("Film");
        pr.getFormu().getChamp("salleLib").setLibelle("Salle");
        pr.getFormu().getChamp("etatLib").setLibelle("&Eacute;tat (CREEE, PROGRAMMEE, ANNULEE)");
        pr.getFormu().getChamp("dateDebut1").setLibelle("Du");
        pr.getFormu().getChamp("dateDebut2").setLibelle("Au");
        pr.setApres("cinema/seance-liste.jsp");
        pr.getFormu().setAnotherButton("<a class=\"btn btn-primary pull-right btn-small\" href=\"module.jsp?but=cinema/seance-saisie.jsp\"><i class=\"material-symbols-rounded\">add</i> Programmer une s&eacute;ance</a>");
        pr.creerObjetPage(libEntete, new String[]{"placesReservees"});
%>
<div class="content-wrapper">
    <section class="content-header"><h1>S&eacute;ances</h1></section>
    <section class="content">
        <form action='<%=pr.getLien() + "?but=cinema/seance-liste.jsp"%>' method="post" name="liste" id="liste">
            <% out.println(pr.getFormu().getHtmlEnsemble()); %>
        </form>
        <%
            pr.getTableau().setLien(new String[]{pr.getLien() + "?but=cinema/seance-fiche.jsp", pr.getLien() + "?but=cinema/contrat-fiche.jsp"});
            pr.getTableau().setColonneLien(new String[]{"id", "idContrat"});
            pr.getTableau().setAttLien(new String[]{"id", "id"});
            pr.getTableau().setLibelleAffiche(new String[]{"S&eacute;ance", "Film", "Salle", "Date", "Heure", "Dur&eacute;e (min)", "Capacit&eacute;", "R&eacute;serv&eacute;es", "Disponibles", "&Eacute;tat", "Contrat"});
            out.println(pr.getTableau().getHtml());
            out.println(pr.getBasPage());
        %>
    </section>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=String.valueOf(e.getMessage()).replace("\"", "'")%>"); history.back();</script>
<% } %>
