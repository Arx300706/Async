<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cinema.*"%>
<%@page import="java.util.*"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        String lien = (String) session.getValue("lien");
        String id = request.getParameter("id");
        Map<String, Object> f = CinemaUtil.premier(null, "SELECT * FROM V_FACTURE_BILLET WHERE ID=?", id);
        if (f == null) throw new Exception("Facture introuvable");
        List<Map<String, Object>> lignes = CinemaUtil.lire(null, "SELECT PRODUITLIB, DESIGNATION, QTE, PU, MONTANT FROM V_FACTURE_BILLET_LIB WHERE IDFACTURECLIENT=? ORDER BY ID", id);
        List<Map<String, Object>> paiements = CinemaUtil.lire(null,
                "SELECT m.ID, m.DATY, m.CREDIT, c.VAL AS CAISSE FROM MOUVEMENTCAISSE m LEFT JOIN CAISSE c ON c.ID = m.IDCAISSE WHERE m.IDOP=? AND m.ETAT>=11 ORDER BY m.ID",
                CinemaUtil.texte(f, "IDRESERVATION"));
        java.text.SimpleDateFormat jour = new java.text.SimpleDateFormat("dd/MM/yyyy");
        double reste = CinemaUtil.nombre(f, "RESTEAPAYER");
%>
<style>
    @media print { .main-sidebar, .main-header, .no-print, header, nav, aside { display:none !important; } .content-wrapper { margin:0 !important; } }
    .fact { max-width:780px; margin:0 auto; background:#fff; padding:28px; border:1px solid #ddd; border-radius:8px; }
    .fact h2 { margin:0; }
    .fact table { width:100%; }
</style>
<div class="content-wrapper">
    <div class="no-print" style="max-width:780px;margin:10px auto">
        <a class="btn btn-secondary" href="<%=lien%>?but=cinema/facture-liste.jsp">&larr; Factures</a>
        <a class="btn btn-secondary" href="<%=lien%>?but=cinema/reservation-fiche.jsp&id=<%=h(CinemaUtil.texte(f, "IDRESERVATION"))%>">R&eacute;servation</a>
        <button class="btn btn-primary pull-right" onclick="window.print()">Imprimer</button>
    </div>
    <div class="fact">
        <div style="display:flex;justify-content:space-between;align-items:flex-start">
            <div><h2>Cin&eacute;ma</h2><div>Billetterie</div></div>
            <div style="text-align:right">
                <h2>FACTURE</h2>
                <div>N&deg; <b><%=h(CinemaUtil.texte(f, "ID"))%></b></div>
                <div>Date : <%=CinemaUtil.date(f, "DATY") == null ? "" : jour.format(CinemaUtil.date(f, "DATY"))%></div>
                <div>R&eacute;servation : <%=h(CinemaUtil.texte(f, "IDRESERVATION"))%></div>
            </div>
        </div>
        <hr>
        <p><b>Client :</b> <%=h(CinemaUtil.texte(f, "CLIENTLIB"))%> (<%=h(CinemaUtil.texte(f, "IDCLIENT"))%>)</p>
        <table class="table table-bordered">
            <thead><tr><th>D&eacute;signation</th><th>Cat&eacute;gorie</th><th style="text-align:right">Qt&eacute;</th><th style="text-align:right">Prix unitaire</th><th style="text-align:right">Montant</th></tr></thead>
            <tbody>
            <% for (Map<String, Object> l : lignes) { %>
            <tr>
                <td><%=h(CinemaUtil.texte(l, "DESIGNATION"))%></td>
                <td><%=h(CinemaUtil.texte(l, "PRODUITLIB"))%></td>
                <td style="text-align:right"><%=nb(CinemaUtil.nombre(l, "QTE"))%></td>
                <td style="text-align:right"><%=ar(CinemaUtil.nombre(l, "PU"))%> Ar</td>
                <td style="text-align:right"><%=ar(CinemaUtil.nombre(l, "MONTANT"))%> Ar</td>
            </tr>
            <% } %>
            </tbody>
            <tfoot>
                <tr><th colspan="4" style="text-align:right">Total</th><th style="text-align:right"><%=ar(CinemaUtil.nombre(f, "MONTANT"))%> Ar</th></tr>
                <tr><td colspan="4" style="text-align:right">D&eacute;j&agrave; pay&eacute;</td><td style="text-align:right"><%=ar(CinemaUtil.nombre(f, "PAYE"))%> Ar</td></tr>
                <tr><th colspan="4" style="text-align:right">Reste &agrave; payer</th><th style="text-align:right"><%=ar(reste)%> Ar</th></tr>
            </tfoot>
        </table>
        <% if (!paiements.isEmpty()) { %>
        <p><b>Paiements :</b>
            <% for (Map<String, Object> p : paiements) { %>
            <br><%=CinemaUtil.date(p, "DATY") == null ? "" : jour.format(CinemaUtil.date(p, "DATY"))%> &mdash; <%=ar(CinemaUtil.nombre(p, "CREDIT"))%> Ar &mdash; <%=h(CinemaUtil.texte(p, "CAISSE"))%> (<%=h(CinemaUtil.texte(p, "ID"))%>)
            <% } %>
        </p>
        <% } %>
        <p style="text-align:center;font-size:1.2em;margin-top:18px"><%=reste <= 0 ? badge("PAYEE") : CinemaUtil.nombre(f, "PAYE") > 0 ? badge("PARTIELLE") : badge("NON PAYEE")%></p>
    </div>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
