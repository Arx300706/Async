<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.CGenUtil"%>
<%@page import="cinema.*"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        String lien = (String) session.getValue("lien");
        FilmAVenir[] films = (FilmAVenir[]) CGenUtil.rechercher(new FilmAVenir(), null, null, " order by prochaineSeance, filmLib");
%>
<div class="content-wrapper">
    <section class="content-header"><h1>Programme : films qui vont &ecirc;tre diffus&eacute;s</h1></section>
    <section class="content">
    <%  // Tableau recapitulatif : film, realisateur, jour, heure, salle
        SeancePlacesDispo[] toutes = (SeancePlacesDispo[]) CGenUtil.rechercher(new SeancePlacesDispo(), null, null,
                " and etat=11 and dateDebut>=trunc(sysdate) order by filmLib, dateDebut, heure");
        String[] jours = {"Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"};
        java.util.List<java.util.Map<String, Object>> promos = Promotion.actives(null);
        java.sql.Date dmin = null, dmax = null;
        for (SeancePlacesDispo x : toutes) {
            if (dmin == null || x.getDateDebut().before(dmin)) dmin = x.getDateDebut();
            if (dmax == null || x.getDateDebut().after(dmax)) dmax = x.getDateDebut();
        }
        if (toutes.length > 0) { %>
        <div class="box"><div class="box-body">
            <h3 style="text-align:center;margin-top:0">Programme de diffusion du <%=date(dmin)%> au <%=date(dmax)%></h3>
            <% for (java.util.Map<String, Object> pm : promos) { %>
            <p style="text-align:center;font-size:1.1em;color:#28a745"><b><%=h(CinemaUtil.texte(pm, "LIBELLE"))%> : -<%=nb(CinemaUtil.nombre(pm, "TAUX"))%> %</b>
                sur toutes les s&eacute;ances &agrave; partir de <%=h(CinemaUtil.texte(pm, "HEUREDEBUT")).replace(":", "h")%></p>
            <% } %>
            <table class="table table-bordered table-condensed" style="max-width:900px;margin:0 auto">
                <thead><tr style="background:#3f3a8c;color:#fff"><th>Film</th><th>R&eacute;alisateur</th><th>Date</th><th>Jour</th><th>Heure</th><th>Salle</th><th>Places libres</th></tr></thead>
                <tbody>
                <% for (SeancePlacesDispo x : toutes) {
                       java.util.Calendar cal = java.util.Calendar.getInstance(); cal.setTime(x.getDateDebut()); %>
                <tr>
                    <td><a href="<%=lien%>?but=cinema/film-fiche.jsp&id=<%=h(x.getIdFilm())%>"><%=h(x.getFilmLib())%></a></td>
                    <td><%=h(x.getRealisateur())%></td>
                    <td><%=date(x.getDateDebut())%></td>
                    <td><%=jours[cal.get(java.util.Calendar.DAY_OF_WEEK) - 1]%></td>
                    <td><%=h(x.getHeure()).replace(":", "h")%>
                        <% double tp = Promotion.taux(promos, x.getHeure()); if (tp > 0) { %> <span style="background:#28a745;color:#fff;border-radius:8px;padding:1px 7px;font-size:12px;font-weight:bold">-<%=nb(tp)%>%</span><% } %></td>
                    <td><%=h(x.getSalleLib())%></td>
                    <td><% if (x.getPlacesDispo() > 0) { %><a href="<%=lien%>?but=cinema/reservation-places.jsp&idSeance=<%=h(x.getId())%>"><%=nb(x.getPlacesDispo())%> / <%=nb(x.getCapacite())%></a><% } else { %><b style="color:#dc3545">COMPLET</b><% } %></td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div></div>
    <% } %>
    <% if (films.length == 0) { %>
        <div class="box"><div class="box-body">Aucune s&eacute;ance programm&eacute;e &agrave; venir.</div></div>
    <% } %>
    <% for (FilmAVenir f : films) {
           SeancePlacesDispo[] seances = (SeancePlacesDispo[]) CGenUtil.rechercher(new SeancePlacesDispo(), null, null,
                   " and idFilm='" + sql(f.getIdFilm()) + "' and etat=11 and dateDebut>=trunc(sysdate) order by dateDebut, heure");
    %>
        <div class="box"><div class="box-body">
            <div class="row">
                <div class="col-md-2" style="text-align:center">
                    <% if (!vide(f.getPhoto())) { %><img src="<%=h(f.getPhoto())%>" alt="" style="max-width:100%;max-height:180px;border-radius:8px"><% } %>
                </div>
                <div class="col-md-10">
                    <h3 style="margin-top:0"><a href="<%=lien%>?but=cinema/film-fiche.jsp&id=<%=h(f.getIdFilm())%>"><%=h(f.getFilmLib())%></a></h3>
                    <p><% if (!vide(f.getRealisateur())) { %>R&eacute;alisateur : <b><%=h(f.getRealisateur())%></b> &middot; <% } %>
                        <% if (!vide(f.getGenre())) { %><%=h(f.getGenre())%> &middot; <% } %>
                        <% if (!vide(f.getClassification())) { %><%=h(f.getClassification())%> &middot; <% } %>
                        <%=nb(f.getDurre())%> min<br>
                        <% for (java.util.Map<String, Object> t : TarifPlace.tous(null)) { %><%=h(CinemaUtil.texte(t, "LIBELLE"))%> <%=ar(CinemaUtil.nombre(t, "PV"))%> Ar &middot; <% } %>
                        <%=nb(f.getNbSeances())%> s&eacute;ance(s) &agrave; venir &middot; prochaine : <b><%=h(f.getProchaineSeanceLib())%></b> &middot;
                        <%=nb(f.getPlacesDispo())%> places disponibles au total</p>
                    <table class="table table-bordered table-condensed">
                        <thead><tr><th>Date</th><th>Heure</th><th>Salle</th><th>Places disponibles</th><th></th></tr></thead>
                        <tbody>
                        <% for (SeancePlacesDispo s : seances) { boolean complet = s.getPlacesDispo() <= 0; %>
                        <tr<%=complet ? " style=\"background:#f8d7da;color:#721c24\"" : ""%>>
                            <td><%=date(s.getDateDebut())%></td>
                            <td><a href="<%=lien%>?but=cinema/seance-fiche.jsp&id=<%=h(s.getId())%>"><%=h(s.getHeure())%></a></td>
                            <td><%=h(s.getSalleLib())%></td>
                            <td><%=complet ? "<b>COMPLET</b>" : nb(s.getPlacesDispo()) + " / " + nb(s.getCapacite())%></td>
                            <td><% if (!complet) { %><a class="btn btn-primary btn-sm" href="<%=lien%>?but=cinema/reservation-places.jsp&idSeance=<%=h(s.getId())%>">Choisir mes places</a><% } %></td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div></div>
    <% } %>
    </section>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
