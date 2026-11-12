<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cinema.*"%>
<%@page import="java.util.*"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        String lien = (String) session.getValue("lien");
        List<Map<String, Object>> tarifs = TarifPlace.tous(null);
%>
<div class="content-wrapper">
    <section class="content-header"><h1>Tarifs des places</h1></section>
    <section class="content"><div class="box"><div class="box-body" style="max-width:820px">
        <p>Le prix d'un billet d&eacute;pend de la rang&eacute;e de la place. Chaque rang&eacute;e (lettre) appartient &agrave; une seule cat&eacute;gorie.
           Une place dont la rang&eacute;e n'a pas de cat&eacute;gorie est vendue au prix du billet du film.</p>
        <table class="table table-bordered">
            <thead><tr><th></th><th>Cat&eacute;gorie</th><th>Rang&eacute;es</th><th>Prix (Ar)</th><th></th></tr></thead>
            <tbody>
            <% for (Map<String, Object> t : tarifs) { String col = CinemaUtil.texte(t, "COULEUR"); %>
            <tr>
                <form action="<%=lien%>" method="post">
                    <input type="hidden" name="but" value="cinema/apres-tarif-place.jsp">
                    <input type="hidden" name="id" value="<%=h(CinemaUtil.texte(t, "ID"))%>">
                    <td style="width:40px"><span style="display:inline-block;width:26px;height:22px;border-radius:6px;background:<%=h(col)%>;border:1.5px solid <%=h(bordure(col))%>"></span></td>
                    <td><b><%=h(CinemaUtil.texte(t, "LIBELLE"))%></b></td>
                    <td><input class="form-control" name="rangees" value="<%=h(CinemaUtil.texte(t, "RANGEES"))%>" style="width:120px" required></td>
                    <td><input class="form-control" type="number" min="1" step="100" name="pv" value="<%=(long) CinemaUtil.nombre(t, "PV")%>" style="width:140px" required></td>
                    <td><button class="btn btn-primary btn-sm" type="submit">Enregistrer</button></td>
                </form>
            </tr>
            <% } %>
            </tbody>
        </table>
        <p>Les nouveaux prix s'appliquent aux billets vendus ensuite (les billets d&eacute;j&agrave; vendus gardent leur prix).</p>

        <h3>Promotions selon l'heure de la s&eacute;ance</h3>
        <p>R&eacute;duction appliqu&eacute;e &agrave; tous les billets des s&eacute;ances qui commencent &agrave; partir de l'heure indiqu&eacute;e.</p>
        <table class="table table-bordered">
            <thead><tr><th>Promotion</th><th>&Agrave; partir de</th><th>R&eacute;duction (%)</th><th>Active</th><th></th></tr></thead>
            <tbody>
            <% for (Map<String, Object> pm : Promotion.toutes(null)) { boolean active = CinemaUtil.nombre(pm, "ACTIF") == 1; %>
            <tr>
                <form action="<%=lien%>" method="post">
                    <input type="hidden" name="but" value="cinema/apres-promotion.jsp">
                    <input type="hidden" name="id" value="<%=h(CinemaUtil.texte(pm, "ID"))%>">
                    <td><b><%=h(CinemaUtil.texte(pm, "LIBELLE"))%></b></td>
                    <td><input class="form-control" type="time" name="heure" value="<%=h(CinemaUtil.texte(pm, "HEUREDEBUT"))%>" style="width:130px" required></td>
                    <td><input class="form-control" type="number" min="1" max="99" name="taux" value="<%=nb(CinemaUtil.nombre(pm, "TAUX"))%>" style="width:100px" required></td>
                    <td><select class="form-control" name="actif" style="width:100px"><option value="1" <%=active ? "selected" : ""%>>Oui</option><option value="0" <%=active ? "" : "selected"%>>Non</option></select></td>
                    <td><button class="btn btn-primary btn-sm" type="submit">Enregistrer</button></td>
                </form>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div></div></section>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
