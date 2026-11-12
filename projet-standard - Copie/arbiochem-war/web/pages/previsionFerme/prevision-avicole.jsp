<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="previsionFerme.PrevisionAvicole" %>
<%@ page import="previsionFerme.PrevisionAvicole.Configuration" %>
<%@ page import="previsionFerme.PrevisionAvicole.JourProjection" %>
<%@ page import="previsionFerme.PrevisionAvicole.LotProjection" %>
<%@ page import="previsionFerme.PrevisionAvicole.RaceResume" %>
<%@ page import="ferme.utils.ImportPoussin" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.YearMonth" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Map" %>

<%
try {
    String lien = (String) session.getValue("lien");
    if (lien == null || lien.trim().isEmpty()) lien = "module.jsp";

    LocalDate dateSelection = LocalDate.now();
    try {
        String dateParam = request.getParameter("date");
        if (dateParam != null && !dateParam.trim().isEmpty()) dateSelection = LocalDate.parse(dateParam);
    } catch (Exception ignore) { }

    int semainePonte = 14;
    double oeufsParFemelle = 1.0;
    int delaiEclosion = 21;
    double tauxEclosion = 100.0;
    String erreurConfiguration = null;
    try {
        if (request.getParameter("semainePonte") != null) {
            semainePonte = Integer.parseInt(request.getParameter("semainePonte"));
        }
        if (request.getParameter("oeufsParFemelle") != null) {
            oeufsParFemelle = Double.parseDouble(request.getParameter("oeufsParFemelle"));
        }
        if (request.getParameter("delaiEclosion") != null) {
            delaiEclosion = Integer.parseInt(request.getParameter("delaiEclosion"));
        }
        if (request.getParameter("tauxEclosion") != null) {
            tauxEclosion = Double.parseDouble(request.getParameter("tauxEclosion"));
        }
    } catch (Exception e) {
        erreurConfiguration = "Les param&egrave;tres saisis sont invalides. Les valeurs par d&eacute;faut sont appliqu&eacute;es.";
        semainePonte = 14;
        oeufsParFemelle = 1.0;
        delaiEclosion = 21;
        tauxEclosion = 100.0;
    }

    Configuration configuration;
    try {
        configuration = new Configuration(semainePonte, oeufsParFemelle, delaiEclosion, tauxEclosion);
    } catch (IllegalArgumentException e) {
        erreurConfiguration = ImportPoussin.html(e.getMessage()) + ". Les valeurs par d&eacute;faut sont appliqu&eacute;es.";
        semainePonte = 14;
        oeufsParFemelle = 1.0;
        delaiEclosion = 21;
        tauxEclosion = 100.0;
        configuration = new Configuration(semainePonte, oeufsParFemelle, delaiEclosion, tauxEclosion);
    }

    List<LotProjection> tousLesLots = PrevisionAvicole.chargerLots(dateSelection);
    List<RaceResume> races = PrevisionAvicole.resumerParRace(tousLesLots, dateSelection);
    String raceSelectionnee = request.getParameter("race");
    boolean raceTrouvee = false;
    if (raceSelectionnee != null) {
        for (RaceResume race : races) {
            if (race.getIdRace().equals(raceSelectionnee)) {
                raceTrouvee = true;
                break;
            }
        }
    }
    if (!raceTrouvee) raceSelectionnee = races.isEmpty() ? "" : races.get(0).getIdRace();

    RaceResume resumeSelectionne = null;
    for (RaceResume race : races) {
        if (race.getIdRace().equals(raceSelectionnee)) {
            resumeSelectionne = race;
            break;
        }
    }

    List<LotProjection> lotsDeLaRace = PrevisionAvicole.lotsPourRace(tousLesLots, raceSelectionnee, dateSelection);
    YearMonth mois = YearMonth.from(dateSelection);
    Map<LocalDate, JourProjection> calendrier =
            PrevisionAvicole.prevoirMois(tousLesLots, raceSelectionnee, mois, configuration);
    int decalage = mois.atDay(1).getDayOfWeek().getValue() - 1;
    int nombreCases = ((decalage + mois.lengthOfMonth() + 6) / 7) * 7;

    String[] nomsMois = {"Janvier", "F&eacute;vrier", "Mars", "Avril", "Mai", "Juin",
            "Juillet", "Ao&ucirc;t", "Septembre", "Octobre", "Novembre", "D&eacute;cembre"};
    DateTimeFormatter dateFr = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    DateTimeFormatter idDate = DateTimeFormatter.BASIC_ISO_DATE;
    NumberFormat entier = NumberFormat.getIntegerInstance(Locale.FRANCE);
    String pageBase = lien + "?but=previsionFerme/prevision-avicole.jsp"
            + "&currentMenu=MENDYN_PREVISION_AVICOLE"
            + "&race=" + URLEncoder.encode(raceSelectionnee, "UTF-8")
            + "&semainePonte=" + semainePonte
            + "&oeufsParFemelle=" + oeufsParFemelle
            + "&delaiEclosion=" + delaiEclosion
            + "&tauxEclosion=" + tauxEclosion
            + "&date=";

    long totalFemelles = 0;
    long totalMales = 0;
    long totalMorts = 0;
    long totalPerdus = 0;
    long totalVivants = 0;
    int totalLots = 0;
    for (RaceResume race : races) {
        totalFemelles += race.getFemelles();
        totalMales += race.getMales();
        totalMorts += race.getMorts();
        totalPerdus += race.getPerdus();
        totalVivants += race.getVivants();
        totalLots += race.getNombreLots();
    }
%>

<style>
    .avicole-page {
        --avicole-blue: #2864d7;
        --avicole-blue-soft: #eaf1fb;
        --avicole-green: #218653;
        --avicole-green-soft: #e8f5ee;
        --avicole-border: #d8dee8;
        --avicole-text-muted: #687180;
    }
    .avicole-panel {
        margin-bottom: 20px;
        border: 1px solid var(--avicole-border);
        border-radius: 4px;
        background: #fff;
    }
    .avicole-panel-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        min-height: 46px;
        padding: 9px 12px;
        border-bottom: 1px solid var(--avicole-border);
    }
    .avicole-panel-header h2,
    .avicole-panel-header h3 {
        margin: 0;
        font-size: 17px;
        font-weight: 600;
    }
    .avicole-config {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        gap: 10px;
        align-items: end;
        padding: 12px;
    }
    .avicole-config label {
        display: block;
        margin-bottom: 5px;
        font-size: 12px;
        font-weight: 600;
    }
    .avicole-config .btn {
        min-height: 34px;
    }
    .avicole-table-wrap,
    .avicole-calendar-wrap {
        width: 100%;
        overflow-x: auto;
    }
    .avicole-table {
        width: 100%;
        min-width: 760px;
        margin: 0;
        border-collapse: collapse;
    }
    .avicole-table th,
    .avicole-table td {
        padding: 9px 10px;
        border-bottom: 1px solid #e5e8ed;
        text-align: left;
        vertical-align: middle;
    }
    .avicole-table th {
        font-size: 12px;
        background: var(--avicole-blue-soft);
    }
    .avicole-table td.is-number,
    .avicole-table th.is-number {
        text-align: right;
    }
    .avicole-table tbody tr.is-selected {
        background: #edf4ff;
    }
    .avicole-race-link {
        font-weight: 600;
        color: #174ca8;
    }
    .avicole-table tfoot td {
        font-weight: 700;
        background: #f5f7fa;
    }
    .avicole-month-nav {
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
    .avicole-month-nav:hover,
    .avicole-month-nav:focus {
        color: #fff;
        border-color: var(--avicole-blue);
        background: var(--avicole-blue);
    }
    .avicole-calendar {
        width: 100%;
        min-width: 700px;
        table-layout: fixed;
        border-collapse: collapse;
    }
    .avicole-calendar th {
        height: 34px;
        padding: 6px;
        text-align: center;
        font-size: 11px;
        color: #59616d;
        border: 1px solid var(--avicole-border);
        background: var(--avicole-blue-soft);
    }
    .avicole-calendar td {
        height: 100px;
        padding: 0;
        vertical-align: top;
        border: 1px solid var(--avicole-border);
        background: #fff;
    }
    .avicole-calendar td.is-empty {
        background: #f6f7f9;
    }
    .avicole-calendar-day {
        display: block;
        width: 100%;
        height: 100px;
        padding: 7px;
        color: #252b33;
    }
    .avicole-calendar-day:hover,
    .avicole-calendar-day:focus {
        color: #173d86;
        background: #f1f6ff;
    }
    .avicole-calendar-day.is-selected {
        color: #fff;
        background: var(--avicole-blue);
    }
    .avicole-calendar-day.is-today:not(.is-selected) .avicole-day-number {
        color: var(--avicole-blue);
        font-weight: 700;
    }
    .avicole-day-number {
        display: block;
        margin-bottom: 7px;
        font-size: 13px;
        font-weight: 600;
    }
    .avicole-day-value {
        display: block;
        margin-top: 4px;
        padding: 2px 5px;
        border-radius: 4px;
        font-size: 10px;
        line-height: 16px;
        color: #174ca8;
        background: #dce9f8;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .avicole-day-value.is-hatch {
        color: #17653f;
        background: var(--avicole-green-soft);
    }
    .avicole-calendar-day.is-selected .avicole-day-value {
        color: #173d86;
        background: #fff;
    }
    .avicole-calendar-day.is-selected .avicole-day-value.is-hatch {
        color: #17653f;
    }
    .avicole-legend {
        display: flex;
        gap: 18px;
        align-items: center;
        padding: 8px 12px;
        color: var(--avicole-text-muted);
        font-size: 12px;
        border-top: 1px solid var(--avicole-border);
    }
    .avicole-legend-swatch {
        display: inline-block;
        width: 11px;
        height: 11px;
        margin-right: 5px;
        border-radius: 2px;
        vertical-align: -1px;
        background: #dce9f8;
    }
    .avicole-legend-swatch.is-hatch {
        background: var(--avicole-green-soft);
        border: 1px solid #b7dfc9;
    }
    .avicole-empty {
        padding: 20px !important;
        text-align: center !important;
        color: var(--avicole-text-muted);
    }
    @media (max-width: 900px) {
        .avicole-config {
            grid-template-columns: repeat(2, minmax(130px, 1fr));
        }
    }
    @media (max-width: 520px) {
        .avicole-config {
            grid-template-columns: 1fr;
        }
    }
</style>

<div class="content-wrapper avicole-page">
    <section class="content-header">
        <h1>Calendrier pr&eacute;visionnel avicole</h1>
    </section>
    <section class="content">
        <% if (erreurConfiguration != null) { %>
            <div class="alert alert-warning"><%=erreurConfiguration%></div>
        <% } %>

        <div class="avicole-panel">
            <div class="avicole-panel-header">
                <h2>Param&egrave;tres de pr&eacute;vision</h2>
            </div>
            <form class="avicole-config" action="<%=lien%>" method="get">
                <input type="hidden" name="but" value="previsionFerme/prevision-avicole.jsp">
                <input type="hidden" name="currentMenu" value="MENDYN_PREVISION_AVICOLE">
                <input type="hidden" name="race" value="<%=ImportPoussin.html(raceSelectionnee)%>">
                <div>
                    <label for="date">Date du bilan</label>
                    <input class="form-control" type="date" id="date" name="date" value="<%=dateSelection%>">
                </div>
                <div>
                    <label for="semainePonte">D&eacute;but de ponte (semaine)</label>
                    <input class="form-control" type="number" id="semainePonte" name="semainePonte"
                           min="1" max="100" step="1" value="<%=semainePonte%>">
                </div>
                <div>
                    <label for="oeufsParFemelle">&OElig;ufs par femelle / jour</label>
                    <input class="form-control" type="number" id="oeufsParFemelle" name="oeufsParFemelle"
                           min="0" max="10" step="0.01" value="<%=oeufsParFemelle%>">
                </div>
                <div>
                    <label for="delaiEclosion">D&eacute;lai d'&eacute;closion (jours)</label>
                    <input class="form-control" type="number" id="delaiEclosion" name="delaiEclosion"
                           min="1" max="365" step="1" value="<%=delaiEclosion%>">
                </div>
                <div>
                    <label for="tauxEclosion">Taux d'&eacute;closion (%)</label>
                    <input class="form-control" type="number" id="tauxEclosion" name="tauxEclosion"
                           min="0" max="100" step="0.01" value="<%=tauxEclosion%>">
                </div>
                <div>
                    <button class="btn btn-primary" type="submit">
                        <i class="fa fa-calculator" aria-hidden="true"></i> Calculer
                    </button>
                </div>
            </form>
        </div>

        <div class="avicole-panel">
            <div class="avicole-panel-header">
                <h2>Effectifs par race au <%=dateSelection.format(dateFr)%></h2>
            </div>
            <div class="avicole-table-wrap">
                <table class="avicole-table">
                    <thead>
                    <tr>
                        <th>Race</th>
                        <th class="is-number">Lots</th>
                        <th class="is-number">Femelles</th>
                        <th class="is-number">M&acirc;les</th>
                        <th class="is-number">Morts</th>
                        <th class="is-number">Perdus</th>
                        <th class="is-number">Vivants</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% if (races.isEmpty()) { %>
                        <tr><td class="avicole-empty" colspan="7">Aucune race active &agrave; cette date</td></tr>
                    <% } else {
                        for (RaceResume race : races) {
                            String lienRace = lien + "?but=previsionFerme/prevision-avicole.jsp"
                                    + "&currentMenu=MENDYN_PREVISION_AVICOLE"
                                    + "&race=" + URLEncoder.encode(race.getIdRace(), "UTF-8")
                                    + "&date=" + dateSelection
                                    + "&semainePonte=" + semainePonte
                                    + "&oeufsParFemelle=" + oeufsParFemelle
                                    + "&delaiEclosion=" + delaiEclosion
                                    + "&tauxEclosion=" + tauxEclosion;
                    %>
                        <tr class="<%=race.getIdRace().equals(raceSelectionnee) ? "is-selected" : ""%>">
                            <td>
                                <a class="avicole-race-link" href="<%=lienRace%>">
                                    <%=ImportPoussin.html(race.getRace())%>
                                </a>
                            </td>
                            <td class="is-number"><%=entier.format(race.getNombreLots())%></td>
                            <td class="is-number"><%=entier.format(race.getFemelles())%></td>
                            <td class="is-number"><%=entier.format(race.getMales())%></td>
                            <td class="is-number"><%=entier.format(race.getMorts())%></td>
                            <td class="is-number"><%=entier.format(race.getPerdus())%></td>
                            <td class="is-number"><%=entier.format(race.getVivants())%></td>
                        </tr>
                    <%  }
                    } %>
                    </tbody>
                    <% if (!races.isEmpty()) { %>
                    <tfoot>
                    <tr>
                        <td>Total</td>
                        <td class="is-number"><%=entier.format(totalLots)%></td>
                        <td class="is-number"><%=entier.format(totalFemelles)%></td>
                        <td class="is-number"><%=entier.format(totalMales)%></td>
                        <td class="is-number"><%=entier.format(totalMorts)%></td>
                        <td class="is-number"><%=entier.format(totalPerdus)%></td>
                        <td class="is-number"><%=entier.format(totalVivants)%></td>
                    </tr>
                    </tfoot>
                    <% } %>
                </table>
            </div>
        </div>

        <% if (resumeSelectionne != null) { %>
        <div class="avicole-panel">
            <div class="avicole-panel-header">
                <a class="avicole-month-nav" href="<%=pageBase + mois.minusMonths(1).atDay(1)%>"
                   title="Mois pr&eacute;c&eacute;dent" aria-label="Mois pr&eacute;c&eacute;dent">
                    <i class="fa fa-angle-left" aria-hidden="true"></i>
                </a>
                <h2><%=ImportPoussin.html(resumeSelectionne.getRace())%> - <%=nomsMois[mois.getMonthValue() - 1]%> <%=mois.getYear()%></h2>
                <a class="avicole-month-nav" href="<%=pageBase + mois.plusMonths(1).atDay(1)%>"
                   title="Mois suivant" aria-label="Mois suivant">
                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                </a>
            </div>
            <div class="avicole-calendar-wrap">
                <table class="avicole-calendar">
                    <thead>
                    <tr>
                        <th>Lun</th><th>Mar</th><th>Mer</th><th>Jeu</th><th>Ven</th><th>Sam</th><th>Dim</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (int caseIndex = 0; caseIndex < nombreCases; caseIndex++) {
                        int numeroJour = caseIndex - decalage + 1;
                        if (caseIndex % 7 == 0) { %><tr><% }
                        if (numeroJour < 1 || numeroJour > mois.lengthOfMonth()) { %>
                            <td class="is-empty"></td>
                        <% } else {
                            LocalDate jour = mois.atDay(numeroJour);
                            JourProjection projection = calendrier.get(jour);
                            String classeJour = "avicole-calendar-day";
                            if (jour.equals(dateSelection)) classeJour += " is-selected";
                            if (jour.equals(LocalDate.now())) classeJour += " is-today";
                        %>
                            <td>
                                <a class="<%=classeJour%>" href="<%=pageBase + jour%>">
                                    <span class="avicole-day-number"><%=numeroJour%></span>
                                    <% if (projection.getOeufs() > 0) { %>
                                        <span class="avicole-day-value"><%=entier.format(projection.getOeufs())%> &oelig;ufs</span>
                                    <% }
                                    if (projection.getPoussins() > 0) { %>
                                        <span class="avicole-day-value is-hatch"><%=entier.format(projection.getPoussins())%> poussins</span>
                                    <% } %>
                                </a>
                            </td>
                        <% }
                        if (caseIndex % 7 == 6) { %></tr><% }
                    } %>
                    </tbody>
                </table>
            </div>
            <div class="avicole-legend">
                <span><span class="avicole-legend-swatch"></span>&OElig;ufs pr&eacute;vus</span>
                <span><span class="avicole-legend-swatch is-hatch"></span>Poussins attendus</span>
            </div>
        </div>

        <div class="avicole-panel">
            <div class="avicole-panel-header">
                <h3>Lots <%=ImportPoussin.html(resumeSelectionne.getRace())%> au <%=dateSelection.format(dateFr)%></h3>
            </div>
            <div class="avicole-table-wrap">
                <table class="avicole-table" style="min-width: 1380px;">
                    <thead>
                    <tr>
                        <th>Lot</th>
                        <th class="is-number">&Acirc;ge</th>
                        <th class="is-number">Femelles</th>
                        <th class="is-number">M&acirc;les</th>
                        <th class="is-number">Morts</th>
                        <th class="is-number">Perdus</th>
                        <th class="is-number">Vivants</th>
                        <th>D&eacute;but de ponte</th>
                        <th class="is-number">&OElig;ufs du jour</th>
                        <th>&Eacute;closion pr&eacute;vue</th>
                        <th class="is-number">Poussins attendus</th>
                        <th>Nouveau lot pr&eacute;vu</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% if (lotsDeLaRace.isEmpty()) { %>
                        <tr><td class="avicole-empty" colspan="12">Aucun lot actif pour cette race</td></tr>
                    <% } else {
                        for (LotProjection lot : lotsDeLaRace) {
                            long oeufsJour = PrevisionAvicole.oeufsPour(lot, dateSelection, configuration);
                            long poussinsAttendus = PrevisionAvicole.poussinsPourPonte(lot, dateSelection, configuration);
                            LocalDate debutPonte = PrevisionAvicole.dateDebutPonte(lot, configuration);
                            LocalDate dateEclosionPrevue = oeufsJour > 0 ? dateSelection.plusDays(delaiEclosion) : null;
                            String nouveauLot = oeufsJour > 0
                                    ? "PREV-" + lot.getId() + "-" + dateEclosionPrevue.format(idDate)
                                    : "-";
                    %>
                        <tr>
                            <td>
                                <a href="<%=lien%>?but=ferme/lot/lot-fiche.jsp&id=<%=ImportPoussin.html(lot.getId())%>">
                                    <%=ImportPoussin.html(lot.getId())%>
                                </a>
                                <br><small><%=ImportPoussin.html(lot.getNom())%></small>
                            </td>
                            <td class="is-number"><%=lot.getAgeSemaines(dateSelection)%> sem.</td>
                            <td class="is-number"><%=entier.format(lot.getFemellesVivantes())%></td>
                            <td class="is-number"><%=entier.format(lot.getMalesVivants())%></td>
                            <td class="is-number"><%=entier.format(lot.getMorts())%></td>
                            <td class="is-number"><%=entier.format(lot.getPerdus())%></td>
                            <td class="is-number"><%=entier.format(lot.getVivants())%></td>
                            <td><%=debutPonte == null ? "-" : debutPonte.format(dateFr)%></td>
                            <td class="is-number"><%=entier.format(oeufsJour)%></td>
                            <td><%=dateEclosionPrevue == null ? "-" : dateEclosionPrevue.format(dateFr)%></td>
                            <td class="is-number"><%=entier.format(poussinsAttendus)%></td>
                            <td><%=ImportPoussin.html(nouveauLot)%></td>
                        </tr>
                    <%  }
                    } %>
                    </tbody>
                </table>
            </div>
        </div>
        <% } %>
    </section>
</div>

<%
} catch (Exception e) {
    e.printStackTrace();
%>
<div class="content-wrapper">
    <section class="content">
        <div class="alert alert-danger">
            Impossible de charger la pr&eacute;vision avicole : <%=ImportPoussin.html(e.getMessage())%>
        </div>
    </section>
</div>
<% } %>
