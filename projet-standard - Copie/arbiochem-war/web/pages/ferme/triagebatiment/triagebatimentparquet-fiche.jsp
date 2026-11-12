<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="affichage.*" %><%@ page import="user.UserEJB" %><%@ page import="utilitaire.ConstanteEtat" %><%@ page import="bean.ClassMAPTable" %>
<%@ page import="ferme.triageBatiment.*" %>
<%try{
    String lien=(String)session.getValue("lien");PageConsulte pc=new PageConsulte(new TriageBatimentParquetLib(),request,(UserEJB)session.getValue("u"));pc.setTitre("Fiche de triage bâtiment/parquet");TriageBatimentParquetLib b=(TriageBatimentParquetLib)pc.getBase();String id=b.getId();boolean importe=b.getIdTransfertPoulet()!=null&&!b.getIdTransfertPoulet().isEmpty();
    String[] caches={"etat","idReceptionPoulailler","idTransfertPoulet"};for(String c:caches)if(pc.getChampByName(c)!=null)pc.getChampByName(c).setVisible(false);pc.getChampByName("idlot").setVisible(false);pc.getChampByName("idLotLib").setLibelle("Lot");pc.getChampByName("idSoucheLib").setLibelle("Race");pc.getChampByName("daty").setLibelle("Date du triage");pc.getChampByName("dispomale").setLibelle("Mâles triés");pc.getChampByName("dispofemelle").setLibelle("Femelles triées");pc.getChampByName("etatLib").setLibelle("État");
    if(importe){pc.getChampByName("numeroBon").setLibelle("N° commande");pc.getChampByName("idMagasinLib").setLibelle("Poulailler");pc.getChampByName("nbVivants").setLibelle("Survivants du transfert");pc.getChampByName("nbMortsTrajet").setLibelle("Morts trajet");pc.getChampByName("nbPerdusTrajet").setLibelle("Perdus trajet");pc.getChampByName("qteAffectee").setLibelle("Total affecté");pc.getChampByName("resteAffecter").setLibelle("Reste à affecter");pc.setOrdre(new String[]{"numeroBon","idLotLib","idSoucheLib","idMagasinLib","daty","nbMortsTrajet","nbPerdusTrajet","nbVivants","dispomale","dispofemelle","qteAffectee","resteAffecter","etatLib"});}else{pc.setOrdre(new String[]{"idLotLib","idSoucheLib","daty","dispomale","dispofemelle","ecartMale","ecartFemelle","etatLib"});}
    ClassMAPTable detailBase;String[] cols;String[] labels;if(importe){detailBase=new TriageBatimentParquetDetailImportLib();cols=new String[]{"idBatimentLib","idParquetLib","idSexeLib","qte","sante","remarque","capaciteMax","resteCapacite"};labels=new String[]{"Bâtiment","Compartiment","Sexe","Poussins","Santé","Remarque","Capacité","Reste disponible"};}else{detailBase=new TriageBatimentParquetDetailLib();cols=new String[]{"idBatimentLib","idParquetLib","idQualiteLib","idSexeLib","qte"};labels=new String[]{"Bâtiment","Parquet","Qualité","Sexe","Quantité"};}PageRecherche pr=new PageRecherche(detailBase,request,new String[]{},new String[]{},4,cols,cols.length);pr.setUtilisateur((UserEJB)session.getValue("u"));pr.setLien(lien);pr.setAWhere(" and idmere='"+id.replace("'","''")+"'");pr.creerObjetPage(cols,null);pr.getTableau().setLibelleAffiche(labels);
    String modif=importe?"ferme/triagebatiment/triagebatimentparquet-import-modif.jsp":"ferme/triagebatiment/triagebatimentparquet-saisie.jsp&acte=update";
%>
<div class="content-wrapper">
    <section class="content-header">
        <h1 class="box-title">
            <a href="<%=lien%>?but=ferme/triagebatiment/triagebatimentparquet-liste.jsp"><i class="fa fa-angle-left"></i></a>
            <%=pc.getTitre()%>
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-body table-responsive">
                        <%out.println(pc.getHtml());%>
                    </div>
                    <%if(b.getEtat()<ConstanteEtat.getEtatValider()){%>
                    <div class="box-footer clearfix">
                        <a class="btn btn-danger" href="<%=lien%>?but=apresTarif.jsp&id=<%=id%>&acte=delete&bute=ferme/triagebatiment/triagebatimentparquet-liste.jsp&classe=ferme.triageBatiment.TriageBatimentParquet">Supprimer</a>
                        <a class="btn btn-primary pull-right" href="<%=lien%>?but=apresTarif.jsp&id=<%=id%>&acte=valider&bute=ferme/triagebatiment/triagebatimentparquet-fiche.jsp&classe=ferme.triageBatiment.TriageBatimentParquet">Valider le triage</a>
                        <a class="btn btn-secondary pull-right" style="margin-right:10px" href="<%=lien%>?but=<%=modif%>&id=<%=id%>">Modifier</a>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
        <div class="box box-default">
            <div class="box-header">
                <h3 class="box-title">Affectations</h3>
            </div>
            <div class="box-body table-responsive">
                <%out.println(pr.getTableau().getHtml());%>
            </div>
        </div>
    </section>
</div>
<%}catch(Exception e){e.printStackTrace();%><script>alert('<%=e.getMessage()%>');history.back();</script><%}%>
