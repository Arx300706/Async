<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.UserEJB"%>
<%@page import="cinema.*"%>
<%@page import="java.net.URLEncoder"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    String lien = (String) session.getValue("lien");
    String idSeance = request.getParameter("idSeance");
    String[] places = request.getParameterValues("places");
    try {
        UserEJB u = (UserEJB) session.getValue("u");
        boolean payer = "payer".equals(request.getParameter("action"));
        String idCaisse = payer ? request.getParameter("idCaisse") : null;
        if (payer && vide(idCaisse)) throw new Exception("Choisissez une caisse pour encaisser");
        String id = ReservationCinema.reserverPlaces(idSeance, places, request.getParameter("idClient"),
                request.getParameter("remarque"), idCaisse, u.getUser().getTuppleID(), null);
%>
<script>document.location.replace("<%=lien%>?but=cinema/reservation-fiche.jsp&id=<%=h(id)%>");</script>
<%
    } catch (PlaceException pe) {
        // Retour au plan : message, place fautive en evidence, autres places conservees
        StringBuilder garder = new StringBuilder();
        if (places != null) for (String p : places) {
            if (p != null && !p.trim().equalsIgnoreCase(pe.getPlace())) garder.append(garder.length() > 0 ? "," : "").append(p.trim().toUpperCase());
        }
        String type = pe instanceof PlaceDejaPriseException ? "prise" : pe instanceof PlaceInexistanteException ? "inexistante" : "double";
        String url = lien + "?but=cinema/reservation-places.jsp&idSeance=" + URLEncoder.encode(idSeance, "UTF-8")
                + "&placeErreur=" + URLEncoder.encode(pe.getPlace(), "UTF-8")
                + "&typeErreur=" + type
                + "&erreur=" + URLEncoder.encode(pe.getMessage(), "UTF-8")
                + "&selection=" + URLEncoder.encode(garder.toString(), "UTF-8");
%>
<script>document.location.replace("<%=js(url)%>");</script>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
