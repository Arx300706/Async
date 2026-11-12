<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.CGenUtil"%>
<%@page import="cinema.*"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        String lien = (String) session.getValue("lien");
        String id = request.getParameter("id");
        Film[] t = (Film[]) CGenUtil.rechercher(new Film(), null, null, " and id='" + sql(id) + "'");
        if (t.length == 0) throw new Exception("Film introuvable");
        Film f = t[0];
        FilmLicence[] licences = (FilmLicence[]) CGenUtil.rechercher(new FilmLicence(), null, null, " and idFilm='" + sql(id) + "' order by dateFinDroits desc");
        ContratFilmLib[] contrats = (ContratFilmLib[]) CGenUtil.rechercher(new ContratFilmLib(), null, null, " and idFilm='" + sql(id) + "' and etat<11 and etat<>0");
        SeancePlacesDispo[] seances = (SeancePlacesDispo[]) CGenUtil.rechercher(new SeancePlacesDispo(), null, null,
                " and idFilm='" + sql(id) + "' and etat<>0 and dateDebut>=trunc(sysdate) order by dateDebut, heure");
%>
<div class="content-wrapper">
    <h1 class="box-title"><a href="<%=lien%>?but=cinema/film-liste.jsp"><i class="fa fa-angle-left"></i></a> <%=h(f.getLibelle())%></h1>
    <div class="row m-0">
        <div class="col-md-3" style="text-align:center">
            <% if (f.getPhoto() != null && !f.getPhoto().trim().isEmpty()) { %>
            <img src="<%=h(f.getPhoto())%>" alt="Affiche" style="max-width:100%;max-height:320px;border-radius:8px">
            <% } %>
        </div>
        <div class="col-md-6"><div class="box"><div class="box-body">
            <table class="table table-bordered">
                <tr><th>ID</th><td><%=h(f.getId())%></td></tr>
                <tr><th>Titre</th><td><%=h(f.getLibelle())%></td></tr>
                <tr><th>R&eacute;alisateur</th><td><%=h(f.getMarque())%></td></tr>
                <tr><th>Genre</th><td><%=h(f.getStyle())%></td></tr>
                <tr><th>Classification</th><td><%=h(f.getSousCategorie())%></td></tr>
                <tr><th>Dur&eacute;e</th><td><%=nb(f.getDurre())%> min</td></tr>
                <tr><th>Prix du billet</th><td><%=ar(f.getPv())%> Ar</td></tr>
                <tr><th>TVA</th><td><%=nb(f.getTva())%> %</td></tr>
                <tr><th>Actif</th><td><%=f.getActif() == 1 ? "Oui" : "Non"%></td></tr>
            </table>
            <div class="box-footer">
                <a class="btn btn-secondary pull-right" href="<%=lien%>?but=cinema/film-saisie.jsp&acte=update&id=<%=h(id)%>">Modifier</a>
                <a class="btn btn-primary pull-right" style="margin-right:10px" href="<%=lien%>?but=cinema/contrat-saisie.jsp&idFilm=<%=h(id)%>">Acheter les droits</a>
                <a class="btn btn-primary pull-right" style="margin-right:10px" href="<%=lien%>?but=cinema/seance-saisie.jsp&refObjet=<%=h(id)%>">Programmer une s&eacute;ance</a>
            </div>
        </div></div></div>
    </div>
    <div class="box"><div class="box-body">
        <h3>Licences (contrats vis&eacute;s)</h3>
        <% if (licences.length == 0) { %><p>Aucune licence : ce film n'est pas programmable.</p><% } else { %>
        <table class="table table-bordered">
            <thead><tr><th>Contrat</th><th>Distributeur</th><th>D&eacute;but des droits</th><th>Fin des droits</th><th>Achet&eacute;es</th><th>Programm&eacute;es</th><th>Restantes</th><th>Statut</th></tr></thead>
            <tbody>
            <% for (FilmLicence l : licences) { %>
            <tr>
                <td><a href="<%=lien%>?but=cinema/contrat-fiche.jsp&id=<%=h(l.getIdbc())%>"><%=h(l.getIdbc())%></a></td>
                <td><%=h(l.getFournisseurLib())%></td>
                <td><%=date(l.getDateDebutDroits())%></td>
                <td><%=date(l.getDateFinDroits())%></td>
                <td><%=nb(l.getSeancesAchetees())%></td>
                <td><%=nb(l.getSeancesProgrammees())%></td>
                <td><%=nb(l.getSeancesRestantes())%></td>
                <td><%=badge(l.getStatut())%></td>
            </tr>
            <% } %>
            </tbody>
        </table>
        <% } %>
        <% if (contrats.length > 0) { %>
        <p>Contrat(s) en cours de saisie (non vis&eacute;s) :
            <% for (ContratFilmLib ct : contrats) { %><a href="<%=lien%>?but=cinema/contrat-fiche.jsp&id=<%=h(ct.getId())%>"><%=h(ct.getId())%></a> <% } %>
        </p>
        <% } %>
        <h3>S&eacute;ances &agrave; venir</h3>
        <% out.println(tableSeances(lien, seances)); %>
    </div></div>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
