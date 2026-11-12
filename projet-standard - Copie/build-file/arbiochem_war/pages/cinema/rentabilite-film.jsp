<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.CGenUtil"%>
<%@page import="cinema.*"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        String lien = (String) session.getValue("lien");
        RentabiliteFilm[] ls = (RentabiliteFilm[]) CGenUtil.rechercher(new RentabiliteFilm(), null, null, " and (coutAchat>0 or recette>0) order by marge desc");
        double cout = 0, recette = 0, spectateurs = 0;
        for (RentabiliteFilm r : ls) { cout += r.getCoutAchat(); recette += r.getRecette(); spectateurs += r.getSpectateurs(); }
%>
<div class="content-wrapper">
    <section class="content-header"><h1>Rentabilit&eacute; par film</h1></section>
    <section class="content"><div class="box"><div class="box-body">
        <p>Co&ucirc;t = montant des contrats de droits vis&eacute;s. Recette = billets des r&eacute;servations vis&eacute;es.</p>
        <table class="table table-bordered table-striped">
            <thead><tr><th>Film</th><th>S&eacute;ances</th><th>Spectateurs</th><th style="text-align:right">Co&ucirc;t d'achat</th><th style="text-align:right">Recette</th><th style="text-align:right">Marge</th></tr></thead>
            <tbody>
            <% for (RentabiliteFilm r : ls) { %>
            <tr>
                <td><a href="<%=lien%>?but=cinema/film-fiche.jsp&id=<%=h(r.getIdFilm())%>"><%=h(r.getFilmLib())%></a></td>
                <td><%=nb(r.getNbSeances())%></td>
                <td><%=nb(r.getSpectateurs())%></td>
                <td style="text-align:right"><%=ar(r.getCoutAchat())%></td>
                <td style="text-align:right"><%=ar(r.getRecette())%></td>
                <td style="text-align:right;font-weight:bold;color:<%=r.getMarge() < 0 ? "#dc3545" : "#28a745"%>"><%=ar(r.getMarge())%></td>
            </tr>
            <% } %>
            <% if (ls.length == 0) { %><tr><td colspan="6">Aucune donn&eacute;e.</td></tr><% } %>
            </tbody>
            <tfoot><tr><th colspan="2">Total</th><th><%=nb(spectateurs)%></th><th style="text-align:right"><%=ar(cout)%></th>
                <th style="text-align:right"><%=ar(recette)%></th><th style="text-align:right"><%=ar(recette - cout)%></th></tr></tfoot>
        </table>
    </div></div></section>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
