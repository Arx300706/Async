<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.CGenUtil"%>
<%@page import="cinema.*"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        String lien = (String) session.getValue("lien");
        String du = request.getParameter("du");
        String au = request.getParameter("au");
        String film = request.getParameter("film");
        String salle = request.getParameter("salle");
        boolean toutes = "1".equals(request.getParameter("toutes"));
        String w = toutes ? " and etat<>0" : " and etat=11 and dateDebut>=trunc(sysdate)";
        if (!vide(du)) w += " and dateDebut>=to_date('" + sql(du) + "','YYYY-MM-DD')";
        if (!vide(au)) w += " and dateDebut<=to_date('" + sql(au) + "','YYYY-MM-DD')";
        if (!vide(film)) w += " and upper(filmLib) like upper('%" + sql(film) + "%')";
        if (!vide(salle)) w += " and upper(salleLib) like upper('%" + sql(salle) + "%')";
        SeancePlacesDispo[] seances = (SeancePlacesDispo[]) CGenUtil.rechercher(new SeancePlacesDispo(), null, null, w + " order by dateDebut, heure, salleLib");
%>
<div class="content-wrapper">
    <section class="content-header"><h1>Places disponibles par s&eacute;ance</h1></section>
    <section class="content"><div class="box"><div class="box-body">
        <form action="<%=lien%>" method="get" class="form-inline" style="margin-bottom:12px">
            <input type="hidden" name="but" value="cinema/places-dispo.jsp">
            <label>Du</label> <input type="date" class="form-control" name="du" value="<%=h(du)%>">
            <label>au</label> <input type="date" class="form-control" name="au" value="<%=h(au)%>">
            <input class="form-control" name="film" placeholder="Film" value="<%=h(film)%>">
            <input class="form-control" name="salle" placeholder="Salle" value="<%=h(salle)%>">
            <label><input type="checkbox" name="toutes" value="1" <%=toutes ? "checked" : ""%>> inclure pass&eacute;es et non vis&eacute;es</label>
            <button class="btn btn-primary" type="submit">Filtrer</button>
        </form>
        <% out.println(tableSeances(lien, seances)); %>
    </div></div></section>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
