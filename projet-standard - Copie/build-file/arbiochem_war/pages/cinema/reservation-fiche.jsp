<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.CGenUtil"%>
<%@page import="cinema.*"%>
<%@page import="java.util.*"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        String lien = (String) session.getValue("lien");
        String id = request.getParameter("id");
        ReservationCinemaVue[] t = (ReservationCinemaVue[]) CGenUtil.rechercher(new ReservationCinemaVue(), null, null, " and id='" + sql(id) + "'");
        if (t.length == 0) throw new Exception("Réservation de cinéma introuvable");
        ReservationCinemaVue r = t[0];
        ReservationCinemaLib[] lignes = (ReservationCinemaLib[]) CGenUtil.rechercher(new ReservationCinemaLib(), null, null, " and idMere='" + sql(id) + "'");
        List<Map<String, Object>> paiements = CinemaUtil.lire(null,
                "SELECT m.ID, m.DATY, m.CREDIT, m.ETAT, c.VAL CAISSE FROM MOUVEMENTCAISSE m LEFT JOIN CAISSE c ON c.ID=m.IDCAISSE WHERE m.IDOP=? ORDER BY m.DATY, m.ID", id);
        List<Map<String, Object>> caisses = CinemaUtil.lire(null,
                "SELECT ID, VAL FROM CAISSE WHERE NVL(ACTIF,1)=1 AND COMPTE IS NOT NULL ORDER BY VAL");
        String classe = "cinema.ReservationCinema";
        String bute = "cinema/reservation-fiche.jsp";
%>
<div class="content-wrapper">
    <h1 class="box-title"><a href="<%=lien%>?but=cinema/reservation-liste.jsp"><i class="fa fa-angle-left"></i></a> R&eacute;servation <%=h(r.getId())%></h1>
    <div class="row m-0"><div class="col-md-2"></div><div class="col-md-8"><div class="box"><div class="box-body">
        <table class="table table-bordered">
            <tr><th>Client</th><td><%=h(r.getClientLib())%></td><th>&Eacute;tat</th><td><%=badge(r.getEtatLib())%></td></tr>
            <tr><th>Date</th><td><%=date(r.getDaty())%></td><th>Places</th><td><%=nb(r.getNbPlaces())%></td></tr>
            <tr><th>Montant</th><td><%=ar(r.getMontant())%> Ar</td><th>Pay&eacute; / reste</th><td><%=ar(r.getPaye())%> / <b><%=ar(r.getResteAPayer())%></b> Ar</td></tr>
            <tr><th>Remarque</th><td colspan="3"><%=h(r.getRemarque())%></td></tr>
            <% String idFacture = FactureBillet.idFacture(r.getId(), null); %>
            <tr><th>Facture</th><td colspan="3"><% if (idFacture != null) { %><a href="<%=lien%>?but=cinema/facture-billet.jsp&id=<%=h(idFacture)%>"><b><%=h(idFacture)%></b></a> (afficher / imprimer)<% } else { %>&eacute;mise au visa de la r&eacute;servation<% } %></td></tr>
        </table>
        <div class="box-footer">
        <% if (r.getEtat() == 1) { %>
            <a class="btn btn-primary pull-right" style="margin-right:10px" href="<%=lien%>?but=apresTarif.jsp&acte=valider&id=<%=h(id)%>&bute=<%=bute%>&classe=<%=classe%>&nomtable=RESERVATION">Viser</a>
        <% } %>
        <% if (r.getEtat() == 1) { %>  <%-- le framework refuse d annuler une reservation visee --%>
            <a class="btn btn-danger pull-left" href="<%=lien%>?but=apresTarif.jsp&acte=annuler&id=<%=h(id)%>&bute=<%=bute%>&classe=<%=classe%>"
               onclick="return confirm('Annuler la réservation et libérer les places ?')">Annuler</a>
        <% } %>
        </div>
        <% if (r.getEtat() == 11 && r.getResteAPayer() > 0) { %>
        <form action="<%=lien%>" method="post" class="form-inline" style="margin-top:12px">
            <input type="hidden" name="but" value="cinema/apres-paiement.jsp">
            <input type="hidden" name="id" value="<%=h(id)%>">
            <label>Montant&nbsp;</label>
            <input type="number" step="1" min="1" max="<%=(long) Math.ceil(r.getResteAPayer())%>" name="montant" class="form-control" value="<%=(long) Math.ceil(r.getResteAPayer())%>" required>
            <label>&nbsp;Caisse&nbsp;</label>
            <select name="idCaisse" class="form-control" required>
                <% for (Map<String, Object> c : caisses) { %>
                <option value="<%=h(CinemaUtil.texte(c, "ID"))%>"><%=h(CinemaUtil.texte(c, "VAL"))%></option>
                <% } %>
            </select>
            <button class="btn btn-primary" type="submit">Encaisser</button>
        </form>
        <% } %>
    </div></div></div></div>
    <div class="box"><div class="box-body">
        <h3>Places r&eacute;serv&eacute;es</h3>
        <table class="table table-bordered table-striped">
            <thead><tr><th>S&eacute;ance</th><th>Film</th><th>Salle</th><th>Date</th><th>Heure</th><th>Place</th><th>Billets</th><th>Prix</th><th>Montant</th></tr></thead>
            <tbody>
            <% for (ReservationCinemaLib l : lignes) { %>
            <tr>
                <td><a href="<%=lien%>?but=cinema/seance-fiche.jsp&id=<%=h(l.getIdSeance())%>"><%=h(l.getIdSeance())%></a></td>
                <td><%=h(l.getFilmLib())%></td>
                <td><%=h(l.getSalleLib())%></td>
                <td><%=date(l.getDateDebut())%></td>
                <td><%=h(l.getHeure())%></td>
                <td><b><%=vide(l.getPlace()) ? "-" : h(l.getPlace())%></b></td>
                <td><%=nb(l.getQte())%></td>
                <td><%=ar(l.getPu())%></td>
                <td><%=ar(l.getMontant())%></td>
            </tr>
            <% } %>
            </tbody>
        </table>
        <h3>Paiements</h3>
        <table class="table table-bordered">
            <thead><tr><th>Mouvement</th><th>Date</th><th>Caisse</th><th>Montant</th><th>&Eacute;tat</th></tr></thead>
            <tbody>
            <% for (Map<String, Object> p : paiements) { %>
            <tr>
                <td><a href="<%=lien%>?but=caisse/mvt/mvtCaisse-fiche.jsp&id=<%=h(CinemaUtil.texte(p, "ID"))%>"><%=h(CinemaUtil.texte(p, "ID"))%></a></td>
                <td><%=CinemaUtil.date(p, "DATY") == null ? "" : new java.text.SimpleDateFormat("dd/MM/yyyy").format(CinemaUtil.date(p, "DATY"))%></td>
                <td><%=h(CinemaUtil.texte(p, "CAISSE"))%></td>
                <td><%=ar(CinemaUtil.nombre(p, "CREDIT"))%></td>
                <td><%=CinemaUtil.nombre(p, "ETAT") >= 11 ? badge("VISE") : badge("CREE")%></td>
            </tr>
            <% } %>
            <% if (paiements.isEmpty()) { %><tr><td colspan="5">Aucun paiement.</td></tr><% } %>
            </tbody>
        </table>
    </div></div>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
