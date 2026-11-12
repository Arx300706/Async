<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.UserEJB"%>
<%@page import="cinema.ReservationCinema"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        UserEJB u = (UserEJB) session.getValue("u");
        String lien = (String) session.getValue("lien");
        String id = request.getParameter("id");
        double montant = Double.parseDouble(request.getParameter("montant"));
        ReservationCinema.payer(id, montant, request.getParameter("idCaisse"), null, u.getUser().getTuppleID(), null);
%>
<script>document.location.replace("<%=lien%>?but=cinema/reservation-fiche.jsp&id=<%=h(id)%>");</script>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
