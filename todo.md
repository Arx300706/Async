# TODO — Module Salle de cinéma

Objectifs :
1. Le cinéma **achète les films** (droits de diffusion) auprès d'un distributeur.
2. Il programme des **séances** uniquement pour les films dont il a les droits.
3. On connaît **les places encore disponibles dans chaque séance** et **les films qui vont être diffusés**.

Contrainte : réutiliser les tables existantes, **aucune nouvelle table**. Créer des vues SQL et insérer des lignes de paramétrage reste permis.

---

## 0. Déroulement global du code

```
 ACHAT DU FILM (côté fournisseur)                          VENTE DES PLACES (côté client)
 ────────────────────────────────                          ──────────────────────────────
 1. Distributeur   (FOURNISSEUR)
 2. Film           (AS_INGREDIENTS)
 3. Demande d'achat (DMDACHAT + DMDACHATFILLE)   [optionnel]
        │ validerObject → état 11
 4. Bon de commande = contrat de droits
        (AS_BONDECOMMANDE + AS_BONDECOMMANDE_FILLE)
        │ viser → état 11
 5. Réception de la copie
        (AS_BONDELIVRAISON + fille) via genererLivraison
        │ viser → état 11  ==> LES DROITS COMMENCENT
 6. Facture fournisseur
        (FACTUREFOURNISSEUR + FACTUREFOURNISSEURFILLE)
        │ viser → écritures comptables
 7. Paiement distributeur
        (MOUVEMENTCAISSE, DEBIT, IDORIGINE = facture)
                                │
                                ▼
                  V_FILM_LICENCE (droits valides ?)
                                │
                                ▼
                     8. Séance (PLANNING) ──────────►  9. Réservation (RESERVATION + RESERVATIONDETAILS)
                        contrôle : licence valide         contrôle : places dispo
                        + pas de chevauchement                     │
                                                                   ▼
                                                       10. Paiement client (MOUVEMENTCAISSE, CREDIT, IDOP = réservation)
                                                                   │
                                                                   ▼
                                     V_SEANCE_PLACES_DISPO / V_FILMS_A_VENIR / V_RENTABILITE_FILM
```

**Règle qui relie les deux côtés :** une séance ne peut être créée que si le film a une **licence valide** à la date de la séance, et s'il reste des séances autorisées sur cette licence.

---

## 1. Rappel du framework

- Une classe hérite de :
  - `ClassMAPTable` pour une table simple ;
  - `ClassMere` pour une table mère avec des lignes filles (ex. `ferme/configuration/Batiment.java`) ;
  - `ClassEtat` pour un objet qui a un état.
- La table est indiquée avec `setNomTable("...")`.
- L'identifiant est créé dans `construirePK` avec `preparePk("PREFIXE", "GETSEQ...")` puis `makePK(c)`.
- Les contrôles métier se font dans `controler(Connection c)`.
- Chaque objet a trois pages JSP : `xxx-saisie.jsp`, `xxx-liste.jsp`, `xxx-fiche.jsp`.
- États : `0` = annulé, `1` = créé, `11` = visé/validé.
- Le circuit d'achat existe déjà dans `arbiochem-ejb/src/java/faturefournisseur/` : `DmdAchat`, `As_BonDeCommande`, `As_BonDeLivraison`, `FactureFournisseur`, `Fournisseur`.

---

## 2. Quelle table pour chaque notion (aucune nouvelle table)

### Côté achat des films

| Notion cinéma | Table | Colonnes utilisées |
|---|---|---|
| **Distributeur** | `FOURNISSEUR` (classe `faturefournisseur.Fournisseur`) | `NOM`, `CONTACT`, `MAIL`, `NIF`, `STAT`, `IDTYPEFOURNISSEUR` = type « DISTRIBUTEUR FILM », `ESTACTIF` |
| **Demande d'achat de film** (optionnelle) | `DMDACHAT` + `DMDACHATFILLE` (classes `DmdAchat`, `DmdAchatFille`) | mère : `FOURNISSEUR`, `DATY`, `DATELIMITE`, `ETAT` ; fille : `IDPRODUIT` = film, `QUANTITE`, `PU` |
| **Contrat de droits** | `AS_BONDECOMMANDE` (classe `As_BonDeCommande`) | `FOURNISSEUR`, `DATY` = date du contrat, **`DATELIMITE` = date de fin des droits**, `IDDMDACHAT`, `REFERENCE` = n° de contrat, `ETAT` |
| **Ligne du contrat** | `AS_BONDECOMMANDE_FILLE` (classe `As_BonDeCommande_Fille`) | `PRODUIT` = film, **`QUANTITE` = nombre de séances autorisées**, `PU` = prix par séance, `TVA`, `IDBC` |
| **Réception de la copie** (DCP, fichier) | `AS_BONDELIVRAISON` + `AS_BONDELIVRAISON_FILLE` (classes `As_BonDeLivraison`, `As_BonDeLivraison_Fille`) | mère : `IDBC`, **`DATY` = date de début des droits**, `IDFOURNISSEUR`, `ETAT` ; fille : `PRODUIT` = film, `QUANTITE`, `IDBC_FILLE` |
| **Facture du distributeur** | `FACTUREFOURNISSEUR` + `FACTUREFOURNISSEURFILLE` (classes `FactureFournisseur`, `FactureFournisseurDetails`) | mère : `IDFOURNISSEUR`, `IDBC`, `DATY`, `DATEECHEANCEPAIEMENT`, `ETAT` ; fille : `IDPRODUIT` = film, `QTE`, `PU`, `IDBCDETAIL` |
| **Paiement du distributeur** | `MOUVEMENTCAISSE` (classe `caisse.MvtCaisse`) | `DEBIT` = montant, `IDORIGINE` = id de la facture fournisseur, `IDTIERS` = distributeur, `IDCAISSE` |

### Côté salles, séances et réservations

| Notion cinéma | Table | Colonnes utilisées |
|---|---|---|
| **Salle** | `MAGASIN2` (classe `magasin.Magasin`) | `VAL` = nom, `CAPACITE` = nombre de places, `IDTYPEMAGASIN` = type « SALLE CINEMA », `ACTIF` |
| **Film** | `AS_INGREDIENTS` (classe `produits.Ingredients`) | `LIBELLE` = titre, `DURRE` = durée en minutes, `PHOTO` = affiche, `PV` = prix du billet, `TVA`, `CATEGORIEINGREDIENT` = « FILM », `ISACHAT` = 1, `ISVENTE` = 1, `ACTIF` |
| **Séance** | `PLANNING` | `REFOBJET` = id du film, `IDMACHINE` = id de la salle, `DATEDEBUT` = date, `HEURE` = heure de début (`HH24:MI`), `DUREE`, `DATEFIN`, `ETAT`, **`IDSOURCE` = id du contrat (`AS_BONDECOMMANDE.ID`) qui autorise la séance**, `IDTYPEMAINTENANCE` = type « SEANCE CINEMA », `ESTPERIODIQUE` = 0 |
| **Réservation** | `RESERVATION` | `IDCLIENT`, `DATY`, `ETAT`, `REMARQUE` |
| **Ligne de réservation** | `RESERVATIONDETAILS` | `IDMERE` = id de la réservation, `IDPRODUIT` = **id de la séance**, `QTE` = nombre de places, `PU` = prix, `DATY` et `HEURE` = date et heure de la séance |
| Client | `CLIENT` | déjà existante |
| Paiement du client | `MOUVEMENTCAISSE` (`CREDIT`, `IDOP` = id de la réservation) | déjà pris en compte par la vue `RESERVATION_LIB` (payé / reste à payer) |

### Règles de calcul centrales

```
licence valide (film, date) =
      contrat (AS_BONDECOMMANDE) à l'état 11
  ET  réception (AS_BONDELIVRAISON) du contrat à l'état 11
  ET  date de la séance ENTRE BL.DATY (début des droits) ET BC.DATELIMITE (fin des droits)

séances restantes (contrat) = SOMME(BC_FILLE.QUANTITE pour ce film)
                              − NOMBRE(séances non annulées avec IDSOURCE = ce contrat)

places disponibles (séance) = CAPACITE de la salle
                              − SOMME(QTE des lignes de réservation de cette séance)
                              (on ne compte que les réservations à l'état 1 ou 11)
```

### Choix à valider

- **Id de la séance dans `RESERVATIONDETAILS.IDPRODUIT`.** La colonne n'a pas de clé étrangère, ce qui le permet, et c'est la seule façon fiable de savoir quelle séance est réservée. Avec l'id du film, il faudrait retrouver la séance par la date et l'heure, sans aucune colonne pour la salle.
- **Un seul film par contrat (bon de commande).** La période des droits (`DATELIMITE`) est portée par la mère du bon de commande. Avec plusieurs films dans un même contrat, ils auraient forcément la même période.
- **Sens donné aux colonnes :**
  - `AS_BONDECOMMANDE.DATELIMITE` = fin des droits ;
  - `AS_BONDELIVRAISON.DATY` = début des droits ;
  - `AS_BONDECOMMANDE_FILLE.QUANTITE` = nombre de séances autorisées.

  Pour un forfait (diffusions illimitées), mettre `QUANTITE` = 1, `PU` = montant du forfait, et ne pas contrôler le nombre de séances. Il faut alors un indicateur, par exemple `REMARQUE` = « FORFAIT » sur la ligne ou un type de contrat.

---

## 3. Données de paramétrage (des lignes à insérer, pas de tables)

- [x] Ajouter dans `TYPEFOURNISSEUR` une ligne « DISTRIBUTEUR FILM ».
- [x] Ajouter dans `TYPEMAGASIN` une ligne « SALLE CINEMA ».
- [x] Ajouter dans `CATEGORIEINGREDIENT` une ligne « FILM » (ou une ligne par genre).
- [x] Ajouter dans `TYPEMAINTENANCE` une ligne « SEANCE CINEMA », pour distinguer les séances des plannings de maintenance dans `PLANNING`.
- [x] Créer un client « Client passage » pour les ventes au guichet.
- [x] Choisir le magasin de réception des copies de films (`AS_BONDECOMMANDE.IDMAGASIN`, `AS_BONDELIVRAISON.MAGASIN`). La validation du bon de livraison génère un mouvement de stock (`As_BonDeLivraison.genereMvtStock`), donc il faut un magasin valide, par exemple « STOCK FILMS » dans `MAGASIN2`.
- [x] Vérifier que les séquences existent : `GETSEQPLANNING`, celles de `RESERVATION` et de `RESERVATIONDETAILS`, et celles du circuit d'achat (normalement déjà présentes). Ce ne sont pas des tables : en créer une si elle manque.

---

## 4. Achat des films — étapes du code

### 4.1 Distributeur
- [x] Réutiliser `faturefournisseur.Fournisseur` avec `IDTYPEFOURNISSEUR` = « DISTRIBUTEUR FILM ».
- [x] Page `cinema/distributeur-liste.jsp` : liste des fournisseurs filtrés sur ce type.

### 4.2 Film (fiche catalogue, avant l'achat)
- [x] Créer le film dans `AS_INGREDIENTS` avec `ISACHAT` = 1, `ISVENTE` = 1 et `ACTIF` = 1.
- [x] Le film peut exister sans licence : il n'est alors pas programmable. C'est `V_FILM_LICENCE` qui décide.

### 4.3 Demande d'achat (optionnelle)
- [x] Réutiliser `DmdAchat` / `DmdAchatFille` avec `IDPRODUIT` = film, `QUANTITE` = nombre de séances souhaitées et `PU` estimé.
- [x] Validation : `DmdAchat.validerObject` existe déjà. Selon le rôle, il met l'état à 3 (cheffab), 4 (dg) ou 11 (respachat) et enregistre l'historique dans `HISTORIQUEVALIDATIONDMDACHAT`.

### 4.4 Contrat de droits = bon de commande
- [x] Créer `cinema.ContratFilm` extends `faturefournisseur.As_BonDeCommande` (ou réutiliser la classe directement) pour ajouter les contrôles du cinéma dans `controler()` :
  - [x] le fournisseur est de type « DISTRIBUTEUR FILM » ;
  - [x] **une seule ligne fille**, et son produit est un film (catégorie « FILM ») ;
  - [x] `DATELIMITE` (fin des droits) > `DATY` ;
  - [x] `QUANTITE` (séances autorisées) > 0 et `PU` ≥ 0 ;
  - [x] pas d'autre contrat validé pour le même film sur une période qui chevauche (optionnel, pour éviter les doublons).
- [x] Remplir `IDDMDACHAT` quand le contrat vient d'une demande d'achat.
- [x] Viser le contrat (état 11).

### 4.5 Réception de la copie = bon de livraison
- [x] Appeler `As_BonDeCommande.genererLivraison(u, c)` sur le contrat visé. Cette méthode existe déjà et crée le bon de livraison avec ses lignes à partir du reste à livrer.
- [x] À la saisie, `DATY` du bon de livraison = **date de début des droits**. Contrôle : `DATY` ≤ `BC.DATELIMITE`.
- [x] Viser le bon de livraison (état 11). À partir de ce moment, **la licence est active**. Le mouvement de stock généré par `genereMvtStock` est sans effet pour le cinéma.

### 4.6 Facture du distributeur
- [x] ⚠️ **Ne pas utiliser `As_BonDeCommande.genererFacture`** : cette méthode crée une **VENTE** (facture client) avec le fournisseur comme client. Ce n'est pas une facture fournisseur.
- [x] Créer la facture fournisseur à partir du bon de livraison avec `FactureFournisseur.genererAPartirLivraison(ids, u, c)`, ou à partir du contrat (`IDBC`) avec `createObject`.
- [x] Lignes : `IDPRODUIT` = film, `QTE` = séances autorisées, `PU` = prix par séance, `IDBCDETAIL` = id de la ligne du contrat.
- [x] Viser la facture. Les écritures comptables sont déjà gérées par `FactureFournisseur.genererEcriture`.

### 4.7 Paiement du distributeur
- [x] Créer un `caisse.MvtCaisse` avec `DEBIT` = montant, `IDORIGINE` = id de la facture fournisseur, `IDTIERS` = distributeur et `IDCAISSE`, puis le viser. `MvtCaisse` sait déjà relier un paiement à une facture fournisseur (via `FACTUREFOURNISSEURCPL`).
- [x] Le paiement n'empêche pas de programmer le film. La licence dépend du contrat et de la réception, pas du paiement. Si le prof veut l'inverse, ajouter « facture payée » dans la condition de `V_FILM_LICENCE`.

### 4.8 Vue des licences
- [x] **`V_FILM_LICENCE`** : une ligne par contrat (= par film), avec :
  - `IDBC`, `IDFILM` (`BC_FILLE.PRODUIT`), titre du film, `IDFOURNISSEUR`, nom du distributeur ;
  - `DATEDEBUTDROITS` = `MIN(BL.DATY)` des bons de livraison à l'état 11 de ce contrat ;
  - `DATEFINDROITS` = `BC.DATELIMITE` ;
  - `SEANCESACHETEES` = `SUM(BC_FILLE.QUANTITE)` ;
  - `SEANCESPROGRAMMEES` = nombre de séances de `PLANNING` avec `IDSOURCE` = `IDBC` et `ETAT` IN (1, 11) ;
  - `SEANCESRESTANTES` = `SEANCESACHETEES − SEANCESPROGRAMMEES` ;
  - `MONTANTACHAT` = `SUM(QUANTITE × PU)` ;
  - `STATUT` : « EN ATTENTE » (pas de BL visé), « ACTIVE » (`SYSDATE` dans la période), « EXPIREE » ou « EPUISEE » (`SEANCESRESTANTES` = 0) ;
  - filtres : BC à l'état 11, catégorie du produit = « FILM ».
- [x] Classe de lecture `cinema.FilmLicence` (`ClassMAPTable`, `setNomTable("V_FILM_LICENCE")`).

---

## 5. Vues SQL côté séances et réservations

- [x] **`V_SEANCE_CINEMA_LIB`**
  - `PLANNING` filtré sur `IDTYPEMAINTENANCE` = « SEANCE CINEMA » ;
  - jointure `AS_INGREDIENTS` sur `REFOBJET` pour le titre et la durée du film ;
  - jointure `MAGASIN2` sur `IDMACHINE` pour le nom et la capacité de la salle ;
  - jointure `V_FILM_LICENCE` sur `IDSOURCE` pour le contrat et le distributeur ;
  - libellé de l'état (0 annulée, 1 créée, 11 programmée) ;
  - colonne calculée `DATEHEUREDEBUT = TO_DATE(TO_CHAR(DATEDEBUT,'YYYY-MM-DD')||' '||HEURE,'YYYY-MM-DD HH24:MI')`.

- [x] **`V_SEANCE_PLACES_RESERVEES`**
  - `SUM(rd.QTE)` groupé par `rd.IDPRODUIT` (= la séance) ;
  - jointure sur `RESERVATION r` avec la condition `r.ETAT IN (1, 11)` ;
  - exclure aussi les lignes de détail à l'état 0.

- [x] **`V_SEANCE_PLACES_DISPO`** : répond à « places encore disponibles par séance »
  - `V_SEANCE_CINEMA_LIB` jointe à gauche (`LEFT JOIN`) sur `V_SEANCE_PLACES_RESERVEES` ;
  - `PLACESRESERVEES = NVL(somme, 0)` ;
  - `PLACESDISPO = CAPACITE − NVL(somme, 0)` ;
  - `TAUXREMPLISSAGE = PLACESRESERVEES / CAPACITE * 100`.

- [x] **`V_FILMS_A_VENIR`** : répond à « films qui vont être diffusés »
  - les films qui ont au moins une séance avec `ETAT = 11` et `DATEHEUREDEBUT >= SYSDATE` ;
  - nombre de séances à venir, date de la prochaine séance, total des places disponibles.

- [x] **`V_RESERVATION_CINEMA_LIB`**
  - les lignes de réservation jointes à la séance, au film, à la salle et au client.
  - Elle est nécessaire parce que les vues existantes (`RESERVATIONDETAILS_LIB`, etc.) cherchent le libellé dans `AS_INGREDIENTS` : avec un id de séance dans `IDPRODUIT`, le titre du film resterait vide.

- [x] **`V_RENTABILITE_FILM`** (bonus) : pour chaque film, le coût d'achat (`MONTANTACHAT` de `V_FILM_LICENCE`), la recette des billets (`SUM(QTE × PU)` des réservations à l'état 11), la marge = recette − coût, le nombre de spectateurs et le nombre de séances.

---

## 6. Classes Java (créer un package `cinema` dans `arbiochem-ejb/src/java`)

### Salle
- [x] Réutiliser `magasin.Magasin`, en filtrant sur le type « SALLE CINEMA ».
- [x] Contrôle : capacité > 0.
- [x] Contrôle à la modification : refuser une nouvelle capacité inférieure au nombre de places déjà réservées sur une séance à venir.

### Film
- [x] Réutiliser `produits.Ingredients`.
- [x] **La colonne `DURRE` n'a pas d'attribut dans la classe Java** : ajouter le champ, le getter et le setter.
- [x] Contrôles : durée > 0 et prix du billet (`PV`) > 0.

### `cinema.Seance` extends `ClassEtat`
- [x] `setNomTable("PLANNING")`. Ne pas réutiliser `maintenance.planning.Planning`, qui contient de la logique propre à la maintenance.
- [x] `construirePK` : préfixe « SEA » avec `getSeqPlanning`.
- [x] `controler()`, dans cet ordre :
  1. [x] la salle existe et est active, le film existe et est actif ;
  2. [x] la date et l'heure de la séance sont dans le futur ;
  3. [x] **licence** : chercher dans `V_FILM_LICENCE` un contrat du film avec `DATEDEBUTDROITS ≤ date séance ≤ DATEFINDROITS` et `SEANCESRESTANTES > 0`. S'il n'y en a pas, erreur « Le cinéma n'a pas les droits de diffusion de ce film à cette date ». Sinon, mettre `IDSOURCE` = id du contrat trouvé ;
  4. [x] calculer `DUREE` et `DATEFIN` à partir de `film.DURRE`, plus un temps de nettoyage éventuel ;
  5. [x] **interdire le chevauchement dans la même salle** : il y a conflit si `debutNouvelle < finExistante ET finNouvelle > debutExistante`, en ignorant les séances à l'état 0 ;
  6. [x] forcer `IDTYPEMAINTENANCE` = « SEANCE CINEMA » et `ESTPERIODIQUE` = 0.
- [x] Faire un `SELECT ... FROM AS_BONDECOMMANDE WHERE ID = ? FOR UPDATE` sur le contrat avant de compter les séances restantes, pour que deux personnes ne consomment pas la dernière séance autorisée en même temps.
- [x] Annulation d'une séance (état 0) : elle rend la séance au contrat automatiquement, grâce au filtre de la vue. Refuser l'annulation s'il y a des réservations validées, ou bien les annuler toutes en même temps.

### `cinema.ReservationCinema` extends `ClassMere`
- [x] Table mère `RESERVATION`, classe fille `cinema.ReservationCinemaDetail`, liaison `idMere`.
- [x] Annulation (passage à l'état 0) : les places sont libérées automatiquement grâce au filtre des vues.
- [x] Visa (passage à l'état 11).

### `cinema.ReservationCinemaDetail`
- [x] `setNomTable("RESERVATIONDETAILS")`.
- [x] `controler()` :
  - [x] quantité > 0 ;
  - [x] la séance existe, est validée (état 11) et n'est pas encore passée ;
  - [x] **quantité ≤ places disponibles**, en relisant `V_SEANCE_PLACES_DISPO` dans la même transaction ;
  - [x] prix unitaire = `PV` du film, et date/heure copiées depuis la séance.
- [x] **Empêcher la double réservation** : faire `SELECT ... FROM PLANNING WHERE ID = ? FOR UPDATE` sur la séance avant de vérifier les places. Sinon, deux guichets peuvent vendre les dernières places en même temps.

### Classes de lecture (sur les vues)
- [x] `cinema.FilmLicence` (`setNomTable("V_FILM_LICENCE")`).
- [x] `cinema.SeancePlacesDispo` (`setNomTable("V_SEANCE_PLACES_DISPO")`).
- [x] `cinema.FilmAVenir` (`setNomTable("V_FILMS_A_VENIR")`).
- [x] `cinema.ReservationCinemaLib` (`setNomTable("V_RESERVATION_CINEMA_LIB")`).
- [x] `cinema.RentabiliteFilm` (`setNomTable("V_RENTABILITE_FILM")`).

---

## 7. Pages JSP (`arbiochem-war/web/pages/cinema/`)

### Achat des films
- [x] `distributeur-liste.jsp` et `distributeur-saisie.jsp` (fournisseurs de type « DISTRIBUTEUR FILM »).
- [x] `contrat-saisie.jsp` : bon de commande avec un seul film, la date de fin des droits, le nombre de séances et le prix.
- [x] `contrat-liste.jsp` et `contrat-fiche.jsp`, avec les boutons Viser, Générer la réception, Générer la facture fournisseur et Payer.
- [x] `licence-liste.jsp` : la vue `V_FILM_LICENCE`, avec le statut en couleur (active, en attente, expirée, épuisée), les séances achetées, programmées et restantes.

### Salles, films, séances, réservations
- [x] `salle-saisie.jsp`, `salle-liste.jsp`, `salle-fiche.jsp`.
- [x] `film-saisie.jsp`, `film-liste.jsp`, `film-fiche.jsp` (avec l'affiche et la liste de ses licences).
- [x] `seance-saisie.jsp` : la liste des films ne propose **que les films qui ont une licence active**. Choix de la salle, date et heure.
- [x] `seance-liste.jsp` : filtres par date, film et salle.
- [x] `seance-fiche.jsp` : places disponibles, contrat utilisé et liste des réservations de la séance.
- [x] `reservation-saisie.jsp` en mère/fille. Le choix de la séance ne propose que les séances à venir qui ont encore des places, et affiche les places restantes.
- [x] `reservation-liste.jsp` et `reservation-fiche.jsp`, avec les boutons Viser, Annuler et Payer (paiement via `MOUVEMENTCAISSE`).
- [x] **`programme.jsp`** : la liste des films à venir et, pour chacun, ses séances avec les places disponibles (à partir de `V_FILMS_A_VENIR` et `V_SEANCE_PLACES_DISPO`).
- [x] **`places-dispo.jsp`** : un tableau par séance (film, salle, date, heure, capacité, places réservées, places disponibles), en rouge quand la séance est complète.
- [x] `rentabilite-film.jsp` (bonus) : coût d'achat, recette et marge par film.

### Menu
- [x] Ajouter les entrées dans `MENUDYNAMIQUE` : un menu « Cinéma » avec les sous-menus Distributeurs, Contrats de films, Licences, Salles, Films, Séances, Réservations, Programme, Places disponibles et Rentabilité.

---

## 8. Effets sur l'existant

- [x] Le module maintenance (`PLANNING_CPL`, `calendrier-maintenance.jsp`, `CalendrierMaintenance.java`) affichera aussi les séances, puisqu'elles sont dans `PLANNING`. Il faut y exclure le type « SEANCE CINEMA ».
- [x] Ne pas utiliser `RESERVATIONDETSANSCI` ni le circuit `CHECKIN`/`CHECKOUT`, qui servent à la logique hôtel. Le check-in peut éventuellement servir plus tard pour contrôler les entrées en salle.
- [x] Ne pas utiliser `As_BonDeCommande.genererFacture` pour les films : elle crée une VENTE (voir 4.6).
- [x] Les écrans d'achat existants (bons de commande, factures fournisseur) afficheront aussi les contrats de films. C'est normal, puisque ce sont de vrais achats.

---

## 9. Ordre de développement conseillé

1. Paramétrage (section 3), puis distributeur, film (avec le champ `DURRE`) et salle.
2. Contrat, réception et facture fournisseur, en réutilisant les classes existantes et en ajoutant les contrôles cinéma.
3. Vue `V_FILM_LICENCE` et page `licence-liste.jsp`.
4. Classe `Seance` avec le contrôle de licence et le contrôle de chevauchement.
5. Vues `V_SEANCE_*` et `V_FILMS_A_VENIR`, puis les pages `programme.jsp` et `places-dispo.jsp`.
6. Réservation et contrôle des places.
7. Paiements (distributeur et client), puis la rentabilité.

---

## 10. Scénarios à tester

### Achat des films
- [x] Un contrat pour un film à 10 séances autorisées, visé, **sans réception** : la licence est « EN ATTENTE » et la création d'une séance est refusée.
- [x] Après la réception visée : la licence est « ACTIVE » et la séance est acceptée.
- [x] Une séance programmée après la date de fin des droits est refusée.
- [x] Une séance programmée avant la date de réception (début des droits) est refusée.
- [x] Après 10 séances, la 11e est refusée (licence « EPUISEE »). Si on annule une séance, on peut de nouveau en créer une.
- [x] Un contrat avec deux films est refusé.
- [x] La facture fournisseur générée est bien dans `FACTUREFOURNISSEUR`, et non dans `VENTE`.
- [x] Le paiement du distributeur apparaît sur la facture fournisseur (payé / reste à payer).

### Séances et réservations
- [x] Une salle de 50 places et une séance : une réservation de 48 places est acceptée, puis une de 3 places est refusée (il reste 2 places).
- [x] Après annulation de la réservation de 48 places, il reste de nouveau 50 places.
- [x] Deux séances qui se chevauchent dans la même salle : la seconde est refusée. Dans deux salles différentes : les deux sont acceptées.
- [x] Une séance passée n'apparaît plus dans `V_FILMS_A_VENIR` et ne peut plus être réservée.
- [x] Un film sans séance à venir n'apparaît pas dans le programme.
- [x] Une séance annulée n'apparaît pas dans le programme.
- [x] Il est impossible de réduire la capacité d'une salle sous le nombre de places déjà réservées.
- [x] Le reste à payer de `RESERVATION_LIB` est juste après un paiement partiel.
- [x] `V_RENTABILITE_FILM` : la marge vaut bien la recette des billets moins le coût d'achat du film.

---

## 11. Réalisé (11/11/2026) — fichiers et écarts par rapport au plan

**Fichiers**
- SQL : `projet-standard - Copie/database/2026-11-11-module-cinema.sql` (paramétrage, vues `V_FILM_LICENCE`, `V_CONTRAT_FILM`, `V_SEANCE_CINEMA_LIB`, `V_SEANCE_PLACES_RESERVEES`, `V_SEANCE_PLACES_DISPO`, `V_FILMS_A_VENIR`, `V_RESERVATION_CINEMA_LIB`, `V_RESERVATION_CINEMA`, `V_RENTABILITE_FILM`, exclusion des séances dans `PLANNING_CPL`, menu « Cinéma »).
- Java : `arbiochem-ejb/src/java/cinema/` + champ `durre` ajouté à `produits.Ingredients`.
- JSP : `arbiochem-war/web/pages/cinema/`.

**Identifiants de paramétrage** : `TPFCINE` (distributeur), `TYPMGSALLE` (salle), `CATFILM` (film), `TMSEANCE` (séance), `CLIPASSAGE` (client passage), `MAGSTOCKFILM` (stock films).

**Écarts**
- Facture distributeur : ni `genererFacture` (crée une VENTE) ni `FactureFournisseur.genererAPartirLivraison` (remet le bon de livraison à l'état 1, ce qui désactiverait la licence). Nouvelle méthode `ContratFilm.genererFactureFournisseur`.
- Réception : `ContratFilm.genererReception(dateDebut)` crée **et vise** le bon de livraison (DATY = début des droits).
- Paiement client : `ReservationCinema.payer` crée et vise un `MvtCaisse` (CREDIT, `IDOP` = réservation, compte de regroupement). `IDORIGINE` reste vide, sinon le lettrage plante faute d'écriture de vente.
- Statut de licence supplémentaire « A VENIR » (droits qui commencent plus tard).
- Forfait (diffusions illimitées) : non géré, saisir le nombre réel de séances.
- Temps de nettoyage entre séances : 15 min (`ConstanteCinema.NETTOYAGE_MINUTES`).

## 12. Plan de salle, caisses et jeu de données (11/11/2026)

- **Plan de salle** : `MAGASIN2.COMPTEUR` = places par rangée ; rangées A, B, C… calculées depuis la capacité (26 maximum).
- **Place vendue** : une ligne `RESERVATIONDETAILS` par place, `QTE` = 1, `REMARQUE` = code de la place (ex. `C7`). Vue `V_SEANCE_PLACES_OCCUPEES`.
- **Contrôles** (`ReservationCinema.verifierLignes`) : place existante dans le plan, pas déjà prise (verrou sur la séance), pas choisie deux fois. Changement de plan d'une salle refusé s'il supprime une place déjà vendue.
- **Vente au guichet** : page `cinema/reservation-places.jsp` (menu Cinéma > Vente de billets), `ReservationCinema.reserverPlaces` (réserver, ou réserver + viser + encaisser en une transaction).
- **Caisses** : `CAICINE01` Guichet 1, `CAICINE02` Guichet 2, `CAICINE03` Mobile Money (comptes 530101 à 530103).
- **Menu** : autorisations `USERMENU` (`REFUSER='*'`) indispensables pour que le menu Cinéma s'affiche.
- **Données** : distributeur « Ciné Distribution Madagascar », salles « Salle 1 - Grande salle » (120 = 10 × 12), « Salle 2 » (80 = 8 × 10), « Salle VIP » (24 = 4 × 6), 6 films avec licence 90 jours / 30 séances, 36 séances visées sur 4 jours (14:00, 17:00, 20:00).

## 13. Exceptions de places et valeurs de test (12/11/2026)

- **Exceptions** (`arbiochem-ejb/src/java/cinema/`) : `PlaceException` (base : `getIdSeance()`, `getPlace()`), `PlaceDejaPriseException` (+ `getIdReservation()`, `isVendue()`), `PlaceInexistanteException`, `PlaceEnDoubleException`. Levées par `ReservationCinema.verifierLignes`.
- **Page de vente** : une `PlaceException` renvoie au plan avec un bandeau rouge, la place fautive qui clignote et les autres places toujours sélectionnées (rien n'est enregistré : transaction annulée).
- **Valeurs de test** : `database/2026-11-12-cinema-valeurs-test.sql` (rejouable, ne dépasse jamais la capacité). Réservations `RTST...` : bloc de 4 places vendues au centre, 2 places réservées non visées au rang A, demi-rangée du fond une séance sur trois, séance VIP du 12/11 20:00 complète. Requête de nettoyage en fin de fichier.

## 14. Programme du 16/11 au 30/11/2026 et tarifs par place (12/11/2026)

- **Tarifs par rangée** : catégories de place = produits `AS_INGREDIENTS` (catégorie `CATPLACE`) : `PV` = prix, `REFERENCE` = rangées, `COULEUR` = couleur du plan. Standard A–B 15 000 Ar, Confort C 20 000 Ar, VIP D 30 000 Ar. Vue `V_TARIF_PLACE`, classe `cinema.TarifPlace`, page Cinéma > Tarifs des places. Le prix d'une ligne de réservation = tarif de la rangée de la place.
- **Film** : réalisateur = `MARQUE`, genre = `STYLE`, classification = `SOUSCATEGORIE`.
- **Données** : script `database/2026-11-12-cinema-tarifs-et-nettoyage.sql` (tarifs, menu, ancien jeu désactivé). Salles A, B, C (20 places, 4 × 5), films Les Gardiens du Baobab (A), Nuit sur Analamanga (B), Le Petit Lémurien (C), contrats de 20 séances jusqu'au 31/12/2026, 41 séances visées.
- **Limite du framework** : une réservation ou une séance **visée** ne peut pas être annulée (`ClassEtat.controleAnnuler`) ; le bouton Annuler n'apparaît donc qu'à l'état « créé ».

## 15. Données finales : uniquement le programme du 16/11 au 30/11/2026 (12/11/2026)

- **En base** : 3 films (Les Gardiens du Baobab, Nuit sur Analamanga, Le Petit Lémurien), 3 salles (A, B, C : 20 places), 3 contrats, 41 séances visées, **aucune réservation**. Tout le reste du module cinéma a été supprimé : autres films, salles, séances, contrats / réceptions / factures, réservations et places, avec leurs paiements et écritures comptables, distributeur DEMO.
- **Script** : `database/2026-11-12-cinema-garder-uniquement-programme.sql` (irréversible, rejouable).
- **Code** : `cinema.DonneesProgramme` recrée ce programme (idempotent, sans réservation) :
  `java -cp "deployments/arbiochem.war/WEB-INF/lib/*" cinema.DonneesProgramme`
- Le script de valeurs de test `2026-11-12-cinema-valeurs-test.sql` (section 13) a été supprimé.

## 16. Factures (12/11/2026)

- **Factures des billets** : tables existantes `FACTURECLIENT` (`IDRESERVATION` = réservation, `ETAT` 11 = émise) et `FACTURECLIENTDETAILS` (une ligne par billet ; `IDPRODUIT` = produit de la catégorie de place, la séance et la place sont dans `DESIGNATION`). Classes `cinema.FactureBillet` / `FactureBilletDetail`. Émise **automatiquement au visa** de la réservation (`ReservationCinema.validerObject`), une seule par réservation.
- **Paramétrage** : fonctions `GETSEQFACTURECLIENT`, `GETSEQFACTURECLIENTDETAILS` ; produits `PRODUIT` IGPLACESTD / IGPLACECONF / IGPLACEVIP / BILLETCINEMA (FK de `FACTURECLIENTDETAILS.IDPRODUIT`). Vues `V_FACTURE_BILLET`, `V_FACTURE_BILLET_LIB`. Script `database/2026-11-12-cinema-factures.sql`.
- **Pages** : Cinéma > Factures (`facture-liste.jsp` : billets + distributeurs), facture imprimable `facture-billet.jsp`, lien depuis la fiche réservation.
- **Créées** : FCB000025 (RES000132, 15 000 Ar), FCB000026 (RES000133, 20 000 Ar) ; factures distributeurs FCF001807 à FCF001809 (1 000 000 Ar chacune, état « créée », à viser).



## 17. Promotion soirée : -50 % à partir de 20h00 (12/11/2026)

- **Paramètre** (sans nouvelle table) : produit `AS_INGREDIENTS` `IGPROMOSOIR` de catégorie `CATPROMO` : `REFERENCE` = heure de début (20:00), `PV` = réduction (50 %), `ACTIF`. Vue `V_PROMOTION_CINEMA`. Script `database/2026-11-12-cinema-promotion.sql`.
- **Règle** (`cinema.Promotion`) : tout billet d'une séance qui commence à 20h00 ou après est vendu avec 50 % de réduction, quelle que soit la catégorie (Standard 7 500, Confort 10 000, VIP 15 000 Ar). Le prix réduit est enregistré dans `RESERVATIONDETAILS.PU` : paiement, facture (« Promotion soirée -50% ») et rentabilité le prennent en compte.
- **Écrans** : bandeau et prix réduits sur le plan de salle, pastille « -50% » dans le programme (10 séances à 20h00), réglage de l'heure / du taux / de l'activation dans Cinéma > Tarifs des places.
- Le script `2026-11-12-cinema-tarifs-et-nettoyage.sql` ne contient plus le nettoyage (il annulait les séances à venir s'il était rejoué).

peut tu ajouter cela une promotion des films a partir de 8h Du Soir y aura une promotion de 50%