<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.UserEJB"%>
<%@page import="affichage.*"%>
<%@page import="cinema.*"%>
<%@page import="faturefournisseur.*"%>
<%!
    static void cacher(Formulaire f, String nom) {
        try { f.getChamp(nom).setVisible(false); } catch (Exception e) { }
    }
    static void libelle(Formulaire f, String nom, String lib) {
        try { f.getChamp(nom).setLibelle(lib); } catch (Exception e) { }
    }
%>
<%
    try {
        UserEJB u = (UserEJB) session.getValue("u");
        int nombreLigne = 1; // un seul film par contrat
        PageInsertMultiple pi = new PageInsertMultiple(new ContratFilm(), new As_BonDeCommande_Fille(), request, nombreLigne, u);
        pi.setLien((String) session.getValue("lien"));

        Fournisseur distributeurs = new Fournisseur();
        Liste[] liste = new Liste[2];
        liste[0] = new Liste("fournisseur", distributeurs, "nom", "id");
        liste[0].setApresW(" and idTypeFournisseur='" + ConstanteCinema.TYPE_FOURNISSEUR_DISTRIBUTEUR + "'");
        liste[1] = new Liste("modepaiement", new ModePaiement(), "val", "id");
        pi.getFormu().changerEnChamp(liste);

        Formulaire fm = pi.getFormu();
        libelle(fm, "fournisseur", "Distributeur");
        libelle(fm, "daty", "Date du contrat");
        libelle(fm, "dateLimite", "Fin des droits de diffusion");
        libelle(fm, "reference", "N&deg; de contrat");
        libelle(fm, "designation", "D&eacute;signation");
        libelle(fm, "remarque", "Remarque");
        libelle(fm, "modepaiement", "Mode de paiement");
        libelle(fm, "iddmdachat", "Demande d'achat (optionnel)");
        libelle(fm, "idDevise", "Devise");
        libelle(fm, "idMagasin", "Magasin de r&eacute;ception");
        fm.getChamp("idDevise").setDefaut("AR");
        fm.getChamp("idDevise").setAutre("readonly");
        fm.getChamp("idMagasin").setDefaut(ConstanteCinema.MAGASIN_FILMS);
        fm.getChamp("idMagasin").setAutre("readonly");
        fm.getChamp("designation").setDefaut("Achat de droits de diffusion");
        cacher(fm, "etat"); cacher(fm, "remise"); cacher(fm, "service"); cacher(fm, "refproforma");
        cacher(fm, "modepaiementlib"); cacher(fm, "fournisseurlib");
        if (request.getParameter("iddmdachat") != null) {
            fm.getChamp("iddmdachat").setDefaut(request.getParameter("iddmdachat"));
            fm.getChamp("iddmdachat").setAutre("readonly");
        }

        Film films = new Film();
        Liste[] listef = new Liste[1];
        listef[0] = new Liste("produit", films, "libelle", "id");
        listef[0].setApresW(" and categorieIngredient='" + ConstanteCinema.CATEGORIE_FILM + "' and nvl(actif,1)=1");
        pi.getFormufle().changerEnChamp(listef);
        for (String n : new String[]{"id", "idbc", "montant", "unite", "remise", "produitLib", "idproduit", "idunite", "montantTva", "montantHT", "montantTTC"}) {
            try { pi.getFormufle().getChampMulitple(n).setVisible(false); } catch (Exception e) { }
        }

        pi.preparerDataFormu();
        pi.getFormufle().getChamp("produit_0").setLibelle("Film");
        pi.getFormufle().getChamp("quantite_0").setLibelle("Nombre de s&eacute;ances autoris&eacute;es");
        pi.getFormufle().getChamp("pu_0").setLibelle("Prix par s&eacute;ance HT");
        pi.getFormufle().getChamp("tva_0").setLibelle("TVA (%)");
        pi.getFormufle().getChamp("tva_0").setDefaut("0");
        pi.getFormufle().getChamp("idDevise_0").setDefaut("AR");
        pi.getFormufle().getChamp("idDevise_0").setAutre("readonly");
        pi.getFormufle().getChamp("idDevise_0").setLibelle("Devise");
        pi.getFormufle().getChamp("tauxDeChange_0").setDefaut("1");
        pi.getFormufle().getChamp("tauxDeChange_0").setAutre("readonly");
        pi.getFormufle().getChamp("tauxDeChange_0").setLibelle("Taux");
        if (request.getParameter("idFilm") != null) pi.getFormufle().getChamp("produit_0").setDefaut(request.getParameter("idFilm"));
        pi.getFormufle().setColOrdre(new String[]{"produit", "quantite", "pu", "tva", "idDevise", "tauxDeChange"});

        pi.getFormu().makeHtmlInsertTabIndex();
        pi.getFormufle().makeHtmlInsertTableauIndex();
%>
<div class="content-wrapper">
    <h1>Contrat de droits de diffusion</h1>
    <p>Un contrat = un seul film. La p&eacute;riode des droits commence &agrave; la r&eacute;ception de la copie et finit &agrave; la date de fin des droits.
        Le nombre de s&eacute;ances autoris&eacute;es limite la programmation.</p>
    <form class="container" action="<%=pi.getLien()%>?but=apresMultiple.jsp" method="post">
        <% out.println(pi.getFormu().getHtmlInsert()); %>
        <% out.println(pi.getFormufle().getHtmlTableauInsert()); %>
        <input name="acte" type="hidden" value="insert">
        <input name="bute" type="hidden" value="cinema/contrat-fiche.jsp">
        <input name="classe" type="hidden" value="cinema.ContratFilm">
        <input name="classefille" type="hidden" value="faturefournisseur.As_BonDeCommande_Fille">
        <input name="nombreLigne" type="hidden" value="<%=nombreLigne%>">
        <input name="colonneMere" type="hidden" value="idbc">
        <input name="nomtable" type="hidden" value="AS_BONDECOMMANDE_FILLE">
    </form>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=String.valueOf(e.getMessage()).replace("\"", "'")%>"); history.back();</script>
<% } %>
