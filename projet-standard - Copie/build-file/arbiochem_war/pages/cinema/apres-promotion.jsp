<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cinema.Promotion"%>
<%@page import="java.sql.Connection"%>
<%@page import="utilitaire.UtilDB"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    String lien = (String) session.getValue("lien");
    Connection c = null;
    try {
        c = new UtilDB().GetConn();
        c.setAutoCommit(false);
        Promotion.modifier(request.getParameter("id"), request.getParameter("heure"),
                Double.parseDouble(request.getParameter("taux")), "1".equals(request.getParameter("actif")), c);
        c.commit();
%>
<script>document.location.replace("<%=lien%>?but=cinema/tarif-liste.jsp");</script>
<%  } catch (Exception e) {
        if (c != null) c.rollback();
        e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<%  } finally {
        if (c != null) c.close();
    } %>
