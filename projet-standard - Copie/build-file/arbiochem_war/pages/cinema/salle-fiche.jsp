<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.CGenUtil"%>
<%@page import="cinema.*"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        String lien = (String) session.getValue("lien");
        String id = request.getParameter("id");
        Salle[] t = (Salle[]) CGenUtil.rechercher(new Salle(), null, null, " and id='" + sql(id) + "'");
        if (t.length == 0) throw new Exception("Salle introuvable");
        Salle s = t[0];
        SeancePlacesDispo[] seances = (SeancePlacesDispo[]) CGenUtil.rechercher(new SeancePlacesDispo(), null, null,
                " and idSalle='" + sql(id) + "' and etat<>0 and dateDebut>=trunc(sysdate) order by dateDebut, heure");
%>
<div class="content-wrapper">
    <h1 class="box-title"><a href="<%=lien%>?but=cinema/salle-liste.jsp"><i class="fa fa-angle-left"></i></a> Salle <%=h(s.getVal())%></h1>
    <div class="row m-0"><div class="col-md-3"></div><div class="col-md-6"><div class="box"><div class="box-body">
        <table class="table table-bordered">
            <tr><th>ID</th><td><%=h(s.getId())%></td></tr>
            <tr><th>Nom</th><td><%=h(s.getVal())%></td></tr>
            <tr><th>Capacit&eacute;</th><td><%=(long) s.getCapacite()%> places</td></tr>
            <tr><th>Plan</th><td><%=CinemaUtil.nombreRangees(s.getCapacite(), s.getCompteur())%> rang&eacute;es de <%=(long) s.getCompteur()%> places (A1 &agrave; <%=s.getCompteur() > 0 ? CinemaUtil.codePlace(CinemaUtil.nombreRangees(s.getCapacite(), s.getCompteur()) - 1, (int) (s.getCapacite() - (CinemaUtil.nombreRangees(s.getCapacite(), s.getCompteur()) - 1) * s.getCompteur())) : "-"%>)</td></tr>
            <tr><th>Active</th><td><%=s.getActif() == 1 ? "Oui" : "Non"%></td></tr>
            <tr><th>Description</th><td><%=h(s.getDesce())%></td></tr>
        </table>
        <div class="box-footer">
            <a class="btn btn-secondary pull-right" href="<%=lien%>?but=cinema/salle-saisie.jsp&acte=update&id=<%=h(id)%>">Modifier</a>
            <a class="btn btn-primary pull-right" style="margin-right:10px" href="<%=lien%>?but=cinema/seance-saisie.jsp&idMachine=<%=h(id)%>">Programmer une s&eacute;ance</a>
        </div>
    </div></div></div></div>
    <div class="box"><div class="box-body" style="text-align:center">
        <h3>Plan de la salle</h3>
        <div style="margin:10px auto 4px;width:50%;max-width:320px;height:7px;border-radius:4px;background:#c2c0b8"></div>
        <div style="color:#555;margin-bottom:18px">&Eacute;cran</div>
        <% java.util.List<java.util.Map<String, Object>> tarifs = TarifPlace.tous(null);
           int par = (int) s.getCompteur(), cap = (int) s.getCapacite(), rg = CinemaUtil.nombreRangees(cap, par);
           for (int r = 0; r < rg; r++) { %>
        <div style="white-space:nowrap;margin:6px 0"><b style="display:inline-block;width:24px"><%=CinemaUtil.LETTRES.charAt(r)%></b>
            <% for (int n = 1; n <= par; n++) {
                   String code = CinemaUtil.codePlace(r, n);
                   java.util.Map<String, Object> t = TarifPlace.pourPlace(tarifs, code);
                   String col = t == null ? "#f1efe8" : CinemaUtil.texte(t, "COULEUR");
                   if (r * par + n > cap) { %><span style="display:inline-block;width:40px"></span><% continue; } %><span title="<%=code%><%=t == null ? "" : " - " + h(CinemaUtil.texte(t, "LIBELLE"))%>" style="display:inline-block;width:38px;height:30px;line-height:27px;margin:2px;border-radius:7px;font-size:12px;background:<%=h(col)%>;border:1.5px solid <%=h(bordure(col))%>;color:<%=h(texteCouleur(col))%>"><%=code%></span><% } %>
        </div>
        <% } %>
        <div style="color:#555;margin-top:14px">Entr&eacute;e</div>
        <div style="margin-top:14px">
            <% for (java.util.Map<String, Object> t : tarifs) { String col = CinemaUtil.texte(t, "COULEUR"); %>
            <span style="margin:0 10px"><span style="display:inline-block;width:16px;height:14px;vertical-align:middle;border-radius:4px;background:<%=h(col)%>;border:1.5px solid <%=h(bordure(col))%>"></span>
                <%=h(CinemaUtil.texte(t, "LIBELLE"))%> &middot; <%=ar(CinemaUtil.nombre(t, "PV"))%> Ar (<%=h(CinemaUtil.texte(t, "RANGEES"))%>)</span>
            <% } %>
        </div>
    </div></div>
    <div class="box"><div class="box-body">
        <h3>S&eacute;ances &agrave; venir dans cette salle</h3>
        <% out.println(tableSeances(lien, seances)); %>
    </div></div>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
