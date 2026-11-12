<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.CGenUtil"%>
<%@page import="cinema.*"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        String lien = (String) session.getValue("lien");
        String statut = request.getParameter("statut");
        String film = request.getParameter("film");
        String w = "";
        if (!vide(statut)) w += " and statut='" + sql(statut) + "'";
        if (!vide(film)) w += " and upper(filmLib) like upper('%" + sql(film) + "%')";
        FilmLicence[] ls = (FilmLicence[]) CGenUtil.rechercher(new FilmLicence(), null, null, w + " order by dateFinDroits desc, idbc");
        double total = 0;
        for (FilmLicence l : ls) total += l.getMontantAchat();
%>
<div class="content-wrapper">
    <section class="content-header"><h1>Licences de diffusion</h1></section>
    <section class="content"><div class="box"><div class="box-body">
        <form action="<%=lien%>" method="get" class="form-inline" style="margin-bottom:12px">
            <input type="hidden" name="but" value="cinema/licence-liste.jsp">
            <input class="form-control" name="film" placeholder="Film" value="<%=h(film)%>">
            <select class="form-control" name="statut">
                <option value="">Tous les statuts</option>
                <% for (String s : new String[]{"ACTIVE", "EN ATTENTE", "A VENIR", "EPUISEE", "EXPIREE"}) { %>
                <option <%=s.equals(statut) ? "selected" : ""%>><%=s%></option>
                <% } %>
            </select>
            <button class="btn btn-primary" type="submit">Filtrer</button>
            <a class="btn btn-secondary pull-right" href="<%=lien%>?but=cinema/contrat-saisie.jsp">Nouveau contrat</a>
        </form>
        <table class="table table-bordered table-striped">
            <thead><tr><th>Contrat</th><th>Film</th><th>Distributeur</th><th>D&eacute;but des droits</th><th>Fin des droits</th>
                <th>Achet&eacute;es</th><th>Programm&eacute;es</th><th>Restantes</th><th>Co&ucirc;t d'achat</th><th>Statut</th></tr></thead>
            <tbody>
            <% for (FilmLicence l : ls) { %>
            <tr>
                <td><a href="<%=lien%>?but=cinema/contrat-fiche.jsp&id=<%=h(l.getIdbc())%>"><%=h(l.getIdbc())%></a></td>
                <td><a href="<%=lien%>?but=cinema/film-fiche.jsp&id=<%=h(l.getIdFilm())%>"><%=h(l.getFilmLib())%></a></td>
                <td><%=h(l.getFournisseurLib())%></td>
                <td><%=date(l.getDateDebutDroits())%></td>
                <td><%=date(l.getDateFinDroits())%></td>
                <td><%=nb(l.getSeancesAchetees())%></td>
                <td><%=nb(l.getSeancesProgrammees())%></td>
                <td><%=nb(l.getSeancesRestantes())%></td>
                <td style="text-align:right"><%=ar(l.getMontantAchat())%></td>
                <td><%=badge(l.getStatut())%></td>
            </tr>
            <% } %>
            <% if (ls.length == 0) { %><tr><td colspan="10">Aucune licence.</td></tr><% } %>
            </tbody>
            <tfoot><tr><th colspan="8">Total (<%=ls.length%> licence(s))</th><th style="text-align:right"><%=ar(total)%></th><th></th></tr></tfoot>
        </table>
    </div></div></section>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
