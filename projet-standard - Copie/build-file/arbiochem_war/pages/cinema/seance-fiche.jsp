<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.CGenUtil"%>
<%@page import="cinema.*"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        String lien = (String) session.getValue("lien");
        String id = request.getParameter("id");
        SeancePlacesDispo[] t = (SeancePlacesDispo[]) CGenUtil.rechercher(new SeancePlacesDispo(), null, null, " and id='" + sql(id) + "'");
        if (t.length == 0) throw new Exception("Séance introuvable");
        SeancePlacesDispo s = t[0];
        ReservationCinemaLib[] res = (ReservationCinemaLib[]) CGenUtil.rechercher(new ReservationCinemaLib(), null, null,
                " and idSeance='" + sql(id) + "' order by idMere");
        String classe = "cinema.Seance";
        String bute = "cinema/seance-fiche.jsp";
        boolean complet = s.getPlacesDispo() <= 0;
%>
<div class="content-wrapper">
    <h1 class="box-title"><a href="<%=lien%>?but=cinema/seance-liste.jsp"><i class="fa fa-angle-left"></i></a> S&eacute;ance <%=h(s.getId())%></h1>
    <div class="row m-0"><div class="col-md-2"></div><div class="col-md-8"><div class="box"><div class="box-body">
        <table class="table table-bordered">
            <tr><th>Film</th><td><a href="<%=lien%>?but=cinema/film-fiche.jsp&id=<%=h(s.getIdFilm())%>"><%=h(s.getFilmLib())%></a></td>
                <th>&Eacute;tat</th><td><%=badge(s.getEtatLib())%></td></tr>
            <tr><th>Salle</th><td><a href="<%=lien%>?but=cinema/salle-fiche.jsp&id=<%=h(s.getIdSalle())%>"><%=h(s.getSalleLib())%></a></td>
                <th>Date et heure</th><td><%=date(s.getDateDebut())%> &agrave; <%=h(s.getHeure())%> (<%=h(s.getDuree())%> min avec nettoyage)</td></tr>
            <tr><th>Capacit&eacute;</th><td><%=nb(s.getCapacite())%> (<%=nb(s.getPlacesParRangee())%> par rang&eacute;e)</td>
                <th>Places r&eacute;serv&eacute;es</th><td><%=nb(s.getPlacesReservees())%> (<%=nb(s.getTauxRemplissage())%> %)</td></tr>
            <tr><th>Places disponibles</th><td style="font-size:1.4em;font-weight:bold;color:<%=complet ? "#dc3545" : "#28a745"%>"><%=complet ? "COMPLET" : nb(s.getPlacesDispo())%></td>
                <th>Prix du billet</th><td><%=ar(s.getPrixBillet())%> Ar</td></tr>
            <tr><th>Contrat utilis&eacute;</th><td><a href="<%=lien%>?but=cinema/contrat-fiche.jsp&id=<%=h(s.getIdContrat())%>"><%=h(s.getIdContrat())%></a></td>
                <th>Distributeur</th><td><%=h(s.getDistributeurLib())%></td></tr>
        </table>
        <div class="box-footer">
        <% if (s.getEtat() == 1) { %>
            <a class="btn btn-primary pull-right" style="margin-right:10px" href="<%=lien%>?but=apresTarif.jsp&acte=valider&id=<%=h(id)%>&bute=<%=bute%>&classe=<%=classe%>&nomtable=PLANNING">Viser (ouvrir &agrave; la r&eacute;servation)</a>
            <a class="btn btn-secondary pull-right" style="margin-right:10px" href="<%=lien%>?but=cinema/seance-saisie.jsp&acte=update&id=<%=h(id)%>">Modifier</a>
        <% } %>
        <% if (s.getEtat() == 11 && !complet) { %>
            <a class="btn btn-primary pull-right" style="margin-right:10px" href="<%=lien%>?but=cinema/reservation-places.jsp&idSeance=<%=h(id)%>">Vendre des billets (plan de salle)</a>
            <a class="btn btn-secondary pull-right" style="margin-right:10px" href="<%=lien%>?but=cinema/reservation-saisie.jsp&idSeance=<%=h(id)%>">R&eacute;server par quantit&eacute;</a>
        <% } %>
        <% if (s.getEtat() == 1) { %>  <%-- le framework refuse d annuler une seance visee --%>
            <a class="btn btn-danger pull-left" href="<%=lien%>?but=apresTarif.jsp&acte=annuler&id=<%=h(id)%>&bute=<%=bute%>&classe=<%=classe%>">Annuler la s&eacute;ance</a>
        <% } %>
        </div>
    </div></div></div></div>
    <div class="box"><div class="box-body">
        <h3>R&eacute;servations de la s&eacute;ance</h3>
        <table class="table table-bordered table-striped">
            <thead><tr><th>R&eacute;servation</th><th>Client</th><th>Date</th><th>Places</th><th>Prix</th><th>Montant</th><th>&Eacute;tat</th></tr></thead>
            <tbody>
            <% for (ReservationCinemaLib r : res) { %>
            <tr>
                <td><a href="<%=lien%>?but=cinema/reservation-fiche.jsp&id=<%=h(r.getIdMere())%>"><%=h(r.getIdMere())%></a></td>
                <td><%=h(r.getClientLib())%></td>
                <td><%=date(r.getDateReservation())%></td>
                <td><%=nb(r.getQte())%></td>
                <td><%=ar(r.getPu())%></td>
                <td><%=ar(r.getMontant())%></td>
                <td><%=badge(r.getEtatLib())%></td>
            </tr>
            <% } %>
            <% if (res.length == 0) { %><tr><td colspan="7">Aucune r&eacute;servation.</td></tr><% } %>
            </tbody>
        </table>
    </div></div>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
