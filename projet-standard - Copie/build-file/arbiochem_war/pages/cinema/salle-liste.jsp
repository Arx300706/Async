<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cinema.Salle"%>
<%@page import="affichage.PageRecherche"%>
<%
    try {
        String listeCrt[] = {"val"};
        String listeInt[] = {};
        String libEntete[] = {"id", "val", "capacite", "actif", "desce"};
        PageRecherche pr = new PageRecherche(new Salle(), request, listeCrt, listeInt, 3, libEntete, libEntete.length);
        pr.setUtilisateur((user.UserEJB) session.getValue("u"));
        pr.setLien((String) session.getValue("lien"));
        pr.setAWhere(" and idTypeMagasin='" + cinema.ConstanteCinema.TYPE_MAGASIN_SALLE + "'");
        pr.getFormu().getChamp("val").setLibelle("Nom");
        pr.setApres("cinema/salle-liste.jsp");
        pr.getFormu().setAnotherButton("<a class=\"btn btn-primary pull-right btn-small\" href=\"module.jsp?but=cinema/salle-saisie.jsp\"><i class=\"material-symbols-rounded\">add</i> Nouvelle salle</a>");
        pr.creerObjetPage(libEntete, new String[]{"capacite"});
%>
<div class="content-wrapper">
    <section class="content-header"><h1>Salles de cin&eacute;ma</h1></section>
    <section class="content">
        <form action='<%=pr.getLien() + "?but=cinema/salle-liste.jsp"%>' method="post" name="liste" id="liste">
            <% out.println(pr.getFormu().getHtmlEnsemble()); %>
        </form>
        <%
            pr.getTableau().setLien(new String[]{pr.getLien() + "?but=cinema/salle-fiche.jsp"});
            pr.getTableau().setColonneLien(new String[]{"id"});
            pr.getTableau().setAttLien(new String[]{"id"});
            pr.getTableau().setLibelleAffiche(new String[]{"ID", "Salle", "Capacit&eacute;", "Active", "Description"});
            out.println(pr.getTableau().getHtml());
            out.println(pr.getBasPage());
        %>
    </section>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=String.valueOf(e.getMessage()).replace("\"", "'")%>"); history.back();</script>
<% } %>
