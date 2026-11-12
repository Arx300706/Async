<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.CGenUtil"%>
<%@page import="cinema.*"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        String lien = (String) session.getValue("lien");
        String id = request.getParameter("id");
        ContratFilmLib[] t = (ContratFilmLib[]) CGenUtil.rechercher(new ContratFilmLib(), null, null, " and id='" + sql(id) + "'");
        if (t.length == 0) throw new Exception("Contrat de film introuvable");
        ContratFilmLib ct = t[0];
        FilmLicence lic = null;
        FilmLicence[] ls = (FilmLicence[]) CGenUtil.rechercher(new FilmLicence(), null, null, " and idbc='" + sql(id) + "'");
        if (ls.length > 0) lic = ls[0];
        double paye = 0, montantFacture = 0;
        int etatFacture = 0;
        if (!vide(ct.getIdFacture())) {
            paye = CinemaUtil.valeur(null, "SELECT NVL(SUM(DEBIT),0) FROM MOUVEMENTCAISSE WHERE IDORIGINE=? AND ETAT>=11", ct.getIdFacture());
            montantFacture = CinemaUtil.valeur(null, "SELECT NVL(SUM(QTE*PU*(1+NVL(TVA,0)/100)),0) FROM FACTUREFOURNISSEURFILLE WHERE IDFACTUREFOURNISSEUR=?", ct.getIdFacture());
            etatFacture = (int) CinemaUtil.valeur(null, "SELECT ETAT FROM FACTUREFOURNISSEUR WHERE ID=?", ct.getIdFacture());
        }
        String classe = "cinema.ContratFilm";
        String bute = "cinema/contrat-fiche.jsp";
%>
<div class="content-wrapper">
    <h1 class="box-title"><a href="<%=lien%>?but=cinema/contrat-liste.jsp"><i class="fa fa-angle-left"></i></a> Contrat de droits <%=h(ct.getId())%></h1>
    <div class="row m-0"><div class="col-md-2"></div><div class="col-md-8"><div class="box"><div class="box-body">
        <table class="table table-bordered">
            <tr><th>Contrat</th><td><%=h(ct.getId())%> <%=h(ct.getReference())%></td><th>&Eacute;tat</th><td><%=badge(ct.getEtatLib())%></td></tr>
            <tr><th>Film</th><td><a href="<%=lien%>?but=cinema/film-fiche.jsp&id=<%=h(ct.getIdFilm())%>"><%=h(ct.getFilmLib())%></a></td>
                <th>Distributeur</th><td><a href="<%=lien%>?but=fournisseur/fournisseur-fiche.jsp&id=<%=h(ct.getFournisseur())%>"><%=h(ct.getFournisseurLib())%></a></td></tr>
            <tr><th>Date du contrat</th><td><%=date(ct.getDaty())%></td><th>Fin des droits</th><td><%=date(ct.getDateLimite())%></td></tr>
            <tr><th>D&eacute;but des droits (r&eacute;ception)</th><td><%=vide(ct.getIdReception()) ? "<i>non r&eacute;ceptionn&eacute;</i>" : date(ct.getDateDebutDroits()) + " (" + h(ct.getIdReception()) + ")"%></td>
                <th>Licence</th><td><%=lic == null ? "-" : badge(lic.getStatut())%></td></tr>
            <tr><th>S&eacute;ances achet&eacute;es</th><td><%=nb(ct.getSeancesAchetees())%> x <%=ar(ct.getPu())%> Ar</td>
                <th>Programm&eacute;es / restantes</th><td><%=lic == null ? "-" : nb(lic.getSeancesProgrammees()) + " / " + nb(lic.getSeancesRestantes())%></td></tr>
            <tr><th>Montant HT</th><td><%=ar(ct.getMontant())%> Ar</td>
                <th>Facture fournisseur</th><td><% if (vide(ct.getIdFacture())) { %>-<% } else { %>
                    <a href="<%=lien%>?but=facturefournisseur/facturefournisseur-fiche.jsp&id=<%=h(ct.getIdFacture())%>"><%=h(ct.getIdFacture())%></a>
                    (<%=etatFacture >= 11 ? "vis&eacute;e" : "&agrave; viser"%>) - pay&eacute; <%=ar(paye)%> / <%=ar(montantFacture)%> Ar
                <% } %></td></tr>
        </table>

        <div class="box-footer">
        <% if (ct.getEtat() > 0 && ct.getEtat() < 11) { %>
            <a class="btn btn-primary pull-right" style="margin-right:10px" href="<%=lien%>?but=apresTarif.jsp&acte=valider&id=<%=h(id)%>&bute=<%=bute%>&classe=<%=classe%>">1. Viser le contrat</a>
            <a class="btn btn-secondary pull-right" style="margin-right:10px" href="<%=lien%>?but=bondecommande/bondecommande-modif.jsp&id=<%=h(id)%>&acte=update">Modifier</a>
            <a class="btn btn-danger pull-left" href="<%=lien%>?but=apresTarif.jsp&acte=annuler&id=<%=h(id)%>&bute=<%=bute%>&classe=<%=classe%>">Annuler</a>
        <% } else if (ct.getEtat() >= 11 && vide(ct.getIdReception())) { %>
            <form action="<%=lien%>" method="get" class="form-inline pull-right">
                <input type="hidden" name="but" value="cinema/apres-contrat.jsp">
                <input type="hidden" name="action" value="reception">
                <input type="hidden" name="id" value="<%=h(id)%>">
                <label>D&eacute;but des droits&nbsp;</label>
                <input type="date" name="debut" class="form-control" required value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>">
                <button class="btn btn-primary" type="submit">2. R&eacute;ceptionner la copie</button>
            </form>
        <% } else if (ct.getEtat() >= 11 && vide(ct.getIdFacture())) { %>
            <a class="btn btn-primary pull-right" style="margin-right:10px" href="<%=lien%>?but=cinema/apres-contrat.jsp&action=facture&id=<%=h(id)%>">3. G&eacute;n&eacute;rer la facture fournisseur</a>
        <% } else if (!vide(ct.getIdFacture())) { %>
            <% if (etatFacture < 11) { %>
            <a class="btn btn-primary pull-right" style="margin-right:10px" href="<%=lien%>?but=facturefournisseur/facturefournisseur-fiche.jsp&id=<%=h(ct.getIdFacture())%>">4. Viser la facture (sur sa fiche)</a>
            <% } else if (paye < montantFacture) { %>
            <a class="btn btn-primary pull-right" style="margin-right:10px" href="<%=lien%>?but=caisse/mvt/mvtCaisse-saisie-sortie-fc.jsp&idOrigine=<%=h(ct.getIdFacture())%>&devise=AR&montant=<%=montantFacture - paye%>&tiers=<%=h(ct.getFournisseur())%>&taux=1">5. Payer le distributeur</a>
            <% } %>
            <a class="btn btn-secondary pull-right" style="margin-right:10px" href="<%=lien%>?but=facturefournisseur/facturefournisseur-fiche.jsp&id=<%=h(ct.getIdFacture())%>">Voir la facture</a>
        <% } %>
        <% if (lic != null && "ACTIVE".equals(lic.getStatut())) { %>
            <a class="btn btn-secondary pull-right" style="margin-right:10px" href="<%=lien%>?but=cinema/seance-saisie.jsp&refObjet=<%=h(ct.getIdFilm())%>">Programmer une s&eacute;ance</a>
        <% } %>
        </div>
    </div></div></div></div>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
