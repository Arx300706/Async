<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="faturefournisseur.Fournisseur"%>
<%@page import="affichage.PageRecherche"%>
<%
    try {
        Fournisseur base = new Fournisseur();
        String listeCrt[] = {"nom", "contact", "mail"};
        String listeInt[] = {};
        String libEntete[] = {"id", "nom", "contact", "mail", "nif", "stat", "adresse"};
        PageRecherche pr = new PageRecherche(base, request, listeCrt, listeInt, 3, libEntete, libEntete.length);
        pr.setUtilisateur((user.UserEJB) session.getValue("u"));
        pr.setLien((String) session.getValue("lien"));
        pr.setAWhere(" and idTypeFournisseur='" + cinema.ConstanteCinema.TYPE_FOURNISSEUR_DISTRIBUTEUR + "'");
        pr.setApres("cinema/distributeur-liste.jsp");
        pr.getFormu().setAnotherButton("<a class=\"btn btn-primary pull-right btn-small\" href=\"module.jsp?but=cinema/distributeur-saisie.jsp\"><i class=\"material-symbols-rounded\">add</i> Nouveau distributeur</a>");
        pr.creerObjetPage(libEntete, new String[]{});
%>
<div class="content-wrapper">
    <section class="content-header"><h1>Distributeurs de films</h1></section>
    <section class="content">
        <form action='<%=pr.getLien() + "?but=cinema/distributeur-liste.jsp"%>' method="post" name="liste" id="liste">
            <% out.println(pr.getFormu().getHtmlEnsemble()); %>
        </form>
        <%
            pr.getTableau().setLien(new String[]{pr.getLien() + "?but=fournisseur/fournisseur-fiche.jsp"});
            pr.getTableau().setColonneLien(new String[]{"id"});
            pr.getTableau().setAttLien(new String[]{"id"});
            pr.getTableau().setLibelleAffiche(new String[]{"ID", "Nom", "Contact", "Mail", "NIF", "STAT", "Adresse"});
            out.println(pr.getTableau().getHtml());
            out.println(pr.getBasPage());
        %>
    </section>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=String.valueOf(e.getMessage()).replace("\"", "'")%>"); history.back();</script>
<% } %>
