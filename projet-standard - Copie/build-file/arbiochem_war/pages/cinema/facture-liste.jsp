<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cinema.*"%>
<%@page import="java.util.*"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        String lien = (String) session.getValue("lien");
        java.text.SimpleDateFormat jour = new java.text.SimpleDateFormat("dd/MM/yyyy");
        // Factures des billets (FACTURECLIENT liees aux reservations de cinema)
        List<Map<String, Object>> billets = CinemaUtil.lire(null,
                "SELECT ID, DATY, IDRESERVATION, CLIENTLIB, NBBILLETS, MONTANT, PAYE, RESTEAPAYER, ETATLIB FROM V_FACTURE_BILLET ORDER BY ID DESC");
        // Factures des distributeurs (achat des droits de diffusion)
        List<Map<String, Object>> distributeurs = CinemaUtil.lire(null,
                "SELECT f.ID, f.DATY, f.IDFOURNISSEURLIB, f.IDBC, v.FILMLIB, f.MONTANTTTC, f.MONTANTPAYE, f.MONTANTRESTE, f.ETAT "
              + "FROM FACTUREFOURNISSEURCPL f JOIN V_CONTRAT_FILM v ON v.ID = f.IDBC ORDER BY f.ID DESC");
        double tb = 0, tbp = 0, td = 0, tdp = 0;
        for (Map<String, Object> f : billets) { tb += CinemaUtil.nombre(f, "MONTANT"); tbp += CinemaUtil.nombre(f, "PAYE"); }
        for (Map<String, Object> f : distributeurs) { td += CinemaUtil.nombre(f, "MONTANTTTC"); tdp += CinemaUtil.nombre(f, "MONTANTPAYE"); }
%>
<div class="content-wrapper">
    <section class="content-header"><h1>Factures du cin&eacute;ma</h1></section>
    <section class="content">
        <div class="box"><div class="box-body">
            <h3>Factures des billets vendus <small><%=billets.size()%> facture(s)</small></h3>
            <p>Une facture est &eacute;mise automatiquement quand une r&eacute;servation est vis&eacute;e (billets vendus). Cliquez sur le num&eacute;ro pour l'afficher et l'imprimer.</p>
            <table class="table table-bordered table-striped">
                <thead><tr><th>Facture</th><th>Date</th><th>R&eacute;servation</th><th>Client</th><th>Billets</th>
                    <th style="text-align:right">Montant</th><th style="text-align:right">Pay&eacute;</th><th style="text-align:right">Reste</th><th>Paiement</th></tr></thead>
                <tbody>
                <% for (Map<String, Object> f : billets) { double reste = CinemaUtil.nombre(f, "RESTEAPAYER"), paye = CinemaUtil.nombre(f, "PAYE"); %>
                <tr>
                    <td><a href="<%=lien%>?but=cinema/facture-billet.jsp&id=<%=h(CinemaUtil.texte(f, "ID"))%>"><b><%=h(CinemaUtil.texte(f, "ID"))%></b></a></td>
                    <td><%=CinemaUtil.date(f, "DATY") == null ? "" : jour.format(CinemaUtil.date(f, "DATY"))%></td>
                    <td><a href="<%=lien%>?but=cinema/reservation-fiche.jsp&id=<%=h(CinemaUtil.texte(f, "IDRESERVATION"))%>"><%=h(CinemaUtil.texte(f, "IDRESERVATION"))%></a></td>
                    <td><%=h(CinemaUtil.texte(f, "CLIENTLIB"))%></td>
                    <td><%=nb(CinemaUtil.nombre(f, "NBBILLETS"))%></td>
                    <td style="text-align:right"><%=ar(CinemaUtil.nombre(f, "MONTANT"))%></td>
                    <td style="text-align:right"><%=ar(paye)%></td>
                    <td style="text-align:right"><%=ar(reste)%></td>
                    <td><%=reste <= 0 ? badge("PAYEE") : paye > 0 ? badge("PARTIELLE") : badge("NON PAYEE")%></td>
                </tr>
                <% } %>
                <% if (billets.isEmpty()) { %><tr><td colspan="9">Aucune facture de billets.</td></tr><% } %>
                </tbody>
                <tfoot><tr><th colspan="5">Total</th><th style="text-align:right"><%=ar(tb)%></th><th style="text-align:right"><%=ar(tbp)%></th><th style="text-align:right"><%=ar(tb - tbp)%></th><th></th></tr></tfoot>
            </table>
        </div></div>

        <div class="box"><div class="box-body">
            <h3>Factures des distributeurs <small>achat des droits de diffusion, <%=distributeurs.size()%> facture(s)</small></h3>
            <table class="table table-bordered table-striped">
                <thead><tr><th>Facture</th><th>Date</th><th>Distributeur</th><th>Contrat</th><th>Film</th>
                    <th style="text-align:right">Montant TTC</th><th style="text-align:right">Pay&eacute;</th><th style="text-align:right">Reste</th><th>&Eacute;tat</th></tr></thead>
                <tbody>
                <% for (Map<String, Object> f : distributeurs) { %>
                <tr>
                    <td><a href="<%=lien%>?but=facturefournisseur/facturefournisseur-fiche.jsp&id=<%=h(CinemaUtil.texte(f, "ID"))%>"><b><%=h(CinemaUtil.texte(f, "ID"))%></b></a></td>
                    <td><%=CinemaUtil.date(f, "DATY") == null ? "" : jour.format(CinemaUtil.date(f, "DATY"))%></td>
                    <td><%=h(CinemaUtil.texte(f, "IDFOURNISSEURLIB"))%></td>
                    <td><a href="<%=lien%>?but=cinema/contrat-fiche.jsp&id=<%=h(CinemaUtil.texte(f, "IDBC"))%>"><%=h(CinemaUtil.texte(f, "IDBC"))%></a></td>
                    <td><%=h(CinemaUtil.texte(f, "FILMLIB"))%></td>
                    <td style="text-align:right"><%=ar(CinemaUtil.nombre(f, "MONTANTTTC"))%></td>
                    <td style="text-align:right"><%=ar(CinemaUtil.nombre(f, "MONTANTPAYE"))%></td>
                    <td style="text-align:right"><%=ar(CinemaUtil.nombre(f, "MONTANTRESTE"))%></td>
                    <td><%=badge(CinemaUtil.nombre(f, "ETAT") >= 11 ? "VISEE" : "CREEE")%></td>
                </tr>
                <% } %>
                <% if (distributeurs.isEmpty()) { %><tr><td colspan="9">Aucune facture distributeur.</td></tr><% } %>
                </tbody>
                <tfoot><tr><th colspan="5">Total</th><th style="text-align:right"><%=ar(td)%></th><th style="text-align:right"><%=ar(tdp)%></th><th style="text-align:right"><%=ar(td - tdp)%></th><th></th></tr></tfoot>
            </table>
            <p>Pour viser ou payer une facture distributeur, ouvrez-la (num&eacute;ro de facture) : boutons <b>Viser</b> puis <b>D&eacute;caisser</b>.</p>
        </div></div>
    </section>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
