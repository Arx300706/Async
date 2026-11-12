<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cinema.ContratFilmLib"%>
<%@page import="affichage.PageRecherche"%>
<%
    try {
        String listeCrt[] = {"filmLib", "fournisseurLib", "etatLib", "daty"};
        String listeInt[] = {"daty"};
        String libEntete[] = {"id", "reference", "daty", "filmLib", "fournisseurLib", "dateDebutDroits", "dateLimite", "seancesAchetees", "montant", "etatLib", "statutLicence", "idFacture"};
        PageRecherche pr = new PageRecherche(new ContratFilmLib(), request, listeCrt, listeInt, 3, libEntete, libEntete.length);
        pr.setUtilisateur((user.UserEJB) session.getValue("u"));
        pr.setLien((String) session.getValue("lien"));
        pr.getFormu().getChamp("filmLib").setLibelle("Film");
        pr.getFormu().getChamp("fournisseurLib").setLibelle("Distributeur");
        pr.getFormu().getChamp("etatLib").setLibelle("&Eacute;tat (CREE, VISE, ANNULE)");
        pr.getFormu().getChamp("daty1").setLibelle("Date min");
        pr.getFormu().getChamp("daty2").setLibelle("Date max");
        pr.setApres("cinema/contrat-liste.jsp");
        pr.getFormu().setAnotherButton("<a class=\"btn btn-primary pull-right btn-small\" href=\"module.jsp?but=cinema/contrat-saisie.jsp\"><i class=\"material-symbols-rounded\">add</i> Nouveau contrat</a>");
        pr.creerObjetPage(libEntete, new String[]{"montant"});
%>
<div class="content-wrapper">
    <section class="content-header"><h1>Contrats de films (droits de diffusion)</h1></section>
    <section class="content">
        <form action='<%=pr.getLien() + "?but=cinema/contrat-liste.jsp"%>' method="post" name="liste" id="liste">
            <% out.println(pr.getFormu().getHtmlEnsemble()); %>
        </form>
        <%
            pr.getTableau().setLien(new String[]{pr.getLien() + "?but=cinema/contrat-fiche.jsp", pr.getLien() + "?but=facturefournisseur/facturefournisseur-fiche.jsp"});
            pr.getTableau().setColonneLien(new String[]{"id", "idFacture"});
            pr.getTableau().setAttLien(new String[]{"id", "id"});
            pr.getTableau().setLibelleAffiche(new String[]{"Contrat", "N&deg;", "Date", "Film", "Distributeur", "D&eacute;but droits", "Fin droits", "S&eacute;ances", "Montant", "&Eacute;tat", "Licence", "Facture"});
            out.println(pr.getTableauRecap().getHtml());
            out.println(pr.getTableau().getHtml());
            out.println(pr.getBasPage());
        %>
    </section>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=String.valueOf(e.getMessage()).replace("\"", "'")%>"); history.back();</script>
<% } %>
