<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.CGenUtil"%>
<%@page import="cinema.*"%>
<%@page import="java.util.*"%>
<%@include file="inc/cinema-util.jspf"%>
<%
    try {
        String lien = (String) session.getValue("lien");
        String idSeance = request.getParameter("idSeance");
        String erreur = request.getParameter("erreur");
        String placeErreur = request.getParameter("placeErreur");
        String typeErreur = request.getParameter("typeErreur");
        String selection = request.getParameter("selection");
        SeancePlacesDispo[] aVenir = (SeancePlacesDispo[]) CGenUtil.rechercher(new SeancePlacesDispo(), null, null,
                " and etat=11 and dateDebut>=trunc(sysdate) order by dateDebut, heure, salleLib");
        SeancePlacesDispo s = null;
        if (!vide(idSeance)) {
            SeancePlacesDispo[] t = (SeancePlacesDispo[]) CGenUtil.rechercher(new SeancePlacesDispo(), null, null, " and id='" + sql(idSeance) + "'");
            if (t.length == 0) throw new Exception("Séance introuvable");
            s = t[0];
        }
%>
<style>
    .cin-wrap { max-width: 1100px; margin: 0 auto; }
    .cin-head { display:flex; flex-wrap:wrap; gap:16px; align-items:center; justify-content:space-between; margin-bottom:12px; }
    .cin-ecran { margin: 14px auto 6px; width: 60%; max-width:420px; height: 7px; border-radius: 4px; background:#c2c0b8; }
    .cin-ecran-lib { text-align:center; color:#555; margin-bottom:26px; font-size:15px; }
    .cin-plan { overflow-x:auto; padding-bottom:8px; }
    .cin-rang { display:flex; align-items:center; justify-content:center; gap:6px; margin:6px 0; white-space:nowrap; }
    .cin-lettre { width:26px; text-align:center; font-weight:bold; color:#555; flex:0 0 26px; }
    .cin-allee { width:22px; flex:0 0 22px; }
    .cin-place { width:42px; height:36px; flex:0 0 42px; border:1.5px solid #b4b2a9; border-radius:8px; font-size:13px;
                 cursor:pointer; background:#f1efe8; color:#444; transition: transform .08s, box-shadow .08s; }
    .cin-place:hover:not([disabled]) { transform: translateY(-2px); box-shadow:0 3px 8px rgba(0,0,0,.18); }
    .cin-place.choisie { background:#0d6efd !important; border-color:#0a58ca !important; color:#fff !important; font-weight:bold; }
    .cin-place.occupee { background:#5f5e5a !important; border-color:#444 !important; color:#fff !important; cursor:not-allowed; text-decoration:line-through; }
    .cin-place.attente { background:repeating-linear-gradient(45deg,#d3d1c7,#d3d1c7 4px,#f1efe8 4px,#f1efe8 8px) !important; color:#777 !important; cursor:not-allowed; }
    .cin-entree { text-align:center; color:#666; margin-top:18px; font-size:14px; }
    .cin-place.erreur { outline:3px solid #dc3545; outline-offset:2px; animation: cinClignote 1s ease-in-out 4; }
    @keyframes cinClignote { 50% { transform: scale(1.18); } }
    .cin-vide { width:34px; flex:0 0 34px; }
    .cin-legende { display:flex; flex-wrap:wrap; gap:16px; justify-content:center; margin:14px 0; font-size:13px; }
    .cin-legende span.p { display:inline-block; width:18px; height:16px; border-radius:5px 5px 3px 3px; vertical-align:middle; margin-right:5px; }
    .cin-recap { position:sticky; bottom:0; background:#fff; border-top:2px solid #0d6efd; padding:12px; margin-top:12px;
                 display:flex; flex-wrap:wrap; gap:12px; align-items:center; justify-content:space-between; }
    .cin-recap .total { font-size:1.3em; font-weight:bold; }
    .cin-seances a { display:inline-block; margin:4px; }
</style>
<div class="content-wrapper">
<div class="cin-wrap">
    <h1>Vente de billets</h1>

    <div class="box"><div class="box-body">
        <form action="<%=lien%>" method="get" class="form-inline">
            <input type="hidden" name="but" value="cinema/reservation-places.jsp">
            <label>S&eacute;ance&nbsp;</label>
            <select name="idSeance" class="form-control" style="min-width:420px" onchange="this.form.submit()">
                <option value="">-- Choisir une s&eacute;ance --</option>
                <% for (SeancePlacesDispo x : aVenir) { %>
                <option value="<%=h(x.getId())%>" <%=s != null && x.getId().equals(s.getId()) ? "selected" : ""%>><%=h(x.getSeanceLib())%></option>
                <% } %>
            </select>
            <button class="btn btn-primary" type="submit">Afficher le plan</button>
        </form>
        <% if (aVenir.length == 0) { %><p style="margin-top:10px">Aucune s&eacute;ance programm&eacute;e &agrave; venir. Programmez et visez une s&eacute;ance d'abord.</p><% } %>
    </div></div>

<% if (s != null) {
       int capacite = (int) s.getCapacite();
       int parRangee = (int) s.getPlacesParRangee();
       if (parRangee <= 0) parRangee = Math.min(10, Math.max(capacite, 1));
       int rangees = CinemaUtil.nombreRangees(capacite, parRangee);
       Map<String, Integer> occupees = new HashMap<>();
       for (Map<String, Object> o : CinemaUtil.lire(null, "SELECT PLACE, ETATRESERVATION FROM V_SEANCE_PLACES_OCCUPEES WHERE IDSEANCE=?", s.getId()))
           occupees.put(CinemaUtil.texte(o, "PLACE"), (int) CinemaUtil.nombre(o, "ETATRESERVATION"));
       int sansNumero = (int) s.getPlacesReservees() - occupees.size();
       if (sansNumero < 0) sansNumero = 0;
       int dispo = (int) s.getPlacesDispo();
       boolean vendable = s.getEtat() == 11 && s.getDateDebut() != null && !s.getDateDebut().before(new java.sql.Date(System.currentTimeMillis() - 86400000L));
       List<Map<String, Object>> caisses = CinemaUtil.lire(null,
               "SELECT ID, VAL FROM CAISSE WHERE NVL(ACTIF,1)=1 AND COMPTE IS NOT NULL ORDER BY CASE WHEN DESCE='CINEMA' THEN 0 ELSE 1 END, VAL");
       int milieu = parRangee >= 8 ? parRangee / 2 : 0;
       List<Map<String, Object>> tarifs = TarifPlace.tous(null);
       Map<String, Object> promo = Promotion.pourHeure(Promotion.actives(null), s.getHeure());
       double tauxPromo = promo == null ? 0 : CinemaUtil.nombre(promo, "TAUX");
%>
    <div class="box"><div class="box-body">
        <div class="cin-head">
            <div>
                <h3 style="margin:0"><a href="<%=lien%>?but=cinema/film-fiche.jsp&id=<%=h(s.getIdFilm())%>"><%=h(s.getFilmLib())%></a></h3>
                <div><%=date(s.getDateDebut())%> &agrave; <b><%=h(s.getHeure())%></b> &middot; <%=h(s.getSalleLib())%>
                    <% if (!vide(s.getGenre())) { %>&middot; <%=h(s.getGenre())%><% } %>
                    <% if (!vide(s.getClassification())) { %>&middot; <%=h(s.getClassification())%><% } %>
                    &middot; <a href="<%=lien%>?but=cinema/seance-fiche.jsp&id=<%=h(s.getId())%>">fiche s&eacute;ance</a></div>
            </div>
            <div style="text-align:right">
                <div style="font-size:1.6em;font-weight:bold;color:<%=dispo > 0 ? "#28a745" : "#dc3545"%>"><%=dispo > 0 ? dispo + " places libres" : "COMPLET"%></div>
                <div><%=capacite%> places &middot; <%=rangees%> rang&eacute;es de <%=parRangee%></div>
            </div>
        </div>
        <% if (promo != null) { %>
        <div class="alert alert-success" style="font-size:1.15em;text-align:center">
            <b><%=h(CinemaUtil.texte(promo, "LIBELLE"))%> : -<%=nb(tauxPromo)%> %</b> sur tous les billets de cette s&eacute;ance
            (s&eacute;ances &agrave; partir de <%=h(CinemaUtil.texte(promo, "HEUREDEBUT")).replace(":", "h")%>)
        </div>
        <% } %>
        <% if (!vide(erreur)) { %>
        <div class="alert alert-danger" style="font-size:1.1em">
            <b><%="prise".equals(typeErreur) ? "Place d&eacute;j&agrave; prise" : "inexistante".equals(typeErreur) ? "Place inexistante" : "Place en double"%> :</b>
            <%=h(erreur)%>
            <% if (!vide(selection)) { %><br>Vos autres places (<%=h(selection)%>) sont toujours s&eacute;lectionn&eacute;es.<% } %>
        </div>
        <% } %>
        <% if (sansNumero > 0) { %>
        <div class="alert alert-warning"><%=sansNumero%> place(s) ont &eacute;t&eacute; vendues sans num&eacute;ro (r&eacute;servation par quantit&eacute;) :
            elles sont d&eacute;compt&eacute;es des places libres mais n'apparaissent pas sur le plan.</div>
        <% } %>
        <% if (!vendable) { %>
        <div class="alert alert-danger">Cette s&eacute;ance n'est pas ouverte &agrave; la vente (non vis&eacute;e, annul&eacute;e ou pass&eacute;e).</div>
        <% } %>

        <div class="cin-ecran"></div>
        <div class="cin-ecran-lib">&Eacute;cran</div>
        <div class="cin-plan">
        <% for (int r = 0; r < rangees; r++) { char lettre = CinemaUtil.LETTRES.charAt(r); %>
            <div class="cin-rang">
                <span class="cin-lettre"><%=lettre%></span>
                <% for (int n = 1; n <= parRangee; n++) {
                       if (milieu > 0 && n == milieu + 1) { %><span class="cin-allee"></span><% }
                       int index = r * parRangee + n;
                       if (index > capacite) { %><span class="cin-vide"></span><% continue; }
                       String code = CinemaUtil.codePlace(r, n);
                       Integer etat = occupees.get(code);
                       String classe = (etat == null ? "" : (etat == 11 ? "occupee" : "attente")) + (code.equalsIgnoreCase(placeErreur) ? " erreur" : "");
                       Map<String, Object> tarif = TarifPlace.pourPlace(tarifs, code);
                       double prixPlace = Promotion.appliquer(tarif == null ? s.getPrixBillet() : CinemaUtil.nombre(tarif, "PV"), tauxPromo);
                       String couleur = tarif == null ? "#f1efe8" : CinemaUtil.texte(tarif, "COULEUR");
                       String cat = tarif == null ? "Standard" : CinemaUtil.texte(tarif, "LIBELLE");
                       String titre = "Place " + code + " - " + cat + " " + ar(prixPlace) + " Ar" + (etat == null ? "" : (etat == 11 ? " - vendue" : " - r\u00e9serv\u00e9e (non vis\u00e9e)"));
                %><button type="button" class="cin-place <%=classe%>" data-code="<%=code%>" data-prix="<%=(long) prixPlace%>" title="<%=h(titre)%>"
                          style="background:<%=h(couleur)%>;border-color:<%=h(bordure(couleur))%>;color:<%=h(texteCouleur(couleur))%>" <%=etat != null || !vendable ? "disabled" : ""%>><%=code%></button><%
                   } %>
                <span class="cin-lettre"><%=lettre%></span>
            </div>
        <% } %>
        </div>
        <div class="cin-entree">Entr&eacute;e</div>

        <div class="cin-legende">
            <% for (Map<String, Object> t : tarifs) { String col = CinemaUtil.texte(t, "COULEUR"); String rg = CinemaUtil.texte(t, "RANGEES"); %>
            <span><span class="p" style="background:<%=h(col)%>;border:1.5px solid <%=h(bordure(col))%>"></span><%=h(CinemaUtil.texte(t, "LIBELLE"))%> &middot;
                <% if (tauxPromo > 0) { %><s style="color:#999"><%=ar(CinemaUtil.nombre(t, "PV"))%></s> <b style="color:#28a745"><%=ar(Promotion.appliquer(CinemaUtil.nombre(t, "PV"), tauxPromo))%> Ar</b><% } else { %><%=ar(CinemaUtil.nombre(t, "PV"))%> Ar<% } %>
                (<%=rg.length() > 1 ? rg.charAt(0) + "&ndash;" + rg.charAt(rg.length() - 1) : h(rg)%>)</span>
            <% } %>
        </div>
        <div class="cin-legende" style="margin-top:0">
            <span><span class="p" style="background:#0d6efd"></span>Votre s&eacute;lection</span>
            <span><span class="p" style="background:repeating-linear-gradient(45deg,#d3d1c7,#d3d1c7 3px,#f1efe8 3px,#f1efe8 6px)"></span>R&eacute;serv&eacute;e (non vis&eacute;e)</span>
            <span><span class="p" style="background:#5f5e5a"></span>Vendue</span>
        </div>

        <% if (vendable && dispo > 0) { %>
        <form action="<%=lien%>" method="post" id="cinForm" onsubmit="return cinAvantEnvoi(event)">
            <input type="hidden" name="but" value="cinema/apres-reservation-places.jsp">
            <input type="hidden" name="idSeance" value="<%=h(s.getId())%>">
            <div id="cinPlaces"></div>
            <div class="row">
                <div class="col-md-4"><label>Client</label>
                    <input class="form-control input-sm" id="cinRechClient" placeholder="Rechercher un client (nom ou code)..." autocomplete="off" style="margin-bottom:4px">
                    <select class="form-control" name="idClient" id="cinClient">
                        <option value="">Client passage</option>
                        <% for (Map<String, Object> cl : CinemaUtil.lire(null,
                                "SELECT ID, NOM FROM CLIENT WHERE NVL(ACTIF,1)=1 AND NVL(ESTACTIF,1)=1 AND NOM IS NOT NULL AND ID<>? ORDER BY UPPER(NOM), ID",
                                ConstanteCinema.CLIENT_PASSAGE)) { %>
                        <option value="<%=h(CinemaUtil.texte(cl, "ID"))%>"><%=h(CinemaUtil.texte(cl, "NOM"))%> (<%=h(CinemaUtil.texte(cl, "ID"))%>)</option>
                        <% } %>
                    </select>
                    <script>
                        (function () {
                            var rech = document.getElementById('cinRechClient'), sel = document.getElementById('cinClient');
                            rech.addEventListener('input', function () {
                                var q = rech.value.trim().toUpperCase(), premier = null;
                                for (var i = 1; i < sel.options.length; i++) {
                                    var o = sel.options[i], vu = !q || o.text.toUpperCase().indexOf(q) >= 0;
                                    o.hidden = !vu; o.disabled = !vu;
                                    if (vu && !premier) premier = o;
                                }
                                if (q && premier) sel.value = premier.value;
                                if (!q) sel.value = '';
                            });
                        })();
                    </script></div>
                <div class="col-md-4"><label>Remarque</label><input class="form-control" name="remarque"></div>
                <div class="col-md-4"><label>Caisse (pour payer)</label>
                    <select class="form-control" name="idCaisse">
                        <% for (Map<String, Object> cs : caisses) { %>
                        <option value="<%=h(CinemaUtil.texte(cs, "ID"))%>"><%=h(CinemaUtil.texte(cs, "VAL"))%></option>
                        <% } %>
                    </select></div>
            </div>
            <div class="cin-recap">
                <div>Places : <b id="cinListe">aucune</b></div>
                <div class="total"><span id="cinNb">0</span> billet(s) &middot; <span id="cinTotal">0</span> Ar</div>
                <div>
                    <button class="btn btn-secondary" type="submit" name="action" value="reserver">R&eacute;server</button>
                    <button class="btn btn-primary" type="submit" name="action" value="payer">R&eacute;server et payer</button>
                </div>
            </div>
        </form>
        <script>
            (function () {
                var max = <%=dispo%>, choix = [], prix = {};
                document.querySelectorAll('.cin-place').forEach(function (b) { prix[b.getAttribute('data-code')] = parseFloat(b.getAttribute('data-prix')) || 0; });
                var total = function () { return choix.reduce(function (t, c) { return t + prix[c]; }, 0); };
                var initiales = "<%=js(selection == null ? "" : selection)%>".split(",").filter(function (x) { return x; });
                var fmt = function (v) { return Math.round(v).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ' '); };
                function maj() {
                    var box = document.getElementById('cinPlaces');
                    box.innerHTML = '';
                    choix.forEach(function (c) {
                        var i = document.createElement('input'); i.type = 'hidden'; i.name = 'places'; i.value = c; box.appendChild(i);
                    });
                    document.getElementById('cinListe').textContent = choix.length ? choix.join(', ') : 'aucune';
                    document.getElementById('cinNb').textContent = choix.length;
                    document.getElementById('cinTotal').textContent = fmt(total());
                }
                document.querySelectorAll('.cin-place:not([disabled])').forEach(function (b) {
                    b.addEventListener('click', function () {
                        var code = b.getAttribute('data-code'), i = choix.indexOf(code);
                        if (i >= 0) { choix.splice(i, 1); b.classList.remove('choisie'); }
                        else {
                            if (choix.length >= max) { alert('Il ne reste que ' + max + ' place(s) libre(s).'); return; }
                            choix.push(code); b.classList.add('choisie');
                        }
                        maj();
                    });
                });
                window.cinAvantEnvoi = function (e) {
                    if (!choix.length) { alert('Cliquez sur au moins une place libre du plan.'); return false; }
                    var payer = e.submitter && e.submitter.value === 'payer';
                    return confirm((payer ? 'Vendre et encaisser ' : 'Réserver ') + choix.length + ' place(s) : ' + choix.join(', ')
                        + '\nTotal : ' + fmt(total()) + ' Ar');
                };
                // reprise de la selection apres une erreur
                initiales.forEach(function (code) {
                    var b = document.querySelector('.cin-place[data-code="' + code + '"]:not([disabled])');
                    if (b && choix.length < max) { choix.push(code); b.classList.add('choisie'); }
                });
                maj();
            })();
        </script>
        <% } %>
    </div></div>
<% } else if (aVenir.length > 0) { %>
    <div class="box"><div class="box-body cin-seances">
        <h3>S&eacute;ances &agrave; venir</h3>
        <% for (SeancePlacesDispo x : aVenir) { %>
        <a class="btn <%=x.getPlacesDispo() > 0 ? "btn-default" : "btn-danger"%>" href="<%=lien%>?but=cinema/reservation-places.jsp&idSeance=<%=h(x.getId())%>"><%=h(x.getSeanceLib())%></a>
        <% } %>
    </div></div>
<% } %>
</div>
</div>
<% } catch (Exception e) { e.printStackTrace(); %>
<script>alert("<%=js(e.getMessage())%>"); history.back();</script>
<% } %>
