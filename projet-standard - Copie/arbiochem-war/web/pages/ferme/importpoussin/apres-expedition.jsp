<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="faturefournisseur.As_BonDeCommandePoussin" %><%@ page import="user.UserEJB" %><%@ page import="java.sql.Date" %>
<% try { String id=request.getParameter("id"); As_BonDeCommandePoussin b=new As_BonDeCommandePoussin(); b.setId(id); b.setDateDepartReelle(Date.valueOf(request.getParameter("dateDepartReelle"))); b.setActionValidation("Expedition"); ((UserEJB)session.getValue("u")).updateObject(b); %>
<script>document.location.replace("<%=(String)session.getValue("lien")%>?but=ferme/importpoussin/commande-fiche.jsp&id=<%=id%>");</script>
<% } catch(Exception e){e.printStackTrace();%><script>alert('<%=e.getMessage()%>');history.back();</script><% } %>
