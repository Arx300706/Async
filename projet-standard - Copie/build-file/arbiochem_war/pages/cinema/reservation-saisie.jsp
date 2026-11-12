<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.UserEJB"%>
<%@page import="affichage.*"%>
<%@page import="cinema.*"%>
<%
    try {
        UserEJB u = (UserEJB) session.getValue("u");
        int nombreLigne = 5;
        PageInsertMultiple pi = new PageInsertMultiple(new ReservationCinema(), new ReservationCinemaDetail(), request, nombreLigne, u);
        pi.setLien((String) session.getValue("lien"));

        pi.getFormu().getChamp("idClient").setLibelle("Client (vide = client passage)");
        pi.getFormu().getChamp("idClient").setPageAppelComplete("client.Client", "id", "CLIENT");
        pi.getFormu().getChamp("daty").setLibelle("Date de r&eacute;servation");
        pi.getFormu().getChamp("remarque").setLibelle("Remarque");
        pi.getFormu().getChamp("etat").setVisible(false);

        // Seances proposees : programmees, a venir, avec des places restantes
        Liste[] listef = new Liste[1];
        listef[0] = new Liste("idProduit", new SeancePlacesDispo(), "seanceLib", "id");
        listef[0].setApresW(" and etat=11 and placesDispo>0 and dateDebut>=trunc(sysdate)");
        listef[0].ajouterVide();
        pi.getFormufle().changerEnChamp(listef);
        for (String n : new String[]{"id", "idMere", "daty", "pu", "remarque", "etat", "heure"}) {
            try { pi.getFormufle().getChampMulitple(n).setVisible(false); } catch (Exception e) { }
        }

        pi.preparerDataFormu();
        pi.getFormufle().getChamp("idProduit_0").setLibelle("S&eacute;ance (film - date - salle - places restantes)");
        pi.getFormufle().getChamp("qte_0").setLibelle("Nombre de places");
        if (request.getParameter("idSeance") != null) {
            pi.getFormufle().getChamp("idProduit_0").setDefaut(request.getParameter("idSeance"));
            pi.getFormufle().getChamp("qte_0").setDefaut("1");
        }
        pi.getFormufle().setColOrdre(new String[]{"idProduit", "qte"});
        pi.getFormu().makeHtmlInsertTabIndex();
        pi.getFormufle().makeHtmlInsertTableauIndex();
%>
<div class="content-wrapper">
    <h1>R&eacute;servation de places</h1>
    <p>Le prix est celui du billet du film. Les places sont contr&ocirc;l&eacute;es &agrave; l'enregistrement (verrou sur la s&eacute;ance) :
        une r&eacute;servation qui d&eacute;passe les places restantes est refus&eacute;e.</p>
    <form class="container" action="<%=pi.getLien()%>?but=apresMultiple.jsp" method="post">
        <% out.println(pi.getFormu().getHtmlInsert()); %>
        <% out.println(pi.getFormufle().getHtmlTableauInsert()); %>
        <input name="acte" type="hidden" value="insert">
        <input name="bute" type="hidden" value="cinema/reservation-fiche.jsp">
        <input name="classe" type="hidden" value="cinema.ReservationCinema">
        <input name="classefille" type="hidden" value="cinema.ReservationCinemaDetail">
        <input name="nombreLigne" type="hidden" value="<%=nombreLigne%>">
        <input name="colonneMere" type="hidden" value="idMere">
        <input name="nomtable" type="hidden" value="RESERVATIONDETAILS">
    </form>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=String.valueOf(e.getMessage()).replace("\"", "'")%>"); history.back();</script>
<% } %>
