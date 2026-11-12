<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="affichage.*"%>
<%@page import="user.UserEJB"%>
<%@page import="cinema.*"%>
<%
    try {
        UserEJB u = (UserEJB) session.getValue("u");
        boolean modif = request.getParameter("acte") != null;
        PageInsert pi = new PageInsert(new Seance(), request, u);
        pi.setLien((String) session.getValue("lien"));

        Liste[] liste = new Liste[3];
        // Seuls les films avec une licence active (ou dont les droits commencent bientot) sont proposes
        liste[0] = new Liste("refObjet", new Film(), "libelle", "id");
        liste[0].setApresW(" and nvl(actif,1)=1 and id in (select idFilm from V_FILM_LICENCE where statut in ('ACTIVE','A VENIR'))");
        liste[1] = new Liste("idMachine", new Salle(), "val", "id");
        liste[1].setApresW(" and idTypeMagasin='" + ConstanteCinema.TYPE_MAGASIN_SALLE + "' and nvl(actif,1)=1");
        // Heure de debut : creneaux de 15 minutes de 08:00 a 23:45
        java.util.List<String> creneaux = new java.util.ArrayList<>();
        for (int hh = 8; hh <= 23; hh++) for (int mm = 0; mm < 60; mm += 15) creneaux.add(String.format("%02d:%02d", hh, mm));
        String[] heures = creneaux.toArray(new String[0]);
        liste[2] = new Liste("heure");
        liste[2].makeListeString(heures, heures);
        pi.getFormu().changerEnChamp(liste);

        pi.getFormu().getChamp("refObjet").setLibelle("Film (licence active)");
        pi.getFormu().getChamp("idMachine").setLibelle("Salle");
        pi.getFormu().getChamp("dateDebut").setLibelle("Date de la s&eacute;ance");
        pi.getFormu().getChamp("heure").setLibelle("Heure de d&eacute;but");
        pi.getFormu().getChamp("heure").setDefaut("18:00");
        for (String n : new String[]{"estPeriodique", "idTypeMaintenance", "dateFin", "duree", "etat", "idSource"}) {
            pi.getFormu().getChamp(n).setVisible(false);
        }
        if (request.getParameter("refObjet") != null) pi.getFormu().getChamp("refObjet").setDefaut(request.getParameter("refObjet"));
        if (request.getParameter("idMachine") != null) pi.getFormu().getChamp("idMachine").setDefaut(request.getParameter("idMachine"));
        pi.preparerDataFormu();
        pi.getFormu().makeHtmlInsertTabIndex();
%>
<div class="content-wrapper">
    <h1><%= modif ? "Modification d'une s&eacute;ance" : "Programmer une s&eacute;ance" %></h1>
    <p>Contr&ocirc;les : le cin&eacute;ma doit avoir les droits du film &agrave; cette date (licence et s&eacute;ances restantes),
        la s&eacute;ance doit &ecirc;tre dans le futur et ne pas chevaucher une autre s&eacute;ance de la m&ecirc;me salle
        (dur&eacute;e du film + <%=ConstanteCinema.NETTOYAGE_MINUTES%> min de nettoyage).
        La s&eacute;ance devra ensuite &ecirc;tre <b>vis&eacute;e</b> pour &ecirc;tre ouverte &agrave; la r&eacute;servation.</p>
    <form action="<%=pi.getLien()%>?but=apresTarif.jsp" method="post" name="PLANNING" id="PLANNING">
        <% out.println(pi.getFormu().getHtmlInsert()); %>
        <input name="acte" type="hidden" value="insert">
        <input name="bute" type="hidden" value="cinema/seance-fiche.jsp">
        <input name="classe" type="hidden" value="cinema.Seance">
        <input name="nomtable" type="hidden" value="PLANNING">
    </form>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=String.valueOf(e.getMessage()).replace("\"", "'")%>"); history.back();</script>
<% } %>
