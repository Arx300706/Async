<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="ferme.lot.LotCalendrier" %>
<%@ page import="ferme.utils.ImportPoussin" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.YearMonth" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<style>
    .lot-calendar-panel {
        margin-bottom: 24px;
        border: 1px solid #d2d6de;
        background: #fff;
        border-radius: 4px;
    }
    .lot-calendar-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        min-height: 48px;
        padding: 8px 12px;
        border-bottom: 1px solid #d2d6de;
    }
    .lot-calendar-header h2 {
        margin: 0;
        font-size: 18px;
        font-weight: 600;
    }
    .lot-calendar-nav {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 34px;
        height: 34px;
        border: 1px solid #c7cbd1;
        border-radius: 4px;
        color: #333;
        background: #fff;
    }
    .lot-calendar-nav:hover,
    .lot-calendar-nav:focus {
        color: #fff;
        background: #2864d7;
        border-color: #2864d7;
    }
    .lot-calendar-scroll {
        overflow-x: auto;
    }
    .lot-calendar-grid {
        width: 100%;
        min-width: 560px;
        table-layout: fixed;
        border-collapse: collapse;
    }
    .lot-calendar-grid th {
        height: 34px;
        padding: 6px;
        text-align: center;
        font-size: 11px;
        color: #59616d;
        background: #eef3fb;
        border: 1px solid #d8dee8;
    }
    .lot-calendar-grid td {
        height: 72px;
        padding: 0;
        vertical-align: top;
        border: 1px solid #d8dee8;
        background: #fff;
    }
    .lot-calendar-grid td.is-empty {
        background: #f6f7f9;
    }
    .lot-calendar-day {
        position: relative;
        display: block;
        width: 100%;
        height: 72px;
        padding: 8px;
        color: #252b33;
    }
    .lot-calendar-day:hover,
    .lot-calendar-day:focus {
        color: #173d86;
        background: #edf4ff;
    }
    .lot-calendar-day.is-selected {
        color: #fff;
        background: #2864d7;
    }
    .lot-calendar-day.is-today:not(.is-selected) .lot-calendar-number {
        color: #2864d7;
        font-weight: 700;
    }
    .lot-calendar-number {
        font-size: 13px;
        font-weight: 600;
    }
    .lot-calendar-count {
        position: absolute;
        right: 7px;
        bottom: 7px;
        min-width: 24px;
        padding: 2px 6px;
        text-align: center;
        font-size: 11px;
        font-weight: 600;
        color: #24415f;
        background: #dce9f8;
        border-radius: 8px;
    }
    .lot-calendar-day.is-selected .lot-calendar-count {
        color: #173d86;
        background: #fff;
    }
    .lot-calendar-results {
        padding: 14px 12px 16px;
    }
    .lot-calendar-results h3 {
        margin: 0 0 10px;
        font-size: 16px;
        font-weight: 600;
    }
    .lot-calendar-table-wrap {
        overflow-x: auto;
        border: 1px solid #d8dee8;
    }
    .lot-calendar-table {
        width: 100%;
        min-width: 720px;
        border-collapse: collapse;
    }
    .lot-calendar-table th,
    .lot-calendar-table td {
        padding: 9px 10px;
        text-align: left;
        border-bottom: 1px solid #e5e8ed;
    }
    .lot-calendar-table th {
        font-size: 12px;
        background: #eaf1fb;
    }
    .lot-calendar-table td.is-number,
    .lot-calendar-table th.is-number {
        text-align: right;
    }
    .lot-calendar-empty {
        padding: 18px !important;
        text-align: center !important;
        color: #6b7280;
    }
</style>

<%
try {
    LocalDate dateRapport;
    try {
        dateRapport = LocalDate.parse(request.getParameter("dateRapport"));
    } catch (Exception ignore) {
        dateRapport = LocalDate.now();
    }

    YearMonth moisRapport = YearMonth.from(dateRapport);
    LocalDate premierJour = moisRapport.atDay(1);
    int decalagePremierJour = premierJour.getDayOfWeek().getValue() - 1;
    int nombreCases = ((decalagePremierJour + moisRapport.lengthOfMonth() + 6) / 7) * 7;
    List<LotCalendrier> lotsDuJour = LotCalendrier.rechercher(dateRapport);
    Map<LocalDate, Integer> lotsParJour = LotCalendrier.compterParJour(moisRapport);
    DateTimeFormatter dateAffichee = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    String[] nomsMois = {"Janvier", "F&eacute;vrier", "Mars", "Avril", "Mai", "Juin",
            "Juillet", "Ao&ucirc;t", "Septembre", "Octobre", "Novembre", "D&eacute;cembre"};
    String lien = (String) session.getValue("lien");
    String pageCalendrier = lien + "?but=ferme/lot/lot-liste.jsp&dateRapport=";
%>
<div class="lot-calendar-panel">
    <div class="lot-calendar-header">
        <a class="lot-calendar-nav" href="<%=pageCalendrier + moisRapport.minusMonths(1).atDay(1)%>"
           title="Mois pr&eacute;c&eacute;dent" aria-label="Mois pr&eacute;c&eacute;dent">
            <i class="fa fa-angle-left" aria-hidden="true"></i>
        </a>
        <h2><%=nomsMois[moisRapport.getMonthValue() - 1]%> <%=moisRapport.getYear()%></h2>
        <a class="lot-calendar-nav" href="<%=pageCalendrier + moisRapport.plusMonths(1).atDay(1)%>"
           title="Mois suivant" aria-label="Mois suivant">
            <i class="fa fa-angle-right" aria-hidden="true"></i>
        </a>
    </div>
    <div class="lot-calendar-scroll">
        <table class="lot-calendar-grid">
            <thead>
            <tr>
                <th>Lun</th>
                <th>Mar</th>
                <th>Mer</th>
                <th>Jeu</th>
                <th>Ven</th>
                <th>Sam</th>
                <th>Dim</th>
            </tr>
            </thead>
            <tbody>
            <% for (int caseIndex = 0; caseIndex < nombreCases; caseIndex++) {
                int numeroJour = caseIndex - decalagePremierJour + 1;
                if (caseIndex % 7 == 0) { %><tr><% }
                if (numeroJour < 1 || numeroJour > moisRapport.lengthOfMonth()) { %>
                    <td class="is-empty"></td>
                <% } else {
                    LocalDate jour = moisRapport.atDay(numeroJour);
                    int nombreLots = lotsParJour.get(jour);
                    String classesJour = "lot-calendar-day";
                    if (jour.equals(dateRapport)) classesJour += " is-selected";
                    if (jour.equals(LocalDate.now())) classesJour += " is-today";
                %>
                    <td>
                        <a class="<%=classesJour%>" href="<%=pageCalendrier + jour%>"
                           title="<%=nombreLots%> lot<%=nombreLots == 1 ? "" : "s"%>">
                            <span class="lot-calendar-number"><%=numeroJour%></span>
                            <% if (nombreLots > 0) { %>
                                <span class="lot-calendar-count"><%=nombreLots%></span>
                            <% } %>
                        </a>
                    </td>
                <% }
                if (caseIndex % 7 == 6) { %></tr><% }
            } %>
            </tbody>
        </table>
    </div>
    <div class="lot-calendar-results">
        <h3>Lots pr&eacute;sents le <%=dateRapport.format(dateAffichee)%> (<%=lotsDuJour.size()%>)</h3>
        <div class="lot-calendar-table-wrap">
            <table class="lot-calendar-table">
                <thead>
                <tr>
                    <th>Id du lot</th>
                    <th>Nom du lot</th>
                    <th>Race</th>
                    <th>Date d'arriv&eacute;e</th>
                    <th class="is-number">Effectif initial</th>
                    <th class="is-number">Morts cumul&eacute;s</th>
                    <th class="is-number">Poulets perdus</th>
                </tr>
                </thead>
                <tbody>
                <% if (lotsDuJour.isEmpty()) { %>
                    <tr>
                        <td class="lot-calendar-empty" colspan="7">Aucun lot pr&eacute;sent &agrave; cette date</td>
                    </tr>
                <% } else {
                    for (LotCalendrier lotJour : lotsDuJour) { %>
                    <tr>
                        <td>
                            <a href="<%=lien%>?but=ferme/lot/lot-fiche.jsp&id=<%=ImportPoussin.html(lotJour.getId())%>">
                                <%=ImportPoussin.html(lotJour.getId())%>
                            </a>
                        </td>
                        <td><%=ImportPoussin.html(lotJour.getNomLot())%></td>
                        <td><%=ImportPoussin.html(lotJour.getRace())%></td>
                        <td><%=lotJour.getDateArrivee() == null ? "-" : lotJour.getDateArrivee().format(dateAffichee)%></td>
                        <td class="is-number"><%=lotJour.getEffectifInitial()%></td>
                        <td class="is-number"><%=lotJour.getNombreMorts()%></td>
                        <td class="is-number"><%=lotJour.getNombrePerdus()%></td>
                    </tr>
                <%  }
                } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%
} catch (Exception calendrierErreur) {
    calendrierErreur.printStackTrace();
%>
<div class="alert alert-danger">
    Impossible de charger le calendrier des lots :
    <%=ImportPoussin.html(calendrierErreur.getMessage())%>
</div>
<% } %>
