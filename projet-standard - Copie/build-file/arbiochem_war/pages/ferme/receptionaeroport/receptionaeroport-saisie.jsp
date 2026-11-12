<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="affichage.*" %><%@ page import="user.UserEJB" %>
<%@ page import="ferme.receptionaeroport.*" %><%@ page import="faturefournisseur.As_BonDeCommandePoussinLib" %>
<% try {
    UserEJB u=(UserEJB)session.getValue("u");
    String id=request.getParameter("id"), idBc=request.getParameter("idBc");
    ReceptionPoussinAeroport existante=null;
    if(id!=null&&!id.trim().isEmpty()){
        existante=(ReceptionPoussinAeroport)new ReceptionPoussinAeroport().getById(id,"RECEPTIONPOUSSINAEROPORT",null);
        idBc=existante.getIdBc();
    }
    if(idBc==null||idBc.trim().isEmpty())throw new Exception("Choisissez d'abord une commande fournisseur expédiée");
    As_BonDeCommandePoussinLib bc=(As_BonDeCommandePoussinLib)new As_BonDeCommandePoussinLib().getById(idBc,"AS_BONDECOMMANDE_POUSSIN_LIB",null);
    PageInsert pi=existante==null?new PageInsert(new ReceptionPoussinAeroport(),request):new PageUpdate(new ReceptionPoussinAeroport(),request,u);
    String lien=(String)session.getValue("lien");if(lien==null||lien.trim().isEmpty()){lien="module.jsp";session.setAttribute("lien",lien);}pi.setLien(lien);
    if(pi.getFormu().getChamp("id")!=null)pi.getFormu().getChamp("id").setVisible(false);
    pi.getFormu().getChamp("etat").setVisible(false);pi.getFormu().getChamp("idBc").setVisible(false);pi.getFormu().getChamp("idBc").setDefaut(idBc);
    pi.getFormu().getChamp("idLot").setVisible(false);pi.getFormu().getChamp("heureDepart").setVisible(false);pi.getFormu().getChamp("nbrCartonMale").setVisible(false);pi.getFormu().getChamp("nbrCartonFemelle").setVisible(false);
    pi.getFormu().getChamp("daty").setLibelle("Date de réception à l'aéroport");pi.getFormu().getChamp("heureArrive").setLibelle("Heure de réception");pi.getFormu().getChamp("heureArrive").setType("time");
    pi.getFormu().getChamp("nbMorts").setLibelle("Morts constatés à l'aéroport");pi.getFormu().getChamp("nbPerdus").setLibelle("Perdus ou manquants");pi.getFormu().getChamp("qteRecus").setLibelle("Poussins vivants (calculé)");pi.getFormu().getChamp("qteRecus").setAutre("readonly");pi.getFormu().getChamp("remarque").setLibelle("Remarque");
    if(existante==null){pi.getFormu().getChamp("daty").setDefaut(utilitaire.Utilitaire.dateDuJour());pi.getFormu().getChamp("heureArrive").setDefaut(java.time.LocalTime.now().format(java.time.format.DateTimeFormatter.ofPattern("HH:mm")));pi.getFormu().getChamp("nbMorts").setDefaut("0");pi.getFormu().getChamp("nbPerdus").setDefaut("0");}
    pi.preparerDataFormu();pi.getFormu().makeHtmlInsertTabIndex();
    String acte=existante==null?"insert":"update";
%>
<div class="content-wrapper"><h1>Réception des poussins à l'aéroport</h1>
<div class="container"><p>Commande <strong><%=bc.getId()%></strong> — fournisseur <strong><%=bc.getFournisseurLib()%></strong> — race <strong><%=bc.getIdSoucheLib()%></strong> — âge <strong><%=bc.getAgeLib()%></strong>.</p><p>Attendus : <strong><%=bc.getNbMaleRequis()%> mâles</strong> et <strong><%=bc.getNbFemelleRequis()%> femelles</strong>, soit <strong><%=bc.getQuantiteCommandee()%></strong> poussins. Le triage par sexe sera effectué après le transfert.</p></div>
<form class="container" action="<%=pi.getLien()%>?but=apresTarif.jsp<%=existante==null?"":"&id="+id%>" method="post"><%out.println(pi.getFormu().getHtmlInsert());%>
<input type="hidden" name="acte" value="<%=acte%>"><input type="hidden" name="bute" value="ferme/receptionaeroport/receptionaeroport-fiche.jsp"><input type="hidden" name="classe" value="ferme.receptionaeroport.ReceptionPoussinAeroport"><input type="hidden" name="nomtable" value="RECEPTIONPOUSSINAEROPORT"></form></div>
<script>
(function(){var total=<%=bc.getQuantiteCommandee()%>;function compter(){var morts=parseInt(document.getElementById('nbMorts').value,10)||0,perdus=parseInt(document.getElementById('nbPerdus').value,10)||0;document.getElementById('qteRecus').value=Math.max(0,total-Math.max(0,morts)-Math.max(0,perdus));}['nbMorts','nbPerdus'].forEach(function(id){var e=document.getElementById(id);if(e)e.addEventListener('input',compter);});compter();})();
</script>
<% }catch(Exception e){e.printStackTrace();String m=e.getMessage()==null?"Impossible d'afficher la réception":e.getMessage().replace("'","\\'").replace("\n"," ");%><script>alert('<%=m%>');history.back();</script><%}%>
