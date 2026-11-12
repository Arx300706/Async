<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.UserEJB"%>
<%@page import="cinema.ContratFilm"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        UserEJB u = (UserEJB) session.getValue("u");
        String lien = (String) session.getValue("lien");
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        ContratFilm ct = new ContratFilm();
        ct.setId(id);
        String userId = u.getUser().getTuppleID();
        if ("reception".equals(action)) {
            String debut = request.getParameter("debut");
            if (debut == null || debut.isEmpty()) throw new Exception("Date de début des droits obligatoire");
            ct.genererReception(java.sql.Date.valueOf(debut), userId, null);
        } else if ("facture".equals(action)) {
            ct.genererFactureFournisseur(userId, null);
        } else {
            throw new Exception("Action inconnue");
        }
%>
<script>document.location.replace("<%=lien%>?but=cinema/contrat-fiche.jsp&id=<%=h(id)%>");</script>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
