<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cinema.Film"%>
<%@page import="affichage.PageRecherche"%>
<%
    try {
        String listeCrt[] = {"libelle"};
        String listeInt[] = {};
        String libEntete[] = {"id", "libelle", "marque", "style", "durre", "sousCategorie", "actif"};
        PageRecherche pr = new PageRecherche(new Film(), request, listeCrt, listeInt, 3, libEntete, libEntete.length);
        pr.setUtilisateur((user.UserEJB) session.getValue("u"));
        pr.setLien((String) session.getValue("lien"));
        pr.setAWhere(" and categorieIngredient='" + cinema.ConstanteCinema.CATEGORIE_FILM + "' and nvl(actif,1)=1");
        pr.getFormu().getChamp("libelle").setLibelle("Titre");
        pr.setApres("cinema/film-liste.jsp");
        pr.getFormu().setAnotherButton("<a class=\"btn btn-primary pull-right btn-small\" href=\"module.jsp?but=cinema/film-saisie.jsp\"><i class=\"material-symbols-rounded\">add</i> Nouveau film</a>");
        pr.creerObjetPage(libEntete, new String[]{});
%>
<div class="content-wrapper">
    <section class="content-header"><h1>Films</h1></section>
    <section class="content">
        <form action='<%=pr.getLien() + "?but=cinema/film-liste.jsp"%>' method="post" name="liste" id="liste">
            <% out.println(pr.getFormu().getHtmlEnsemble()); %>
        </form>
        <%
            pr.getTableau().setLien(new String[]{pr.getLien() + "?but=cinema/film-fiche.jsp"});
            pr.getTableau().setColonneLien(new String[]{"id"});
            pr.getTableau().setAttLien(new String[]{"id"});
            pr.getTableau().setLibelleAffiche(new String[]{"ID", "Titre", "R&eacute;alisateur", "Genre", "Dur&eacute;e (min)", "Classification", "Actif"});
            out.println(pr.getTableau().getHtml());
            out.println(pr.getBasPage());
        %>
    </section>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=String.valueOf(e.getMessage()).replace("\"", "'")%>"); history.back();</script>
<% } %>
