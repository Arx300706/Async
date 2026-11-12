# Catalogue des 516 tables

Source : dictionnaire du schéma `ARBIOCHEMSTANDARD` de la base Oracle locale, en lecture seule. Les types, nullabilités et clés ci-dessous proviennent des métadonnées. Les rôles explicités ont été rapprochés du code ou du SQL.

Les relations indiquées comme clés étrangères sont déclarées dans Oracle. Une jointure applicative peut exister sans contrainte de clé étrangère. Le SQL complet se trouve dans [tables.sql](tables.sql).

<a id="absence"></a>

## ABSENCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `TYPE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `MOTIF` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `VALEUR` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ANNEE_CIBLE` | `NUMBER(*,0)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `DATYFIN` | `DATE` | Oui |  |
| `DATESAISIE` | `DATE` | Oui |  |

Clés : `ABSENCE_PK` (primaire) : `ID`.

Références dans le code : [paie/conge/Absence.java:122](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/conge/Absence.java#L122>).

<a id="accident"></a>

## ACCIDENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `DATE_DECLARATION` | `DATE` | Oui |  |
| `ID_PERSONNEL` | `VARCHAR2(50 BYTE)` | Oui | FK → LOG_PERSONNEL |
| `ID_LIEU` | `VARCHAR2(50 BYTE)` | Oui | FK → LIEU_ACCIDENT_TRAVAIL |
| `ID_TYPE_ACCIDENT` | `VARCHAR2(50 BYTE)` | Oui | FK → TYPE_ACCIDENT |
| `ID_GRAVITE` | `VARCHAR2(50 BYTE)` | Oui | FK → GRAVITE_ACCIDENT |
| `ID_MACHINE` | `VARCHAR2(50 BYTE)` | Oui | FK → MACHINE |
| `CAUSE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `HEUREACCIDENT` | `VARCHAR2(250 BYTE)` | Oui |  |
| `HORAIREDEBUT` | `VARCHAR2(250 BYTE)` | Oui |  |
| `HORAIREFIN` | `VARCHAR2(250 BYTE)` | Oui |  |
| `ACTIVITE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `LESIONS` | `VARCHAR2(2000 BYTE)` | Oui |  |
| `CENTRESOIN` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DETAILSTEMOIN1` | `VARCHAR2(2000 BYTE)` | Oui |  |
| `DETAILSTEMOIN2` | `VARCHAR2(2000 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `SYS_C006990` (primaire) : `ID`.

Clés étrangères sortantes :

- [ACCIDENT](tables.md#accident).`ID_GRAVITE` → [GRAVITE_ACCIDENT](tables.md#gravite-accident).`ID` (`FK_ACCIDENT_GRAVITE`, ENABLED).
- [ACCIDENT](tables.md#accident).`ID_LIEU` → [LIEU_ACCIDENT_TRAVAIL](tables.md#lieu-accident-travail).`ID` (`FK_ACCIDENT_LIEU`, ENABLED).
- [ACCIDENT](tables.md#accident).`ID_MACHINE` → [MACHINE](tables.md#machine).`ID` (`FK_ACCIDENT_MACHINE`, ENABLED).
- [ACCIDENT](tables.md#accident).`ID_PERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`FK_ACCIDENT_PERSONNEL`, ENABLED).
- [ACCIDENT](tables.md#accident).`ID_TYPE_ACCIDENT` → [TYPE_ACCIDENT](tables.md#type-accident).`ID` (`FK_ACCIDENT_TYPE`, ENABLED).

Vues dépendantes directes (2) : [V_ACCIDENT_LIB](vues.md#v-accident-lib), [V_ACCIDENT_PDF](vues.md#v-accident-pdf).

Références dans le code : [paie/accident/Accident.java:168](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/accident/Accident.java#L168>), [paie/accident/accident-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/accident/accident-saisie.jsp#L19>), [paie/accident/arret-travail-saisie.jsp:29](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/accident/arret-travail-saisie.jsp#L29>).

<a id="acte"></a>

## ACTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDPRODUIT` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `LIBELLE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `QTE` | `NUMBER(*,0)` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDCLIENT` | `VARCHAR2(255 BYTE)` | Oui | FK → CLIENT |
| `IDRESERVATION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `TVA` | `NUMBER(10,2)` | Oui |  |

Clés : `ACTE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [ACTE](tables.md#acte).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`ACTE_CLIENT_FK`, ENABLED).
- [ACTE](tables.md#acte).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`ACTE_PRODUIT_FK`, ENABLED).

Vues dépendantes directes (2) : [ACTE_LIB](vues.md#acte-lib), [FACTURECLIENTDETAILSLIB](vues.md#factureclientdetailslib).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="actionrole"></a>

## ACTIONROLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `NOMTABLEOBJET` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ACTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ROLEMINIMUM` | `NUMBER(30,0)` | Oui |  |
| `DIRECTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `UTILISATEUR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `GROUPETABLE` | `VARCHAR2(150 BYTE)` | Oui |  |

Clés : `PK_ACTIONROLES` (primaire) : `ID`.

Références dans le code : [user/UserEJBBean.java:1512](<../../projet-standard - Copie/arbiochem-ejb/src/java/user/UserEJBBean.java#L1512>), [role/actionrole-saisie.jsp:18](<../../projet-standard - Copie/arbiochem-war/web/pages/role/actionrole-saisie.jsp#L18>).

<a id="action-formation"></a>

## ACTION_FORMATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDPLANFORMATION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDTYPEFORMATION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDCATEGORIEFORMATION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `FORMATEUR` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REFERENCE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `INTITULE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TYPEPRESTATAIRE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDSEMESTRE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `NBSESSIONPREVUS` | `NUMBER(*,0)` | Oui |  |
| `DUREESTAGIAIREHEURE` | `NUMBER(10,2)` | Oui |  |
| `NBOUVRIERSPREVUE` | `NUMBER(*,0)` | Oui |  |
| `NBCADREPREVUE` | `NUMBER(*,0)` | Oui |  |
| `OBJECTIF` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `ESTREALISEE` | `NUMBER(38,0)` | Oui |  |

Clés : `ACTION_FORMATION_PK` (primaire) : `ID`.

Tables qui la référencent :

- [EVALUATION_A_CHAUD](tables.md#evaluation-a-chaud).`IDFORMATIONSUIVIE` → [ACTION_FORMATION](tables.md#action-formation).`ID`.

Vues dépendantes directes (9) : [ACTION_FORMATION_LIB](vues.md#action-formation-lib), [EVALUATION_A_CHAUD_LIB](vues.md#evaluation-a-chaud-lib), [PARTICIPATION_FORMATION_LIB](vues.md#participation-formation-lib), [SESSION_FORMATION_LIB](vues.md#session-formation-lib), [SUIVI_PRESENCE_FILLE_LIB](vues.md#suivi-presence-fille-lib), [SUIVI_PRESENCE_MERE_LIB](vues.md#suivi-presence-mere-lib), [V_FORMATION_BILAN_PAR_TYPE](vues.md#v-formation-bilan-par-type), [V_FORMATION_CROISE_TYPE_STATUT](vues.md#v-formation-croise-type-statut), [V_RECAP_GLOBAL_FORMATION](vues.md#v-recap-global-formation).

Références dans le code : [paie/formation/action/ActionFormation.java:155](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formation/action/ActionFormation.java#L155>), [paie/formation/action/ActionFormationBack.java:142](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formation/action/ActionFormationBack.java#L142>), [paie/formation/action/actionformation-saisie-back.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/action/actionformation-saisie-back.jsp#L22>), [paie/formation/action/actionformation-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/action/actionformation-saisie.jsp#L22>), [paie/evaluation/evaluationchaud-saisie.jsp:42](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/evaluation/evaluationchaud-saisie.jsp#L42>) ; 4 autres fichiers dans `usages-code.json`.

<a id="action-formation-detail"></a>

## ACTION_FORMATION_DETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDACTIONFORMATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPECOUT` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPE_COUT_FORMATION |
| `COUT` | `NUMBER(18,2)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C006994` (primaire) : `ID`.

Clés étrangères sortantes :

- [ACTION_FORMATION_DETAIL](tables.md#action-formation-detail).`IDTYPECOUT` → [TYPE_COUT_FORMATION](tables.md#type-cout-formation).`ID` (`FK_AFD_TYPECOUT`, ENABLED).

Vues dépendantes directes (2) : [ACTION_FORMATION_DETAIL_LIB](vues.md#action-formation-detail-lib), [V_RECAP_GLOBAL_FORMATION](vues.md#v-recap-global-formation).

Références dans le code : [paie/formation/action/ActionFormationDetail.java:66](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formation/action/ActionFormationDetail.java#L66>), [paie/formation/action/actionformation-saisie.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/action/actionformation-saisie.jsp#L24>).

<a id="agence"></a>

## AGENCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(20 BYTE)` | Non |  |
| `VAL` | `VARCHAR2(30 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="ai-agent-call"></a>

## AI_AGENT_CALL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `USERID` | `VARCHAR2(255 BYTE)` | Oui |  |
| `SESSIONID` | `VARCHAR2(255 BYTE)` | Oui |  |
| `AGENT` | `VARCHAR2(32 BYTE)` | Oui |  |
| `TOKENSIN` | `NUMBER(10,0)` | Oui |  |
| `TOKENSOUT` | `NUMBER(10,0)` | Oui |  |
| `COSTMGA` | `NUMBER(12,2)` | Oui |  |
| `SUCCESS` | `CHAR(1 BYTE)` | Oui |  |
| `LATENCYMS` | `NUMBER(10,0)` | Oui |  |
| `CREATEDAT` | `DATE` | Oui |  |

Clés : `SYS_C006998` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="ai-msg-report"></a>

## AI_MSG_REPORT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `EMAILADRESS` | `VARCHAR2(255 BYTE)` | Oui |  |
| `EMAIL_MSG_TYPE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C006999` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="ai-msg-report-type"></a>

## AI_MSG_REPORT_TYPE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007000` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="ai-session"></a>

## AI_SESSION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `USERID` | `VARCHAR2(255 BYTE)` | Non |  |
| `STATUS` | `VARCHAR2(16 BYTE)` | Oui |  |
| `DATESTARTEDAT` | `DATE` | Oui |  |
| `TIMESTARTEDAT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `LASTSEENAT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TTL_MINUTES` | `NUMBER(6,0)` | Oui |  |
| `METADATA_JSON` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `SYS_C007003` (primaire) : `ID`.

Tables qui la référencent :

- [AI_TURN](tables.md#ai-turn).`SESSIONID` → [AI_SESSION](tables.md#ai-session).`ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="ai-turn"></a>

## AI_TURN

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `SESSIONID` | `VARCHAR2(255 BYTE)` | Non | FK → AI_SESSION |
| `ROLE` | `VARCHAR2(16 BYTE)` | Oui |  |
| `CONTENT` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `TOKENSPROMPT` | `NUMBER(10,0)` | Oui |  |
| `TOKENSCOMPLETION` | `NUMBER(10,0)` | Oui |  |
| `AGENT` | `VARCHAR2(48 BYTE)` | Oui |  |
| `LATENCYMS` | `NUMBER(10,0)` | Oui |  |
| `DATECREATEDAT` | `DATE` | Oui |  |
| `TIMECREATEDAT` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007006` (primaire) : `ID`.

Clés étrangères sortantes :

- [AI_TURN](tables.md#ai-turn).`SESSIONID` → [AI_SESSION](tables.md#ai-session).`ID` (`SYS_C007842`, ENABLED).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="alimentpoussin"></a>

## ALIMENTPOUSSIN

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDPRODUITS` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDINGREDIENTS` | `VARCHAR2(100 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `UNITE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `QUANTITE` | `NUMBER(30,10)` | Oui |  |

Clés : `SYS_C007008` (primaire) : `ID`.

Clés étrangères sortantes :

- [ALIMENTPOUSSIN](tables.md#alimentpoussin).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`SYS_C008287`, ENABLED).

Vues dépendantes directes (1) : [ALIMENTPOUSSIN_LIBCOMPLET](vues.md#alimentpoussin-libcomplet).

Références dans le code : [produits/AlimentPoussin.java:21](<../../projet-standard - Copie/arbiochem-ejb/src/java/produits/AlimentPoussin.java#L21>).

<a id="all-vue"></a>

## ALL_VUE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `VIEW_NAME` | `VARCHAR2(30 BYTE)` | Non |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="annulationutilisateur"></a>

## ANNULATIONUTILISATEUR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `IDANNULATIONUSER` | `VARCHAR2(20 BYTE)` | Non | PK |
| `REFUSER` | `NUMBER(20,0)` | Oui |  |
| `DATY` | `DATE` | Oui |  |

Clés : `SYS_C007010` (primaire) : `IDANNULATIONUSER`.

Vues dépendantes directes (2) : [UTILISATEURROLE](vues.md#utilisateurrole), [UTILISATEURVALIDE](vues.md#utilisateurvalide).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="anomalieordo"></a>

## ANOMALIEORDO

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ARR` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ID` | `NUMBER` | Oui |  |
| `NAME` | `VARCHAR2(200 BYTE)` | Oui |  |
| `SEXE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `PERE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `MOTHER` | `VARCHAR2(200 BYTE)` | Oui |  |
| `file` | `VARCHAR2(100 BYTE)` | Oui |  |
| `RISQUE` | `NUMBER(*,0)` | Oui |  |
| `CENTREVOTE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `BUREAUVOTE` | `VARCHAR2(100 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="arret-travail"></a>

## ARRET_TRAVAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `ID_ACCIDENT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `DATE_DEBUT_ARRET` | `DATE` | Oui |  |
| `DATE_FIN_ARRET` | `DATE` | Oui |  |
| `NOMBRE_JOUR` | `NUMBER(6,2)` | Oui |  |

Clés : `SYS_C007012` (primaire) : `ID`.

Vues dépendantes directes (1) : [V_ARRETTRAVAIL_LIB](vues.md#v-arrettravail-lib).

Références dans le code : [paie/accident/ArretTravail.java:67](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/accident/ArretTravail.java#L67>), [paie/accident/arret-travail-saisie.jsp:20](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/accident/arret-travail-saisie.jsp#L20>), [paie/accident/arretTravail-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/accident/arretTravail-liste.jsp#L7>), [paie/accident/inc/arret-travail.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/accident/inc/arret-travail.jsp#L7>).

<a id="articleprix"></a>

## ARTICLEPRIX

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `IDPRODUIT` | `VARCHAR2(2000 BYTE)` | Oui |  |
| `IPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PUMP` | `NUMBER` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="as-bondecommande"></a>

## AS_BONDECOMMANDE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(500 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(500 BYTE)` | Oui |  |
| `MODEPAIEMENT` | `VARCHAR2(500 BYTE)` | Oui |  |
| `FOURNISSEUR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `REFERENCE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(120 BYTE)` | Oui | FK → DEVISE |
| `IDMAGASIN` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DATELIMITE` | `DATE` | Oui |  |
| `SERVICE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDDMDACHAT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REFPROFORMA` | `VARCHAR2(200 BYTE)` | Oui |  |
| `REMISE` | `NUMBER(30,2)` | Oui |  |

Clés : `SYS_C007014` (primaire) : `ID`.

Clés étrangères sortantes :

- [AS_BONDECOMMANDE](tables.md#as-bondecommande).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`BC_DEVISE_FK`, ENABLED).

Tables qui la référencent :

- [AS_BONDECOMMANDE_FILLE](tables.md#as-bondecommande-fille).`IDBC` → [AS_BONDECOMMANDE](tables.md#as-bondecommande).`ID`.
- [PLANPAIEMENTACHAT](tables.md#planpaiementachat).`IDBCF` → [AS_BONDECOMMANDE](tables.md#as-bondecommande).`ID`.

Vues dépendantes directes (4) : [AS_BONDECOMMANDE_CPL](vues.md#as-bondecommande-cpl), [AS_BONDECOMMANDE_MERECPL](vues.md#as-bondecommande-merecpl), [AS_BONDECOMMANDE_MF](vues.md#as-bondecommande-mf), [DMDACHATSUIVICOMMANDE](vues.md#dmdachatsuivicommande).

Références dans le code : [faturefournisseur/As_BonDeCommande.java:122](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/As_BonDeCommande.java#L122>).

<a id="as-bondecommande-fille"></a>

## AS_BONDECOMMANDE_FILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `PRODUIT` | `VARCHAR2(1500 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `IDBC` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_BONDECOMMANDE |
| `QUANTITE` | `NUMBER(30,2)` | Oui |  |
| `PU` | `NUMBER(38,2)` | Oui |  |
| `MONTANT` | `FLOAT(126)` | Oui |  |
| `TVA` | `NUMBER(38,2)` | Oui |  |
| `UNITE` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_UNITE |
| `REMISE` | `NUMBER(30,2)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(120 BYTE)` | Oui | FK → DEVISE |
| `TAUXDECHANGE` | `NUMBER(30,2)` | Oui |  |

Clés : `SYS_C007016` (primaire) : `ID`.

Clés étrangères sortantes :

- [AS_BONDECOMMANDE_FILLE](tables.md#as-bondecommande-fille).`UNITE` → [AS_UNITE](tables.md#as-unite).`ID` (`AS_BCFILLE_UNITE_FK`, ENABLED).
- [AS_BONDECOMMANDE_FILLE](tables.md#as-bondecommande-fille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`BCFILLE_DEVISE_FK`, ENABLED).
- [AS_BONDECOMMANDE_FILLE](tables.md#as-bondecommande-fille).`PRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`BCF_PRODUIT`, ENABLED).
- [AS_BONDECOMMANDE_FILLE](tables.md#as-bondecommande-fille).`IDBC` → [AS_BONDECOMMANDE](tables.md#as-bondecommande).`ID` (`BC_MERE_FILLE`, ENABLED).

Vues dépendantes directes (5) : [AS_BONDECOMMANDE_CPL](vues.md#as-bondecommande-cpl), [AS_BONDECOMMANDE_FILLE_CPL](vues.md#as-bondecommande-fille-cpl), [AS_BONDECOMMANDE_MF](vues.md#as-bondecommande-mf), [BCFILLERESTEALIVRERLIB](vues.md#bcfillerestealivrerlib), [DMDACHATSUIVICOMMANDE](vues.md#dmdachatsuivicommande).

Références dans le code : [faturefournisseur/As_BonDeCommande.java:260](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/As_BonDeCommande.java#L260>), [faturefournisseur/As_BonDeCommande_Fille.java:37](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/As_BonDeCommande_Fille.java#L37>), [bondecommande/bondecommande-modif.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/bondecommande/bondecommande-modif.jsp#L21>), [maintenance/bondecommande/bondecommande-saisie.jsp:18](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/bondecommande/bondecommande-saisie.jsp#L18>).

<a id="as-bondelivraison"></a>

## AS_BONDELIVRAISON

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `REMARQUE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `IDBC` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `IDFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → FOURNISSEUR |
| `MAGASIN` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDFACTUREFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → FACTUREFOURNISSEUR |
| `IDDEPENSEDIVERS` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `AS_BONDELIVRAISON_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [AS_BONDELIVRAISON](tables.md#as-bondelivraison).`IDFACTUREFOURNISSEUR` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID` (`SYS_C008253`, ENABLED).
- [AS_BONDELIVRAISON](tables.md#as-bondelivraison).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` (`SYS_C008356`, ENABLED).

Tables qui la référencent :

- [AS_BONDELIVRAISON_FILLE](tables.md#as-bondelivraison-fille).`NUMBL` → [AS_BONDELIVRAISON](tables.md#as-bondelivraison).`ID`.
- [PACKINGLISTACHAT](tables.md#packinglistachat).`IDBR` → [AS_BONDELIVRAISON](tables.md#as-bondelivraison).`ID`.

Vues dépendantes directes (10) : [AS_BONDELIVRAISON_LIB](vues.md#as-bondelivraison-lib), [AS_BONDELIVRAISON_LIBCPL](vues.md#as-bondelivraison-libcpl), [AS_BONDELIVRAISON_MF](vues.md#as-bondelivraison-mf), [DEPENSEBONDELIVRAISON](vues.md#depensebondelivraison), [DEPENSEDFACTUREFOURNISSEUR](vues.md#depensedfacturefournisseur), [DEPENSEDIVERSLIB](vues.md#depensediverslib), [FACTUREFOURNISSEURCPL_FD](vues.md#facturefournisseurcpl-fd), [FF_FILLEBL_GRP](vues.md#ff-fillebl-grp), [MVTSTOCKLIBFACTURE](vues.md#mvtstocklibfacture), [V_ETATSTOCK_ENTREE](vues.md#v-etatstock-entree).

Références dans le code : [faturefournisseur/As_BonDeLivraison.java:39](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/As_BonDeLivraison.java#L39>), [faturefournisseur/FactureDeclaration.java:750](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/FactureDeclaration.java#L750>), [faturefournisseur/FactureFournisseur.java:1086](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/FactureFournisseur.java#L1086>), [stock/EtatStockParEntreeFournisseur.java:181](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStockParEntreeFournisseur.java#L181>), [stock/EtatStockParEntreeStandard.java:200](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStockParEntreeStandard.java#L200>).

<a id="as-bondelivraison-client"></a>

## AS_BONDELIVRAISON_CLIENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `REMARQUE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `IDVENTE` | `VARCHAR2(255 BYTE)` | Oui | FK → VENTE |
| `IDBC` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `MAGASIN` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDCLIENT` | `VARCHAR2(100 BYTE)` | Oui | FK → CLIENT |
| `DESCRIPTION` | `VARCHAR2(250 BYTE)` | Oui |  |
| `VEHICULE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `CHAUFFEUR` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `SYS_C007020` (primaire) : `ID`.

Clés étrangères sortantes :

- [AS_BONDELIVRAISON_CLIENT](tables.md#as-bondelivraison-client).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`BLC_CLIENT_FK`, ENABLED).
- [AS_BONDELIVRAISON_CLIENT](tables.md#as-bondelivraison-client).`IDVENTE` → [VENTE](tables.md#vente).`ID` (`SYS_C008064`, ENABLED).

Tables qui la référencent :

- [AS_BONDELIVRAISON_CLIENT_FILLE](tables.md#as-bondelivraison-client-fille).`NUMBL` → [AS_BONDELIVRAISON_CLIENT](tables.md#as-bondelivraison-client).`ID`.

Vues dépendantes directes (20) : [ASBLCLIENTCPLASINGREDIENTS](vues.md#asblclientcplasingredients), [AS_BLCLFILLEGRP_VENTE_CPL_V](vues.md#as-blclfillegrp-vente-cpl-v), [AS_BLCLFILLEGRP_VENTE_CPL_V2](vues.md#as-blclfillegrp-vente-cpl-v2), [AS_BLCLIENTFILLEGRPBCFILLE](vues.md#as-blclientfillegrpbcfille), [AS_BL_CLIENT_CPL_ASINGREDIENTS](vues.md#as-bl-client-cpl-asingredients), [AS_BL_CLIENT_FILLE_VISE](vues.md#as-bl-client-fille-vise), [AS_BONDELIVRAISONCLIENT_LIB](vues.md#as-bondelivraisonclient-lib), [AS_BONDELIVRAISONCLIENT_LIBCPL](vues.md#as-bondelivraisonclient-libcpl), [AS_BONDELIVRAISONCLIENT_lib](vues.md#as-bondelivraisonclient-lib--41535f424f4e44454c4956524149534f4e434c49454e545f6c6962), [AS_BONDELIVRAISON_CLIENT_CPL](vues.md#as-bondelivraison-client-cpl), [AS_BONDELIVRAISON_CLIENT_CPL2](vues.md#as-bondelivraison-client-cpl2), [AS_BONDELIVRAISON_CLIENT_MF](vues.md#as-bondelivraison-client-mf), [AS_BONLIVRFILLE_CLIENT_CPL](vues.md#as-bonlivrfille-client-cpl), [BLGROUPBYIDBC](vues.md#blgroupbyidbc), [BL_CLIENT_FILLE_BC](vues.md#bl-client-fille-bc), [BL_CLIENT_FILLE_GRP_BC](vues.md#bl-client-fille-grp-bc), [SORTIEPRODUITPARVENTE](vues.md#sortieproduitparvente), [VENTE_CPL](vues.md#vente-cpl), [VENTE_CPL_CL](vues.md#vente-cpl-cl), [VENTE_CPL_VISEE](vues.md#vente-cpl-visee).

Références dans le code : [vente/As_BondeLivraisonClient.java:98](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/As_BondeLivraisonClient.java#L98>), [vente/As_BondeLivraisonClientArbiochem.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/As_BondeLivraisonClientArbiochem.java#L9>).

<a id="as-bondelivraison-client-fille"></a>

## AS_BONDELIVRAISON_CLIENT_FILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `PRODUIT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `NUMBL` | `VARCHAR2(100 BYTE)` | Oui | FK → AS_BONDELIVRAISON_CLIENT |
| `QUANTITE` | `NUMBER(10,2)` | Oui |  |
| `IDVENTEDETAIL` | `VARCHAR2(100 BYTE)` | Oui | FK → VENTE_DETAILS |
| `UNITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDBC_FILLE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SYS_C007022` (primaire) : `ID`.

Clés étrangères sortantes :

- [AS_BONDELIVRAISON_CLIENT_FILLE](tables.md#as-bondelivraison-client-fille).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID` (`SYS_C008070`, ENABLED).
- [AS_BONDELIVRAISON_CLIENT_FILLE](tables.md#as-bondelivraison-client-fille).`NUMBL` → [AS_BONDELIVRAISON_CLIENT](tables.md#as-bondelivraison-client).`ID` (`SYS_C008265`, ENABLED).

Vues dépendantes directes (16) : [ASBLCLIENTCPLASINGREDIENTS](vues.md#asblclientcplasingredients), [AS_BC_FILLE_AVEC_PRIX](vues.md#as-bc-fille-avec-prix), [AS_BLCLIENTFILLEGRPBCFILLE](vues.md#as-blclientfillegrpbcfille), [AS_BLCLIENTFILLEINSERTION](vues.md#as-blclientfilleinsertion), [AS_BL_CLIENT_CPL_ASINGREDIENTS](vues.md#as-bl-client-cpl-asingredients), [AS_BL_CLIENT_FILLE_VISE](vues.md#as-bl-client-fille-vise), [AS_BONDELIVRAISON_CLIENT_MF](vues.md#as-bondelivraison-client-mf), [AS_BONLIVRFILLE_CLIENT_CPL](vues.md#as-bonlivrfille-client-cpl), [AS_BONLIVRFILLE_CLIENT_CPL2](vues.md#as-bonlivrfille-client-cpl2), [BLCF_GRPVENTEDET](vues.md#blcf-grpventedet), [BLCLIENT_FILLE_GRP](vues.md#blclient-fille-grp), [BLGROUPBYIDBC](vues.md#blgroupbyidbc), [BL_CLIENT_FILLE_BC](vues.md#bl-client-fille-bc), [BL_CLIENT_FILLE_GRP_BC](vues.md#bl-client-fille-grp-bc), [BL_CLIENT_FILLE_GRP_VENTE](vues.md#bl-client-fille-grp-vente), [BL_QTELIVREE_BY_IDBCFILLE](vues.md#bl-qtelivree-by-idbcfille).

Références dans le code : [vente/As_BondeLivraisonClientFille.java:57](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/As_BondeLivraisonClientFille.java#L57>), [vente/As_BondeLivraisonClientFilleArbiochem.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/As_BondeLivraisonClientFilleArbiochem.java#L9>), [vente/As_BondeLivraisonClientFilleInsertion.java:38](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/As_BondeLivraisonClientFilleInsertion.java#L38>).

<a id="as-bondelivraison-fille"></a>

## AS_BONDELIVRAISON_FILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `PRODUIT` | `VARCHAR2(100 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `NUMBL` | `VARCHAR2(100 BYTE)` | Oui | FK → AS_BONDELIVRAISON |
| `QUANTITE` | `NUMBER(10,2)` | Oui |  |
| `IDDETAILSFACTUREFOURNISSEUR` | `VARCHAR2(100 BYTE)` | Oui |  |
| `UNITE` | `VARCHAR2(100 BYTE)` | Oui | FK → AS_UNITE |
| `IDBC_FILLE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDFACTUREFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → FACTUREFOURNISSEUR |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `TAUXDECHANGE` | `NUMBER(30,2)` | Oui |  |

Clés : `AS_BONDELIVRAISON_FILLEPK` (primaire) : `ID`.

Clés étrangères sortantes :

- [AS_BONDELIVRAISON_FILLE](tables.md#as-bondelivraison-fille).`PRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`BLF_PRODUIT_FK`, ENABLED).
- [AS_BONDELIVRAISON_FILLE](tables.md#as-bondelivraison-fille).`UNITE` → [AS_UNITE](tables.md#as-unite).`ID` (`BLF_UNITE_FK`, ENABLED).
- [AS_BONDELIVRAISON_FILLE](tables.md#as-bondelivraison-fille).`NUMBL` → [AS_BONDELIVRAISON](tables.md#as-bondelivraison).`ID` (`NONFILLE_FK`, ENABLED).
- [AS_BONDELIVRAISON_FILLE](tables.md#as-bondelivraison-fille).`IDFACTUREFOURNISSEUR` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID` (`SYS_C008254`, ENABLED).

Vues dépendantes directes (5) : [AS_BONDELIVRAISON_FILLE_LIB](vues.md#as-bondelivraison-fille-lib), [AS_BONDELIVRAISON_LIBCPL](vues.md#as-bondelivraison-libcpl), [AS_BONDELIVRAISON_MF](vues.md#as-bondelivraison-mf), [FFFILLERESTEALIVRER](vues.md#fffillerestealivrer), [FF_FILLEBL_GRP](vues.md#ff-fillebl-grp).

Références dans le code : [faturefournisseur/As_BonDeLivraison_Fille.java:48](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/As_BonDeLivraison_Fille.java#L48>).

<a id="as-ingredients"></a>

## AS_INGREDIENTS

Référentiel des articles : libellés, unités, prix, catégories, seuils et comptes comptables.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `LIBELLE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `SEUIL` | `NUMBER(10,2)` | Oui |  |
| `UNITE` | `VARCHAR2(100 BYTE)` | Oui | FK → AS_UNITE |
| `QUANTITEPARPACK` | `NUMBER(10,2)` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `ACTIF` | `NUMBER(2,0)` | Oui |  |
| `PHOTO` | `VARCHAR2(100 BYTE)` | Oui |  |
| `CALORIE` | `NUMBER(5,2)` | Oui |  |
| `DURRE` | `NUMBER(3,0)` | Oui |  |
| `COMPOSE` | `NUMBER(8,0)` | Oui |  |
| `CATEGORIEINGREDIENT` | `VARCHAR2(100 BYTE)` | Oui | FK → CATEGORIEINGREDIENT |
| `IDFOURNISSEUR` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `QTELIMITE` | `NUMBER(30,2)` | Oui |  |
| `PV` | `NUMBER(30,2)` | Oui |  |
| `LIBELLEVENTE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `SEUILMIN` | `NUMBER(30,2)` | Oui |  |
| `SEUILMAX` | `NUMBER(30,2)` | Oui |  |
| `PUACHATUSD` | `NUMBER(30,2)` | Oui |  |
| `PUACHATEURO` | `NUMBER(30,2)` | Oui |  |
| `PUACHATAUTREDEVISE` | `NUMBER(30,2)` | Oui |  |
| `PUVENTEUSD` | `NUMBER(30,2)` | Oui |  |
| `PUVENTEEURO` | `NUMBER(30,2)` | Oui |  |
| `PUVENTEAUTREDEVISE` | `NUMBER(30,2)` | Oui |  |
| `ISVENTE` | `NUMBER(5,0)` | Oui |  |
| `ISACHAT` | `NUMBER(5,0)` | Oui |  |
| `COMPTE_VENTE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPTE_ACHAT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `LIBELLEEXTACTE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `TVA` | `NUMBER(10,2)` | Oui |  |
| `FILEPATH` | `VARCHAR2(500 BYTE)` | Oui |  |
| `RESTE` | `NUMBER(20,2)` | Oui |  |
| `TYPESTOCK` | `VARCHAR2(4 BYTE)` | Oui | FK → TYPESTOCK |
| `REFPOST` | `VARCHAR2(100 BYTE)` | Oui | FK → POSTE |
| `REFQUALIFICATION` | `VARCHAR2(100 BYTE)` | Oui | FK → QUALIFICATION_PAIE |
| `IDCHAMBRE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ISPERISHABLE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `PV2` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDFAMILLE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(50 BYTE)` | Oui |  |
| `PARFUMS` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ISPETRI` | `NUMBER(1,0)` | Oui |  |
| `TYPECONSO` | `VARCHAR2(50 BYTE)` | Oui |  |
| `COMPTE_TVA` | `VARCHAR2(100 BYTE)` | Oui |  |
| `TYPEPRODUIT` | `VARCHAR2(50 BYTE)` | Oui | FK → TYPE_PRODUIT |
| `COMPTE_STOCK` | `VARCHAR2(50 BYTE)` | Oui |  |
| `COMPTE_SORTIE_STOCK` | `VARCHAR2(50 BYTE)` | Oui |  |
| `COMPTE_RISTOURNE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `UNITE2` | `VARCHAR2(50 BYTE)` | Oui |  |
| `MARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ANNEESORTIE` | `NUMBER(4,0)` | Oui |  |
| `SAV` | `NUMBER(30,2)` | Oui |  |
| `IDMODELE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COULEUR` | `VARCHAR2(100 BYTE)` | Oui |  |
| `TAILLE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDREFCOM` | `VARCHAR2(100 BYTE)` | Oui |  |
| `REFERENCECOMMANDE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `CLIENT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `STYLE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `CODEBARRE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDSERVICE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `REFERENCE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `SOUSCATEGORIE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `PVGROS` | `NUMBER(10,2)` | Oui |  |
| `CODEGROS` | `NUMBER` | Oui |  |
| `IDNATURE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007028` (primaire) : `ID`.

Clés étrangères sortantes :

- [AS_INGREDIENTS](tables.md#as-ingredients).`TYPESTOCK` → [TYPESTOCK](tables.md#typestock).`ID` (`FK_AS_INGREDIENTS_TYPESTOCK`, ENABLED).
- [AS_INGREDIENTS](tables.md#as-ingredients).`REFQUALIFICATION` → [QUALIFICATION_PAIE](tables.md#qualification-paie).`ID` (`FK_QUALIFICATION`, ENABLED).
- [AS_INGREDIENTS](tables.md#as-ingredients).`TYPEPRODUIT` → [TYPE_PRODUIT](tables.md#type-produit).`ID` (`FK_TYPEPRODUIT`, ENABLED).
- [AS_INGREDIENTS](tables.md#as-ingredients).`REFPOST` → [POSTE](tables.md#poste).`ID` (`INGREDIENT_POSTE_FK`, ENABLED).
- [AS_INGREDIENTS](tables.md#as-ingredients).`CATEGORIEINGREDIENT` → [CATEGORIEINGREDIENT](tables.md#categorieingredient).`ID` (`SYS_C008177`, ENABLED).
- [AS_INGREDIENTS](tables.md#as-ingredients).`UNITE` → [AS_UNITE](tables.md#as-unite).`ID` (`SYS_C008310`, ENABLED).

Tables qui la référencent :

- [ACTE](tables.md#acte).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [ALIMENTPOUSSIN](tables.md#alimentpoussin).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [AS_BONDECOMMANDE_FILLE](tables.md#as-bondecommande-fille).`PRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [AS_BONDELIVRAISON_FILLE](tables.md#as-bondelivraison-fille).`PRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [AS_RECETTE](tables.md#as-recette).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [AS_RECETTEFABRICATION](tables.md#as-recettefabrication).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [AS_RECETTEOFFFABTABLE](tables.md#as-recetteofffabtable).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [AVOIRACHATFILLE](tables.md#avoirachatfille).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [BATIMENTVIDESANITAIREDETAIL](tables.md#batimentvidesanitairedetail).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [CHECKIN](tables.md#checkin).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [COMPTEURELECTRICITE](tables.md#compteurelectricite).`IDCATEGORIE` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [COMPTEURMAINTENANCE](tables.md#compteurmaintenance).`IDCATEGORIE` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [CONSOMMABLEMACHINE](tables.md#consommablemachine).`IDCONSOMMABLE` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [CONSOMMATIONDETAILS](tables.md#consommationdetails).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [DISTRIBUTIONALIMENTDETAIL](tables.md#distributionalimentdetail).`IDALIMENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [DMDACHATFILLE](tables.md#dmdachatfille).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [EQUIVALENCECARTON](tables.md#equivalencecarton).`IDCARTON` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [EQUIVALENCECARTON](tables.md#equivalencecarton).`IDPETRIS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [FUMIGATION](tables.md#fumigation).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [INFOSAUTO](tables.md#infosauto).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [LIVRAISONINTERNEFILLE](tables.md#livraisoninternefille).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [LOT](tables.md#lot).`IDARTICLE` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [PACKINGLISTACHATFILLE](tables.md#packinglistachatfille).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [PLANCOMMANDE](tables.md#plancommande).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [PREVISIONFERME](tables.md#previsionferme).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [REMISEFILLE](tables.md#remisefille).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [RISTOURNEDETAILS](tables.md#ristournedetails).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [SEUILPERTEACHAT](tables.md#seuilperteachat).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.
- [TARIF_INGREDIENTS](tables.md#tarif-ingredients).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID`.

Vues dépendantes directes (196) : [ACTE_LIB](vues.md#acte-lib), [ALIMENTPOUSSIN_LIBCOMPLET](vues.md#alimentpoussin-libcomplet), [ASBLCLIENTCPLASINGREDIENTS](vues.md#asblclientcplasingredients), [AS_BC_FILLE_AVEC_PRIX](vues.md#as-bc-fille-avec-prix), [AS_BL_CLIENT_CPL_ASINGREDIENTS](vues.md#as-bl-client-cpl-asingredients), [AS_BONCOMMANDE_FILLE_AVEC_PRIX](vues.md#as-boncommande-fille-avec-prix), [AS_BONDECOMMANDE_CPL](vues.md#as-bondecommande-cpl), [AS_BONDECOMMANDE_FILLE_CPL](vues.md#as-bondecommande-fille-cpl), [AS_BONDECOMMANDE_LIVRE](vues.md#as-bondecommande-livre), [AS_BONDELIVRAISON_LIBCPL](vues.md#as-bondelivraison-libcpl), [AS_BONLIVRFILLE_CLIENT_CPL](vues.md#as-bonlivrfille-client-cpl), [AS_BONLIVRFILLE_CLIENT_CPL2](vues.md#as-bonlivrfille-client-cpl2), [AS_INGREDIENTS_CONSOMMABLE](vues.md#as-ingredients-consommable), [AS_INGREDIENTS_LIB](vues.md#as-ingredients-lib), [AS_INGREDIENTS_LIB2](vues.md#as-ingredients-lib2), [AS_INGREDIENTS_LIB_PIECE](vues.md#as-ingredients-lib-piece), [AS_INGREDIENTS_MAGASIN](vues.md#as-ingredients-magasin), [AS_INGREDIENTS_NON_VENTE](vues.md#as-ingredients-non-vente), [AS_INGREDIENTS_PRODUIT_FINIE](vues.md#as-ingredients-produit-finie), [AS_INGREDIENTXMAGASIN2](vues.md#as-ingredientxmagasin2), [AS_INGREDIENT_MAINTENANCE_LIB](vues.md#as-ingredient-maintenance-lib), [AS_INGREDIENT_VENTE_LIB](vues.md#as-ingredient-vente-lib), [AS_PRODUITS](vues.md#as-produits), [AS_RECETTEBC](vues.md#as-recettebc), [AS_RECETTECOMPOSE](vues.md#as-recettecompose), [AS_RECETTEFAB](vues.md#as-recettefab), [AS_RECETTEFABLIB](vues.md#as-recettefablib), [AS_RECETTEOF](vues.md#as-recetteof), [AS_RECETTEOFABRICATION](vues.md#as-recetteofabrication), [AS_RECETTEOFF](vues.md#as-recetteoff), [AS_RECETTEREC](vues.md#as-recetterec), [AS_RECETTE_LIBCOMPLET](vues.md#as-recette-libcomplet), [AS_RECETTE_LIB_CAT](vues.md#as-recette-lib-cat), [AS_RECETTE_MAINTENANCE_LIB](vues.md#as-recette-maintenance-lib), [AS_RECOFFVUE](vues.md#as-recoffvue), [ATTRIBUTIONELEMENTLIB](vues.md#attributionelementlib), [AUTOMAINTENANCE](vues.md#automaintenance), [AVOIRACHATFILLELIB](vues.md#avoirachatfillelib), [AVOIRFCFILLELIB](vues.md#avoirfcfillelib), [AVOIRFCFILLELIB_PDF](vues.md#avoirfcfillelib-pdf), [BALANCE_CLIENT](vues.md#balance-client), [BATIMENTVIDESANITAIREDETAILLIB](vues.md#batimentvidesanitairedetaillib), [BC_CLIENT_FILLE_CPL_LIB](vues.md#bc-client-fille-cpl-lib), [BC_CLIENT_FILLE_CPL_LIB2](vues.md#bc-client-fille-cpl-lib2), [BC_CLIENT_FILLE_CPL_LIBB](vues.md#bc-client-fille-cpl-libb), [BC_CLIENT_FILLE_CPL_LIB_PDF](vues.md#bc-client-fille-cpl-lib-pdf), [BC_CLIENT_FILLE_CPL_LIB_VISEE](vues.md#bc-client-fille-cpl-lib-visee), [BL_CLIENT_FILLE_BC](vues.md#bl-client-fille-bc), [BONCOMMANDEDETAILSCARTON_CPL](vues.md#boncommandedetailscarton-cpl), [BONCOMMANDEFABDETAILS](vues.md#boncommandefabdetails), [BONDECOMMANDE_CLIENT_FILLE_CPL](vues.md#bondecommande-client-fille-cpl), [BONDECOMMANDE_CLIENT_FILLE_V](vues.md#bondecommande-client-fille-v), [BONDECOMMANDE_OFDETAILS](vues.md#bondecommande-ofdetails), [CARTONFILLE_CPL](vues.md#cartonfille-cpl), [CHARGE_LIB](vues.md#charge-lib), [CHECKINLIBELLE](vues.md#checkinlibelle), [CHECKINSANSCHEKOUTCPL](vues.md#checkinsanschekoutcpl), [COMMANDEFILLECPL](vues.md#commandefillecpl), [COMMANDEFILLE_CPL_LIB](vues.md#commandefille-cpl-lib), [COMMANDEFILLE_V](vues.md#commandefille-v), [COMPTEURELECTRICITECPL](vues.md#compteurelectricitecpl), [CONSOMMABLEMACHINELIB](vues.md#consommablemachinelib), [CONSOMMATIONDETAILSLIB](vues.md#consommationdetailslib), [DEMANDETRANSFERTFILLECPL](vues.md#demandetransfertfillecpl), [DEPENSE_MAT_PREM](vues.md#depense-mat-prem), [DISTRIBUTIONALIMENTDETAIL_LIB](vues.md#distributionalimentdetail-lib), [DMDACHATFILLE_LIB](vues.md#dmdachatfille-lib), [DMDACHATFILLE_LIB_PRD](vues.md#dmdachatfille-lib-prd), [EQUIVALENCECARTONLIB](vues.md#equivalencecartonlib), [ETAT_VENTE_DETAILS_POIDS](vues.md#etat-vente-details-poids), [FABNONRATTACHE](vues.md#fabnonrattache), [FABRICATIONFILLEAUTOCOMPLETE](vues.md#fabricationfilleautocomplete), [FABRICATIONFILLECPL](vues.md#fabricationfillecpl), [FABRICATIONFILLECPL2](vues.md#fabricationfillecpl2), [FABRICATIONFILLEPETRI](vues.md#fabricationfillepetri), [FABRICATIONFILLEPU](vues.md#fabricationfillepu), [FACTFRNSFILLEAUTOCOMPLETE](vues.md#factfrnsfilleautocomplete), [FACTUREDECLARATIONFILLECPL](vues.md#facturedeclarationfillecpl), [FACTUREFOURNISSEURFILLECPL](vues.md#facturefournisseurfillecpl), [FACTUREFOURNISSEURFILLE_U](vues.md#facturefournisseurfille-u), [FACTUREFOURNISSEUR_FILLE_ECR](vues.md#facturefournisseur-fille-ecr), [FACTUREFOURNISSEUR_FL_TVA](vues.md#facturefournisseur-fl-tva), [FFAVECPERTE_FF](vues.md#ffavecperte-ff), [FFAVECPERTE_FF_IDPG](vues.md#ffavecperte-ff-idpg), [FFFILLECPL_MONTANT](vues.md#fffillecpl-montant), [FFFILLECPL_VISEE](vues.md#fffillecpl-visee), [FFFILLERESTEALIVRER](vues.md#fffillerestealivrer), [FREQUENCE_PANNE_MACHINE](vues.md#frequence-panne-machine), [FUMIGATION_LIB](vues.md#fumigation-lib), [HISTORIQUEPRIXLIB](vues.md#historiqueprixlib), [INFOSAUTOLIB](vues.md#infosautolib), [INVENTAIREFILLEAUTOCOMPLETE](vues.md#inventairefilleautocomplete), [INVENTAIREFILLELIB](vues.md#inventairefillelib), [INVENTAIREFILLETYPEMVT](vues.md#inventairefilletypemvt), [INVENTAIREFILLEUPDATE](vues.md#inventairefilleupdate), [INVENTAIRE_FILLE_CPL](vues.md#inventaire-fille-cpl), [LOT_LIB](vues.md#lot-lib), [MAGASINLIB](vues.md#magasinlib), [MAGASINLIBCOMPTA](vues.md#magasinlibcompta), [MONTANT_STOCK](vues.md#montant-stock), [MONTANT_STOCK_ENG](vues.md#montant-stock-eng), [MVTSTOCKFILLEAUTOCOMPLETE](vues.md#mvtstockfilleautocomplete), [MVTSTOCKFILLECPTSTOCK](vues.md#mvtstockfillecptstock), [MVTSTOCKFILLEENTREEFAB](vues.md#mvtstockfilleentreefab), [MVTSTOCKFILLEFABOFCATVISE](vues.md#mvtstockfillefabofcatvise), [MVTSTOCKFILLEFABOFCATVISETOUS](vues.md#mvtstockfillefabofcatvisetous), [MVTSTOCKFILLEGRP](vues.md#mvtstockfillegrp), [MVTSTOCKFILLEGRPVARIATION](vues.md#mvtstockfillegrpvariation), [MVTSTOCKFILLELIB](vues.md#mvtstockfillelib), [MVTSTOCKFILLELIB_ENG](vues.md#mvtstockfillelib-eng), [MVTSTOCKFILLELIB_VISE](vues.md#mvtstockfillelib-vise), [MVTSTOCKFILLESORITEFAB](vues.md#mvtstockfillesoritefab), [MVTSTOCKPRODUIT](vues.md#mvtstockproduit), [NOMBRE_PANNE_MACHINE](vues.md#nombre-panne-machine), [OFFILLELIB](vues.md#offillelib), [OFFILLELIBQTERESTE](vues.md#offillelibqtereste), [OFFILLELIBSTOCK](vues.md#offillelibstock), [OFFILLELIBSTOCKIA](vues.md#offillelibstockia), [OFNONRATTACHE](vues.md#ofnonrattache), [OFNONRATTACHEREEL](vues.md#ofnonrattachereel), [PACKINGLISTACHATFILLELIB](vues.md#packinglistachatfillelib), [PACKINGLISTACHATFILLEUNITE](vues.md#packinglistachatfilleunite), [PLANNING_CPL](vues.md#planning-cpl), [PREVISIONFERMELIB](vues.md#previsionfermelib), [PROCESSFABPETRI](vues.md#processfabpetri), [PRODUITCOMMANDECARTON](vues.md#produitcommandecarton), [PRODUITCOMMANDEFILLECARTON](vues.md#produitcommandefillecarton), [PRODUIT_LIB](vues.md#produit-lib), [PRODUIT_LIBCPL](vues.md#produit-libcpl), [PROFORMADETAILS_CPL](vues.md#proformadetails-cpl), [PROFORMADETAILS_CPL2](vues.md#proformadetails-cpl2), [PROFORMADETAILS_CPL_ING](vues.md#proformadetails-cpl-ing), [PROFORMADETAILS_CPL_ING_PDF](vues.md#proformadetails-cpl-ing-pdf), [PROFORMAMONTANTLEGER](vues.md#proformamontantleger), [PROFORMAMONTANTLEGER2](vues.md#proformamontantleger2), [PROFORMA_DETAILS_VIDE](vues.md#proforma-details-vide), [RAPPROCHEMENTGLOBALE_PIE](vues.md#rapprochementglobale-pie), [RECETTEMONTANT](vues.md#recettemontant), [RECETTE_FILLE_LIB](vues.md#recette-fille-lib), [RECETTE_MERE_LIB](vues.md#recette-mere-lib), [REMISEFILLELIB](vues.md#remisefillelib), [REMISEFILLEMERELIB](vues.md#remisefillemerelib), [RESERVATIONDETAILSAVECMERE](vues.md#reservationdetailsavecmere), [RISTOURNEDETAILS_LIB](vues.md#ristournedetails-lib), [STAT_DEPENSE_CAT](vues.md#stat-depense-cat), [STAT_DEPENSE_MAT_PREM](vues.md#stat-depense-mat-prem), [STOCKETDEPENSEFABNC](vues.md#stocketdepensefabnc), [STOCKETDEPENSEFABTHE](vues.md#stocketdepensefabthe), [STOCKETDEPENSEFABTHECAT](vues.md#stocketdepensefabthecat), [STOCKETDEPENSEOFFABTHE](vues.md#stocketdepenseoffabthe), [STOCKETDEPENSEOFFABTHECAT](vues.md#stocketdepenseoffabthecat), [STOCKETDEPENSEOFFILLEFABTHE](vues.md#stocketdepenseoffillefabthe), [STOCKETDEPENSEOFFILLETHECAT](vues.md#stocketdepenseoffillethecat), [ST_INGREDIENTSAUTO](vues.md#st-ingredientsauto), [ST_INGREDIENTSAUTOACHAT_EUR](vues.md#st-ingredientsautoachat-eur), [ST_INGREDIENTSAUTOACHAT_USD](vues.md#st-ingredientsautoachat-usd), [ST_INGREDIENTSAUTOCHAMBRE](vues.md#st-ingredientsautochambre), [ST_INGREDIENTSAUTOSERVICE](vues.md#st-ingredientsautoservice), [ST_INGREDIENTSAUTOVENTE](vues.md#st-ingredientsautovente), [ST_INGREDIENTSVENTEPOS](vues.md#st-ingredientsventepos), [ST_INGREDIENTSVENTEPOS_REM](vues.md#st-ingredientsventepos-rem), [TABLEAUBORDBC](vues.md#tableaubordbc), [TARIF_INGREDIENTS_LIB](vues.md#tarif-ingredients-lib), [TARIF_INGREDIENTS_MAX_LIB](vues.md#tarif-ingredients-max-lib), [TEMPSMOYENPANNES](vues.md#tempsmoyenpannes), [TRANSFERTSTOCKDETAILSCPL](vues.md#transfertstockdetailscpl), [UPDATEVENTEDETAILS](vues.md#updateventedetails), [VENTEDETCALCREMGLOVISE](vues.md#ventedetcalcremglovise), [VENTEDETMERECATINGRCATCLIENT](vues.md#ventedetmerecatingrcatclient), [VENTEMONTANTLEGER](vues.md#ventemontantleger), [VENTE_CPL_ANALYSEF](vues.md#vente-cpl-analysef), [VENTE_DETAILS_ANALYSE](vues.md#vente-details-analyse), [VENTE_DETAILS_CPL](vues.md#vente-details-cpl), [VENTE_DETAILS_CPL_2](vues.md#vente-details-cpl-2), [VENTE_DETAILS_LIB](vues.md#vente-details-lib), [VENTE_DETAILS_POIDS_ING](vues.md#vente-details-poids-ing), [VENTE_DETAILS_RESTE](vues.md#vente-details-reste), [VENTE_DETAILS_TICKET](vues.md#vente-details-ticket), [VENTE_DETAILS_VIDE](vues.md#vente-details-vide), [VENTE_DETAILS_VIDEAUTOCOMPLETE](vues.md#vente-details-videautocomplete), [VUE_SUIVI_CARTON](vues.md#vue-suivi-carton), [V_DUREE_TRAVAUX_MACHINE](vues.md#v-duree-travaux-machine), [V_ETATSTOCK_ENTREE](vues.md#v-etatstock-entree), [V_ETATSTOCK_ENTREE_STANDARD](vues.md#v-etatstock-entree-standard), [V_ETATSTOCK_ING](vues.md#v-etatstock-ing), [V_ETATSTOCK_ING_ALL](vues.md#v-etatstock-ing-all), [V_ETATSTOCK_ING_ENG](vues.md#v-etatstock-ing-eng), [V_ETATSTOCK_ING_ENG_SOMME](vues.md#v-etatstock-ing-eng-somme), [V_ETATSTOCK_ING_GP_PDF](vues.md#v-etatstock-ing-gp-pdf), [V_ETATSTOCK_ING_MAGASIN](vues.md#v-etatstock-ing-magasin), [V_ETATSTOCK_ING_POINT](vues.md#v-etatstock-ing-point), [V_ETATSTOCK_ING_TOUS](vues.md#v-etatstock-ing-tous), [V_ETATSTOCK_ING_VENTE](vues.md#v-etatstock-ing-vente), [V_ETATSTOCK_PROD_FINI](vues.md#v-etatstock-prod-fini), [V_ETATSTOCK_PROD_FINI2](vues.md#v-etatstock-prod-fini2), [V_INVENTAIREFILLECPL](vues.md#v-inventairefillecpl).

Références dans le code : [produits/Ingredients.java:319](<../../projet-standard - Copie/arbiochem-ejb/src/java/produits/Ingredients.java#L319>), [annexe/type-produit/inc/listeproduit.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/type-produit/inc/listeproduit.jsp#L27>), [stat/EtatStockProduitFini.java:57](<../../projet-standard - Copie/arbiochem-ejb/src/java/stat/EtatStockProduitFini.java#L57>), [stock/EtatStock.java:159](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStock.java#L159>), [stock/EtatStockAvecEngagement.java:41](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStockAvecEngagement.java#L41>) ; 14 autres fichiers dans `usages-code.json`.

<a id="as-ingredient-maintenance"></a>

## AS_INGREDIENT_MAINTENANCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `IDINGREDIENT` | `VARCHAR2(250 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `IDENTITE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `REFERENCEOBJET` | `VARCHAR2(250 BYTE)` | Oui |  |
| `MARQUEOBJET` | `VARCHAR2(250 BYTE)` | Oui |  |
| `MODELEOBJET` | `VARCHAR2(250 BYTE)` | Oui |  |
| `NUMEROSERIEOBJET` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DESCRIPTIONOBJET` | `VARCHAR2(250 BYTE)` | Oui |  |
| `QUALITEOBJET` | `VARCHAR2(250 BYTE)` | Oui | FK → QUALITESOBJETMAINTENANCE |
| `ETATOBJET` | `VARCHAR2(250 BYTE)` | Oui | FK → ETATOBJETMAINTENANCE |
| `LOCALISATIONOBJET` | `VARCHAR2(250 BYTE)` | Oui |  |
| `PUISSANCEOBJET` | `VARCHAR2(250 BYTE)` | Oui |  |
| `OBSERVATIONOBJET` | `VARCHAR2(250 BYTE)` | Oui |  |
| `TYPERATTACHEMENT` | `VARCHAR2(250 BYTE)` | Oui |  |
| `ESTENGIN` | `NUMBER(2,0)` | Oui |  |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `DATEAQUISITION` | `DATE` | Oui |  |
| `IDLIGNE` | `VARCHAR2(40 BYTE)` | Oui |  |
| `IDDEPARTEMENT` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SYS_C007026` (primaire) : `ID`.

Clés étrangères sortantes :

- [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ETATOBJET` → [ETATOBJETMAINTENANCE](tables.md#etatobjetmaintenance).`ID` (`SYS_C007913`, ENABLED).
- [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`QUALITEOBJET` → [QUALITESOBJETMAINTENANCE](tables.md#qualitesobjetmaintenance).`ID` (`SYS_C008024`, ENABLED).
- [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`SYS_C008294`, ENABLED).

Tables qui la référencent :

- [ATTRIBUTIONELEMENT](tables.md#attributionelement).`IDINGREDIENTMAINTENANCE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID`.
- [CONSOMMABLEMACHINE](tables.md#consommablemachine).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID`.
- [CONSOMMATION](tables.md#consommation).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID`.
- [ELEMENTINSPECTIONMACHINE](tables.md#elementinspectionmachine).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID`.
- [HISTORIQUEINSPECTIONMERE](tables.md#historiqueinspectionmere).`IDELEMENT` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID`.
- [INSPECTIONMERE](tables.md#inspectionmere).`IDELEMENT` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID`.
- [INTERDUREEPANNE](tables.md#interdureepanne).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID`.
- [TEMPSOUVERTURE](tables.md#tempsouverture).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID`.

Vues dépendantes directes (28) : [AS_INGREDIENTS_LIB_PIECE](vues.md#as-ingredients-lib-piece), [AS_INGREDIENT_MAINTENANCE_LIB](vues.md#as-ingredient-maintenance-lib), [AS_RECETTE_MAINTENANCE_LIB](vues.md#as-recette-maintenance-lib), [ATTRIBUTIONELEMENTLIB](vues.md#attributionelementlib), [AUTOMAINTENANCE](vues.md#automaintenance), [CONSOMMABLEMACHINELIB](vues.md#consommablemachinelib), [CONSOMMATIONLIB](vues.md#consommationlib), [COUTSMAINTENANCE](vues.md#coutsmaintenance), [DEMANDETRAVAUX_CPL](vues.md#demandetravaux-cpl), [ELEMENTINSPECTIONMACHINELIB](vues.md#elementinspectionmachinelib), [FABNONRATTACHE](vues.md#fabnonrattache), [FACTUREFOURNISSEURAVECMACHINE](vues.md#facturefournisseuravecmachine), [FREQUENCE_PANNE_MACHINE](vues.md#frequence-panne-machine), [HISTORIQUEINSPECTIONLIB](vues.md#historiqueinspectionlib), [INSPECTIONFILLECPL](vues.md#inspectionfillecpl), [INSPECTIONFILLELIB](vues.md#inspectionfillelib), [MTBFDETAIL](vues.md#mtbfdetail), [NOMBRE_PANNE_MACHINE](vues.md#nombre-panne-machine), [ORDRETRAVAUXFILLELIB](vues.md#ordretravauxfillelib), [OTRAVFILLELIBSTOCK](vues.md#otravfillelibstock), [PIECEMACHINELIB](vues.md#piecemachinelib), [PLANNING_CPL](vues.md#planning-cpl), [SOCOBISMAINTENANCE0203](vues.md#socobismaintenance0203), [TAUXDISPONIBILITEMACHINE](vues.md#tauxdisponibilitemachine), [TEMPSMOYENPANNES](vues.md#tempsmoyenpannes), [TEMPSOUVERTURELIB](vues.md#tempsouverturelib), [TRAVAUXFILLECPL](vues.md#travauxfillecpl), [V_DUREE_TRAVAUX_MACHINE](vues.md#v-duree-travaux-machine).

Références dans le code : [maintenance/ressources/IngredientMaintenance.java:170](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/ressources/IngredientMaintenance.java#L170>), [compteur/valeur-actuel-electricite.jsp:26](<../../projet-standard - Copie/arbiochem-war/web/pages/compteur/valeur-actuel-electricite.jsp#L26>), [inspection/inspection-saisie.jsp:37](<../../projet-standard - Copie/arbiochem-war/web/pages/inspection/inspection-saisie.jsp#L37>), [maintenance/ressources/consommable-machine-saisie.jsp:48](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/consommable-machine-saisie.jsp#L48>), [maintenance/ressources/consommation-saisie.jsp:36](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/consommation-saisie.jsp#L36>) ; 3 autres fichiers dans `usages-code.json`.

<a id="as-recette"></a>

## AS_RECETTE

Composition des produits par ingrédients et quantités.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDPRODUITS` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDINGREDIENTS` | `VARCHAR2(100 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `UNITE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `QUANTITE` | `NUMBER(30,10)` | Oui |  |

Clés : `SYS_C007030` (primaire) : `ID`.

Clés étrangères sortantes :

- [AS_RECETTE](tables.md#as-recette).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`SYS_C008290`, ENABLED).

Vues dépendantes directes (7) : [AS_RECETTECOMPOSE](vues.md#as-recettecompose), [AS_RECETTEREC](vues.md#as-recetterec), [AS_RECETTE_LIBCOMPLET](vues.md#as-recette-libcomplet), [AS_RECETTE_MAINTENANCE_LIB](vues.md#as-recette-maintenance-lib), [RECETTEMONTANT](vues.md#recettemontant), [ST_INGREDIENTSVENTEPOS](vues.md#st-ingredientsventepos), [ST_INGREDIENTSVENTEPOS_REM](vues.md#st-ingredientsventepos-rem).

Références dans le code : [produits/Recette.java:237](<../../projet-standard - Copie/arbiochem-ejb/src/java/produits/Recette.java#L237>), [produits/RecetteFab.java:7](<../../projet-standard - Copie/arbiochem-ejb/src/java/produits/RecetteFab.java#L7>).

<a id="as-recettefabrication"></a>

## AS_RECETTEFABRICATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDINGREDIENTS` | `VARCHAR2(200 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `UNITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `QTEAV` | `NUMBER(30,5)` | Oui |  |
| `QUANTITE` | `NUMBER(30,10)` | Oui |  |
| `IDPRODUITS` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SYS_C007032` (primaire) : `ID`.

Clés étrangères sortantes :

- [AS_RECETTEFABRICATION](tables.md#as-recettefabrication).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`SYS_C008292`, ENABLED).

Vues dépendantes directes (1) : [AS_RECETTEFABLIB](vues.md#as-recettefablib).

Références dans le code : [fabrication/Fabrication.java:167](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/Fabrication.java#L167>).

<a id="as-recetteofffabtable"></a>

## AS_RECETTEOFFFABTABLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDINGREDIENTS` | `VARCHAR2(200 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `UNITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `QTEAV` | `NUMBER(30,5)` | Oui |  |
| `QUANTITE` | `NUMBER(30,10)` | Oui |  |
| `IDPRODUITS` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDUNITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPOSE` | `NUMBER` | Oui |  |
| `NIVEAU` | `NUMBER` | Oui |  |

Clés : `SYS_C007034` (primaire) : `ID`.

Clés étrangères sortantes :

- [AS_RECETTEOFFFABTABLE](tables.md#as-recetteofffabtable).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`SYS_C008291`, ENABLED).

Vues dépendantes directes (1) : [AS_RECOFFVUE](vues.md#as-recoffvue).

Références dans le code : [fabrication/OfFille.java:68](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/OfFille.java#L68>).

<a id="as-recette-back"></a>

## AS_RECETTE_BACK

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non |  |
| `IDPRODUITS` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDINGREDIENTS` | `VARCHAR2(100 BYTE)` | Oui |  |
| `QUANTITE` | `NUMBER(10,3)` | Oui |  |
| `UNITE` | `VARCHAR2(50 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="as-unite"></a>

## AS_UNITE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `ACTIF` | `NUMBER` | Oui |  |

Clés : `PK_ASUNITE` (primaire) : `ID`.

Tables qui la référencent :

- [AS_BONDECOMMANDE_FILLE](tables.md#as-bondecommande-fille).`UNITE` → [AS_UNITE](tables.md#as-unite).`ID`.
- [AS_BONDELIVRAISON_FILLE](tables.md#as-bondelivraison-fille).`UNITE` → [AS_UNITE](tables.md#as-unite).`ID`.
- [AS_INGREDIENTS](tables.md#as-ingredients).`UNITE` → [AS_UNITE](tables.md#as-unite).`ID`.
- [CONSOMMABLEMACHINE](tables.md#consommablemachine).`IDUNITE` → [AS_UNITE](tables.md#as-unite).`ID`.
- [CONSOMMATIONDETAILS](tables.md#consommationdetails).`IDUNITE` → [AS_UNITE](tables.md#as-unite).`ID`.
- [PROFORMA_DETAILS](tables.md#proforma-details).`UNITE` → [AS_UNITE](tables.md#as-unite).`ID`.
- [TEMPSOUVERTURE](tables.md#tempsouverture).`IDUNITE` → [AS_UNITE](tables.md#as-unite).`ID`.

Vues dépendantes directes (76) : [ALIMENTPOUSSIN_LIBCOMPLET](vues.md#alimentpoussin-libcomplet), [AS_BLCLFILLEGRP_VENTE_CPL_V](vues.md#as-blclfillegrp-vente-cpl-v), [AS_BLCLFILLEGRP_VENTE_CPL_V2](vues.md#as-blclfillegrp-vente-cpl-v2), [AS_BONDECOMMANDE_CPL](vues.md#as-bondecommande-cpl), [AS_BONDECOMMANDE_FILLE_CPL](vues.md#as-bondecommande-fille-cpl), [AS_BONDELIVRAISON_LIBCPL](vues.md#as-bondelivraison-libcpl), [AS_BONLIVRFILLE_CLIENT_CPL](vues.md#as-bonlivrfille-client-cpl), [AS_BONLIVRFILLE_CLIENT_CPL2](vues.md#as-bonlivrfille-client-cpl2), [AS_INGREDIENTS_LIB](vues.md#as-ingredients-lib), [AS_INGREDIENTS_LIB2](vues.md#as-ingredients-lib2), [AS_INGREDIENTS_LIB_PIECE](vues.md#as-ingredients-lib-piece), [AS_INGREDIENTS_PRODUIT_FINIE](vues.md#as-ingredients-produit-finie), [AS_INGREDIENT_VENTE_LIB](vues.md#as-ingredient-vente-lib), [AS_RECETTECOMPOSE](vues.md#as-recettecompose), [AS_RECETTEFAB](vues.md#as-recettefab), [AS_RECETTEFABLIB](vues.md#as-recettefablib), [AS_RECETTEREC](vues.md#as-recetterec), [AS_RECETTE_LIBCOMPLET](vues.md#as-recette-libcomplet), [AS_RECETTE_MAINTENANCE_LIB](vues.md#as-recette-maintenance-lib), [AS_UNITE_ACTIF](vues.md#as-unite-actif), [BATIMENTVIDESANITAIREDETAILLIB](vues.md#batimentvidesanitairedetaillib), [BC_CLIENT_FILLE_CPL_LIB](vues.md#bc-client-fille-cpl-lib), [BC_CLIENT_FILLE_CPL_LIB2](vues.md#bc-client-fille-cpl-lib2), [BC_CLIENT_FILLE_CPL_LIBB](vues.md#bc-client-fille-cpl-libb), [BC_CLIENT_FILLE_CPL_LIB_PDF](vues.md#bc-client-fille-cpl-lib-pdf), [BONDECOMMANDE_CLIENT_FILLE_V](vues.md#bondecommande-client-fille-v), [COMMANDEFILLE_CPL_LIB](vues.md#commandefille-cpl-lib), [COMMANDEFILLE_V](vues.md#commandefille-v), [CONSOMMABLEMACHINELIB](vues.md#consommablemachinelib), [CONSOMMATIONDETAILSLIB](vues.md#consommationdetailslib), [DMDACHATFILLE_LIB](vues.md#dmdachatfille-lib), [FABRICATIONFILLECPL](vues.md#fabricationfillecpl), [FABRICATIONFILLEPRATIQUE](vues.md#fabricationfillepratique), [FACTUREFOURNISSEURFILLE_U](vues.md#facturefournisseurfille-u), [FFFILLERESTEALIVRER](vues.md#fffillerestealivrer), [MVTSTOCKFILLELIB](vues.md#mvtstockfillelib), [OFFILLELIB](vues.md#offillelib), [OFFILLELIBQTERESTE](vues.md#offillelibqtereste), [OFFILLELIBSTOCK](vues.md#offillelibstock), [OFFILLELIBSTOCKIA](vues.md#offillelibstockia), [ORDRETRAVAUXFILLELIB](vues.md#ordretravauxfillelib), [OTRAVFILLELIBSTOCK](vues.md#otravfillelibstock), [PACKINGLISTACHATFILLEUNITE](vues.md#packinglistachatfilleunite), [PRODUIT_LIB](vues.md#produit-lib), [PRODUIT_LIBCPL](vues.md#produit-libcpl), [PROFORMADETAILS_CPL](vues.md#proformadetails-cpl), [PROFORMADETAILS_CPL2](vues.md#proformadetails-cpl2), [PROFORMADETAILS_CPL_ING](vues.md#proformadetails-cpl-ing), [PROFORMADETAILS_CPL_ING_PDF](vues.md#proformadetails-cpl-ing-pdf), [PROFORMA_DETAILS_VIDE](vues.md#proforma-details-vide), [RAPPROCHEMENT_BF_CLIENT](vues.md#rapprochement-bf-client), [RECETTE_FILLE_LIB](vues.md#recette-fille-lib), [ST_INGREDIENTSAUTO](vues.md#st-ingredientsauto), [ST_INGREDIENTSVENTEPOS](vues.md#st-ingredientsventepos), [ST_INGREDIENTSVENTEPOS_REM](vues.md#st-ingredientsventepos-rem), [TARIF_INGREDIENTS_LIB](vues.md#tarif-ingredients-lib), [TARIF_INGREDIENTS_MAX_LIB](vues.md#tarif-ingredients-max-lib), [TEMPSOUVERTURELIB](vues.md#tempsouverturelib), [TRANSFERTSTOCKDETAILSCPL](vues.md#transfertstockdetailscpl), [TRAVAUXFILLECPL](vues.md#travauxfillecpl), [VENTE_DETAILS_POIDS_ING](vues.md#vente-details-poids-ing), [VENTE_DETAILS_RESTE](vues.md#vente-details-reste), [VENTE_DETAILS_VIDE](vues.md#vente-details-vide), [V_ETATSTOCK_ENTREE](vues.md#v-etatstock-entree), [V_ETATSTOCK_ENTREE_STANDARD](vues.md#v-etatstock-entree-standard), [V_ETATSTOCK_ING](vues.md#v-etatstock-ing), [V_ETATSTOCK_ING_ALL](vues.md#v-etatstock-ing-all), [V_ETATSTOCK_ING_ENG](vues.md#v-etatstock-ing-eng), [V_ETATSTOCK_ING_ENG_SOMME](vues.md#v-etatstock-ing-eng-somme), [V_ETATSTOCK_ING_MAGASIN](vues.md#v-etatstock-ing-magasin), [V_ETATSTOCK_ING_POINT](vues.md#v-etatstock-ing-point), [V_ETATSTOCK_ING_TOUS](vues.md#v-etatstock-ing-tous), [V_ETATSTOCK_ING_VENTE](vues.md#v-etatstock-ing-vente), [V_ETATSTOCK_PROD_FINI](vues.md#v-etatstock-prod-fini), [V_ETATSTOCK_PROD_FINI2](vues.md#v-etatstock-prod-fini2), [V_INVENTAIREFILLECPL](vues.md#v-inventairefillecpl).

Références dans le code : [produits/RecetteLib.java:152](<../../projet-standard - Copie/arbiochem-ejb/src/java/produits/RecetteLib.java#L152>), [annexe/produit/produit-liste-arbiochem.jsp:36](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/produit/produit-liste-arbiochem.jsp#L36>), [annexe/produit/produit-liste.jsp:35](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/produit/produit-liste.jsp#L35>), [maintenance/ressources/machine/composition-machine-saisie.jsp:18](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/machine/composition-machine-saisie.jsp#L18>), [produits/as-ingredients-liste.jsp:30](<../../projet-standard - Copie/arbiochem-war/web/pages/produits/as-ingredients-liste.jsp#L30>) ; 12 autres fichiers dans `usages-code.json`.

<a id="attacher-fichier"></a>

## ATTACHER_FICHIER

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non |  |
| `CHEMIN` | `VARCHAR2(100 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `MERE` | `VARCHAR2(50 BYTE)` | Non |  |
| `DATY` | `TIMESTAMP(6)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : [fichier/AttacherFichier.java:58](<../../projet-standard - Copie/arbiochem-ejb/src/java/fichier/AttacherFichier.java#L58>).

<a id="attributionelement"></a>

## ATTRIBUTIONELEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDINGREDIENTMAINTENANCE` | `VARCHAR2(255 BYTE)` | Oui | FK → AS_INGREDIENT_MAINTENANCE |
| `IDPERSONNEL` | `VARCHAR2(255 BYTE)` | Oui | FK → PERSONNEL |
| `DATY` | `DATE` | Non |  |
| `ETATELEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → QUALITESOBJETMAINTENANCE |
| `TYPEATTRIBUTION` | `NUMBER` | Oui |  |
| `QTE` | `NUMBER` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `PK_ATTRIBUTIONELEMENT` (primaire) : `ID`.

Clés étrangères sortantes :

- [ATTRIBUTIONELEMENT](tables.md#attributionelement).`IDINGREDIENTMAINTENANCE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` (`FK_ATTRELEMENT_ING`, ENABLED).
- [ATTRIBUTIONELEMENT](tables.md#attributionelement).`IDPERSONNEL` → [PERSONNEL](tables.md#personnel).`ID` (`FK_ATTRELEMENT_PERS`, ENABLED).
- [ATTRIBUTIONELEMENT](tables.md#attributionelement).`ETATELEMENT` → [QUALITESOBJETMAINTENANCE](tables.md#qualitesobjetmaintenance).`ID` (`FK_ATTRIBUTIONELEMENT_ETAT`, ENABLED).

Vues dépendantes directes (2) : [ATTRIBUTIONELEMENTLIB](vues.md#attributionelementlib), [DERNIERATTRIBUTIONELEMENT](vues.md#dernierattributionelement).

Références dans le code : [maintenance/configuration/AttributionElement.java:23](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/configuration/AttributionElement.java#L23>).

<a id="autocarburant"></a>

## AUTOCARBURANT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDAUTO` | `VARCHAR2(50 BYTE)` | Oui |  |
| `MONTANT` | `NUMBER(10,2)` | Oui |  |
| `ODOMETRE` | `NUMBER(10,2)` | Oui |  |
| `VOLUME` | `NUMBER(10,0)` | Oui |  |

Clés : `SYS_C007042` (primaire) : `ID`.

Références dans le code : [maintenance/ressources/Autocarburant.java:14](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/ressources/Autocarburant.java#L14>).

<a id="avance"></a>

## AVANCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non |  |
| `IDTYPEAVANCE` | `VARCHAR2(100 BYTE)` | Non | FK → TYPEAVANCE |
| `IDPERSONNEL` | `VARCHAR2(100 BYTE)` | Non |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `NBREMBOURSEMENT` | `NUMBER(*,0)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `DATEAVANCE` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `INTERET` | `NUMBER(38,2)` | Non |  |
| `DATEDEBLOCAGE` | `DATE` | Oui |  |
| `DATEDEBUTREMBOURSEMENT` | `DATE` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MOIS` | `NUMBER(38,0)` | Oui |  |
| `DATESAISIE` | `DATE` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Clés étrangères sortantes :

- [AVANCE](tables.md#avance).`IDTYPEAVANCE` → [TYPEAVANCE](tables.md#typeavance).`ID` (`AVANCE_TYPE_FK`, ENABLED).

Vues dépendantes directes (3) : [AVANCE_LIB](vues.md#avance-lib), [AVANCE_LIB2](vues.md#avance-lib2), [REMBOURSEMENTLIB](vues.md#remboursementlib).

Références dans le code : [paie/avance/Avance.java:87](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/avance/Avance.java#L87>), [paie/avance/avance-quinzaine-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avance/avance-quinzaine-saisie.jsp#L13>), [paie/avance/avance-saisie.jsp:18](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avance/avance-saisie.jsp#L18>), [paie/edition/EditionCalcul.java:188](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/EditionCalcul.java#L188>).

<a id="avoirachat"></a>

## AVOIRACHAT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Non | FK → MAGASIN2 |
| `DATY` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(32,0)` | Oui |  |
| `IDFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Non | FK → FOURNISSEUR |
| `IDFACTURE` | `VARCHAR2(255 BYTE)` | Oui | FK → FACTUREFOURNISSEUR |
| `REMISE` | `NUMBER(30,2)` | Oui |  |

Clés : `PK_AVOIRACHAT` (primaire) : `ID`.

Clés étrangères sortantes :

- [AVOIRACHAT](tables.md#avoirachat).`IDFACTURE` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID` (`FK_AVOIRACHAT_FACTURE`, ENABLED).
- [AVOIRACHAT](tables.md#avoirachat).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` (`FK_AVOIRACHAT_FOURNISSEUR`, ENABLED).
- [AVOIRACHAT](tables.md#avoirachat).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` (`FK_AVOIRACHAT_MAGASIN`, ENABLED).

Tables qui la référencent :

- [AVOIRACHATFILLE](tables.md#avoirachatfille).`IDMERE` → [AVOIRACHAT](tables.md#avoirachat).`ID`.

Vues dépendantes directes (3) : [AVOIRACHATCALC](vues.md#avoirachatcalc), [AVOIRACHATCALCGROUPEORIGINE](vues.md#avoirachatcalcgroupeorigine), [AVOIRACHATLIB](vues.md#avoirachatlib).

Références dans le code : [avoir/AvoirAchat.java:34](<../../projet-standard - Copie/arbiochem-ejb/src/java/avoir/AvoirAchat.java#L34>), [facturefournisseur/avoir/avoirachat-arbiochem-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/avoir/avoirachat-arbiochem-saisie.jsp#L21>), [facturefournisseur/avoir/avoirachat-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/avoir/avoirachat-saisie.jsp#L21>).

<a id="avoirachatfille"></a>

## AVOIRACHATFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Non | FK → AVOIRACHAT |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Non | FK → AS_INGREDIENTS |
| `QTE` | `NUMBER(32,2)` | Oui |  |
| `PU` | `NUMBER(32,2)` | Oui |  |
| `REMISE` | `NUMBER(32,2)` | Oui |  |
| `TVA` | `NUMBER(32,2)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(255 BYTE)` | Non | FK → DEVISE |
| `TAUX` | `NUMBER(32,2)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDFACTUREDETAILS` | `VARCHAR2(255 BYTE)` | Non | FK → FACTUREFOURNISSEURFILLE |
| `RISTOURNE` | `NUMBER(30,2)` | Oui |  |
| `TAUXDECHANGE` | `NUMBER(30,2)` | Oui |  |

Clés : `PK_AVOIRFILLE` (primaire) : `ID`.

Clés étrangères sortantes :

- [AVOIRACHATFILLE](tables.md#avoirachatfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`FK_AVOIRFILLE_DEV`, ENABLED).
- [AVOIRACHATFILLE](tables.md#avoirachatfille).`IDFACTUREDETAILS` → [FACTUREFOURNISSEURFILLE](tables.md#facturefournisseurfille).`ID` (`FK_AVOIRFILLE_FACDET`, ENABLED).
- [AVOIRACHATFILLE](tables.md#avoirachatfille).`IDMERE` → [AVOIRACHAT](tables.md#avoirachat).`ID` (`FK_AVOIRFILLE_MERE`, ENABLED).
- [AVOIRACHATFILLE](tables.md#avoirachatfille).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`FK_AVOIRFILLE_PROD`, ENABLED).

Vues dépendantes directes (2) : [AVOIRACHATFILLECALC](vues.md#avoirachatfillecalc), [AVOIRACHATFILLELIB](vues.md#avoirachatfillelib).

Références dans le code : [avoir/AvoirAchatFille.java:41](<../../projet-standard - Copie/arbiochem-ejb/src/java/avoir/AvoirAchatFille.java#L41>), [facturefournisseur/avoir/avoirachat-arbiochem-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/avoir/avoirachat-arbiochem-saisie.jsp#L23>), [facturefournisseur/avoir/avoirachat-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/avoir/avoirachat-saisie.jsp#L23>).

<a id="avoirfc"></a>

## AVOIRFC

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui | FK → MAGASIN2 |
| `DATY` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDCLIENT` | `VARCHAR2(100 BYTE)` | Oui | FK → CLIENT |
| `IDVENTE` | `VARCHAR2(255 BYTE)` | Oui | FK → VENTE |
| `IDMOTIF` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDTYPEAVOIR` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPEAVOIR |
| `NUMAVOIR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDRISTOURNE` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `AVOIRFC_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [AVOIRFC](tables.md#avoirfc).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`AVOIRFC_CLIENT_FK`, ENABLED).
- [AVOIRFC](tables.md#avoirfc).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` (`AVOIRFC_MAGASIN_FK`, ENABLED).
- [AVOIRFC](tables.md#avoirfc).`IDVENTE` → [VENTE](tables.md#vente).`ID` (`AVOIRFC_VENTE_FK`, ENABLED).
- [AVOIRFC](tables.md#avoirfc).`IDTYPEAVOIR` → [TYPEAVOIR](tables.md#typeavoir).`ID` (`FK_AVOIRFC_TYPEAVOIR`, ENABLED).

Tables qui la référencent :

- [AVOIRFCFILLE](tables.md#avoirfcfille).`IDAVOIRFC` → [AVOIRFC](tables.md#avoirfc).`ID`.

Vues dépendantes directes (8) : [AVOIRFCFILLE_GRP_VISEEE](vues.md#avoirfcfille-grp-viseee), [AVOIRFCLIB](vues.md#avoirfclib), [AVOIRFCLIB_PDF](vues.md#avoirfclib-pdf), [AVOIRFCMONTANT](vues.md#avoirfcmontant), [AVOIRFC_MERE_MONTANT](vues.md#avoirfc-mere-montant), [AVOIRFC_MF](vues.md#avoirfc-mf), [AVOIR_MF](vues.md#avoir-mf), [V_NUMEROAVOIR_EN_COURS](vues.md#v-numeroavoir-en-cours).

Références dans le code : [avoir/AvoirFC.java:111](<../../projet-standard - Copie/arbiochem-ejb/src/java/avoir/AvoirFC.java#L111>).

<a id="avoirfcfille"></a>

## AVOIRFCFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDAVOIRFC` | `VARCHAR2(255 BYTE)` | Oui | FK → AVOIRFC |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QTE` | `NUMBER(*,0)` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `REMISE` | `NUMBER(30,2)` | Oui |  |
| `TVA` | `NUMBER(30,2)` | Oui |  |
| `PUACHAT` | `NUMBER(30,2)` | Oui |  |
| `PUVENTE` | `NUMBER(30,2)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `TAUXDECHANGE` | `NUMBER(30,2)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(250 BYTE)` | Oui |  |
| `IDVENTEDETAILS` | `VARCHAR2(255 BYTE)` | Oui | FK → VENTE_DETAILS |
| `TAUX` | `NUMBER(32,2)` | Oui |  |

Clés : `AVOIRFCFILLE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [AVOIRFCFILLE](tables.md#avoirfcfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`AVFCFILLE_DEVISE_FK`, ENABLED).
- [AVOIRFCFILLE](tables.md#avoirfcfille).`IDVENTEDETAILS` → [VENTE_DETAILS](tables.md#vente-details).`ID` (`AVFCFILLE_VENTEDETAIL_FK`, ENABLED).
- [AVOIRFCFILLE](tables.md#avoirfcfille).`IDAVOIRFC` → [AVOIRFC](tables.md#avoirfc).`ID` (`AVOIRFC_MEREFILLE_FK`, ENABLED).

Vues dépendantes directes (6) : [AVOIRFCFILLELIB](vues.md#avoirfcfillelib), [AVOIRFCFILLELIB_PDF](vues.md#avoirfcfillelib-pdf), [AVOIRFCFILLE_GRP](vues.md#avoirfcfille-grp), [AVOIRFCFILLE_GRP_VISEEE](vues.md#avoirfcfille-grp-viseee), [AVOIRFC_MF](vues.md#avoirfc-mf), [AVOIR_MF](vues.md#avoir-mf).

Références dans le code : [avoir/AvoirFCFille.java:50](<../../projet-standard - Copie/arbiochem-ejb/src/java/avoir/AvoirFCFille.java#L50>).

<a id="banque"></a>

## BANQUE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `PK_BANQUE` (primaire) : `ID`.

Tables qui la référencent :

- [BANQUE_AGENCE](tables.md#banque-agence).`IDBANQUE` → [BANQUE](tables.md#banque).`ID`.
- [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`IDBANQUE` → [BANQUE](tables.md#banque).`ID`.

Vues dépendantes directes (3) : [BANQUEAGENCELIB](vues.md#banqueagencelib), [EMPLOYE_COMPLET](vues.md#employe-complet), [TRAITE_LIB](vues.md#traite-lib).

Références dans le code : [facture/escompte-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/facture/escompte-saisie.jsp#L19>), [facture/traite-modif.jsp:14](<../../projet-standard - Copie/arbiochem-war/web/pages/facture/traite-modif.jsp#L14>), [facture/traite-saisie.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/facture/traite-saisie.jsp#L24>), [paie/employe/banqueagence-liste.jsp:26](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/banqueagence-liste.jsp#L26>), [paie/employe/banqueagence-saisie.jsp:35](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/banqueagence-saisie.jsp#L35>) ; 1 autres fichiers dans `usages-code.json`.

<a id="banque-agence"></a>

## BANQUE_AGENCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `NOM` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CODEAGENCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDBANQUE` | `VARCHAR2(255 BYTE)` | Oui | FK → BANQUE |

Clés : `AGENCE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [BANQUE_AGENCE](tables.md#banque-agence).`IDBANQUE` → [BANQUE](tables.md#banque).`ID` (`FK_BANQUE_AGENCE`, ENABLED).

Tables qui la référencent :

- [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`IDAGENCE` → [BANQUE_AGENCE](tables.md#banque-agence).`ID`.

Vues dépendantes directes (2) : [BANQUEAGENCELIB](vues.md#banqueagencelib), [EMPLOYE_COMPLET](vues.md#employe-complet).

Références dans le code : [paie/employe/BanqueAgence.java:16](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/BanqueAgence.java#L16>), [paie/employe/banqueagence-saisie.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/banqueagence-saisie.jsp#L24>).

<a id="batiment"></a>

## BATIMENT

Bâtiment d’élevage : ferme, dimensions, surface, capacité et densité.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDFERME` | `VARCHAR2(50 BYTE)` | Non | FK → MAGASIN2 |
| `NOMBATIMENT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `SURFACE` | `NUMBER(10,2)` | Oui |  |
| `CAPACITE` | `NUMBER(10,2)` | Oui |  |
| `DENSITE` | `NUMBER(10,2)` | Oui |  |
| `LONGUEUR` | `NUMBER(30,5)` | Oui |  |
| `LARGEUR` | `NUMBER(30,5)` | Oui |  |

Clés : `SYS_C007061` (primaire) : `ID`.

Clés étrangères sortantes :

- [BATIMENT](tables.md#batiment).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID` (`FK_BATIMENT_MAGASIN`, ENABLED).

Tables qui la référencent :

- [BATIMENTDETAIL](tables.md#batimentdetail).`IDMERE` → [BATIMENT](tables.md#batiment).`ID`.
- [BATIMENTVIDESANITAIRE](tables.md#batimentvidesanitaire).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID`.
- [DISTRIBUTIONALIMENTDETAIL](tables.md#distributionalimentdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID`.
- [ECLOSION](tables.md#eclosion).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID`.
- [FUMIGATION](tables.md#fumigation).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID`.
- [MIRAGEDETAIL](tables.md#miragedetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID`.
- [MISEENINCUBATEURDETAIL](tables.md#miseenincubateurdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID`.
- [PESEEPOUSSIN](tables.md#peseepoussin).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID`.
- [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID`.
- [SUIVIJOURNALIERDETAIL](tables.md#suivijournalierdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID`.
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDBATIMENTARRIVE` → [BATIMENT](tables.md#batiment).`ID`.
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDBATIMENTDEPART` → [BATIMENT](tables.md#batiment).`ID`.
- [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID`.
- [TRIAGEOEUF](tables.md#triageoeuf).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID`.
- [TRIAGEQUALITEPOUSSINDETAIL](tables.md#triagequalitepoussindetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID`.
- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID`.

Vues dépendantes directes (15) : [BATIMENTVIDESANITAIRE_LIB](vues.md#batimentvidesanitaire-lib), [BATIMENT_LIB](vues.md#batiment-lib), [DISTRIBUTIONALIMENTDETAIL_LIB](vues.md#distributionalimentdetail-lib), [ECLOSION_LIB](vues.md#eclosion-lib), [FUMIGATION_LIB](vues.md#fumigation-lib), [MIRAGEDETAIL_LIB](vues.md#miragedetail-lib), [MISEENINCUBATEURDETAIL_LIB](vues.md#miseenincubateurdetail-lib), [PESEEPOUSSIN_LIB](vues.md#peseepoussin-lib), [RECEPTIONOACDETAIL_LIB](vues.md#receptionoacdetail-lib), [SUIVIJOURNALIERDETAIL_LIB](vues.md#suivijournalierdetail-lib), [TRANSFERTPOULETDETAIL_LIB](vues.md#transfertpouletdetail-lib), [TRIAGEBATPARQUETDETAIL_LIB](vues.md#triagebatparquetdetail-lib), [TRIAGEOEUF_LIB](vues.md#triageoeuf-lib), [TRIAGEQUALITEPOUSSINDETAIL_LIB](vues.md#triagequalitepoussindetail-lib), [VACCINATIONPOUSSINDETAIL_LIB](vues.md#vaccinationpoussindetail-lib).

Références dans le code : [ferme/configuration/Batiment.java:22](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/configuration/Batiment.java#L22>), [ferme/couvoir/miseneincubateur-saisie.jsp:50](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/miseneincubateur-saisie.jsp#L50>), [ferme/couvoir/triagequalitepoussin-saisie.jsp:53](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/triagequalitepoussin-saisie.jsp#L53>), [ferme/production/fumigation-saisie.jsp:54](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/fumigation-saisie.jsp#L54>), [ferme/production/fumigationsimple-saisie.jsp:30](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/fumigationsimple-saisie.jsp#L30>) ; 11 autres fichiers dans `usages-code.json`.

<a id="batimentdetail"></a>

## BATIMENTDETAIL

Association d’un bâtiment avec un parquet, un lot et un sexe ; surface, capacité, densité et effectif.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(50 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUET` | `VARCHAR2(50 BYTE)` | Oui | FK → PARQUET |
| `SURFACE` | `NUMBER(10,2)` | Oui |  |
| `CAPACITE` | `NUMBER(10,2)` | Oui |  |
| `IDLOT` | `VARCHAR2(50 BYTE)` | Oui | FK → LOT |
| `IDSEXE` | `VARCHAR2(50 BYTE)` | Oui | FK → SEXE |
| `EFFECTIF` | `NUMBER(10,2)` | Oui |  |
| `DENSITE` | `NUMBER(10,2)` | Oui |  |

Clés : `SYS_C007062` (primaire) : `ID`.

Clés étrangères sortantes :

- [BATIMENTDETAIL](tables.md#batimentdetail).`IDMERE` → [BATIMENT](tables.md#batiment).`ID` (`FK_BATDET_BATIMENT`, ENABLED).
- [BATIMENTDETAIL](tables.md#batimentdetail).`IDLOT` → [LOT](tables.md#lot).`ID` (`FK_BATDET_LOT`, ENABLED).
- [BATIMENTDETAIL](tables.md#batimentdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` (`FK_BATDET_PARQUET`, ENABLED).
- [BATIMENTDETAIL](tables.md#batimentdetail).`IDSEXE` → [SEXE](tables.md#sexe).`ID` (`FK_BATDET_SEXE`, ENABLED).

Vues dépendantes directes (2) : [BATIMENTDETAIL_LIB](vues.md#batimentdetail-lib), [PARQUET_BATIMENT_LIB](vues.md#parquet-batiment-lib).

Références dans le code : [ferme/configuration/BatimentDetail.java:22](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/configuration/BatimentDetail.java#L22>).

<a id="batimentvidesanitaire"></a>

## BATIMENTVIDESANITAIRE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDBATIMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → BATIMENT |
| `IDRESPONSABLE` | `VARCHAR2(255 BYTE)` | Oui | FK → LOG_PERSONNEL |
| `DATY` | `DATE` | Oui |  |
| `HEUREDEBUT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `HEUREFIN` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SYS_C007063` (primaire) : `ID`.

Clés étrangères sortantes :

- [BATIMENTVIDESANITAIRE](tables.md#batimentvidesanitaire).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` (`FK_BVS_BAT`, ENABLED).
- [BATIMENTVIDESANITAIRE](tables.md#batimentvidesanitaire).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`FK_LOG_P_BAT`, ENABLED).

Tables qui la référencent :

- [BATIMENTVIDESANITAIREDETAIL](tables.md#batimentvidesanitairedetail).`IDMERE` → [BATIMENTVIDESANITAIRE](tables.md#batimentvidesanitaire).`ID`.

Vues dépendantes directes (1) : [BATIMENTVIDESANITAIRE_LIB](vues.md#batimentvidesanitaire-lib).

Références dans le code : [ferme/batiment/BatimentVideSanitaire.java:81](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/batiment/BatimentVideSanitaire.java#L81>), [ferme/batiment/batimentvidesanitaire-saisie.jsp:17](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/batiment/batimentvidesanitaire-saisie.jsp#L17>).

<a id="batimentvidesanitairedetail"></a>

## BATIMENTVIDESANITAIREDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → BATIMENTVIDESANITAIRE |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `QTE` | `NUMBER` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `SYS_C007064` (primaire) : `ID`.

Clés étrangères sortantes :

- [BATIMENTVIDESANITAIREDETAIL](tables.md#batimentvidesanitairedetail).`IDMERE` → [BATIMENTVIDESANITAIRE](tables.md#batimentvidesanitaire).`ID` (`FK_BVSD_BVS`, ENABLED).
- [BATIMENTVIDESANITAIREDETAIL](tables.md#batimentvidesanitairedetail).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`FK_LOG_PERSONNEL_BAT`, ENABLED).

Vues dépendantes directes (1) : [BATIMENTVIDESANITAIREDETAILLIB](vues.md#batimentvidesanitairedetaillib).

Références dans le code : [ferme/batiment/BatimentVideSanitaireDetail.java:78](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/batiment/BatimentVideSanitaireDetail.java#L78>), [ferme/batiment/batimentvidesanitaire-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/batiment/batimentvidesanitaire-saisie.jsp#L19>).

<a id="bilansection"></a>

## BILANSECTION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `KEY` | `VARCHAR2(100 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDPARENT` | `VARCHAR2(100 BYTE)` | Oui | FK → BILANSECTION |
| `TYPE` | `VARCHAR2(1 BYTE)` | Oui |  |

Clés : `BILANSECTION_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [BILANSECTION](tables.md#bilansection).`IDPARENT` → [BILANSECTION](tables.md#bilansection).`ID` (`BILAN_PARENT_FK`, ENABLED).

Tables qui la référencent :

- [BILANSECTION](tables.md#bilansection).`IDPARENT` → [BILANSECTION](tables.md#bilansection).`ID`.
- [BILAN_SECTION_COMPTE](tables.md#bilan-section-compte).`IDBILANSECTION` → [BILANSECTION](tables.md#bilansection).`ID`.

Vues dépendantes directes (1) : [V_BILAN_SECTION_COMPTE_COMPLET](vues.md#v-bilan-section-compte-complet).

Références dans le code : [mg/cnaps/compta/BilanSection.java:31](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/BilanSection.java#L31>).

<a id="bilan-section-compte"></a>

## BILAN_SECTION_COMPTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDBILANSECTION` | `VARCHAR2(100 BYTE)` | Oui | FK → BILANSECTION |
| `COMPTE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `AMORTI` | `NUMBER(*,0)` | Oui |  |

Clés : `BILAN_SECTION_COMPTE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [BILAN_SECTION_COMPTE](tables.md#bilan-section-compte).`IDBILANSECTION` → [BILANSECTION](tables.md#bilansection).`ID` (`BILAN_SECTION_FK`, ENABLED).

Vues dépendantes directes (1) : [V_BILAN_SECTION_COMPTE_COMPLET](vues.md#v-bilan-section-compte-complet).

Références dans le code : [mg/cnaps/compta/BilanSectionCompte.java:29](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/BilanSectionCompte.java#L29>).

<a id="billetagefille"></a>

## BILLETAGEFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(100 BYTE)` | Non |  |
| `BILLET` | `NUMBER` | Non |  |
| `NOMBREBILLET` | `NUMBER` | Non |  |

Clés : `SYS_C007071` (primaire) : `ID`.

Références dans le code : [paie/avance/BilletageFille.java:56](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/avance/BilletageFille.java#L56>), [caisse/mvt/paiement-avance.jsp:32](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/mvt/paiement-avance.jsp#L32>), [paie/caisse/paiement-hs.jsp:31](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/caisse/paiement-hs.jsp#L31>).

<a id="boncommande"></a>

## BONCOMMANDE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `DESIGNATION` | `VARCHAR2(400 BYTE)` | Oui |  |
| `IDMODEPAIEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → MODEPAIEMENT |
| `IDFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → FOURNISSEUR |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ECHEANCEPAIEMENT` | `DATE` | Oui |  |
| `ECHEANCELIVRAISONE` | `DATE` | Oui |  |

Clés : `BONCOMMANDE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [BONCOMMANDE](tables.md#boncommande).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` (`BONCOMMANDE_FOURNISSEUR_FK`, ENABLED).
- [BONCOMMANDE](tables.md#boncommande).`IDMODEPAIEMENT` → [MODEPAIEMENT](tables.md#modepaiement).`ID` (`BONCOMMANDE_MODEPAIEMENT_FK`, ENABLED).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="bondecommande-client"></a>

## BONDECOMMANDE_CLIENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(500 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(500 BYTE)` | Oui |  |
| `MODEPAIEMENT` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDCLIENT` | `VARCHAR2(255 BYTE)` | Oui | FK → CLIENT |
| `REFERENCE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATEBESOIN` | `DATE` | Oui |  |
| `IDPROFORMA` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MODELIVRAISON` | `NUMBER` | Oui |  |
| `DATELIVRAISON` | `DATE` | Oui |  |
| `LIEULIVRAISON` | `VARCHAR2(255 BYTE)` | Oui |  |
| `FRAISLIVRAISON` | `NUMBER(30,2)` | Oui |  |
| `NUMEROBC` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDREPRESENTANT` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `BONDECOMMANDE_CLIENT_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`BCC_DEVISE_FK`, ENABLED).
- [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`FK_CLIENT`, ENABLED).

Tables qui la référencent :

- [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID`.
- [CARTON](tables.md#carton).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID`.
- [FABRICATION](tables.md#fabrication).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID`.
- [OFAB](tables.md#ofab).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID`.
- [TRAVAUX](tables.md#travaux).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID`.

Vues dépendantes directes (14) : [BCCLIENT_FILLE_GRP](vues.md#bcclient-fille-grp), [BC_CLIENT_FILLE_CPL_LIB](vues.md#bc-client-fille-cpl-lib), [BC_CLIENT_FILLE_CPL_LIB2](vues.md#bc-client-fille-cpl-lib2), [BC_CLIENT_FILLE_CPL_LIB_PDF](vues.md#bc-client-fille-cpl-lib-pdf), [BC_CLIENT_FILLE_CPL_LIB_VISEE](vues.md#bc-client-fille-cpl-lib-visee), [BL_CLIENT_FILLE_GRP_BC](vues.md#bl-client-fille-grp-bc), [BONCOMMANDEFABDETAILS](vues.md#boncommandefabdetails), [BONDECOMMANDEFACTURER](vues.md#bondecommandefacturer), [BONDECOMMANDE_CLIENT_CPL](vues.md#bondecommande-client-cpl), [BONDECOMMANDE_CLIENT_CPL_M](vues.md#bondecommande-client-cpl-m), [BONDECOMMANDE_CLIENT_FILLE_CPL](vues.md#bondecommande-client-fille-cpl), [PROFORMACOMMADER](vues.md#proformacommader), [TABLEAUBORDBC](vues.md#tableaubordbc), [V_NUMEROBC_EN_COURS](vues.md#v-numerobc-en-cours).

Références dans le code : [vente/BonDeCommande.java:613](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/BonDeCommande.java#L613>), [vente/BonDeCommandeArbiochem.java:8](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/BonDeCommandeArbiochem.java#L8>), [vente/bondecommande/bondecommande-modif.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/bondecommande/bondecommande-modif.jsp#L22>), [fabrication/fabrication-modif.jsp:53](<../../projet-standard - Copie/arbiochem-war/web/pages/fabrication/fabrication-modif.jsp#L53>), [fabrication/fabrication-saisie.jsp:108](<../../projet-standard - Copie/arbiochem-war/web/pages/fabrication/fabrication-saisie.jsp#L108>) ; 1 autres fichiers dans `usages-code.json`.

<a id="bondecommande-client-fille"></a>

## BONDECOMMANDE_CLIENT_FILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(1000 BYTE)` | Non | PK |
| `PRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDBC` | `VARCHAR2(500 BYTE)` | Oui | FK → BONDECOMMANDE_CLIENT |
| `QUANTITE` | `NUMBER(30,2)` | Oui |  |
| `PU` | `NUMBER(38,2)` | Oui |  |
| `MONTANT` | `FLOAT(126)` | Oui |  |
| `TVA` | `NUMBER(38,2)` | Oui |  |
| `REMISE` | `NUMBER(30,2)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `UNITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `RISTOURNE` | `NUMBER(5,2)` | Oui |  |
| `TAUX` | `NUMBER(30,2)` | Oui |  |
| `REMISEARBIOCHEM` | `NUMBER(30,2)` | Oui |  |
| `RISTOURNEARBIOCHEM` | `NUMBER(30,2)` | Oui |  |

Clés : `BONDECOMMANDE_CLIENT_FILLE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`BCCF_DEVISE_FK`, ENABLED).
- [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID` (`BCLIENT_MERE_FILLE`, ENABLED).

Tables qui la référencent :

- [FABRICATIONFILLE](tables.md#fabricationfille).`IDBCFILLE` → [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`ID`.
- [OFFILLE](tables.md#offille).`IDBCFILLE` → [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`ID`.
- [ORDRETRAVAUXFILLE](tables.md#ordretravauxfille).`IDBCFILLE` → [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`ID`.
- [TRAVAUXFILLE](tables.md#travauxfille).`IDBCFILLE` → [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`ID`.

Vues dépendantes directes (22) : [AS_BONCOMMANDE_FILLE_AVEC_PRIX](vues.md#as-boncommande-fille-avec-prix), [AS_RECETTEBC](vues.md#as-recettebc), [BCCLIENT_FILLE_GRP](vues.md#bcclient-fille-grp), [BC_CLIENT_FILLE_CPL_LIB](vues.md#bc-client-fille-cpl-lib), [BC_CLIENT_FILLE_CPL_LIB2](vues.md#bc-client-fille-cpl-lib2), [BC_CLIENT_FILLE_CPL_LIBB](vues.md#bc-client-fille-cpl-libb), [BC_CLIENT_FILLE_CPL_LIB_PDF](vues.md#bc-client-fille-cpl-lib-pdf), [BC_DETAILS_RESTE](vues.md#bc-details-reste), [BLCLIENT_FILLE_GRP](vues.md#blclient-fille-grp), [BL_CLIENT_FILLE_BC](vues.md#bl-client-fille-bc), [BONCOMMANDEFABDETAILS](vues.md#boncommandefabdetails), [BONDECOMMANDEFACTURER](vues.md#bondecommandefacturer), [BONDECOMMANDE_CLIENTF_TAUX](vues.md#bondecommande-clientf-taux), [BONDECOMMANDE_CLIENT_FILLE_CPL](vues.md#bondecommande-client-fille-cpl), [BONDECOMMANDE_CLIENT_FILLE_V](vues.md#bondecommande-client-fille-v), [BONDECOMMANDE_OFDETAILS](vues.md#bondecommande-ofdetails), [PRODUITCOMMANDE](vues.md#produitcommande), [PROFORMACOMMADER](vues.md#proformacommader), [QTEFABANDRESTFABBYIDBC](vues.md#qtefabandrestfabbyidbc), [QTEOFANDRESTOFBYIDBC](vues.md#qteofandrestofbyidbc), [TABLEAUBORDBC](vues.md#tableaubordbc), [VENTE_DETAILS_BC](vues.md#vente-details-bc).

Références dans le code : [vente/BonDeCommandeFille.java:155](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/BonDeCommandeFille.java#L155>), [vente/BonDeCommandeFilleArbiochem.java:23](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/BonDeCommandeFilleArbiochem.java#L23>), [vente/bondecommande/bondecommande-modif.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/bondecommande/bondecommande-modif.jsp#L24>).

<a id="business-unite"></a>

## BUSINESS_UNITE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDSOCIETE` | `VARCHAR2(50 BYTE)` | Oui | FK → SOCIETE |

Clés : `SYS_C007075` (primaire) : `ID`.

Clés étrangères sortantes :

- [BUSINESS_UNITE](tables.md#business-unite).`IDSOCIETE` → [SOCIETE](tables.md#societe).`ID` (`FK_BU_SOCIETE`, ENABLED).

Vues dépendantes directes (1) : [FICHE_POSTE_LIB](vues.md#fiche-poste-lib).

Références dans le code : [paie/annexe/BusinessUnit.java:19](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/annexe/BusinessUnit.java#L19>).

<a id="caisse"></a>

## CAISSE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPECAISSE` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPECAISSE |
| `IDPOINT` | `VARCHAR2(255 BYTE)` | Oui | FK → POINT |
| `IDPOMPISTE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDCATEGORIECAISSE` | `VARCHAR2(255 BYTE)` | Oui | FK → CATEGORIECAISSE |
| `COMPTE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui | FK → MAGASIN2 |
| `IDDEVISE` | `VARCHAR2(120 BYTE)` | Oui | FK → DEVISE |
| `IDTYPEBANQUE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ESTRIB` | `NUMBER(1,0)` | Oui |  |
| `ACTIF` | `NUMBER(*,0)` | Oui |  |

Clés : `CAISSE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [CAISSE](tables.md#caisse).`IDCATEGORIECAISSE` → [CATEGORIECAISSE](tables.md#categoriecaisse).`ID` (`CAISSE_CATEGORIE_FK`, ENABLED).
- [CAISSE](tables.md#caisse).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`CAISSE_DEVISE_FK`, ENABLED).
- [CAISSE](tables.md#caisse).`IDPOINT` → [POINT](tables.md#point).`ID` (`CAISSE_POINT_FK`, ENABLED).
- [CAISSE](tables.md#caisse).`IDTYPECAISSE` → [TYPECAISSE](tables.md#typecaisse).`ID` (`CAISSE_TYPE_FK`, ENABLED).
- [CAISSE](tables.md#caisse).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` (`FK_IDMAGASIN`, ENABLED).

Tables qui la référencent :

- [CHEQUE](tables.md#cheque).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID`.
- [DEPENSE](tables.md#depense).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID`.
- [DETAILSBONCAISSE](tables.md#detailsboncaisse).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID`.
- [ENCAISSEMENT](tables.md#encaissement).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID`.
- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID`.
- [OUVERTURECAISSEFILLE](tables.md#ouverturecaissefille).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID`.
- [PAIEMENTBON](tables.md#paiementbon).`IDCAISSEBON` → [CAISSE](tables.md#caisse).`ID`.
- [PAIEMENTBON](tables.md#paiementbon).`IDCAISSEPAIEMENT` → [CAISSE](tables.md#caisse).`ID`.
- [PREVISION](tables.md#prevision).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID`.
- [REPORTCAISSE](tables.md#reportcaisse).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID`.
- [VERSEMENTCHEQUE](tables.md#versementcheque).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID`.
- [VIREMENTINTRACAISSE](tables.md#virementintracaisse).`IDCAISSEARRIVE` → [CAISSE](tables.md#caisse).`ID`.
- [VIREMENTINTRACAISSE](tables.md#virementintracaisse).`IDCAISSEDEPART` → [CAISSE](tables.md#caisse).`ID`.

Vues dépendantes directes (33) : [BANQUE_COMPTA](vues.md#banque-compta), [CAISSEBANQUE](vues.md#caissebanque), [CAISSECPL](vues.md#caissecpl), [CAISSETRAITE](vues.md#caissetraite), [CAISSE_POMPISTE](vues.md#caisse-pompiste), [CHEQUECPL](vues.md#chequecpl), [DEPENSELIB](vues.md#depenselib), [DETAILSBONCAISSECPL](vues.md#detailsboncaissecpl), [ENCAISSEMENTCPL](vues.md#encaissementcpl), [MOUVEMENTCAISSECPL](vues.md#mouvementcaissecpl), [MOUVEMENTCAISSEFILLECPL](vues.md#mouvementcaissefillecpl), [MOUVEMENTCAISSEGROUPEFACTURE](vues.md#mouvementcaissegroupefacture), [MOUVEMENTCAISSEGROUPERESA](vues.md#mouvementcaissegrouperesa), [MVTCAISSECPLORIGINE](vues.md#mvtcaissecplorigine), [MVTCAISSEGROUPEFACTURE_PDF](vues.md#mvtcaissegroupefacture-pdf), [MVTINTRACAISSETRAITEV](vues.md#mvtintracaissetraitev), [MVTINTRACAISSE_LIB](vues.md#mvtintracaisse-lib), [MVTINTRACAISSE_LIBCOMPLET](vues.md#mvtintracaisse-libcomplet), [PRELEVEMENTCPL](vues.md#prelevementcpl), [PREVISION_CPL](vues.md#prevision-cpl), [RAPPROCHEMENTBCMERELIB](vues.md#rapprochementbcmerelib), [RELEVERDETAILCPL](vues.md#releverdetailcpl), [RELEVERDETAILNR](vues.md#releverdetailnr), [RELEVERDETAILR](vues.md#releverdetailr), [RELEVERLIB](vues.md#releverlib), [REPORTCAISSELIB](vues.md#reportcaisselib), [REPORTCAISSE_DEVISE](vues.md#reportcaisse-devise), [SOUSECRITURENR](vues.md#sousecriturenr), [SOUSECRITURER](vues.md#sousecriturer), [TRAITE_JC](vues.md#traite-jc), [VIREMENTINTRACAISSECPL](vues.md#virementintracaissecpl), [V_ETATCAISSE](vues.md#v-etatcaisse), [V_ETATCAISSE_CLOTURE](vues.md#v-etatcaisse-cloture).

Références dans le code : [caisse/Caisse.java:37](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/Caisse.java#L37>), [caisse/mvt/ff-mvtCaisse-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/mvt/ff-mvtCaisse-saisie.jsp#L19>), [facture/verser-traite.jsp:54](<../../projet-standard - Copie/arbiochem-war/web/pages/facture/verser-traite.jsp#L54>), [pertegain/pertegain-mvtcaisse-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/pertegain/pertegain-mvtcaisse-saisie.jsp#L33>), [rapprochement/liste-relever.jsp:31](<../../projet-standard - Copie/arbiochem-war/web/pages/rapprochement/liste-relever.jsp#L31>) ; 2 autres fichiers dans `usages-code.json`.

<a id="calendrier"></a>

## CALENDRIER

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `EVENEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007078` (primaire) : `ID`.

Références dans le code : [paie/pointage/Calendrier.java:39](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/pointage/Calendrier.java#L39>), [paie/pointage/calendrier-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/pointage/calendrier-fiche.jsp#L11>), [paie/pointage/calendrier-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/pointage/calendrier-liste.jsp#L7>), [paie/pointage/calendrier-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/pointage/calendrier-saisie.jsp#L13>).

<a id="candidat"></a>

## CANDIDAT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `NOM` | `VARCHAR2(100 BYTE)` | Oui |  |
| `PRENOM` | `VARCHAR2(100 BYTE)` | Oui |  |
| `EMAIL` | `VARCHAR2(150 BYTE)` | Oui |  |
| `TELEPHONE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATE_NAISSANCE` | `DATE` | Oui |  |

Clés : `SYS_C007079` (primaire) : `ID`.

Tables qui la référencent :

- [CANDIDATURES](tables.md#candidatures).`IDCANDIDAT` → [CANDIDAT](tables.md#candidat).`ID`.

Vues dépendantes directes (1) : [CANDIDATURESLIB](vues.md#candidatureslib).

Références dans le code : [paie/recrutement/Candidat.java:67](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/recrutement/Candidat.java#L67>), [paie/recrutement/candidat-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/recrutement/candidat-fiche.jsp#L11>), [paie/recrutement/candidat-liste.jsp:9](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/recrutement/candidat-liste.jsp#L9>), [paie/recrutement/candidat-saisie.jsp:15](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/recrutement/candidat-saisie.jsp#L15>), [paie/recrutement/candidature-saisie.jsp:30](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/recrutement/candidature-saisie.jsp#L30>).

<a id="candidatures"></a>

## CANDIDATURES

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDCANDIDAT` | `VARCHAR2(50 BYTE)` | Oui | FK → CANDIDAT |
| `IDOFFREEMPLOIE` | `VARCHAR2(50 BYTE)` | Oui | FK → OFFRE_EMPLOI |
| `ETAT` | `NUMBER(2,0)` | Oui |  |
| `DATEAPPLICATION` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `RAISONREFUS` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007080` (primaire) : `ID`.

Clés étrangères sortantes :

- [CANDIDATURES](tables.md#candidatures).`IDCANDIDAT` → [CANDIDAT](tables.md#candidat).`ID` (`FK_CANDIDATURES_CANDIDAT`, ENABLED).
- [CANDIDATURES](tables.md#candidatures).`IDOFFREEMPLOIE` → [OFFRE_EMPLOI](tables.md#offre-emploi).`ID` (`FK_CANDIDATURES_OFFRE`, ENABLED).

Vues dépendantes directes (1) : [CANDIDATURESLIB](vues.md#candidatureslib).

Références dans le code : [paie/recrutement/Candidatures.java:73](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/recrutement/Candidatures.java#L73>), [paie/recrutement/candidature-saisie.jsp:16](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/recrutement/candidature-saisie.jsp#L16>), [entretient/entretient-saisie.jsp:28](<../../projet-standard - Copie/arbiochem-war/web/pages/entretient/entretient-saisie.jsp#L28>).

<a id="carton"></a>

## CARTON

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDBC` | `VARCHAR2(500 BYTE)` | Oui | FK → BONDECOMMANDE_CLIENT |
| `IDBL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATECREATION` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `NUMERO` | `VARCHAR2(22 BYTE)` | Oui |  |

Clés : `CARTON_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [CARTON](tables.md#carton).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID` (`CARTON_BC_FK`, ENABLED).

Vues dépendantes directes (6) : [CARTONFILLE_CPL](vues.md#cartonfille-cpl), [GETNUMERO_CARTON_NEXT](vues.md#getnumero-carton-next), [PRODUITSOUSCARTON](vues.md#produitsouscarton), [VUE_CARTONFILLE_IDMERE](vues.md#vue-cartonfille-idmere), [VUE_CARTONFILLE_SUM](vues.md#vue-cartonfille-sum), [VUE_SUIVI_CARTON](vues.md#vue-suivi-carton).

Références dans le code : [vente/Carton.java:19](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/Carton.java#L19>), [vente/CartonFille.java:13](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/CartonFille.java#L13>), [vente/bondecommande/inc/liste-cartons.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/bondecommande/inc/liste-cartons.jsp#L11>), [vente/miseencarton/carton-fiche.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/miseencarton/carton-fiche.jsp#L13>).

<a id="categorie"></a>

## CATEGORIE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPEPRODUIT` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPE_PRODUIT |
| `COMPTE_VENTE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPTE_ACHAT` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `CATEGORIE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [CATEGORIE](tables.md#categorie).`IDTYPEPRODUIT` → [TYPE_PRODUIT](tables.md#type-produit).`ID` (`CATEGORIE_TYPEPRODUIT_FK`, ENABLED).

Tables qui la référencent :

- [PRODUIT](tables.md#produit).`IDCATEGORIE` → [CATEGORIE](tables.md#categorie).`ID`.

Vues dépendantes directes (1) : [FFFILLECPL_MONTANT](vues.md#fffillecpl-montant).

Références dans le code : [annexe/Categorie.java:19](<../../projet-standard - Copie/arbiochem-ejb/src/java/annexe/Categorie.java#L19>), [annexe/sous-categorie/sous-categorie-saisie.jsp:29](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/sous-categorie/sous-categorie-saisie.jsp#L29>).

<a id="categorieavoirfc"></a>

## CATEGORIEAVOIRFC

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `TYPE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `PK_CATEGORIEAVOIRFC` (primaire) : `ID`.

Vues dépendantes directes (2) : [AVOIRFCLIB](vues.md#avoirfclib), [AVOIRFCLIB_PDF](vues.md#avoirfclib-pdf).

Références dans le code : [avoir/CategorieAvoirfc.java:11](<../../projet-standard - Copie/arbiochem-ejb/src/java/avoir/CategorieAvoirfc.java#L11>), [avoir/avoirFC-arbiochem-liste.jsp:54](<../../projet-standard - Copie/arbiochem-war/web/pages/avoir/avoirFC-arbiochem-liste.jsp#L54>), [avoir/avoirFC-arbiochem-saisie.jsp:45](<../../projet-standard - Copie/arbiochem-war/web/pages/avoir/avoirFC-arbiochem-saisie.jsp#L45>), [avoir/avoirFC-liste.jsp:54](<../../projet-standard - Copie/arbiochem-war/web/pages/avoir/avoirFC-liste.jsp#L54>), [avoir/avoirFC-saisie.jsp:45](<../../projet-standard - Copie/arbiochem-war/web/pages/avoir/avoirFC-saisie.jsp#L45>) ; 3 autres fichiers dans `usages-code.json`.

<a id="categoriecaisse"></a>

## CATEGORIECAISSE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPECAISSE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `CATEGORIECAISSE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [CAISSE](tables.md#caisse).`IDCATEGORIECAISSE` → [CATEGORIECAISSE](tables.md#categoriecaisse).`ID`.
- [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`IDCATEGORIECAISSE` → [CATEGORIECAISSE](tables.md#categoriecaisse).`ID`.

Vues dépendantes directes (4) : [CAISSECPL](vues.md#caissecpl), [CAISSE_POMPISTE](vues.md#caisse-pompiste), [ENCAISSEMENT_DETAILS_LIB](vues.md#encaissement-details-lib), [PRECISDETENCAISSEMENT_LIB](vues.md#precisdetencaissement-lib).

Références dans le code : [caisse/CategorieCaisse.java:19](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/CategorieCaisse.java#L19>), [caisse/caisse-liste.jsp:31](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/caisse-liste.jsp#L31>), [caisse/caisse-modif.jsp:42](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/caisse-modif.jsp#L42>), [caisse/caisse-saisie.jsp:45](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/caisse-saisie.jsp#L45>), [encaissement/encaissement-details-modif.jsp:41](<../../projet-standard - Copie/arbiochem-war/web/pages/encaissement/encaissement-details-modif.jsp#L41>) ; 3 autres fichiers dans `usages-code.json`.

<a id="categorieconsommable"></a>

## CATEGORIECONSOMMABLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007089` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="categorieevalentretient"></a>

## CATEGORIEEVALENTRETIENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `SYS_C007090` (primaire) : `ID`.

Tables qui la référencent :

- [ENTRETIENRH_DETAIL](tables.md#entretienrh-detail).`IDCATEGORIEEVALUATION` → [CATEGORIEEVALENTRETIENT](tables.md#categorieevalentretient).`ID`.

Vues dépendantes directes (1) : [ENTRETIENRH_DETAIL_LIB](vues.md#entretienrh-detail-lib).

Références dans le code : [entretient/entretientrh-saisie.jsp:68](<../../projet-standard - Copie/arbiochem-war/web/pages/entretient/entretientrh-saisie.jsp#L68>).

<a id="categorieingredient"></a>

## CATEGORIEINGREDIENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ESTACHAT` | `NUMBER(*,0)` | Oui |  |
| `ACTIF` | `NUMBER` | Oui |  |

Clés : `SYS_C007094` (primaire) : `ID`.

Tables qui la référencent :

- [AS_INGREDIENTS](tables.md#as-ingredients).`CATEGORIEINGREDIENT` → [CATEGORIEINGREDIENT](tables.md#categorieingredient).`ID`.
- [CA_JOUR](tables.md#ca-jour).`IDCATEGORIE` → [CATEGORIEINGREDIENT](tables.md#categorieingredient).`ID`.
- [INVENTAIRE](tables.md#inventaire).`IDCATEGORIE` → [CATEGORIEINGREDIENT](tables.md#categorieingredient).`ID`.
- [REMISEFILLE](tables.md#remisefille).`CATEGORIEPRODUIT` → [CATEGORIEINGREDIENT](tables.md#categorieingredient).`ID`.

Vues dépendantes directes (44) : [AS_RECETTEFABLIB](vues.md#as-recettefablib), [AS_RECETTE_LIB_CAT](vues.md#as-recette-lib-cat), [CATEGORIEINGREDIENTLIB](vues.md#categorieingredientlib), [CATEGORIEINGREDIENTLIB_ACHT](vues.md#categorieingredientlib-acht), [CATEGORIEINGREDIENT_ACTIF](vues.md#categorieingredient-actif), [CATEGORIELIB](vues.md#categorielib), [DEMANDETRANSFERTCPL](vues.md#demandetransfertcpl), [DEPENSEDIVERSLIB](vues.md#depensediverslib), [DMDACHATLIB](vues.md#dmdachatlib), [FACTUREFOURNISSEURFILLECPL](vues.md#facturefournisseurfillecpl), [INVENTAIRELIB](vues.md#inventairelib), [MVTSTOCKFILLEFABOFCATVISE](vues.md#mvtstockfillefabofcatvise), [MVTSTOCKFILLEFABOFCATVISETOUS](vues.md#mvtstockfillefabofcatvisetous), [PRODUIT_LIB](vues.md#produit-lib), [PRODUIT_LIBCPL](vues.md#produit-libcpl), [RAPPROCHEMENTGLOBALE_PIE](vues.md#rapprochementglobale-pie), [REMISEFILLELIB](vues.md#remisefillelib), [REMISEFILLEMERELIB](vues.md#remisefillemerelib), [STAT_DEPENSE_CAT](vues.md#stat-depense-cat), [STOCKETDEPENSEFABNC](vues.md#stocketdepensefabnc), [STOCKETDEPENSEFABTHECAT](vues.md#stocketdepensefabthecat), [STOCKETDEPENSEOFFABTHECAT](vues.md#stocketdepenseoffabthecat), [STOCKETDEPENSEOFFILLETHECAT](vues.md#stocketdepenseoffillethecat), [VENTEDETCALCREMGLOVISE](vues.md#ventedetcalcremglovise), [VENTE_CPL_ANALYSEF](vues.md#vente-cpl-analysef), [VENTE_DETAILS_ANALYSE](vues.md#vente-details-analyse), [VENTE_DETAILS_CPL_2](vues.md#vente-details-cpl-2), [VENTE_DETAILS_POIDS_ING](vues.md#vente-details-poids-ing), [VENTE_DETAILS_VIDE](vues.md#vente-details-vide), [V_CATEGORIEINGREDIENT](vues.md#v-categorieingredient), [V_ETATSTOCK_ENTREE](vues.md#v-etatstock-entree), [V_ETATSTOCK_ENTREE_DMDACHAT](vues.md#v-etatstock-entree-dmdachat), [V_ETATSTOCK_ENTREE_STANDARD](vues.md#v-etatstock-entree-standard), [V_ETATSTOCK_ING](vues.md#v-etatstock-ing), [V_ETATSTOCK_ING_ALL](vues.md#v-etatstock-ing-all), [V_ETATSTOCK_ING_ENG](vues.md#v-etatstock-ing-eng), [V_ETATSTOCK_ING_ENG_SOMME](vues.md#v-etatstock-ing-eng-somme), [V_ETATSTOCK_ING_MAGASIN](vues.md#v-etatstock-ing-magasin), [V_ETATSTOCK_ING_POINT](vues.md#v-etatstock-ing-point), [V_ETATSTOCK_ING_TOUS](vues.md#v-etatstock-ing-tous), [V_ETATSTOCK_ING_VENTE](vues.md#v-etatstock-ing-vente), [V_ETATSTOCK_PROD_FINI](vues.md#v-etatstock-prod-fini), [V_ETATSTOCK_PROD_FINI2](vues.md#v-etatstock-prod-fini2), [V_INVENTAIREFILLECAT](vues.md#v-inventairefillecat).

Références dans le code : [produits/CategorieIngredient.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/produits/CategorieIngredient.java#L10>), [annexe/categorie/categorie-fiche.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/categorie/categorie-fiche.jsp#L24>), [annexe/categorie/categorie-liste.jsp:14](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/categorie/categorie-liste.jsp#L14>), [annexe/categorie/categorie-saisie.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/categorie/categorie-saisie.jsp#L27>), [annexe/produit/produit-saisie.jsp:46](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/produit/produit-saisie.jsp#L46>) ; 16 autres fichiers dans `usages-code.json`.

<a id="categorielot"></a>

## CATEGORIELOT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `SYS_C007095` (primaire) : `ID`.

Tables qui la référencent :

- [LOT](tables.md#lot).`IDCATEGORIELOT` → [CATEGORIELOT](tables.md#categorielot).`ID`.

Vues dépendantes directes (1) : [LOT_LIB](vues.md#lot-lib).

Références dans le code : [ferme/lot/lot-saisie.jsp:43](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/lot/lot-saisie.jsp#L43>).

<a id="categoriestock"></a>

## CATEGORIESTOCK

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `ACTIF` | `NUMBER` | Oui |  |

Clés : `SYS_C007101` (primaire) : `ID`.

Tables qui la référencent :

- [MVTSTOCK](tables.md#mvtstock).`IDCATEGORIESTOCK` → [CATEGORIESTOCK](tables.md#categoriestock).`ID`.

Vues dépendantes directes (1) : [MVTSTOCKLIB](vues.md#mvtstocklib).

Références dans le code : [stock/dechets-jeter-multiple.jsp:38](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/dechets-jeter-multiple.jsp#L38>), [stock/mvtstock-arbiochem-saisie.jsp:100](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/mvtstock-arbiochem-saisie.jsp#L100>), [stock/mvtstock-liste.jsp:34](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/mvtstock-liste.jsp#L34>), [stock/mvtstock-saisie.jsp:100](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/mvtstock-saisie.jsp#L100>).

<a id="categorie-centre"></a>

## CATEGORIE_CENTRE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `CATEGORIE_CENTRE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [CENTRE](tables.md#centre).`DESCE` → [CATEGORIE_CENTRE](tables.md#categorie-centre).`ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="categorie-formation"></a>

## CATEGORIE_FORMATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `CATEGORIE_FORMATION_PK` (primaire) : `ID`.

Vues dépendantes directes (2) : [ACTION_FORMATION_LIB](vues.md#action-formation-lib), [V_RECAP_GLOBAL_FORMATION](vues.md#v-recap-global-formation).

Références dans le code : [paie/formation/configuration/CategorieFormation.java:39](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formation/configuration/CategorieFormation.java#L39>), [paie/formation/action/actionformation-saisie-back.jsp:38](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/action/actionformation-saisie-back.jsp#L38>), [paie/formation/action/actionformation-saisie.jsp:49](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/action/actionformation-saisie.jsp#L49>), [paie/formation/configuration/categorie/categorieformation-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/configuration/categorie/categorieformation-fiche.jsp#L11>), [paie/formation/configuration/categorie/categorieformation-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/configuration/categorie/categorieformation-liste.jsp#L7>) ; 1 autres fichiers dans `usages-code.json`.

<a id="categorie-paie"></a>

## CATEGORIE_PAIE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DROIT_HEURE_SUP` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ESSAIE` | `NUMBER(30,2)` | Oui |  |

Clés : `CATEGORIE_PAIE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [CATEGORIE_QUALIFICATION](tables.md#categorie-qualification).`IDCATEGORIE` → [CATEGORIE_PAIE](tables.md#categorie-paie).`ID`.
- [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`IDCATEGORIE_PAIE` → [CATEGORIE_PAIE](tables.md#categorie-paie).`ID`.

Vues dépendantes directes (20) : [CATEGORIEQUALIFICATION_LIB](vues.md#categoriequalification-lib), [CATEGORIE_PAIE_LIB](vues.md#categorie-paie-lib), [CATEGORIE_PAIE_SALAIRE](vues.md#categorie-paie-salaire), [CATEGORIE_QUALIFICATION_LIBC](vues.md#categorie-qualification-libc), [CATEGORIE_QUALIFICATION_VW](vues.md#categorie-qualification-vw), [CATEG_QUALILIBCOMPLET](vues.md#categ-qualilibcomplet), [CATEG_QUALI_LIBCOMPLET](vues.md#categ-quali-libcomplet), [EMPLOYE_COMPLET](vues.md#employe-complet), [EMPLOYE_COMPLET2](vues.md#employe-complet2), [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_PDF](vues.md#employe-complet-pdf), [FICHE_POSTE_LIB](vues.md#fiche-poste-lib), [HSMOIS_CPL](vues.md#hsmois-cpl), [LOG_PERSONNEL_GRAPHE](vues.md#log-personnel-graphe), [PAIE_INFO_PERSONNEL_HISTORIC_3](vues.md#paie-info-personnel-historic-3), [PARTICIPATION_FORMATION_LIB](vues.md#participation-formation-lib), [PERIODEPAIELIB](vues.md#periodepaielib), [SITUATION_SALAIRE_EDITION_DIST](vues.md#situation-salaire-edition-dist), [SUIVI_PRESENCE_FILLE_LIB](vues.md#suivi-presence-fille-lib), [TEST_SITUATION_SALAIRE_EDITION](vues.md#test-situation-salaire-edition).

Références dans le code : [paie/categorie/CategoriePaie.java:27](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/categorie/CategoriePaie.java#L27>), [paie/avance/avance-quinzaine-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avance/avance-quinzaine-saisie.jsp#L22>), [paie/avance/avance-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avance/avance-saisie.jsp#L33>), [paie/avancement/avancement-categorie.jsp:37](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-categorie.jsp#L37>), [paie/avancement/avancement-contrat.jsp:53](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-contrat.jsp#L53>) ; 8 autres fichiers dans `usages-code.json`.

<a id="categorie-qualification"></a>

## CATEGORIE_QUALIFICATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDCATEGORIE` | `VARCHAR2(500 BYTE)` | Oui | FK → CATEGORIE_PAIE |
| `IDQUALIFICATION` | `VARCHAR2(500 BYTE)` | Oui | FK → QUALIFICATION_PAIE |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `DATE_DEBUT` | `DATE` | Oui |  |
| `DATE_FIN` | `DATE` | Oui |  |
| `AVENANT` | `NUMBER(*,0)` | Oui |  |
| `IDPOSTE` | `VARCHAR2(100 BYTE)` | Oui | FK → POSTE |
| `INDICE` | `NUMBER(30,3)` | Oui |  |

Clés : `CATEGORIE_QUALIFICATION_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [CATEGORIE_QUALIFICATION](tables.md#categorie-qualification).`IDCATEGORIE` → [CATEGORIE_PAIE](tables.md#categorie-paie).`ID` (`CATEGORIE_FK`, ENABLED).
- [CATEGORIE_QUALIFICATION](tables.md#categorie-qualification).`IDPOSTE` → [POSTE](tables.md#poste).`ID` (`CATEGQUALI_POSTE_FK`, ENABLED).
- [CATEGORIE_QUALIFICATION](tables.md#categorie-qualification).`IDQUALIFICATION` → [QUALIFICATION_PAIE](tables.md#qualification-paie).`ID` (`QUALIFICATION_FK`, ENABLED).

Tables qui la référencent :

- [PAIE_PERSONNEL_ELEMENTPAIE](tables.md#paie-personnel-elementpaie).`IDCATEGORIE_QUALIFICATION` → [CATEGORIE_QUALIFICATION](tables.md#categorie-qualification).`ID`.

Vues dépendantes directes (18) : [CATEGORIEQUALIFICATION_LIB](vues.md#categoriequalification-lib), [CATEGORIE_QUALIFICATION_LIBC](vues.md#categorie-qualification-libc), [CATEGORIE_QUALIFICATION_VW](vues.md#categorie-qualification-vw), [CATEG_QUALILIBCOMPLET](vues.md#categ-qualilibcomplet), [CATEG_QUALI_CONTRAT](vues.md#categ-quali-contrat), [CATEG_QUALI_LIBCOMPLET](vues.md#categ-quali-libcomplet), [DETAILS_PAIE_EDITION_PDF](vues.md#details-paie-edition-pdf), [EMPLOYE_COMPLET](vues.md#employe-complet), [EMPLOYE_COMPLET2](vues.md#employe-complet2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [EMPLOYE_COMPLET_PDF](vues.md#employe-complet-pdf), [HEURESUPFABRICATION_CPL](vues.md#heuresupfabrication-cpl), [HEURESUPFABRICATION_TOTAL](vues.md#heuresupfabrication-total), [PAIE_EDITION_ELTPAIE](vues.md#paie-edition-eltpaie), [PAIE_INFO_PERSONNEL_GROUPE](vues.md#paie-info-personnel-groupe), [PAIE_INFO_PERSONNEL_SPEC](vues.md#paie-info-personnel-spec), [RESSOURCEPARFABRICATIONCOMPLET](vues.md#ressourceparfabricationcomplet), [SALAIRECATEGORIE_ACTIF](vues.md#salairecategorie-actif).

Références dans le code : [paie/CategorieQualification.java:137](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/CategorieQualification.java#L137>), [paie/categorie/SalaireCategorie.java:24](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/categorie/SalaireCategorie.java#L24>).

<a id="ca-annee-anterieur"></a>

## CA_ANNEE_ANTERIEUR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ANNEE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `MOIS` | `VARCHAR2(100 BYTE)` | Oui |  |
| `MONTANT` | `NUMBER(38,2)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Vues dépendantes directes (1) : [CA_ANNEE_VIEW](vues.md#ca-annee-view).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="ca-jour"></a>

## CA_JOUR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `JOURLIB` | `VARCHAR2(200 BYTE)` | Oui |  |
| `JOUR` | `NUMBER(*,0)` | Oui |  |
| `MOIS` | `NUMBER(*,0)` | Oui |  |
| `ANNEE` | `NUMBER(*,0)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(100 BYTE)` | Oui | FK → CATEGORIEINGREDIENT |

Clés : `CA_JOUR_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [CA_JOUR](tables.md#ca-jour).`IDCATEGORIE` → [CATEGORIEINGREDIENT](tables.md#categorieingredient).`ID` (`SYS_C008176`, ENABLED).

Vues dépendantes directes (3) : [CA_JOURNALIER](vues.md#ca-journalier), [CA_JOURNALIER_UNION](vues.md#ca-journalier-union), [CA_MENSUEL](vues.md#ca-mensuel).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="centre"></a>

## CENTRE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui | FK → CATEGORIE_CENTRE |
| `TYPE` | `VARCHAR2(500 BYTE)` | Oui | FK → TYPE_CENTRE |

Clés : `CENTRE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [CENTRE](tables.md#centre).`DESCE` → [CATEGORIE_CENTRE](tables.md#categorie-centre).`ID` (`CENTRE_CATEGORIE`, ENABLED).
- [CENTRE](tables.md#centre).`TYPE` → [TYPE_CENTRE](tables.md#type-centre).`ID` (`TYPE_CENTRE_FK`, ENABLED).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="charge"></a>

## CHARGE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `LIBELLE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `TYPE` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPECHARGE |
| `IDFABRICATION` | `VARCHAR2(255 BYTE)` | Oui | FK → FABRICATION |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDINGREDIENTS` | `VARCHAR2(150 BYTE)` | Oui |  |
| `QTE` | `NUMBER(20,5)` | Oui |  |

Clés : `CHARGE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [CHARGE](tables.md#charge).`IDFABRICATION` → [FABRICATION](tables.md#fabrication).`ID` (`CHARGE_FAB_FK`, ENABLED).
- [CHARGE](tables.md#charge).`TYPE` → [TYPECHARGE](tables.md#typecharge).`ID` (`CHARGE_TYPE_FK`, ENABLED).

Vues dépendantes directes (6) : [CHARGEGROUPBYOFF](vues.md#chargegroupbyoff), [CHARGEGROUPEBYOFF](vues.md#chargegroupebyoff), [CHARGEMONTANT](vues.md#chargemontant), [CHARGE_CPL](vues.md#charge-cpl), [CHARGE_LIB](vues.md#charge-lib), [DEPENSEFAB](vues.md#depensefab).

Références dans le code : [charge/Charge.java:19](<../../projet-standard - Copie/arbiochem-ejb/src/java/charge/Charge.java#L19>), [fabrication/charge/charge-saisie-multiple.jsp:28](<../../projet-standard - Copie/arbiochem-war/web/pages/fabrication/charge/charge-saisie-multiple.jsp#L28>).

<a id="chargepersonneltemp"></a>

## CHARGEPERSONNELTEMP

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(50 BYTE)` | Oui | FK → PAIE_INFO_PERSONNEL |
| `IDPOSTE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDCLASSE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `HEUREHS` | `NUMBER(10,2)` | Oui |  |
| `HEUREFERIE` | `NUMBER(10,2)` | Oui |  |
| `HEUREDIM` | `NUMBER(10,2)` | Oui |  |
| `HEURENUIT` | `NUMBER(10,2)` | Oui |  |
| `HEUREIF` | `NUMBER(10,2)` | Oui |  |
| `TAUX` | `NUMBER(10,2)` | Oui |  |

Clés : `PK_CHARGEPERSONNELTEMP` (primaire) : `ID`.

Clés étrangères sortantes :

- [CHARGEPERSONNELTEMP](tables.md#chargepersonneltemp).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` (`FK_CHARGE_PERSONNEL`, ENABLED).

Références dans le code : [charge/ChargePersonnelTemp.java:56](<../../projet-standard - Copie/arbiochem-ejb/src/java/charge/ChargePersonnelTemp.java#L56>).

<a id="chat-summary"></a>

## CHAT_SUMMARY

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `SESSIONID` | `VARCHAR2(255 BYTE)` | Non |  |
| `USERID` | `VARCHAR2(255 BYTE)` | Non |  |
| `SUMMARYTEXT` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `KEYWORDS` | `VARCHAR2(512 BYTE)` | Oui |  |
| `DATECREATEDAT` | `DATE` | Oui |  |
| `TIMECREATEDAT` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007109` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="checkin"></a>

## CHECKIN

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `RESERVATION` | `VARCHAR2(50 BYTE)` | Oui | FK → RESERVATION |
| `DATY` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(150 BYTE)` | Oui |  |
| `CLIENT` | `VARCHAR2(50 BYTE)` | Oui | FK → CLIENT |
| `IDPRODUIT` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDCLIENT` | `VARCHAR2(50 BYTE)` | Oui | FK → CLIENT |
| `QTE` | `NUMBER(30,2)` | Oui |  |

Clés : `SYS_C007110` (primaire) : `ID`.

Clés étrangères sortantes :

- [CHECKIN](tables.md#checkin).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`CHECKIN_AS_INGREDIENTS_ID_FK`, ENABLED).
- [CHECKIN](tables.md#checkin).`CLIENT` → [CLIENT](tables.md#client).`ID` (`CHECKIN_CLIENT_ID_FK`, ENABLED).
- [CHECKIN](tables.md#checkin).`RESERVATION` → [RESERVATION](tables.md#reservation).`ID` (`CHECKIN_RESERVATION_ID_FK`, ENABLED).
- [CHECKIN](tables.md#checkin).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`CHECKIN___FK_CLIENT`, ENABLED).

Tables qui la référencent :

- [CHECKOUT](tables.md#checkout).`RESERVATION` → [CHECKIN](tables.md#checkin).`ID`.

Vues dépendantes directes (4) : [CHECKINAVECCHEKOUT](vues.md#checkinavecchekout), [CHECKINAVECCHEKOUTCOMPLET](vues.md#checkinavecchekoutcomplet), [CHECKINSANSCHEKOUT](vues.md#checkinsanschekout), [RESERVATIONDETSANSCI](vues.md#reservationdetsansci).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="checklist-fille"></a>

## CHECKLIST_FILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `IDCHECKLISTMERE` | `VARCHAR2(250 BYTE)` | Non | FK → CHECKLIST_MERE |
| `IDTYPEDOCUMENT` | `VARCHAR2(250 BYTE)` | Oui | FK → TYPEDOCUMENTCHECKLIST |
| `IDRESPONSABLE` | `VARCHAR2(250 BYTE)` | Oui | FK → LOG_DIRECTION |
| `CONTENUE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `EST_COCHE` | `NUMBER(1,0)` | Oui |  |

Clés : `SYS_C007113` (primaire) : `ID`.

Clés étrangères sortantes :

- [CHECKLIST_FILLE](tables.md#checklist-fille).`IDCHECKLISTMERE` → [CHECKLIST_MERE](tables.md#checklist-mere).`ID` (`FK_CHKFILLE_MERE`, ENABLED).
- [CHECKLIST_FILLE](tables.md#checklist-fille).`IDRESPONSABLE` → [LOG_DIRECTION](tables.md#log-direction).`ID` (`FK_CHKFILLE_RESPONSABLE`, ENABLED).
- [CHECKLIST_FILLE](tables.md#checklist-fille).`IDTYPEDOCUMENT` → [TYPEDOCUMENTCHECKLIST](tables.md#typedocumentchecklist).`ID` (`FK_CHKFILLE_TYPDOC`, ENABLED).

Références dans le code : [paie/onBoarding/CheckListFille.java:77](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/onBoarding/CheckListFille.java#L77>), [paie/onBoarding/checkentree-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/onBoarding/checkentree-saisie.jsp#L22>).

<a id="checklist-mere"></a>

## CHECKLIST_MERE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDPERSONNEL` | `VARCHAR2(250 BYTE)` | Oui | FK → LOG_PERSONNEL |
| `TYPECHECKLISTE` | `NUMBER(1,0)` | Oui |  |

Clés : `SYS_C007115` (primaire) : `ID`.

Clés étrangères sortantes :

- [CHECKLIST_MERE](tables.md#checklist-mere).`IDPERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`FK_CHKMERE_PERSONNEL`, ENABLED).

Tables qui la référencent :

- [CHECKLIST_FILLE](tables.md#checklist-fille).`IDCHECKLISTMERE` → [CHECKLIST_MERE](tables.md#checklist-mere).`ID`.

Vues dépendantes directes (1) : [CHECKLIST_MERE_LIB](vues.md#checklist-mere-lib).

Références dans le code : [paie/onBoarding/CheckListMere.java:50](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/onBoarding/CheckListMere.java#L50>), [paie/onBoarding/checkentree-saisie.jsp:20](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/onBoarding/checkentree-saisie.jsp#L20>).

<a id="checkout"></a>

## CHECKOUT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `RESERVATION` | `VARCHAR2(50 BYTE)` | Oui | FK → CHECKIN |
| `DATY` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(150 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `SYS_C007116` (primaire) : `ID`.

Clés étrangères sortantes :

- [CHECKOUT](tables.md#checkout).`RESERVATION` → [CHECKIN](tables.md#checkin).`ID` (`CHECKOUT_CHECKIN_ID_FK`, ENABLED).

Vues dépendantes directes (4) : [CHECKINAVECCHEKOUT](vues.md#checkinavecchekout), [CHECKINAVECCHEKOUTCOMPLET](vues.md#checkinavecchekoutcomplet), [CHECKINSANSCHEKOUT](vues.md#checkinsanschekout), [CHECKOUTLIB](vues.md#checkoutlib).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="cheque"></a>

## CHEQUE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `REFERENCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDCAISSE` | `VARCHAR2(255 BYTE)` | Oui | FK → CAISSE |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDPRECISIONDETAILENCAISSEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → PRECISION_DETAIL_ENCAISSEMENT |
| `IDCLIENT` | `VARCHAR2(255 BYTE)` | Oui | FK → CLIENT |

Clés : `CHEQUE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [CHEQUE](tables.md#cheque).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` (`CHEQUE_CAISSE_FK`, ENABLED).
- [CHEQUE](tables.md#cheque).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`SYS_C008200`, ENABLED).
- [CHEQUE](tables.md#cheque).`IDPRECISIONDETAILENCAISSEMENT` → [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`ID` (`SYS_C008312`, ENABLED).

Tables qui la référencent :

- [VERSEMENTCHEQUEDETAILS](tables.md#versementchequedetails).`IDCHEQUE` → [CHEQUE](tables.md#cheque).`ID`.

Vues dépendantes directes (2) : [CHEQUECPL](vues.md#chequecpl), [VERSEMENTCHEQUEDETAILSCPL](vues.md#versementchequedetailscpl).

Références dans le code : [cheque/Cheque.java:22](<../../projet-standard - Copie/arbiochem-ejb/src/java/cheque/Cheque.java#L22>).

<a id="civilite"></a>

## CIVILITE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `PK_CIVILITE` (primaire) : `ID`.

Tables qui la référencent :

- [LOG_PERSONNEL](tables.md#log-personnel).`IDCIVILITE` → [CIVILITE](tables.md#civilite).`ID`.

Vues dépendantes directes (1) : [EMPLOYE_COMPLET](vues.md#employe-complet).

Références dans le code : [paie/employe/infopersonnel-saisie.jsp:69](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/infopersonnel-saisie.jsp#L69>).

<a id="classeetfiche"></a>

## CLASSEETFICHE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `CLASSE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `FICHE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `V_CLASSETFICHE_PK` (primaire) : `ID`.

Vues dépendantes directes (1) : [V_CLASSEETFICHE](vues.md#v-classeetfiche).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="client"></a>

## CLIENT

Référentiel des clients.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `NOM` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TELEPHONE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MAIL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ADRESSE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDNATIONALITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPTEAUXILIAIRE` | `VARCHAR2(20 BYTE)` | Oui |  |
| `IDTYPECLIENT` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPECLIENT |
| `IDPROVINCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ECHEANCE` | `NUMBER(30,2)` | Oui |  |
| `TELFIXE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `NIF` | `VARCHAR2(255 BYTE)` | Oui |  |
| `STAT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CARTE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATECARTE` | `DATE` | Oui |  |
| `TAXE` | `NUMBER(5,2)` | Oui |  |
| `CODECLIENT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ESTACTIF` | `NUMBER(*,0)` | Oui |  |
| `QUITTANCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `WHATSAPP` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDMODEPAIEMENT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDPOINT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `NIVEAU` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATEECHEANCEPAIEMENT` | `DATE` | Oui |  |
| `SOCIETEMERE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDECHEANCEPAIEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ACTIF` | `NUMBER(38,0)` | Oui |  |
| `BDC` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DEMANDE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `FREQUENCE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `SEUIL` | `NUMBER(30,2)` | Oui |  |

Clés : `SYS_C007120` (primaire) : `ID` ; `SYS_C007121` (unique) : `COMPTEAUXILIAIRE`.

Clés étrangères sortantes :

- [CLIENT](tables.md#client).`IDTYPECLIENT` → [TYPECLIENT](tables.md#typeclient).`ID` (`FK_CLIENT_TYPECLIENT`, ENABLED).

Tables qui la référencent :

- [ACTE](tables.md#acte).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.
- [AS_BONDELIVRAISON_CLIENT](tables.md#as-bondelivraison-client).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.
- [AVOIRFC](tables.md#avoirfc).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.
- [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.
- [CHECKIN](tables.md#checkin).`CLIENT` → [CLIENT](tables.md#client).`ID`.
- [CHECKIN](tables.md#checkin).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.
- [CHEQUE](tables.md#cheque).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.
- [COMMANDE](tables.md#commande).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.
- [DETAILSBONCAISSE](tables.md#detailsboncaisse).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.
- [ENCAISSEMENT](tables.md#encaissement).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.
- [PAIEMENTBON](tables.md#paiementbon).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.
- [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.
- [PROFORMA](tables.md#proforma).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.
- [RESERVATION](tables.md#reservation).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.
- [VENTE](tables.md#vente).`IDCLIENT` → [CLIENT](tables.md#client).`ID`.

Vues dépendantes directes (50) : [ACTE_LIB](vues.md#acte-lib), [AS_BONDELIVRAISONCLIENT_LIBCPL](vues.md#as-bondelivraisonclient-libcpl), [AS_BONDELIVRAISON_CLIENT_CPL](vues.md#as-bondelivraison-client-cpl), [AS_BONDELIVRAISON_CLIENT_CPL2](vues.md#as-bondelivraison-client-cpl2), [AVOIRFC_MERE_MONTANT](vues.md#avoirfc-mere-montant), [BALANCE_CLIENT](vues.md#balance-client), [BONDECOMMANDE_CLIENT_CPL](vues.md#bondecommande-client-cpl), [BONDECOMMANDE_CLIENT_CPL_M](vues.md#bondecommande-client-cpl-m), [CHECKINLIBELLE](vues.md#checkinlibelle), [CLIENTLIB](vues.md#clientlib), [CLIENT_ACTIF](vues.md#client-actif), [COMMANDECPL](vues.md#commandecpl), [COMPTE_AUX](vues.md#compte-aux), [DETAILSBONCAISSECPL](vues.md#detailsboncaissecpl), [ETAT_VENTE_DETAILS_POIDS](vues.md#etat-vente-details-poids), [FACTURECLIENTCPL](vues.md#factureclientcpl), [INSERTION_VENTEAUTOCOMPLETE](vues.md#insertion-venteautocomplete), [MOUVEMENTCAISSEAUTOCOMPLETE](vues.md#mouvementcaisseautocomplete), [MOUVEMENTCAISSEMERELIB](vues.md#mouvementcaissemerelib), [PLANNINGFACTURELIB](vues.md#planningfacturelib), [PRECISDETENCAISSEMENT_LIB](vues.md#precisdetencaissement-lib), [PROFORMA_CPL](vues.md#proforma-cpl), [PROFORMA_CPL2](vues.md#proforma-cpl2), [RESERVATIONDETAILSAVECMERE](vues.md#reservationdetailsavecmere), [RESERVATION_LIB](vues.md#reservation-lib), [RISTOURNELIB](vues.md#ristournelib), [TIERS](vues.md#tiers), [TIERSENSEMBLE](vues.md#tiersensemble), [TRAITE_LIB](vues.md#traite-lib), [UPDATEVENTE](vues.md#updatevente), [VENTEDETCALCREMGLOVISE](vues.md#ventedetcalcremglovise), [VENTEDETMERECATINGRCATCLIENT](vues.md#ventedetmerecatingrcatclient), [VENTE_CPL](vues.md#vente-cpl), [VENTE_CPL_AVEC_MONTANT](vues.md#vente-cpl-avec-montant), [VENTE_CPL_AVEC_MONTANT_EUR](vues.md#vente-cpl-avec-montant-eur), [VENTE_CPL_AVEC_MONTANT_MGA](vues.md#vente-cpl-avec-montant-mga), [VENTE_CPL_AVEC_MONTANT_SANSDEV](vues.md#vente-cpl-avec-montant-sansdev), [VENTE_CPL_AVEC_MONTANT_USD](vues.md#vente-cpl-avec-montant-usd), [VENTE_CPL_BC_VISEE](vues.md#vente-cpl-bc-visee), [VENTE_CPL_CL](vues.md#vente-cpl-cl), [VENTE_CPL_SANSAVOIR](vues.md#vente-cpl-sansavoir), [VENTE_CPL_VISEE](vues.md#vente-cpl-visee), [VENTE_DETAILS_ANALYSE](vues.md#vente-details-analyse), [VENTE_DETAILS_CPL_2](vues.md#vente-details-cpl-2), [VENTE_DETAILS_POIDS_ING](vues.md#vente-details-poids-ing), [VENTE_DETAILS_VIDE](vues.md#vente-details-vide), [VENTE_DIRECTE_CPL_PDF](vues.md#vente-directe-cpl-pdf), [VENTE_LIB](vues.md#vente-lib), [VENTE_LIB_BC](vues.md#vente-lib-bc), [VENTE_MERE_MONTANT](vues.md#vente-mere-montant).

Références dans le code : [client/Client.java:137](<../../projet-standard - Copie/arbiochem-ejb/src/java/client/Client.java#L137>), [station/export/ExportPDF.java:471](<../../projet-standard - Copie/arbiochem-war/src/java/station/export/ExportPDF.java#L471>), [station/export/ExportPDFARBIOCHEM.java:591](<../../projet-standard - Copie/arbiochem-war/src/java/station/export/ExportPDFARBIOCHEM.java#L591>), [choix/client/client-choix.jsp:16](<../../projet-standard - Copie/arbiochem-war/web/pages/choix/client/client-choix.jsp#L16>), [client/client-arbiochem-saisie.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/client/client-arbiochem-saisie.jsp#L27>) ; 43 autres fichiers dans `usages-code.json`.

<a id="cloturecaisse"></a>

## CLOTURECAISSE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `IDPOINT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDCAISSE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `MONTANTTHEORIQUE` | `NUMBER(10,2)` | Oui |  |
| `MONTANT` | `NUMBER(10,2)` | Oui |  |
| `EXPLICATION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDUSER` | `VARCHAR2(255 BYTE)` | Oui |  |
| `HEURE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007122` (primaire) : `ID`.

Tables qui la référencent :

- [CLOTURECAISSEFILLE](tables.md#cloturecaissefille).`IDCLOTURE` → [CLOTURECAISSE](tables.md#cloturecaisse).`ID`.

Vues dépendantes directes (1) : [CLOTURECAISSE_CPL](vues.md#cloturecaisse-cpl).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="cloturecaissefille"></a>

## CLOTURECAISSEFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDCLOTURE` | `VARCHAR2(100 BYTE)` | Oui | FK → CLOTURECAISSE |
| `IDCAISSE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `EXPLICATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `MONTANTTHEORIQUE` | `NUMBER(30,2)` | Oui |  |
| `IDBILLETAGE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007123` (primaire) : `ID`.

Clés étrangères sortantes :

- [CLOTURECAISSEFILLE](tables.md#cloturecaissefille).`IDCLOTURE` → [CLOTURECAISSE](tables.md#cloturecaisse).`ID` (`SYS_C008203`, ENABLED).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="cloture-mois-annee"></a>

## CLOTURE_MOIS_ANNEE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `MOIS` | `NUMBER` | Oui |  |
| `ANNEE` | `NUMBER` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SYS_C007124` (primaire) : `ID`.

Références dans le code : [mg/cnaps/compta/ClotureMoisAnnee.java:72](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/ClotureMoisAnnee.java#L72>).

<a id="cnaps-user"></a>

## CNAPS_USER

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `CODE_DR` | `VARCHAR2(50 BYTE)` | Non |  |
| `USER_INIT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `AGENT_MO` | `VARCHAR2(50 BYTE)` | Oui |  |
| `AGENT_DISPONIBLE` | `VARCHAR2(10 BYTE)` | Oui |  |
| `USERNAME` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CODE_SERVICE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ID_UTILISATEUR` | `VARCHAR2(50 BYTE)` | Non |  |

Clés : `SYS_C007128` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="code-rome"></a>

## CODE_ROME

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDSOUSFAMILLE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CODE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007130` (primaire) : `ID`.

Vues dépendantes directes (4) : [CODE_ROME_LIB](vues.md#code-rome-lib), [FICHE_POSTE_LIB](vues.md#fiche-poste-lib), [METIERLIB](vues.md#metierlib), [V_HIERARCHIE_PROFESSIONNELLE](vues.md#v-hierarchie-professionnelle).

Références dans le code : [paie/competence/CodeRome.java:8](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/competence/CodeRome.java#L8>), [paie/competence/metier-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/competence/metier-saisie.jsp#L21>), [poste/ficheposte-saisie.jsp:44](<../../projet-standard - Copie/arbiochem-war/web/pages/poste/ficheposte-saisie.jsp#L44>).

<a id="commande"></a>

## COMMANDE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(500 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(500 BYTE)` | Oui |  |
| `MODEPAIEMENT` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDCLIENT` | `VARCHAR2(255 BYTE)` | Oui | FK → CLIENT |
| `REFERENCE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATEBESOIN` | `DATE` | Oui |  |
| `IDPROFORMA` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MODELIVRAISON` | `NUMBER` | Oui |  |
| `DATELIVRAISON` | `DATE` | Oui |  |
| `LIEULIVRAISON` | `VARCHAR2(255 BYTE)` | Oui |  |
| `FRAISLIVRAISON` | `NUMBER(30,2)` | Oui |  |

Clés : `COMMANDE_CLIENT_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [COMMANDE](tables.md#commande).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`C_DEVISE_FK`, ENABLED).
- [COMMANDE](tables.md#commande).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`C_FK_CLIENT`, ENABLED).

Tables qui la référencent :

- [COMMANDEFILLE](tables.md#commandefille).`IDC` → [COMMANDE](tables.md#commande).`ID`.

Vues dépendantes directes (3) : [COMMANDECPL](vues.md#commandecpl), [COMMANDEFILLE_CPL_LIB](vues.md#commandefille-cpl-lib), [COMMANDEMONTANT](vues.md#commandemontant).

Références dans le code : [vente/Commande.java:167](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/Commande.java#L167>).

<a id="commandefille"></a>

## COMMANDEFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(1000 BYTE)` | Non | PK |
| `PRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDC` | `VARCHAR2(500 BYTE)` | Oui | FK → COMMANDE |
| `QUANTITE` | `NUMBER(30,2)` | Oui |  |
| `PU` | `NUMBER(38,2)` | Oui |  |
| `MONTANT` | `FLOAT(126)` | Oui |  |
| `TVA` | `NUMBER(38,2)` | Oui |  |
| `REMISE` | `NUMBER(30,2)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `UNITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `RISTOURNE` | `NUMBER(5,2)` | Oui |  |
| `CALORIE` | `NUMBER(32,2)` | Oui |  |

Clés : `COMMANDE_CLIENT_FILLE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [COMMANDEFILLE](tables.md#commandefille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`CMD_D_FK`, ENABLED).
- [COMMANDEFILLE](tables.md#commandefille).`IDC` → [COMMANDE](tables.md#commande).`ID` (`C_FILLE`, ENABLED).

Vues dépendantes directes (5) : [COMMANDEFILLECPL](vues.md#commandefillecpl), [COMMANDEFILLEVIDE](vues.md#commandefillevide), [COMMANDEFILLE_ARBIOCHEM](vues.md#commandefille-arbiochem), [COMMANDEFILLE_CPL_LIB](vues.md#commandefille-cpl-lib), [COMMANDEFILLE_V](vues.md#commandefille-v).

Références dans le code : [vente/CommandeFille.java:199](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/CommandeFille.java#L199>).

<a id="commentairedemande"></a>

## COMMENTAIREDEMANDE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `REFUSER` | `NUMBER` | Oui |  |
| `NOMUSER` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `COMMENTAIRE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDDMDACHAT` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SYS_C007135` (primaire) : `ID`.

Références dans le code : [faturefournisseur/CommentaireDemande.java:16](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/CommentaireDemande.java#L16>).

<a id="commercial"></a>

## COMMERCIAL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `NOM` | `VARCHAR2(255 BYTE)` | Oui |  |
| `NUMERO` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ADRESSE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SYS_C007136` (primaire) : `ID`.

Tables qui la référencent :

- [COMMISSION](tables.md#commission).`IDCOMMERCIAL` → [COMMERCIAL](tables.md#commercial).`ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="commission"></a>

## COMMISSION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDCOMMERCIAL` | `VARCHAR2(255 BYTE)` | Oui | FK → COMMERCIAL |
| `IDMODEPAIEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → MODEPAIEMENT |
| `DATY` | `DATE` | Oui |  |
| `DESIGNATION` | `VARCHAR2(400 BYTE)` | Oui |  |
| `DATEECHEANCEPAIEMENT` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `REFERENCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDFACTURE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `TAUX` | `NUMBER(30,2)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(255 BYTE)` | Oui | FK → DEVISE |
| `ESTPREVU` | `NUMBER(1,0)` | Oui |  |
| `DATYPREVU` | `DATE` | Oui |  |

Clés : `SYS_C007137` (primaire) : `ID`.

Clés étrangères sortantes :

- [COMMISSION](tables.md#commission).`IDCOMMERCIAL` → [COMMERCIAL](tables.md#commercial).`ID` (`COMI_COMERCIAL_FK`, ENABLED).
- [COMMISSION](tables.md#commission).`IDMODEPAIEMENT` → [MODEPAIEMENT](tables.md#modepaiement).`ID` (`COMI_MODEPAIEMENT_FK`, ENABLED).
- [COMMISSION](tables.md#commission).`DEVISE` → [DEVISE](tables.md#devise).`ID` (`COM_DEVISE_FK`, ENABLED).
- [COMMISSION](tables.md#commission).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`COM_IDDEVISE_FK`, ENABLED).

Tables qui la référencent :

- [COMMISSIONFILLE](tables.md#commissionfille).`IDCOMMISSION` → [COMMISSION](tables.md#commission).`ID`.

Vues dépendantes directes (1) : [VENTE_DIRECTE_CPL_PDF](vues.md#vente-directe-cpl-pdf).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="commissionfille"></a>

## COMMISSIONFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDCOMMISSION` | `VARCHAR2(255 BYTE)` | Oui | FK → COMMISSION |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QTE` | `NUMBER` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `REMISES` | `NUMBER(10,2)` | Oui |  |
| `IDFACTUREDETAILS` | `VARCHAR2(250 BYTE)` | Oui |  |
| `TVA` | `NUMBER(10,2)` | Oui |  |
| `DEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `TAUXDECHANGE` | `NUMBER(30,2)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(255 BYTE)` | Oui | FK → DEVISE |
| `DESIGNATION` | `VARCHAR2(200 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007138` (primaire) : `ID`.

Clés étrangères sortantes :

- [COMMISSIONFILLE](tables.md#commissionfille).`DEVISE` → [DEVISE](tables.md#devise).`ID` (`COMFILLE_DEVISE_FK`, ENABLED).
- [COMMISSIONFILLE](tables.md#commissionfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`COMFILLE_IDDEVISE_FK`, ENABLED).
- [COMMISSIONFILLE](tables.md#commissionfille).`IDCOMMISSION` → [COMMISSION](tables.md#commission).`ID` (`COMIS_MEREFILLE_FK`, ENABLED).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="compta-classe-compte"></a>

## COMPTA_CLASSE_COMPTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `SYS_C007140` (primaire) : `ID`.

Vues dépendantes directes (1) : [COMPTA_COMPTE_LIBELLE](vues.md#compta-compte-libelle).

Références dans le code : [mg/cnaps/compta/ClasseCompte.java:18](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/ClasseCompte.java#L18>), [compta/configuration/classecompte-fiche.jsp:16](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/configuration/classecompte-fiche.jsp#L16>), [compta/configuration/classecompte-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/configuration/classecompte-liste.jsp#L7>), [compta/compte/compte-liste.jsp:38](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/compte/compte-liste.jsp#L38>), [compta/compte/compte-saisie.jsp:41](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/compte/compte-saisie.jsp#L41>).

<a id="compta-compte"></a>

## COMPTA_COMPTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `COMPTE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `TYPECOMPTE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CLASSY` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ANALYTIQUE_OBLI` | `VARCHAR2(10 BYTE)` | Oui |  |
| `IDJOURNAL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CODEIMPOT` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `COMPTA_COMPTE_UK1` (unique) : `COMPTE` ; `SYS_C007142` (primaire) : `ID`.

Tables qui la référencent :

- [COMPTA_SOUS_ECRITURE](tables.md#compta-sous-ecriture).`COMPTE` → [COMPTA_COMPTE](tables.md#compta-compte).`COMPTE`.

Vues dépendantes directes (34) : [CAISSECPL](vues.md#caissecpl), [COMPTA_COMPTE_INGREDIENTS](vues.md#compta-compte-ingredients), [COMPTA_COMPTE_LIB](vues.md#compta-compte-lib), [COMPTA_COMPTE_LIBELLE](vues.md#compta-compte-libelle), [COMPTA_LETTRAGE_LIB](vues.md#compta-lettrage-lib), [COMPTA_MOUVEMENT_ANALYTIQUE](vues.md#compta-mouvement-analytique), [COMPTA_MOUVEMENT_DETAILAUX](vues.md#compta-mouvement-detailaux), [COMPTA_MOUVEMENT_DETAILGEN](vues.md#compta-mouvement-detailgen), [COMPTA_MOUVEMENT_DETAILS_ANAL2](vues.md#compta-mouvement-details-anal2), [COMPTA_MOUVEMENT_GENERAL](vues.md#compta-mouvement-general), [COMPTA_REPORT](vues.md#compta-report), [COMPTA_SOUSECRITURE_CREE2](vues.md#compta-sousecriture-cree2), [COMPTA_SOUSECRITURE_ECRITURE](vues.md#compta-sousecriture-ecriture), [COMPTA_SOUSECRITURE_LIB](vues.md#compta-sousecriture-lib), [COMPTA_SOUSECRITURE_LIB_2](vues.md#compta-sousecriture-lib-2), [COMPTA_SOUSECRITURE_SANSPG](vues.md#compta-sousecriture-sanspg), [COMPTA_SOUSECRITURE_VISEE](vues.md#compta-sousecriture-visee), [COMPTA_SOUS_ECRITURE_ANAL](vues.md#compta-sous-ecriture-anal), [COMPTA_SOUS_ECRITURE_GEN](vues.md#compta-sous-ecriture-gen), [COMPTE6](vues.md#compte6), [COMPTE_ANALYTIQUE](vues.md#compte-analytique), [ECRITURE_DELA_PAIE_REGR_COMPTE](vues.md#ecriture-dela-paie-regr-compte), [ECRITURE_IMPOT](vues.md#ecriture-impot), [MAGASIN_COMPTE_CPL](vues.md#magasin-compte-cpl), [REPORTSOLDE](vues.md#reportsolde), [REPORTSOLDE_ANALYTIQUE](vues.md#reportsolde-analytique), [REPORTSOLDE_AUX_V1](vues.md#reportsolde-aux-v1), [REPORTSOLDE_GENERAL](vues.md#reportsolde-general), [REPORTSOLDE_GENERAL_V1](vues.md#reportsolde-general-v1), [REPORTSOLDE_JANVIER](vues.md#reportsolde-janvier), [SOUSECRITUREGROUPEBYUNIONVISE](vues.md#sousecrituregroupebyunionvise), [V_BALANCE_DETAILS](vues.md#v-balance-details), [V_BALANCE_DETAILS_ANALYTIQUE](vues.md#v-balance-details-analytique), [V_COMPTA_COMPTE](vues.md#v-compta-compte).

Références dans le code : [mg/cnaps/compta/ComptaCompte.java:140](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/ComptaCompte.java#L140>), [compta/compte/compte-liste.jsp:16](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/compte/compte-liste.jsp#L16>), [compta/compte/compte-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/compte/compte-saisie.jsp#L21>), [mg/cnaps/compta/Balance.java:146](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/Balance.java#L146>), [client/client-arbiochem-saisie.jsp:40](<../../projet-standard - Copie/arbiochem-war/web/pages/client/client-arbiochem-saisie.jsp#L40>) ; 20 autres fichiers dans `usages-code.json`.

<a id="compta-ecriture"></a>

## COMPTA_ECRITURE

Document principal d’écriture comptable.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `DATECOMPTABLE` | `DATE` | Oui |  |
| `EXERCICE` | `NUMBER(20,2)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(500 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `HORSEXERCICE` | `NUMBER` | Oui |  |
| `JOURNAL` | `VARCHAR2(50 BYTE)` | Non |  |
| `OD` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ORIGINE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CREDIT` | `NUMBER(20,2)` | Oui |  |
| `DEBIT` | `NUMBER(20,2)` | Oui |  |
| `IDUSER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `PERIODE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `TRIMESTRE` | `NUMBER` | Oui |  |
| `ANNEE` | `NUMBER` | Oui |  |
| `IDOBJET` | `VARCHAR2(50 BYTE)` | Oui |  |
| `LETTRAGE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATESAISIE` | `DATE` | Oui |  |
| `DATEMODIF` | `DATE` | Oui |  |
| `IDMODIFICATEUR` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SYS_C007147` (primaire) : `ID`.

Vues dépendantes directes (31) : [COMPTA_ECRITURE_FICHE](vues.md#compta-ecriture-fiche), [COMPTA_ECRITURE_LIB](vues.md#compta-ecriture-lib), [COMPTA_ECRITURE_LIB_ACHAT](vues.md#compta-ecriture-lib-achat), [COMPTA_ECRITURE_LIB_AVOIRFC](vues.md#compta-ecriture-lib-avoirfc), [COMPTA_ECRITURE_LIB_MANUELLE](vues.md#compta-ecriture-lib-manuelle), [COMPTA_ECRITURE_LIB_STOCK](vues.md#compta-ecriture-lib-stock), [COMPTA_ECRITURE_LIB_VENTE](vues.md#compta-ecriture-lib-vente), [COMPTA_ECRITURE_MF](vues.md#compta-ecriture-mf), [COMPTA_MOUVEMENT_DETAILS_ANAL2](vues.md#compta-mouvement-details-anal2), [COMPTA_SOUSECRITURE_ECRITURE](vues.md#compta-sousecriture-ecriture), [COMPTA_SOUSECRITURE_LETTRE](vues.md#compta-sousecriture-lettre), [COMPTA_SOUSECRITURE_LIB](vues.md#compta-sousecriture-lib), [COMPTA_SOUSECRITURE_LIB_2](vues.md#compta-sousecriture-lib-2), [COMPTA_SOUSECRITURE_LIB_J](vues.md#compta-sousecriture-lib-j), [COMPTA_SOUSECRITURE_SANSPG](vues.md#compta-sousecriture-sanspg), [COMPTA_SOUS_ECRITURE_CSEMF](vues.md#compta-sous-ecriture-csemf), [ECRITURE_IMPOT](vues.md#ecriture-impot), [FACTUREFOURNISSEURCPL](vues.md#facturefournisseurcpl), [FACTURESTANDARD](vues.md#facturestandard), [MOUVEMENTCAISSECPL](vues.md#mouvementcaissecpl), [MVTCAISSECPLORIGINE](vues.md#mvtcaissecplorigine), [RELEVECLIENT](vues.md#releveclient), [RELEVER_CLIENT_OPT](vues.md#relever-client-opt), [REPORTSOLDE](vues.md#reportsolde), [SOUSECRITURENR](vues.md#sousecriturenr), [SOUSECRITURER](vues.md#sousecriturer), [VENTE_CPL](vues.md#vente-cpl), [VENTE_CPL_CL](vues.md#vente-cpl-cl), [V_BALANCE_DETAILS](vues.md#v-balance-details), [V_BALANCE_DETAILS_ANALYTIQUE](vues.md#v-balance-details-analytique), [V_BALANCE_DETAILS_AUX](vues.md#v-balance-details-aux).

Références dans le code : [mg/cnaps/compta/ComptaEcriture.java:161](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/ComptaEcriture.java#L161>), [mg/cnaps/compta/Balance.java:133](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/Balance.java#L133>).

<a id="compta-ecriture-fita"></a>

## COMPTA_ECRITURE_FITA

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non |  |
| `DATY` | `DATE` | Oui |  |
| `DATECOMPTABLE` | `DATE` | Oui |  |
| `EXERCICE` | `NUMBER(20,2)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(500 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `HORSEXERCICE` | `NUMBER` | Oui |  |
| `JOURNAL` | `VARCHAR2(50 BYTE)` | Non |  |
| `OD` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ORIGINE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CREDIT` | `NUMBER(20,2)` | Oui |  |
| `DEBIT` | `NUMBER(20,2)` | Oui |  |
| `IDUSER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `PERIODE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `TRIMESTRE` | `NUMBER` | Oui |  |
| `ANNEE` | `NUMBER` | Oui |  |
| `IDOBJET` | `VARCHAR2(50 BYTE)` | Oui |  |
| `LETTRAGE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATESAISIE` | `DATE` | Oui |  |
| `DATEMODIF` | `DATE` | Oui |  |
| `IDMODIFICATEUR` | `VARCHAR2(50 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="compta-exercice"></a>

## COMPTA_EXERCICE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `NUMBER(4,0)` | Non |  |
| `EXERCICE` | `NUMBER(10,0)` | Oui |  |
| `ETAT` | `NUMBER(2,0)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MOIS_DEBUT` | `NUMBER` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Vues dépendantes directes (1) : [V_BILAN_SECTION_COMPTE_COMPLET](vues.md#v-bilan-section-compte-complet).

Références dans le code : [mg/cnaps/compta/ComptaExercice.java:32](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/ComptaExercice.java#L32>), [compta/ecriture/saisie-ecriture-multiple.jsp:42](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/ecriture/saisie-ecriture-multiple.jsp#L42>), [compta/etat/balance-filtre-apj.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/etat/balance-filtre-apj.jsp#L24>).

<a id="compta-journal"></a>

## COMPTA_JOURNAL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(300 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007152` (primaire) : `ID`.

Vues dépendantes directes (29) : [COMPTA_COMPTE_LIBELLE](vues.md#compta-compte-libelle), [COMPTA_ECRITURE_FICHE](vues.md#compta-ecriture-fiche), [COMPTA_ECRITURE_LIB](vues.md#compta-ecriture-lib), [COMPTA_ECRITURE_LIB_ACHAT](vues.md#compta-ecriture-lib-achat), [COMPTA_ECRITURE_LIB_AVOIRFC](vues.md#compta-ecriture-lib-avoirfc), [COMPTA_ECRITURE_LIB_MANUELLE](vues.md#compta-ecriture-lib-manuelle), [COMPTA_ECRITURE_LIB_STOCK](vues.md#compta-ecriture-lib-stock), [COMPTA_ECRITURE_LIB_VENTE](vues.md#compta-ecriture-lib-vente), [COMPTA_JOURNAL_COMPTE](vues.md#compta-journal-compte), [COMPTA_JOURNAL_ECRITURE_VIEW](vues.md#compta-journal-ecriture-view), [COMPTA_JOURNAL_MOTSCLESSS](vues.md#compta-journal-motsclesss), [COMPTA_JOURNAL_VIEW](vues.md#compta-journal-view), [COMPTA_LETTRAGE_LIB](vues.md#compta-lettrage-lib), [COMPTA_MOUVEMENT_GENERAL](vues.md#compta-mouvement-general), [COMPTA_REPORT](vues.md#compta-report), [COMPTA_SOUSECRITURE_CREE2](vues.md#compta-sousecriture-cree2), [COMPTA_SOUSECRITURE_ECRITURE](vues.md#compta-sousecriture-ecriture), [COMPTA_SOUSECRITURE_LIB](vues.md#compta-sousecriture-lib), [COMPTA_SOUSECRITURE_LIB_2](vues.md#compta-sousecriture-lib-2), [COMPTA_SOUSECRITURE_SANSPG](vues.md#compta-sousecriture-sanspg), [COMPTA_SOUSECRITURE_VISEE](vues.md#compta-sousecriture-visee), [RELEVECLIENT](vues.md#releveclient), [REPORTSOLDE](vues.md#reportsolde), [REPORTSOLDE_ANALYTIQUE](vues.md#reportsolde-analytique), [REPORTSOLDE_AUX_V1](vues.md#reportsolde-aux-v1), [REPORTSOLDE_GENERAL](vues.md#reportsolde-general), [REPORTSOLDE_GENERAL_V1](vues.md#reportsolde-general-v1), [REPORTSOLDE_JANVIER](vues.md#reportsolde-janvier), [SOUSECRITURENR](vues.md#sousecriturenr).

Références dans le code : [mg/cnaps/compta/Journal.java:21](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/Journal.java#L21>), [compta/bilan/bilan-filtre.jsp:12](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/bilan/bilan-filtre.jsp#L12>), [compta/etat/journal-filtre.jsp:12](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/etat/journal-filtre.jsp#L12>).

<a id="compta-lettrage"></a>

## COMPTA_LETTRAGE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `LETTRE` | `VARCHAR2(50 BYTE)` | Non |  |
| `DATE_LETTRAGE` | `DATE` | Non |  |
| `MONTANT` | `NUMBER(15,2)` | Non |  |
| `REMARQUE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `IDUSER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `PK_COMPTA_LETTRAGE` (primaire) : `ID` ; `UNICITE_LETTRE` (unique) : `LETTRE`.

Vues dépendantes directes (8) : [COMPTA_LETTRAGE_LIB](vues.md#compta-lettrage-lib), [COMPTA_MOUVEMENT_DETAILAUX](vues.md#compta-mouvement-detailaux), [COMPTA_MOUVEMENT_DETAILGEN](vues.md#compta-mouvement-detailgen), [COMPTA_MOUVEMENT_DETAILS_ANAL2](vues.md#compta-mouvement-details-anal2), [COMPTA_SOUSECRITURE_LETTRE](vues.md#compta-sousecriture-lettre), [COMPTA_SOUS_ECRITURE_ANAL](vues.md#compta-sous-ecriture-anal), [COMPTA_SOUS_ECRITURE_GEN](vues.md#compta-sous-ecriture-gen), [RELEVECLIENT](vues.md#releveclient).

Références dans le code : [mg/cnaps/compta/ComptaLettrage.java:31](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/ComptaLettrage.java#L31>).

<a id="compta-origine"></a>

## COMPTA_ORIGINE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `SYS_C007160` (primaire) : `ID`.

Références dans le code : [mg/cnaps/compta/OrigineCompte.java:18](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/OrigineCompte.java#L18>), [compta/configuration/origine-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/configuration/origine-fiche.jsp#L11>), [compta/configuration/origine-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/configuration/origine-liste.jsp#L7>).

<a id="compta-sous-ecriture"></a>

## COMPTA_SOUS_ECRITURE

Lignes comptables de débit et crédit.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non |  |
| `COMPTE` | `VARCHAR2(50 BYTE)` | Oui | FK → COMPTA_COMPTE |
| `DEBIT` | `NUMBER(20,2)` | Oui |  |
| `CREDIT` | `NUMBER(20,2)` | Oui |  |
| `REMARQUE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `LIBELLEPIECE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `IDMERE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `REFERENCE_ENGAGEMENT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `COMPTE_AUX` | `VARCHAR2(50 BYTE)` | Oui |  |
| `LETTRAGE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `JOURNAL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `EXERCICE` | `NUMBER` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `FOLIO` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ANALYTIQUE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `SOURCE` | `VARCHAR2(250 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Clés étrangères sortantes :

- [COMPTA_SOUS_ECRITURE](tables.md#compta-sous-ecriture).`COMPTE` → [COMPTA_COMPTE](tables.md#compta-compte).`COMPTE` (`SYS_C007908`, ENABLED).

Vues dépendantes directes (38) : [COMPTASOUSECRITURESTVA](vues.md#comptasousecriturestva), [COMPTA_ECRITURE_FILLE](vues.md#compta-ecriture-fille), [COMPTA_ECRITURE_MERE](vues.md#compta-ecriture-mere), [COMPTA_ECRITURE_MF](vues.md#compta-ecriture-mf), [COMPTA_LETTRAGE_LIB](vues.md#compta-lettrage-lib), [COMPTA_MONTANT](vues.md#compta-montant), [COMPTA_MOUVEMENT_ANALYTIQUE](vues.md#compta-mouvement-analytique), [COMPTA_MOUVEMENT_DETAILAUX](vues.md#compta-mouvement-detailaux), [COMPTA_MOUVEMENT_DETAILGEN](vues.md#compta-mouvement-detailgen), [COMPTA_MOUVEMENT_DETAILS_ANAL2](vues.md#compta-mouvement-details-anal2), [COMPTA_MOUVEMENT_GENERAL](vues.md#compta-mouvement-general), [COMPTA_REPORT](vues.md#compta-report), [COMPTA_SOUSECRITURE_CREE2](vues.md#compta-sousecriture-cree2), [COMPTA_SOUSECRITURE_ECRITURE](vues.md#compta-sousecriture-ecriture), [COMPTA_SOUSECRITURE_LIB](vues.md#compta-sousecriture-lib), [COMPTA_SOUSECRITURE_LIB_2](vues.md#compta-sousecriture-lib-2), [COMPTA_SOUSECRITURE_SANSPG](vues.md#compta-sousecriture-sanspg), [COMPTA_SOUSECRITURE_VISEE](vues.md#compta-sousecriture-visee), [COMPTA_SOUS_ECRITURE_ANAL](vues.md#compta-sous-ecriture-anal), [COMPTA_SOUS_ECRITURE_AUX](vues.md#compta-sous-ecriture-aux), [COMPTA_SOUS_ECRITURE_CSEMF](vues.md#compta-sous-ecriture-csemf), [COMPTA_SOUS_ECRITURE_GEN](vues.md#compta-sous-ecriture-gen), [ECRITURE_IMPOT](vues.md#ecriture-impot), [RELEVECLIENT](vues.md#releveclient), [RELEVER_CLIENT_OPT](vues.md#relever-client-opt), [REPORTSOLDE](vues.md#reportsolde), [REPORTSOLDE_ANALYTIQUE](vues.md#reportsolde-analytique), [REPORTSOLDE_AUX_V1](vues.md#reportsolde-aux-v1), [REPORTSOLDE_GENERAL](vues.md#reportsolde-general), [REPORTSOLDE_GENERAL_V1](vues.md#reportsolde-general-v1), [REPORTSOLDE_JANVIER](vues.md#reportsolde-janvier), [SOUSECRITURECOMPTEEXTRAIT](vues.md#sousecriturecompteextrait), [SOUSECRITURENR](vues.md#sousecriturenr), [SOUSECRITURER](vues.md#sousecriturer), [V_BALANCE_DETAILS](vues.md#v-balance-details), [V_BALANCE_DETAILS_ANALYTIQUE](vues.md#v-balance-details-analytique), [V_BALANCE_DETAILS_AUX](vues.md#v-balance-details-aux), [V_BILAN_SECTION_COMPTE_COMPLET](vues.md#v-bilan-section-compte-complet).

Références dans le code : [mg/cnaps/compta/ComptaLettrage.java:190](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/ComptaLettrage.java#L190>), [mg/cnaps/compta/ComptaSousEcriture.java:211](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/ComptaSousEcriture.java#L211>), [mg/cnaps/compta/ComptaSousEcritureModif.java:90](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/ComptaSousEcritureModif.java#L90>), [mg/cnaps/compta/Balance.java:132](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/Balance.java#L132>).

<a id="compta-sous-ecriture-fita"></a>

## COMPTA_SOUS_ECRITURE_FITA

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non |  |
| `COMPTE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DEBIT` | `NUMBER(20,2)` | Oui |  |
| `CREDIT` | `NUMBER(20,2)` | Oui |  |
| `REMARQUE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `LIBELLEPIECE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `IDMERE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `REFERENCE_ENGAGEMENT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `COMPTE_AUX` | `VARCHAR2(50 BYTE)` | Oui |  |
| `LETTRAGE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `JOURNAL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `EXERCICE` | `NUMBER` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `FOLIO` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ANALYTIQUE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `SOURCE` | `VARCHAR2(250 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="compta-type-compte"></a>

## COMPTA_TYPE_COMPTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `SYS_C007164` (primaire) : `ID`.

Vues dépendantes directes (6) : [COMPTA_COMPTE_LIBELLE](vues.md#compta-compte-libelle), [COMPTA_MOUVEMENT_DETAILAUX](vues.md#compta-mouvement-detailaux), [COMPTA_MOUVEMENT_DETAILGEN](vues.md#compta-mouvement-detailgen), [COMPTA_MOUVEMENT_DETAILS_ANAL2](vues.md#compta-mouvement-details-anal2), [COMPTA_SOUS_ECRITURE_ANAL](vues.md#compta-sous-ecriture-anal), [COMPTA_SOUS_ECRITURE_GEN](vues.md#compta-sous-ecriture-gen).

Références dans le code : [mg/cnaps/compta/TypeCompte.java:18](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/TypeCompte.java#L18>), [compta/compte/compte-liste.jsp:26](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/compte/compte-liste.jsp#L26>), [compta/compte/compte-modif.jsp:28](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/compte/compte-modif.jsp#L28>), [compta/compte/compte-saisie.jsp:31](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/compte/compte-saisie.jsp#L31>), [compta/configuration/typecompte-fiche.jsp:16](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/configuration/typecompte-fiche.jsp#L16>) ; 3 autres fichiers dans `usages-code.json`.

<a id="compteur"></a>

## COMPTEUR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `NOMBRE` | `NUMBER(30,2)` | Oui |  |
| `IDFABRICATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMACHINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DEBUT` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui | FK → MAGASIN2 |
| `IDTRANCHE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `COMPTEUR_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [COMPTEUR](tables.md#compteur).`IDORIGINE` → [MAGASIN2](tables.md#magasin2).`ID` (`COMPTEUR_ORIGINE_FK`, ENABLED).

Vues dépendantes directes (1) : [COMPTEURLIB](vues.md#compteurlib).

Références dans le code : [compteur/Compteur.java:59](<../../projet-standard - Copie/arbiochem-ejb/src/java/compteur/Compteur.java#L59>).

<a id="compteurelectricite"></a>

## COMPTEURELECTRICITE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDLIGNE` | `VARCHAR2(255 BYTE)` | Oui | FK → LIGNE |
| `VALEUR` | `NUMBER(38,0)` | Oui |  |
| `ECART` | `NUMBER(38,0)` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(255 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui | FK → MAGASIN2 |
| `ETAT` | `NUMBER` | Oui |  |
| `ANCIEN` | `NUMBER(30,3)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `HEURE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMACHINE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → COMPTEURELECTRICITEMERE |

Clés : `SYS_C007167` (primaire) : `ID`.

Clés étrangères sortantes :

- [COMPTEURELECTRICITE](tables.md#compteurelectricite).`IDMERE` → [COMPTEURELECTRICITEMERE](tables.md#compteurelectricitemere).`ID` (`COMPTEURELECTRICITE_MERE_FK`, ENABLED).
- [COMPTEURELECTRICITE](tables.md#compteurelectricite).`IDCATEGORIE` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`FK_COMPTEUR_INGREDIENTS_CE`, ENABLED).
- [COMPTEURELECTRICITE](tables.md#compteurelectricite).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` (`FK_COMPTEUR_MAGASIN_CE`, ENABLED).
- [COMPTEURELECTRICITE](tables.md#compteurelectricite).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID` (`SYS_C007932`, ENABLED).

Vues dépendantes directes (2) : [COMPTEURELECTRICITECPL](vues.md#compteurelectricitecpl), [COMPTEURELECTRICITELIB](vues.md#compteurelectricitelib).

Références dans le code : [compteur/CompteurElectricite.java:133](<../../projet-standard - Copie/arbiochem-ejb/src/java/compteur/CompteurElectricite.java#L133>), [compteur/initialisation-releve-electricite.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/compteur/initialisation-releve-electricite.jsp#L23>), [compteur/releve-electricite-multiple-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/compteur/releve-electricite-multiple-saisie.jsp#L23>).

<a id="compteurelectricitemere"></a>

## COMPTEURELECTRICITEMERE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `LIGNE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(5,0)` | Oui |  |

Clés : `SYS_C007168` (primaire) : `ID`.

Tables qui la référencent :

- [COMPTEURELECTRICITE](tables.md#compteurelectricite).`IDMERE` → [COMPTEURELECTRICITEMERE](tables.md#compteurelectricitemere).`ID`.

Vues dépendantes directes (2) : [COMPTEURELECTRICITECPL](vues.md#compteurelectricitecpl), [COMPTEURELECTRICITEMERELIB](vues.md#compteurelectricitemerelib).

Références dans le code : [compteur/CompteurElectriciteMere.java:76](<../../projet-standard - Copie/arbiochem-ejb/src/java/compteur/CompteurElectriciteMere.java#L76>), [compteur/initialisation-releve-electricite.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/compteur/initialisation-releve-electricite.jsp#L21>), [compteur/releve-electricite-multiple-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/compteur/releve-electricite-multiple-saisie.jsp#L21>).

<a id="compteurmaintenance"></a>

## COMPTEURMAINTENANCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDLIGNE` | `VARCHAR2(255 BYTE)` | Oui | FK → LIGNE |
| `VALEUR` | `NUMBER(38,0)` | Oui |  |
| `ECART` | `NUMBER(38,0)` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(255 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui | FK → MAGASIN2 |
| `ETAT` | `NUMBER` | Oui |  |
| `ANCIEN` | `NUMBER(30,3)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `HEURE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007170` (primaire) : `ID`.

Clés étrangères sortantes :

- [COMPTEURMAINTENANCE](tables.md#compteurmaintenance).`IDCATEGORIE` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`FK_COMPTEUR_INGREDIENTS`, ENABLED).
- [COMPTEURMAINTENANCE](tables.md#compteurmaintenance).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` (`FK_COMPTEUR_MAGASIN`, ENABLED).
- [COMPTEURMAINTENANCE](tables.md#compteurmaintenance).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID` (`SYS_C007933`, ENABLED).

Vues dépendantes directes (2) : [COMPTEURCPL](vues.md#compteurcpl), [RELEVERFABCPL](vues.md#releverfabcpl).

Références dans le code : [maintenance/configuration/CompteurMaintenance.java:93](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/configuration/CompteurMaintenance.java#L93>).

<a id="conditionnement"></a>

## CONDITIONNEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(44 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `SYS_C007171` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="configcnaps-plafond"></a>

## CONFIGCNAPS_PLAFOND

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `TYPECONFIG` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPTE_CREDIT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `VALMIN` | `NUMBER(30,2)` | Oui |  |
| `VALMAX` | `NUMBER(30,2)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Vues dépendantes directes (1) : [CONF_CNAPS](vues.md#conf-cnaps).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="configuration"></a>

## CONFIGURATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VALMIN` | `VARCHAR2(100 BYTE)` | Oui |  |
| `VALMAX` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `TYPECONFIG` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPTE_CREDIT` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `CONFIGURATION_PK` (primaire) : `ID`.

Vues dépendantes directes (5) : [PAIEINFOPERSELTPAIECOMPLET2](vues.md#paieinfoperseltpaiecomplet2), [V1_OSTIE_AFFICHE_T1](vues.md#v1-ostie-affiche-t1), [V1_OSTIE_AFFICHE_T2](vues.md#v1-ostie-affiche-t2), [V1_OSTIE_AFFICHE_T3](vues.md#v1-ostie-affiche-t3), [V1_OSTIE_AFFICHE_T4](vues.md#v1-ostie-affiche-t4).

Références dans le code : [configuration/Configuration.java:36](<../../projet-standard - Copie/arbiochem-ejb/src/java/configuration/Configuration.java#L36>), [paie/edition/EditionCalcul.java:108](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/EditionCalcul.java#L108>).

<a id="conge-fin-2023"></a>

## CONGE_FIN_2023

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `MATRICULE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CONGE` | `NUMBER(10,2)` | Oui |  |

Clés : `CONGE_FIN2023_PKEY` (primaire) : `ID` ; `CONGE_FIN_2023_MATRICULE_KEY` (unique) : `MATRICULE`.

Vues dépendantes directes (1) : [SOLDECONGE_FIN_2023](vues.md#soldeconge-fin-2023).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="consommablemachine"></a>

## CONSOMMABLEMACHINE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDMACHINE` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENT_MAINTENANCE |
| `IDCONSOMMABLE` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `IDTYPEMAINTENANCE` | `VARCHAR2(50 BYTE)` | Oui | FK → TYPEMAINTENANCE |
| `QTE` | `NUMBER(30,5)` | Oui |  |
| `IDUNITE` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_UNITE |
| `FREQUENCE` | `VARCHAR2(50 BYTE)` | Oui | FK → UNITEMAINTENANCE |

Clés : `SYS_C007178` (primaire) : `ID`.

Clés étrangères sortantes :

- [CONSOMMABLEMACHINE](tables.md#consommablemachine).`IDTYPEMAINTENANCE` → [TYPEMAINTENANCE](tables.md#typemaintenance).`ID` (`SYS_C008007`, ENABLED).
- [CONSOMMABLEMACHINE](tables.md#consommablemachine).`FREQUENCE` → [UNITEMAINTENANCE](tables.md#unitemaintenance).`ID` (`SYS_C008049`, ENABLED).
- [CONSOMMABLEMACHINE](tables.md#consommablemachine).`IDCONSOMMABLE` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`SYS_C008282`, ENABLED).
- [CONSOMMABLEMACHINE](tables.md#consommablemachine).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` (`SYS_C008302`, ENABLED).
- [CONSOMMABLEMACHINE](tables.md#consommablemachine).`IDUNITE` → [AS_UNITE](tables.md#as-unite).`ID` (`SYS_C008307`, ENABLED).

Vues dépendantes directes (1) : [CONSOMMABLEMACHINELIB](vues.md#consommablemachinelib).

Références dans le code : [maintenance/ressources/ConsommableMachine.java:77](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/ressources/ConsommableMachine.java#L77>).

<a id="consommation"></a>

## CONSOMMATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDTYPEMAINTENANCE` | `VARCHAR2(50 BYTE)` | Oui | FK → TYPEMAINTENANCE |
| `IDMACHINE` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENT_MAINTENANCE |
| `DESCE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(2,0)` | Oui |  |

Clés : `SYS_C007179` (primaire) : `ID`.

Clés étrangères sortantes :

- [CONSOMMATION](tables.md#consommation).`IDTYPEMAINTENANCE` → [TYPEMAINTENANCE](tables.md#typemaintenance).`ID` (`SYS_C008006`, ENABLED).
- [CONSOMMATION](tables.md#consommation).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` (`SYS_C008301`, ENABLED).

Tables qui la référencent :

- [CONSOMMATIONDETAILS](tables.md#consommationdetails).`IDMERE` → [CONSOMMATION](tables.md#consommation).`ID`.

Vues dépendantes directes (1) : [CONSOMMATIONLIB](vues.md#consommationlib).

Références dans le code : [maintenance/ressources/Consommation.java:58](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/ressources/Consommation.java#L58>), [maintenance/ressources/consommation-saisie.jsp:20](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/consommation-saisie.jsp#L20>).

<a id="consommationdetails"></a>

## CONSOMMATIONDETAILS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(50 BYTE)` | Oui | FK → CONSOMMATION |
| `IDINGREDIENTS` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `QTE` | `NUMBER(30,5)` | Oui |  |
| `IDUNITE` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_UNITE |

Clés : `SYS_C007180` (primaire) : `ID`.

Clés étrangères sortantes :

- [CONSOMMATIONDETAILS](tables.md#consommationdetails).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`SYS_C008281`, ENABLED).
- [CONSOMMATIONDETAILS](tables.md#consommationdetails).`IDUNITE` → [AS_UNITE](tables.md#as-unite).`ID` (`SYS_C008306`, ENABLED).
- [CONSOMMATIONDETAILS](tables.md#consommationdetails).`IDMERE` → [CONSOMMATION](tables.md#consommation).`ID` (`SYS_C008335`, ENABLED).

Vues dépendantes directes (1) : [CONSOMMATIONDETAILSLIB](vues.md#consommationdetailslib).

Références dans le code : [maintenance/ressources/ConsommationDetails.java:65](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/ressources/ConsommationDetails.java#L65>), [maintenance/ressources/consommation-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/consommation-saisie.jsp#L22>).

<a id="critere-eval-a-chaud"></a>

## CRITERE_EVAL_A_CHAUD

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007182` (primaire) : `ID`.

Tables qui la référencent :

- [EVALUATION_A_CHAUD_FILLE](tables.md#evaluation-a-chaud-fille).`IDEVALUATIONCRITERE` → [CRITERE_EVAL_A_CHAUD](tables.md#critere-eval-a-chaud).`ID`.

Vues dépendantes directes (1) : [EVALUATION_A_CHAUD_FILLE_LIB](vues.md#evaluation-a-chaud-fille-lib).

Références dans le code : [paie/evaluation/CritereEvalAChaud.java:7](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/evaluation/CritereEvalAChaud.java#L7>).

<a id="cv"></a>

## CV

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `NOMCANDIDAT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PRENOMCANDIDAT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TITRECV` | `VARCHAR2(255 BYTE)` | Oui |  |
| `RESUMEPROFIL` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `IDFICHEPOSTE` | `VARCHAR2(255 BYTE)` | Oui | FK → FICHE_POSTE |

Clés : `SYS_C007184` (primaire) : `ID`.

Clés étrangères sortantes :

- [CV](tables.md#cv).`IDFICHEPOSTE` → [FICHE_POSTE](tables.md#fiche-poste).`ID` (`FK_CV_FICHE_POSTE`, ENABLED).

Tables qui la référencent :

- [CV_CERTIFICATION](tables.md#cv-certification).`IDCV` → [CV](tables.md#cv).`ID`.
- [CV_COMPETENCE](tables.md#cv-competence).`IDCV` → [CV](tables.md#cv).`ID`.
- [CV_EXPERIENCE](tables.md#cv-experience).`IDCV` → [CV](tables.md#cv).`ID`.
- [CV_FORMATION](tables.md#cv-formation).`IDCV` → [CV](tables.md#cv).`ID`.
- [CV_LANGUE](tables.md#cv-langue).`IDCV` → [CV](tables.md#cv).`ID`.

Vues dépendantes directes (2) : [CV_LIB](vues.md#cv-lib), [V_MATCHING_CV_FP](vues.md#v-matching-cv-fp).

Références dans le code : [paie/cv/CV.java:74](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/cv/CV.java#L74>), [paie/cv/cv-saisie.jsp:18](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/cv-saisie.jsp#L18>).

<a id="cv-certification"></a>

## CV_CERTIFICATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `IDCV` | `VARCHAR2(250 BYTE)` | Oui | FK → CV |
| `NOMCERTIFICATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ORGANISME` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATEOBTENTION` | `DATE` | Oui |  |

Clés : `SYS_C007186` (primaire) : `ID`.

Clés étrangères sortantes :

- [CV_CERTIFICATION](tables.md#cv-certification).`IDCV` → [CV](tables.md#cv).`ID` (`FK_CV_CERTIFICATION_CV`, ENABLED).

Références dans le code : [paie/cv/CVCertification.java:58](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/cv/CVCertification.java#L58>), [paie/cv/certificationcv-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/certificationcv-saisie.jsp#L19>), [paie/cv/inc/cv-certification.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/inc/cv-certification.jsp#L7>).

<a id="cv-competence"></a>

## CV_COMPETENCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `IDCV` | `VARCHAR2(250 BYTE)` | Oui | FK → CV |
| `COMPETENCE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `NIVEAU` | `NUMBER(*,0)` | Oui |  |
| `IDTYPECOMPETENCESFP` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SYS_C007188` (primaire) : `ID`.

Clés étrangères sortantes :

- [CV_COMPETENCE](tables.md#cv-competence).`IDCV` → [CV](tables.md#cv).`ID` (`FK_CV_COMPETENCE_CV`, ENABLED).

Vues dépendantes directes (1) : [V_MATCHING_CV_FP](vues.md#v-matching-cv-fp).

Références dans le code : [paie/cv/CVCompetence.java:57](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/cv/CVCompetence.java#L57>), [paie/cv/competencecv-saisie.jsp:18](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/competencecv-saisie.jsp#L18>), [paie/cv/inc/cv-competence.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/inc/cv-competence.jsp#L7>).

<a id="cv-experience"></a>

## CV_EXPERIENCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `IDCV` | `VARCHAR2(250 BYTE)` | Oui | FK → CV |
| `ENTREPRISE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `POSTEOCCUPE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCRIPTION` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `SYS_C007190` (primaire) : `ID`.

Clés étrangères sortantes :

- [CV_EXPERIENCE](tables.md#cv-experience).`IDCV` → [CV](tables.md#cv).`ID` (`FK_CV_EXPERIENCE_CV`, ENABLED).

Références dans le code : [paie/cv/CVExperience.java:66](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/cv/CVExperience.java#L66>), [paie/cv/cv-saisie.jsp:20](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/cv-saisie.jsp#L20>), [paie/cv/experiencecv-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/experiencecv-saisie.jsp#L19>), [paie/cv/inc/cv-experience.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/inc/cv-experience.jsp#L7>).

<a id="cv-formation"></a>

## CV_FORMATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `IDCV` | `VARCHAR2(250 BYTE)` | Oui | FK → CV |
| `ETABLISSEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDDIPLOME` | `VARCHAR2(250 BYTE)` | Oui | FK → DIPLOME |
| `DOMAINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATEDEBUT` | `DATE` | Oui |  |
| `DATEFIN` | `DATE` | Oui |  |

Clés : `SYS_C007192` (primaire) : `ID`.

Clés étrangères sortantes :

- [CV_FORMATION](tables.md#cv-formation).`IDCV` → [CV](tables.md#cv).`ID` (`FK_CV_FORMATION_CV`, ENABLED).
- [CV_FORMATION](tables.md#cv-formation).`IDDIPLOME` → [DIPLOME](tables.md#diplome).`ID` (`FK_CV_FORMATION_DIPLOME`, ENABLED).

Références dans le code : [paie/cv/CVFormation.java:76](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/cv/CVFormation.java#L76>), [paie/cv/formationcv-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/formationcv-saisie.jsp#L21>), [paie/cv/inc/cv-formation.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/inc/cv-formation.jsp#L7>).

<a id="cv-langue"></a>

## CV_LANGUE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `IDCV` | `VARCHAR2(250 BYTE)` | Oui | FK → CV |
| `LANGUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `NIVEAULECTURE` | `NUMBER(*,0)` | Oui |  |
| `NIVEAUECRIT` | `NUMBER(*,0)` | Oui |  |
| `NIVEAUORAL` | `NUMBER(*,0)` | Oui |  |

Clés : `SYS_C007194` (primaire) : `ID`.

Clés étrangères sortantes :

- [CV_LANGUE](tables.md#cv-langue).`IDCV` → [CV](tables.md#cv).`ID` (`FK_CV_LANGUE_CV`, ENABLED).

Références dans le code : [paie/cv/CVLangue.java:66](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/cv/CVLangue.java#L66>), [paie/cv/inc/cv-langue.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/inc/cv-langue.jsp#L7>), [paie/cv/languecv-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/languecv-saisie.jsp#L19>).

<a id="datyexiste"></a>

## DATYEXISTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `DATY` | `DATE` | Non |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="declarationtva"></a>

## DECLARATIONTVA

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATYDEBUT` | `DATE` | Oui |  |
| `DATYFIN` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `SYS_C007200` (primaire) : `ID`.

Vues dépendantes directes (2) : [DECLARATIONTVALIB](vues.md#declarationtvalib), [DECLARATIONTVA_VIDE](vues.md#declarationtva-vide).

Références dans le code : [declaration/DeclarationTva.java:289](<../../projet-standard - Copie/arbiochem-ejb/src/java/declaration/DeclarationTva.java#L289>).

<a id="dec-decision-categorie"></a>

## DEC_DECISION_CATEGORIE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `DEC_DECISION_CATEGORIE_PKEY` (primaire) : `ID`.

Tables qui la référencent :

- [DEC_DECISION_TYPE](tables.md#dec-decision-type).`DESCE` → [DEC_DECISION_CATEGORIE](tables.md#dec-decision-categorie).`ID`.

Références dans le code : [paie/employe/personnelnonvalide-saisie.jsp:36](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/personnelnonvalide-saisie.jsp#L36>).

<a id="dec-decision-type"></a>

## DEC_DECISION_TYPE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(50 BYTE)` | Oui | FK → DEC_DECISION_CATEGORIE |

Clés : `DEC_DECISION_TYPE_PKEY` (primaire) : `ID`.

Clés étrangères sortantes :

- [DEC_DECISION_TYPE](tables.md#dec-decision-type).`DESCE` → [DEC_DECISION_CATEGORIE](tables.md#dec-decision-categorie).`ID` (`DEC_DECISION_TYPE_DESCE_FKEY`, ENABLED).

Vues dépendantes directes (5) : [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [LOG_PERS_NON_VALIDE_LIB_3](vues.md#log-pers-non-valide-lib-3), [PAIE_AVANCEMENT_LIBELLE2](vues.md#paie-avancement-libelle2), [PAIE_AVANCEMENT_LIBELLE4](vues.md#paie-avancement-libelle4).

Références dans le code : [paie/employe/DecDecisionType.java:23](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/DecDecisionType.java#L23>), [paie/avancement/avancement-categorie.jsp:32](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-categorie.jsp#L32>), [paie/avancement/avancement-contrat.jsp:32](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-contrat.jsp#L32>), [paie/avancement/avancement-direction.jsp:32](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-direction.jsp#L32>), [paie/avancement/avancement-fonction.jsp:32](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-fonction.jsp#L32>) ; 2 autres fichiers dans `usages-code.json`.

<a id="demande"></a>

## DEMANDE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(100 BYTE)` | Oui | FK → PAIE_INFO_PERSONNEL |
| `IDTYPEDEMANDE` | `VARCHAR2(100 BYTE)` | Oui | FK → TYPEDEMANDE |
| `TITRE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `HORAIRENORMAL` | `VARCHAR2(20 BYTE)` | Oui |  |
| `HEUREDEPART` | `VARCHAR2(20 BYTE)` | Oui |  |
| `HEUREARRIVE` | `VARCHAR2(20 BYTE)` | Oui |  |
| `IDTYPEABSENCE` | `VARCHAR2(100 BYTE)` | Oui | FK → TYPEABSENCE |
| `MOTIF` | `VARCHAR2(100 BYTE)` | Oui |  |
| `NUMERO` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `DUREE` | `NUMBER(10,2)` | Oui |  |
| `DATEDEPART` | `DATE` | Oui |  |
| `DATERETOUR` | `DATE` | Oui |  |
| `OBSERVATION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `IDREMPLACENTS` | `VARCHAR2(100 BYTE)` | Oui |  |
| `RESTE_CONGE` | `NUMBER(10,2)` | Oui |  |
| `DATEFIN` | `DATE` | Oui |  |
| `AVENANT` | `VARCHAR2(250 BYTE)` | Oui |  |
| `RESTE_PERMISSION` | `NUMBER(10,2)` | Oui |  |
| `MOTIFREFU` | `VARCHAR2(500 BYTE)` | Oui |  |
| `WEEKENDDECOMPTE` | `NUMBER` | Oui |  |
| `IDDEPARTEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `DEMANDE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [DEMANDE](tables.md#demande).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` (`DEMANDE_PAIEINFOPERS_ID_FK`, ENABLED).
- [DEMANDE](tables.md#demande).`IDTYPEABSENCE` → [TYPEABSENCE](tables.md#typeabsence).`ID` (`DEMANDE_TYPEABS_ID_FK`, ENABLED).
- [DEMANDE](tables.md#demande).`IDTYPEDEMANDE` → [TYPEDEMANDE](tables.md#typedemande).`ID` (`DEMANDE_TYPEDEMANDE_ID_FK`, ENABLED).

Tables qui la référencent :

- [HISTORIQUEDEMANDE](tables.md#historiquedemande).`IDDEMANDE` → [DEMANDE](tables.md#demande).`ID`.

Vues dépendantes directes (6) : [CONGEPRIS](vues.md#congepris), [DEMANDE_LIBCOMPLET](vues.md#demande-libcomplet), [DEMANDE_LIBCOMPLET2](vues.md#demande-libcomplet2), [DEMANDE_LIBCOMPLET3](vues.md#demande-libcomplet3), [DEMANDE_REMPLACENTS](vues.md#demande-remplacents), [SITUATIONDEMANDE](vues.md#situationdemande).

Références dans le code : [paie/conge/Conge.java:124](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/conge/Conge.java#L124>), [paie/demande/CongeCollectif.java:8](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/demande/CongeCollectif.java#L8>), [paie/demande/DemandeJustifications.java:74](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/demande/DemandeJustifications.java#L74>), [paie/demande/conge-collectif-saisie.jsp:34](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/demande/conge-collectif-saisie.jsp#L34>), [paie/demande/demande-absence-refu.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/demande/demande-absence-refu.jsp#L33>) ; 2 autres fichiers dans `usages-code.json`.

<a id="demandetransfert"></a>

## DEMANDETRANSFERT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(300 BYTE)` | Oui |  |
| `IDMAGASINDEPART` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASINARRIVE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDOF` | `VARCHAR2(255 BYTE)` | Oui | FK → OFAB |
| `CATEGORIEINGREDIENT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDFABRICATION` | `VARCHAR2(255 BYTE)` | Oui | FK → FABRICATION |

Clés : `DEMANDETRANSFERT_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [DEMANDETRANSFERT](tables.md#demandetransfert).`IDOF` → [OFAB](tables.md#ofab).`ID` (`DEMANDETRANSFERT_OF_FK`, ENABLED).
- [DEMANDETRANSFERT](tables.md#demandetransfert).`IDFABRICATION` → [FABRICATION](tables.md#fabrication).`ID` (`DEMTRANS_FAB_FK`, ENABLED).

Tables qui la référencent :

- [DEMANDETRANSFERTFILLE](tables.md#demandetransfertfille).`IDDEMANDETRANSFERT` → [DEMANDETRANSFERT](tables.md#demandetransfert).`ID`.
- [TRANSFERTSTOCK](tables.md#transfertstock).`IDDEMANDETRANSFERT` → [DEMANDETRANSFERT](tables.md#demandetransfert).`ID`.

Vues dépendantes directes (2) : [DEMANDETRANSFERTCPL](vues.md#demandetransfertcpl), [DEMANDETRANSFERTFILLECPL](vues.md#demandetransfertfillecpl).

Références dans le code : [demande/DemandeTransfert.java:35](<../../projet-standard - Copie/arbiochem-ejb/src/java/demande/DemandeTransfert.java#L35>), [fabrication/Fabrication.java:1060](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/Fabrication.java#L1060>), [fabrication/Of.java:568](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/Of.java#L568>), [demande/demandetransfert-saisie.jsp:79](<../../projet-standard - Copie/arbiochem-war/web/pages/demande/demandetransfert-saisie.jsp#L79>), [stock/transfertstock/transfertstock-saisie.jsp:118](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/transfertstock/transfertstock-saisie.jsp#L118>).

<a id="demandetransfertfille"></a>

## DEMANDETRANSFERTFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDDEMANDETRANSFERT` | `VARCHAR2(255 BYTE)` | Oui | FK → DEMANDETRANSFERT |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDSOURCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PU` | `NUMBER(30,5)` | Oui |  |
| `QUANTITE` | `NUMBER(30,5)` | Oui |  |

Clés : `DEMANDETRANSFERTFILLE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [DEMANDETRANSFERTFILLE](tables.md#demandetransfertfille).`IDDEMANDETRANSFERT` → [DEMANDETRANSFERT](tables.md#demandetransfert).`ID` (`DEMANDETRANSFERT_MEREFILLE_FK`, ENABLED).

Vues dépendantes directes (2) : [DEMANDETRANSFERTFILLECPL](vues.md#demandetransfertfillecpl), [DEMTRANSFILLEGROUPEMERE](vues.md#demtransfillegroupemere).

Références dans le code : [demande/DemandeTransfertFille.java:7](<../../projet-standard - Copie/arbiochem-ejb/src/java/demande/DemandeTransfertFille.java#L7>), [demande/demandetransfert-saisie.jsp:81](<../../projet-standard - Copie/arbiochem-war/web/pages/demande/demandetransfert-saisie.jsp#L81>).

<a id="demandetravaux"></a>

## DEMANDETRAVAUX

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDENTITE` | `VARCHAR2(255 BYTE)` | Oui | FK → ENTITE |
| `IDSITUATION` | `VARCHAR2(255 BYTE)` | Oui | FK → SITUATION |
| `IDMACHINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `DATEBESOIN` | `DATE` | Oui |  |
| `PRIORITE` | `VARCHAR2(22 BYTE)` | Oui |  |
| `ESTEXISTANT` | `NUMBER(*,0)` | Oui |  |
| `DESCRIPTION` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `DEMANDEUR` | `NUMBER(10,0)` | Oui | FK → UTILISATEUR |
| `CAUSE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `TYPE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `IDDEPARTEMENTMAINTENANCE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDDEPARTEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDPLANNING` | `VARCHAR2(40 BYTE)` | Oui |  |
| `IDTYPEMAINTENANCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `DEMANDETRAVAUX_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [DEMANDETRAVAUX](tables.md#demandetravaux).`DEMANDEUR` → [UTILISATEUR](tables.md#utilisateur).`REFUSER` (`DEMANDEUR_FK`, ENABLED).
- [DEMANDETRAVAUX](tables.md#demandetravaux).`IDENTITE` → [ENTITE](tables.md#entite).`ID` (`DMDTRAVAUXENTITE_FK`, ENABLED).
- [DEMANDETRAVAUX](tables.md#demandetravaux).`IDSITUATION` → [SITUATION](tables.md#situation).`ID` (`DMDTRAVAUXSITUATION_FK`, ENABLED).

Vues dépendantes directes (4) : [DEMANDETRAVAUX_CPL](vues.md#demandetravaux-cpl), [FREQUENCE_PANNE_MACHINE](vues.md#frequence-panne-machine), [NOMBRE_PANNE_MACHINE](vues.md#nombre-panne-machine), [ORDRETRAVAUXCPL](vues.md#ordretravauxcpl).

Références dans le code : [maintenance/planning/DemandeTravaux.java:49](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/planning/DemandeTravaux.java#L49>).

<a id="departement"></a>

## DEPARTEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ACTIF` | `NUMBER` | Oui |  |

Clés : `DEPARTEMENT_PK` (primaire) : `ID`.

Tables qui la référencent :

- [FICHE_POSTE](tables.md#fiche-poste).`IDDEPARTEMENT` → [DEPARTEMENT](tables.md#departement).`ID`.

Vues dépendantes directes (19) : [AS_BONDECOMMANDE_MERECPL](vues.md#as-bondecommande-merecpl), [AS_INGREDIENTS_LIB](vues.md#as-ingredients-lib), [AS_INGREDIENT_MAINTENANCE_LIB](vues.md#as-ingredient-maintenance-lib), [DEMANDETRAVAUX_CPL](vues.md#demandetravaux-cpl), [DEMANDE_LIBCOMPLET](vues.md#demande-libcomplet), [DEPARTEMENT_ACTIF](vues.md#departement-actif), [DMDACHATLIB](vues.md#dmdachatlib), [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [FICHE_POSTE_LIB](vues.md#fiche-poste-lib), [HEURESUPFABRICATION_CPL](vues.md#heuresupfabrication-cpl), [HSMOIS_CPL](vues.md#hsmois-cpl), [LOG_PERSONNEL_AVECCONGE](vues.md#log-personnel-avecconge), [LOG_PERSONNEL_FIN](vues.md#log-personnel-fin), [LOG_PERSONNEL_FIN_CONGE](vues.md#log-personnel-fin-conge), [LOG_PERSONNEL_GRAPHE](vues.md#log-personnel-graphe), [PLANNING_CPL](vues.md#planning-cpl), [POINTAGECANTINE_CPL](vues.md#pointagecantine-cpl), [SOLDE_CONGE_PERS](vues.md#solde-conge-pers), [SOLDE_FORMATION_SYNDICALE](vues.md#solde-formation-syndicale).

Références dans le code : [paie/annexe/Departement.java:19](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/annexe/Departement.java#L19>), [maintenance/demandetravaux/demandetravaux-saisie.jsp:40](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/demandetravaux/demandetravaux-saisie.jsp#L40>), [maintenance/ressources/machine/machine-liste.jsp:46](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/machine/machine-liste.jsp#L46>), [paie/avance/avancesaisie-multiple.jsp:143](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avance/avancesaisie-multiple.jsp#L143>), [paie/cantine/pointage-cantine-saisie.jsp:93](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cantine/pointage-cantine-saisie.jsp#L93>) ; 15 autres fichiers dans `usages-code.json`.

<a id="departementdivers"></a>

## DEPARTEMENTDIVERS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CODE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007209` (primaire) : `ID`.

Tables qui la référencent :

- [SECTION](tables.md#section).`IDSERVICE` → [DEPARTEMENTDIVERS](tables.md#departementdivers).`ID`.

Vues dépendantes directes (2) : [DEPENSEDIVERSLIB](vues.md#depensediverslib), [SECTION_LIB](vues.md#section-lib).

Références dans le code : [depense/depense-divers-saisie.jsp:37](<../../projet-standard - Copie/arbiochem-war/web/pages/depense/depense-divers-saisie.jsp#L37>).

<a id="departementmaintenance"></a>

## DEPARTEMENTMAINTENANCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007210` (primaire) : `ID`.

Tables qui la référencent :

- [PERSONNEL](tables.md#personnel).`IDDEPARTEMENT` → [DEPARTEMENTMAINTENANCE](tables.md#departementmaintenance).`ID`.

Vues dépendantes directes (2) : [DEMANDETRAVAUX_CPL](vues.md#demandetravaux-cpl), [PERSONNEMAINTENANCECPL](vues.md#personnemaintenancecpl).

Références dans le code : [maintenance/ressources/DepartementMaintenance.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/ressources/DepartementMaintenance.java#L9>), [maintenance/demandetravaux/demandetravaux-saisie.jsp:34](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/demandetravaux/demandetravaux-saisie.jsp#L34>).

<a id="depense"></a>

## DEPENSE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(400 BYTE)` | Oui |  |
| `IDCAISSE` | `VARCHAR2(255 BYTE)` | Non | FK → CAISSE |
| `IDOP` | `VARCHAR2(255 BYTE)` | Oui | FK → ORDONNERPAIEMENT |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `DEPENSE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [DEPENSE](tables.md#depense).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` (`DEPENSE_CAISSE_FK`, ENABLED).
- [DEPENSE](tables.md#depense).`IDOP` → [ORDONNERPAIEMENT](tables.md#ordonnerpaiement).`ID` (`DEPENSE_OP_FK`, ENABLED).

Vues dépendantes directes (2) : [DEPENSELIB](vues.md#depenselib), [DEPENSE_VALIDEE](vues.md#depense-validee).

Références dans le code : [depense/Depense.java:26](<../../projet-standard - Copie/arbiochem-ejb/src/java/depense/Depense.java#L26>), [depense/DepenseCreerValider.java:18](<../../projet-standard - Copie/arbiochem-ejb/src/java/depense/DepenseCreerValider.java#L18>), [encaissement/EncaissementReport.java:311](<../../projet-standard - Copie/arbiochem-ejb/src/java/encaissement/EncaissementReport.java#L311>), [depense/depense-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/depense/depense-saisie.jsp#L21>).

<a id="depensedivers"></a>

## DEPENSEDIVERS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `FOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → FOURNISSEUR |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMODEPAIEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `COMPTECHEQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ACHETEUR` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `SERVICE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDSECTION` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007213` (primaire) : `ID`.

Clés étrangères sortantes :

- [DEPENSEDIVERS](tables.md#depensedivers).`FOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` (`SYS_C008355`, ENABLED).

Tables qui la référencent :

- [DEPENSEDIVERSFILLE](tables.md#depensediversfille).`IDMERE` → [DEPENSEDIVERS](tables.md#depensedivers).`ID`.

Vues dépendantes directes (3) : [DEPENSEBONDELIVRAISON](vues.md#depensebondelivraison), [DEPENSEDFACTUREFOURNISSEUR](vues.md#depensedfacturefournisseur), [DEPENSEDIVERSLIB](vues.md#depensediverslib).

Références dans le code : [depense/DepenseDivers.java:112](<../../projet-standard - Copie/arbiochem-ejb/src/java/depense/DepenseDivers.java#L112>), [depense/depense-divers-saisie.jsp:20](<../../projet-standard - Copie/arbiochem-war/web/pages/depense/depense-divers-saisie.jsp#L20>).

<a id="depensediversfille"></a>

## DEPENSEDIVERSFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → DEPENSEDIVERS |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QUANTITE` | `NUMBER(10,2)` | Oui |  |
| `PU` | `NUMBER(10,2)` | Oui |  |
| `TVA` | `NUMBER(30,2)` | Oui |  |

Clés : `SYS_C007214` (primaire) : `ID`.

Clés étrangères sortantes :

- [DEPENSEDIVERSFILLE](tables.md#depensediversfille).`IDMERE` → [DEPENSEDIVERS](tables.md#depensedivers).`ID` (`SYS_C008075`, ENABLED).

Vues dépendantes directes (2) : [DEPENSEDIVERSFILLELIB](vues.md#depensediversfillelib), [DEPENSEDIVERSLIB](vues.md#depensediverslib).

Références dans le code : [depense/DepenseDiversFille.java:83](<../../projet-standard - Copie/arbiochem-ejb/src/java/depense/DepenseDiversFille.java#L83>), [depense/depense-divers-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/depense/depense-divers-saisie.jsp#L22>).

<a id="detailsboncaisse"></a>

## DETAILSBONCAISSE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDCAISSE` | `VARCHAR2(255 BYTE)` | Oui | FK → CAISSE |
| `DEBIT` | `NUMBER(30,2)` | Oui |  |
| `CREDIT` | `NUMBER(30,2)` | Oui |  |
| `IDCLIENT` | `VARCHAR2(255 BYTE)` | Oui | FK → CLIENT |
| `IDPRECISIONDETAILENCAISSEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → PRECISION_DETAIL_ENCAISSEMENT |
| `DATY` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `DETAILSBONCAISSE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [DETAILSBONCAISSE](tables.md#detailsboncaisse).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` (`DETAILBC_CAISSE_FK`, ENABLED).
- [DETAILSBONCAISSE](tables.md#detailsboncaisse).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`DETAILBC_CLIENT_FK`, ENABLED).
- [DETAILSBONCAISSE](tables.md#detailsboncaisse).`IDPRECISIONDETAILENCAISSEMENT` → [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`ID` (`DETAILBC_PRECDETENC_FK`, ENABLED).

Vues dépendantes directes (1) : [DETAILSBONCAISSECPL](vues.md#detailsboncaissecpl).

Références dans le code : [caisse/DetailsBonCaisse.java:28](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/DetailsBonCaisse.java#L28>).

<a id="detformu"></a>

## DETFORMU

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `MIN` | `NUMBER(30,2)` | Oui |  |
| `MAX` | `NUMBER(30,2)` | Oui |  |
| `FORMULE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `UNITE` | `NUMBER(30,2)` | Oui |  |
| `REMARQUE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `MERE` | `VARCHAR2(100 BYTE)` | Oui | FK → PAIE_RUBRIQUE |
| `FORMULECONDITION` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Non |  |
| `CREATION` | `DATE` | Oui |  |

Clés : `DETFORMU_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [DETFORMU](tables.md#detformu).`MERE` → [PAIE_RUBRIQUE](tables.md#paie-rubrique).`ID` (`DETFORMU_MERE_FKEY`, ENABLED).

Vues dépendantes directes (1) : [PAIEINFOPERSELTPAIECOMPLET2](vues.md#paieinfoperseltpaiecomplet2).

Références dans le code : [paie/generique/DetFormu.java:99](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/generique/DetFormu.java#L99>).

<a id="devise"></a>

## DEVISE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(120 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(130 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `PK_DEVISE` (primaire) : `ID`.

Tables qui la référencent :

- [AS_BONDECOMMANDE](tables.md#as-bondecommande).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [AS_BONDECOMMANDE_FILLE](tables.md#as-bondecommande-fille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [AVOIRACHATFILLE](tables.md#avoirachatfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [AVOIRFCFILLE](tables.md#avoirfcfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [CAISSE](tables.md#caisse).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [COMMANDE](tables.md#commande).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [COMMANDEFILLE](tables.md#commandefille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [COMMISSION](tables.md#commission).`DEVISE` → [DEVISE](tables.md#devise).`ID`.
- [COMMISSION](tables.md#commission).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [COMMISSIONFILLE](tables.md#commissionfille).`DEVISE` → [DEVISE](tables.md#devise).`ID`.
- [COMMISSIONFILLE](tables.md#commissionfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [ENCAISSEMENT](tables.md#encaissement).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [ENCAISSEMENT_DETAILS](tables.md#encaissement-details).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [FACTUREDECLARATION](tables.md#facturedeclaration).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [FACTUREDECLARATION](tables.md#facturedeclaration).`DEVISE` → [DEVISE](tables.md#devise).`ID`.
- [FACTUREDECLARATIONFILLE](tables.md#facturedeclarationfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`DEVISE` → [DEVISE](tables.md#devise).`ID`.
- [FACTUREFOURNISSEURFILLE](tables.md#facturefournisseurfille).`DEVISE` → [DEVISE](tables.md#devise).`ID`.
- [FACTUREFOURNISSEURFILLE](tables.md#facturefournisseurfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [FOURNISSEUR](tables.md#fournisseur).`DEVISE` → [DEVISE](tables.md#devise).`ID`.
- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [PREVISION](tables.md#prevision).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [PROFORMA_DETAILS](tables.md#proforma-details).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [TAUXDECHANGE](tables.md#tauxdechange).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.
- [VENTE_DETAILS](tables.md#vente-details).`IDDEVISE` → [DEVISE](tables.md#devise).`ID`.

Vues dépendantes directes (4) : [ACTION_FORMATION_DETAIL_LIB](vues.md#action-formation-detail-lib), [AS_BONDECOMMANDE_MERECPL](vues.md#as-bondecommande-merecpl), [AVOIRACHATFILLELIB](vues.md#avoirachatfillelib), [PREVISION_CPL](vues.md#prevision-cpl).

Références dans le code : [caisse/Devise.java:12](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/Devise.java#L12>), [facturefournisseur/avoir/avoirachat-arbiochem-saisie.jsp:59](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/avoir/avoirachat-arbiochem-saisie.jsp#L59>), [facturefournisseur/avoir/avoirachat-saisie.jsp:58](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/avoir/avoirachat-saisie.jsp#L58>), [facturefournisseur/facturefournisseur-modif.jsp:36](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/facturefournisseur-modif.jsp#L36>), [facturefournisseur/repartition-frais-divers.jsp:39](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/repartition-frais-divers.jsp#L39>) ; 2 autres fichiers dans `usages-code.json`.

<a id="diplome"></a>

## DIPLOME

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `NIVEAU` | `NUMBER(*,0)` | Oui |  |

Clés : `SYS_C007222` (primaire) : `ID`.

Tables qui la référencent :

- [CV_FORMATION](tables.md#cv-formation).`IDDIPLOME` → [DIPLOME](tables.md#diplome).`ID`.

Références dans le code : [paie/cv/Diplome.java:39](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/cv/Diplome.java#L39>), [paie/cv/formationcv-saisie.jsp:39](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/formationcv-saisie.jsp#L39>).

<a id="direction"></a>

## DIRECTION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `IDDIR` | `VARCHAR2(250 BYTE)` | Non | PK |
| `LIBELLEDIR` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DESCDIR` | `VARCHAR2(250 BYTE)` | Oui |  |
| `IDDIRECTEUR` | `NUMBER(4,0)` | Oui |  |
| `ABBREVDIR` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `PK_DIRECTION` (primaire) : `IDDIR`.

Vues dépendantes directes (5) : [DIRECTION_LISTE](vues.md#direction-liste), [UTILISATEURCPL](vues.md#utilisateurcpl), [UTILISATEURVUE](vues.md#utilisateurvue), [UTILISATEURVUEFICHE_ID](vues.md#utilisateurvuefiche-id), [UTILISATEUR_ACTIONROLE](vues.md#utilisateur-actionrole).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="distributionaliment"></a>

## DISTRIBUTIONALIMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDFERME` | `VARCHAR2(50 BYTE)` | Oui | FK → MAGASIN2 |
| `IDLOT` | `VARCHAR2(50 BYTE)` | Oui | FK → LOT |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SYS_C007225` (primaire) : `ID`.

Clés étrangères sortantes :

- [DISTRIBUTIONALIMENT](tables.md#distributionaliment).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID` (`FK_DISTALIM_FERME`, ENABLED).
- [DISTRIBUTIONALIMENT](tables.md#distributionaliment).`IDLOT` → [LOT](tables.md#lot).`ID` (`FK_DISTALIM_LOT`, ENABLED).

Tables qui la référencent :

- [DISTRIBUTIONALIMENTDETAIL](tables.md#distributionalimentdetail).`IDMERE` → [DISTRIBUTIONALIMENT](tables.md#distributionaliment).`ID`.

Vues dépendantes directes (1) : [DISTRIBUTIONALIMENT_LIB](vues.md#distributionaliment-lib).

Références dans le code : [ferme/aliment/DistributionAliment.java:17](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/aliment/DistributionAliment.java#L17>).

<a id="distributionalimentdetail"></a>

## DISTRIBUTIONALIMENTDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(50 BYTE)` | Oui | FK → DISTRIBUTIONALIMENT |
| `IDBATIMENT` | `VARCHAR2(50 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUET` | `VARCHAR2(50 BYTE)` | Oui | FK → PARQUET |
| `IDALIMENT` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `IDLOTSTOCK` | `VARCHAR2(50 BYTE)` | Oui |  |
| `QTE` | `NUMBER(10,2)` | Oui |  |
| `RATIONPARTETE` | `NUMBER(10,2)` | Oui |  |

Clés : `SYS_C007226` (primaire) : `ID`.

Clés étrangères sortantes :

- [DISTRIBUTIONALIMENTDETAIL](tables.md#distributionalimentdetail).`IDALIMENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`FK_DISTALIMDET_ALIMENT`, ENABLED).
- [DISTRIBUTIONALIMENTDETAIL](tables.md#distributionalimentdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` (`FK_DISTALIMDET_BATIMENT`, ENABLED).
- [DISTRIBUTIONALIMENTDETAIL](tables.md#distributionalimentdetail).`IDMERE` → [DISTRIBUTIONALIMENT](tables.md#distributionaliment).`ID` (`FK_DISTALIMDET_MERE`, ENABLED).
- [DISTRIBUTIONALIMENTDETAIL](tables.md#distributionalimentdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` (`FK_DISTALIMDET_PARQUET`, ENABLED).

Vues dépendantes directes (1) : [DISTRIBUTIONALIMENTDETAIL_LIB](vues.md#distributionalimentdetail-lib).

Références dans le code : [ferme/aliment/DistributionAlimentDetail.java:16](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/aliment/DistributionAlimentDetail.java#L16>).

<a id="dmdachat"></a>

## DMDACHAT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `FOURNISSEUR` | `VARCHAR2(50 BYTE)` | Oui | FK → FOURNISSEUR |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `DATELIMITE` | `DATE` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDOBJET` | `VARCHAR2(255 BYTE)` | Oui |  |
| `SERVICE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDPROVENANCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SYS_C007227` (primaire) : `ID`.

Clés étrangères sortantes :

- [DMDACHAT](tables.md#dmdachat).`FOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` (`DMDACHAT_FRNS_FK`, ENABLED).

Tables qui la référencent :

- [DMDACHATFILLE](tables.md#dmdachatfille).`IDMERE` → [DMDACHAT](tables.md#dmdachat).`ID`.
- [FACTUREDECLARATION](tables.md#facturedeclaration).`IDDMDACHAT` → [DMDACHAT](tables.md#dmdachat).`ID`.
- [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDDMDACHAT` → [DMDACHAT](tables.md#dmdachat).`ID`.
- [PLANCOMMANDE](tables.md#plancommande).`IDDMDACHAT` → [DMDACHAT](tables.md#dmdachat).`ID`.

Vues dépendantes directes (3) : [DMDACHATLIB](vues.md#dmdachatlib), [DMDACHATSUIVICOMMANDE](vues.md#dmdachatsuivicommande), [FACTUREFOURNISSEURCPL_TRAVAUX](vues.md#facturefournisseurcpl-travaux).

Références dans le code : [faturefournisseur/DmdAchat.java:33](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/DmdAchat.java#L33>), [bondecommande/bondecommande-arbiochem-saisie.jsp:60](<../../projet-standard - Copie/arbiochem-war/web/pages/bondecommande/bondecommande-arbiochem-saisie.jsp#L60>), [bondecommande/bondecommande-saisie.jsp:58](<../../projet-standard - Copie/arbiochem-war/web/pages/bondecommande/bondecommande-saisie.jsp#L58>).

<a id="dmdachatfille"></a>

## DMDACHATFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(50 BYTE)` | Oui | FK → DMDACHAT |
| `IDPRODUIT` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QUANTITE` | `NUMBER(20,2)` | Oui |  |
| `PU` | `NUMBER(20,2)` | Oui |  |
| `TVA` | `NUMBER(20,2)` | Oui |  |
| `QTESTOCK` | `NUMBER(30,3)` | Oui |  |
| `REFERENCE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `SYS_C007228` (primaire) : `ID`.

Clés étrangères sortantes :

- [DMDACHATFILLE](tables.md#dmdachatfille).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`DMDACHATFILLE_PROD_FK`, ENABLED).
- [DMDACHATFILLE](tables.md#dmdachatfille).`IDMERE` → [DMDACHAT](tables.md#dmdachat).`ID` (`DMDACHAT_MEREFILLE_FK`, ENABLED).

Vues dépendantes directes (2) : [DMDACHATFILLE_LIB](vues.md#dmdachatfille-lib), [DMDACHATSUIVICOMMANDE](vues.md#dmdachatsuivicommande).

Références dans le code : [faturefournisseur/DmdAchatFille.java:18](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/DmdAchatFille.java#L18>).

<a id="echeancepaiement"></a>

## ECHEANCEPAIEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `NOMBREJOUR` | `NUMBER` | Oui |  |

Clés : `SYS_C007230` (primaire) : `ID`.

Vues dépendantes directes (1) : [VENTE_DIRECTE_CPL_PDF](vues.md#vente-directe-cpl-pdf).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="eclosion"></a>

## ECLOSION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDLOT` | `VARCHAR2(100 BYTE)` | Oui | FK → LOT |
| `DATEECLOSION` | `DATE` | Oui |  |
| `NOMBREOEUFINITIAL` | `NUMBER(30,2)` | Oui |  |
| `IDECLOSOIR` | `VARCHAR2(100 BYTE)` | Oui | FK → ECLOSOIR |
| `IDINCUBATEUR` | `VARCHAR2(100 BYTE)` | Oui | FK → INCUBATEUR |
| `IDBATIMENT` | `VARCHAR2(100 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUET` | `VARCHAR2(100 BYTE)` | Oui | FK → PARQUET |
| `ETAT` | `NUMBER(30,2)` | Oui |  |

Clés : `ECLOSION_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [ECLOSION](tables.md#eclosion).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` (`ECLOSION_BAT_FK`, ENABLED).
- [ECLOSION](tables.md#eclosion).`IDECLOSOIR` → [ECLOSOIR](tables.md#eclosoir).`ID` (`ECLOSION_ECLOSOIR_FK`, ENABLED).
- [ECLOSION](tables.md#eclosion).`IDINCUBATEUR` → [INCUBATEUR](tables.md#incubateur).`ID` (`ECLOSION_INCUB_FK`, ENABLED).
- [ECLOSION](tables.md#eclosion).`IDLOT` → [LOT](tables.md#lot).`ID` (`ECLOSION_LOT_FK`, ENABLED).
- [ECLOSION](tables.md#eclosion).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` (`ECLOSION_PARQ_FK`, ENABLED).

Tables qui la référencent :

- [ECLOSIONDETAIL](tables.md#eclosiondetail).`IDMERE` → [ECLOSION](tables.md#eclosion).`ID`.

Vues dépendantes directes (1) : [ECLOSION_LIB](vues.md#eclosion-lib).

Références dans le code : [ferme/couvoir/Eclosion.java:84](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/couvoir/Eclosion.java#L84>), [ferme/couvoir/eclosion-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/eclosion-saisie.jsp#L22>).

<a id="eclosiondetail"></a>

## ECLOSIONDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(100 BYTE)` | Oui | FK → ECLOSION |
| `IDQUALITEECLOSION` | `VARCHAR2(100 BYTE)` | Oui | FK → QUALITEECLOSION |
| `QTE` | `NUMBER(30,2)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `ECLOSIONDET_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [ECLOSIONDETAIL](tables.md#eclosiondetail).`IDMERE` → [ECLOSION](tables.md#eclosion).`ID` (`ECLOSIONDET_MERE_FK`, ENABLED).
- [ECLOSIONDETAIL](tables.md#eclosiondetail).`IDQUALITEECLOSION` → [QUALITEECLOSION](tables.md#qualiteeclosion).`ID` (`ECLOSIONDET_QUAL_FK`, ENABLED).

Vues dépendantes directes (1) : [ECLOSIONDETAIL_LIB](vues.md#eclosiondetail-lib).

Références dans le code : [ferme/couvoir/EclosionDetail.java:65](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/couvoir/EclosionDetail.java#L65>), [ferme/couvoir/eclosion-saisie.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/eclosion-saisie.jsp#L24>).

<a id="eclosoir"></a>

## ECLOSOIR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CAPACITE` | `NUMBER(30,2)` | Oui |  |

Clés : `SYS_C007233` (primaire) : `ID`.

Tables qui la référencent :

- [ECLOSION](tables.md#eclosion).`IDECLOSOIR` → [ECLOSOIR](tables.md#eclosoir).`ID`.
- [TRIAGEQUALITEPOUSSIN](tables.md#triagequalitepoussin).`IDECLOSOIR` → [ECLOSOIR](tables.md#eclosoir).`ID`.

Vues dépendantes directes (2) : [ECLOSION_LIB](vues.md#eclosion-lib), [TRIAGEQUALITEPOUSSIN_LIB](vues.md#triagequalitepoussin-lib).

Références dans le code : [ferme/configuration/Eclosoir.java:14](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/configuration/Eclosoir.java#L14>), [ferme/configuration/eclosoir-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/eclosoir-saisie.jsp#L19>), [ferme/couvoir/eclosion-saisie.jsp:32](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/eclosion-saisie.jsp#L32>), [ferme/couvoir/triagequalitepoussin-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/triagequalitepoussin-saisie.jsp#L33>).

<a id="elementinspection"></a>

## ELEMENTINSPECTION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007234` (primaire) : `ID`.

Tables qui la référencent :

- [ELEMENTINSPECTIONMACHINE](tables.md#elementinspectionmachine).`IDELEMENTINSPECTION` → [ELEMENTINSPECTION](tables.md#elementinspection).`ID`.
- [HISTORIQUEINSPECTIONFILLE](tables.md#historiqueinspectionfille).`IDELEMENT` → [ELEMENTINSPECTION](tables.md#elementinspection).`ID`.
- [INSPECTIONFILLE](tables.md#inspectionfille).`IDELEMENT` → [ELEMENTINSPECTION](tables.md#elementinspection).`ID`.

Vues dépendantes directes (3) : [ELEMENTINSPECTIONMACHINELIB](vues.md#elementinspectionmachinelib), [INSPECTIONFILLELIB](vues.md#inspectionfillelib), [SOCOBISMAINTENANCE0203](vues.md#socobismaintenance0203).

Références dans le code : [machine/ElementInspection.java:18](<../../projet-standard - Copie/arbiochem-ejb/src/java/machine/ElementInspection.java#L18>), [maintenance/elementInspection/elementInspection-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/elementInspection/elementInspection-fiche.jsp#L11>), [maintenance/elementInspection/elementInspection-liste.jsp:9](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/elementInspection/elementInspection-liste.jsp#L9>), [maintenance/elementInspection/elementInspection-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/elementInspection/elementInspection-saisie.jsp#L13>), [inspection/inspection-saisie.jsp:50](<../../projet-standard - Copie/arbiochem-war/web/pages/inspection/inspection-saisie.jsp#L50>) ; 1 autres fichiers dans `usages-code.json`.

<a id="elementinspectionmachine"></a>

## ELEMENTINSPECTIONMACHINE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDELEMENTINSPECTION` | `VARCHAR2(100 BYTE)` | Oui | FK → ELEMENTINSPECTION |
| `IDMACHINE` | `VARCHAR2(100 BYTE)` | Oui | FK → AS_INGREDIENT_MAINTENANCE |

Clés : `SYS_C007235` (primaire) : `ID`.

Clés étrangères sortantes :

- [ELEMENTINSPECTIONMACHINE](tables.md#elementinspectionmachine).`IDELEMENTINSPECTION` → [ELEMENTINSPECTION](tables.md#elementinspection).`ID` (`FK_ELEMENT_INSPECTION`, ENABLED).
- [ELEMENTINSPECTIONMACHINE](tables.md#elementinspectionmachine).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` (`SYS_C008300`, ENABLED).

Vues dépendantes directes (3) : [ELEMENTINSPECTIONMACHINELIB](vues.md#elementinspectionmachinelib), [INSPECTIONFILLELIB](vues.md#inspectionfillelib), [SOCOBISMAINTENANCE0203](vues.md#socobismaintenance0203).

Références dans le code : [machine/ElementInspectionMachine.java:38](<../../projet-standard - Copie/arbiochem-ejb/src/java/machine/ElementInspectionMachine.java#L38>), [maintenance/elementInspection/elementInspectionMachine-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/elementInspection/elementInspectionMachine-saisie.jsp#L13>).

<a id="emploi"></a>

## EMPLOI

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMETIER` | `VARCHAR2(50 BYTE)` | Oui | FK → METIER |

Clés : `SYS_C007237` (primaire) : `ID`.

Clés étrangères sortantes :

- [EMPLOI](tables.md#emploi).`IDMETIER` → [METIER](tables.md#metier).`ID` (`SYS_C008161`, ENABLED).

Vues dépendantes directes (3) : [EMPLOI_LIB](vues.md#emploi-lib), [FICHE_POSTE_LIB](vues.md#fiche-poste-lib), [V_HIERARCHIE_PROFESSIONNELLE](vues.md#v-hierarchie-professionnelle).

Références dans le code : [paie/competence/Emploi.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/competence/Emploi.java#L10>), [paie/competence/emploi-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/competence/emploi-saisie.jsp#L13>), [poste/ficheposte-saisie.jsp:43](<../../projet-standard - Copie/arbiochem-war/web/pages/poste/ficheposte-saisie.jsp#L43>).

<a id="employee-onboarding-checklist"></a>

## EMPLOYEE_ONBOARDING_CHECKLIST

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDSESSIONONBOARDING` | `VARCHAR2(255 BYTE)` | Non | FK → EMPLOYEE_ONBOARDING_SESSIONS |
| `IDONBOARDINGITEM` | `VARCHAR2(255 BYTE)` | Non |  |
| `ESTTERMINER` | `NUMBER(1,0)` | Non |  |
| `DATEFIN` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `SYS_C007241` (primaire) : `ID`.

Clés étrangères sortantes :

- [EMPLOYEE_ONBOARDING_CHECKLIST](tables.md#employee-onboarding-checklist).`IDSESSIONONBOARDING` → [EMPLOYEE_ONBOARDING_SESSIONS](tables.md#employee-onboarding-sessions).`ID` (`FK_CHECKLIST_SESSION`, ENABLED).

Vues dépendantes directes (1) : [EMPLOYEEONBOARDINGCHECKLISTCPL](vues.md#employeeonboardingchecklistcpl).

Références dans le code : [onBoarding/EmployeOnBoardingChecklist.java:69](<../../projet-standard - Copie/arbiochem-ejb/src/java/onBoarding/EmployeOnBoardingChecklist.java#L69>).

<a id="employee-onboarding-sessions"></a>

## EMPLOYEE_ONBOARDING_SESSIONS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(36 BYTE)` | Non |  |
| `IDONBOARDING` | `VARCHAR2(36 BYTE)` | Non | FK → ONBOARDING_MERE |
| `DATEDEBUT` | `DATE` | Non |  |
| `DATEFIN` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `PROGRESSION` | `NUMBER(5,2)` | Oui |  |

Clés : `SYS_C007245` (primaire) : `ID`.

Clés étrangères sortantes :

- [EMPLOYEE_ONBOARDING_SESSIONS](tables.md#employee-onboarding-sessions).`IDONBOARDING` → [ONBOARDING_MERE](tables.md#onboarding-mere).`ID` (`FK_SESSION_ONBOARDING`, ENABLED).

Tables qui la référencent :

- [EMPLOYEE_ONBOARDING_CHECKLIST](tables.md#employee-onboarding-checklist).`IDSESSIONONBOARDING` → [EMPLOYEE_ONBOARDING_SESSIONS](tables.md#employee-onboarding-sessions).`ID`.

Vues dépendantes directes (2) : [EMPLOYEEONBOARDINGCHECKLISTCPL](vues.md#employeeonboardingchecklistcpl), [EMPLOYEEONBOARDINGSESSIONSCPL](vues.md#employeeonboardingsessionscpl).

Références dans le code : [onBoarding/EmployeOnBoardingSession.java:75](<../../projet-standard - Copie/arbiochem-ejb/src/java/onBoarding/EmployeOnBoardingSession.java#L75>), [onBoarding/employeeonboarding-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/onBoarding/employeeonboarding-saisie.jsp#L23>), [onBoarding/onboardingspecpersonnel-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/onBoarding/onboardingspecpersonnel-saisie.jsp#L23>).

<a id="encaissement"></a>

## ENCAISSEMENT

Document principal d’encaissement.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(400 BYTE)` | Oui |  |
| `IDCAISSE` | `VARCHAR2(255 BYTE)` | Oui | FK → CAISSE |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPEENCAISSEMENT` | `VARCHAR2(100 BYTE)` | Oui | FK → TYPE_ENCAISSEMENT |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `TAUX` | `NUMBER(10,2)` | Oui |  |
| `IDCLIENT` | `VARCHAR2(100 BYTE)` | Oui | FK → CLIENT |

Clés : `SYS_C007246` (primaire) : `ID`.

Clés étrangères sortantes :

- [ENCAISSEMENT](tables.md#encaissement).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` (`ENCAISSEMENT_CAISSE_FK`, ENABLED).
- [ENCAISSEMENT](tables.md#encaissement).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`ENCAISSEMENT_CLIENT_FK`, ENABLED).
- [ENCAISSEMENT](tables.md#encaissement).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`ENCAISSEMENT_DEVISE_FK`, ENABLED).
- [ENCAISSEMENT](tables.md#encaissement).`IDTYPEENCAISSEMENT` → [TYPE_ENCAISSEMENT](tables.md#type-encaissement).`ID` (`ENCAISSEMENT_TYPE_FK`, ENABLED).

Tables qui la référencent :

- [ENCAISSEMENT_DETAILS](tables.md#encaissement-details).`IDENCAISSEMENT` → [ENCAISSEMENT](tables.md#encaissement).`ID`.
- [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`IDENCAISSEMENT` → [ENCAISSEMENT](tables.md#encaissement).`ID`.
- [PRELEVEMENT_ENCAISSE](tables.md#prelevement-encaisse).`IDENCAISSEMENT` → [ENCAISSEMENT](tables.md#encaissement).`ID`.
- [VENTELUBRIFIANT](tables.md#ventelubrifiant).`IDENCAISSEMENT` → [ENCAISSEMENT](tables.md#encaissement).`ID`.

Vues dépendantes directes (4) : [ENCAISSEMENTCPL](vues.md#encaissementcpl), [PRECISDETENCAISSEMENT_LIB](vues.md#precisdetencaissement-lib), [VENTELUBRIFIANTLIB](vues.md#ventelubrifiantlib), [VENTE_ENCAISSE](vues.md#vente-encaisse).

Références dans le code : [encaissement/Encaissement.java:58](<../../projet-standard - Copie/arbiochem-ejb/src/java/encaissement/Encaissement.java#L58>), [encaissement/EncaissementViaP.java:22](<../../projet-standard - Copie/arbiochem-ejb/src/java/encaissement/EncaissementViaP.java#L22>), [encaissement/depenseEncaissement-modif.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/encaissement/depenseEncaissement-modif.jsp#L25>), [encaissement/encaissement-details-modif.jsp:26](<../../projet-standard - Copie/arbiochem-war/web/pages/encaissement/encaissement-details-modif.jsp#L26>), [encaissement/encaissement-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/encaissement/encaissement-saisie.jsp#L23>) ; 3 autres fichiers dans `usages-code.json`.

<a id="encaissement-details"></a>

## ENCAISSEMENT_DETAILS

Lignes d’encaissement.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDENCAISSEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → ENCAISSEMENT |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `REMARQUE` | `VARCHAR2(400 BYTE)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(120 BYTE)` | Oui | FK → DEVISE |

Clés : `SYS_C007247` (primaire) : `ID`.

Clés étrangères sortantes :

- [ENCAISSEMENT_DETAILS](tables.md#encaissement-details).`IDENCAISSEMENT` → [ENCAISSEMENT](tables.md#encaissement).`ID` (`ENCAISSEMENT_MEREFILLE_FK`, ENABLED).
- [ENCAISSEMENT_DETAILS](tables.md#encaissement-details).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`ENCAISSE_DEVISE_FK`, ENABLED).

Vues dépendantes directes (13) : [ENCAISSEMENT_BON](vues.md#encaissement-bon), [ENCAISSEMENT_CHEQUE](vues.md#encaissement-cheque), [ENCAISSEMENT_DETAILS_LIB](vues.md#encaissement-details-lib), [ENCAISSEMENT_ESPECES](vues.md#encaissement-especes), [ENCAISSEMENT_FANILO](vues.md#encaissement-fanilo), [ENCAISSEMENT_MVOLA](vues.md#encaissement-mvola), [ENCAISSEMENT_ORANGEMONEY](vues.md#encaissement-orangemoney), [ENCAISSEMENT_PRECISION_TOTAL](vues.md#encaissement-precision-total), [ENCAISSEMENT_TPE](vues.md#encaissement-tpe), [ENCAISSEMENT_VALIDEE](vues.md#encaissement-validee), [ENCAISSEMENT_VISA](vues.md#encaissement-visa), [MONTANTENCAISSEMENT](vues.md#montantencaissement), [VENTE_ENCAISSE](vues.md#vente-encaisse).

Références dans le code : [encaissement/EncaissementDetails.java:39](<../../projet-standard - Copie/arbiochem-ejb/src/java/encaissement/EncaissementDetails.java#L39>).

<a id="enfantpersonnel"></a>

## ENFANTPERSONNEL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(50 BYTE)` | Oui | FK → LOG_PERSONNEL |
| `NOM` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATENAISSANCE` | `DATE` | Oui |  |
| `GENRE` | `NUMBER(*,0)` | Oui |  |
| `ESTSCOLARISE` | `NUMBER` | Oui |  |

Clés : `ENFANTPERSONNEL_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [ENFANTPERSONNEL](tables.md#enfantpersonnel).`IDPERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`ENFPERS_LOG_FK`, ENABLED).

Vues dépendantes directes (1) : [ENFANTPERSONNEL_CPL](vues.md#enfantpersonnel-cpl).

Références dans le code : [paie/employe/EnfantPersonnel.java:22](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/EnfantPersonnel.java#L22>).

<a id="entite"></a>

## ENTITE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `ENTITE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [DEMANDETRAVAUX](tables.md#demandetravaux).`IDENTITE` → [ENTITE](tables.md#entite).`ID`.

Vues dépendantes directes (4) : [DEMANDETRAVAUX_CPL](vues.md#demandetravaux-cpl), [OTRAVLIB](vues.md#otravlib), [PLANNING_CPL](vues.md#planning-cpl), [TRAVAUXCPL](vues.md#travauxcpl).

Références dans le code : [maintenance/configuration/Entite.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/configuration/Entite.java#L9>), [maintenance/travaux/Travaux-liste.jsp:47](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/travaux/Travaux-liste.jsp#L47>), [maintenance/configuration/souscategorieentite/sous-categorie-entite-saisie.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/configuration/souscategorieentite/sous-categorie-entite-saisie.jsp#L27>), [maintenance/travaux/Travaux-saisie.jsp:47](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/travaux/Travaux-saisie.jsp#L47>).

<a id="entretienrh"></a>

## ENTRETIENRH

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `TYPEENTRETIENT` | `NUMBER(1,0)` | Oui |  |
| `NOMPRENOMCANDIDAT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDPERSONNEL` | `VARCHAR2(250 BYTE)` | Oui | FK → PAIE_INFO_PERSONNEL |
| `IDFONCTION` | `VARCHAR2(250 BYTE)` | Oui | FK → PAIE_FONCTION |
| `IDDIRECTION` | `VARCHAR2(250 BYTE)` | Oui |  |
| `IDEVALUATEUR` | `VARCHAR2(250 BYTE)` | Oui | FK → PAIE_INFO_PERSONNEL |
| `MOTIVATIONCANDIDAT` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `AMBITIONPROFESSIONEL` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `PRETENTIONSALARIALE` | `NUMBER(18,2)` | Oui |  |
| `REMUNERATIONACTUEL` | `NUMBER(18,2)` | Oui |  |
| `APPRECIATIONCANDIDAT` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `COMMENTAIRES` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `EXPERIENCECANDIDAT` | `NUMBER(5,0)` | Oui |  |
| `ATOUT` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `FAIBLESSES` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `POINTVIGILANCE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `CONCLUSTION` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `SYS_C007251` (primaire) : `ID`.

Clés étrangères sortantes :

- [ENTRETIENRH](tables.md#entretienrh).`IDEVALUATEUR` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` (`FK_ENT_EVAL`, ENABLED).
- [ENTRETIENRH](tables.md#entretienrh).`IDFONCTION` → [PAIE_FONCTION](tables.md#paie-fonction).`ID` (`FK_ENT_FONCT`, ENABLED).
- [ENTRETIENRH](tables.md#entretienrh).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` (`FK_ENT_PERS`, ENABLED).

Tables qui la référencent :

- [ENTRETIENRH_DETAIL](tables.md#entretienrh-detail).`IDENTRETIENTRH` → [ENTRETIENRH](tables.md#entretienrh).`ID`.

Vues dépendantes directes (1) : [ENTRETIENRH_LIB](vues.md#entretienrh-lib).

Références dans le code : [entretien/EntretienRH.java:174](<../../projet-standard - Copie/arbiochem-ejb/src/java/entretien/EntretienRH.java#L174>), [entretient/entretientrh-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/entretient/entretientrh-saisie.jsp#L19>).

<a id="entretienrh-detail"></a>

## ENTRETIENRH_DETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `IDENTRETIENTRH` | `VARCHAR2(250 BYTE)` | Oui | FK → ENTRETIENRH |
| `IDCATEGORIEEVALUATION` | `VARCHAR2(250 BYTE)` | Oui | FK → CATEGORIEEVALENTRETIENT |
| `CRITERE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `NOTE` | `NUMBER(2,0)` | Oui |  |
| `OBSERVATION` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `SYS_C007252` (primaire) : `ID`.

Clés étrangères sortantes :

- [ENTRETIENRH_DETAIL](tables.md#entretienrh-detail).`IDCATEGORIEEVALUATION` → [CATEGORIEEVALENTRETIENT](tables.md#categorieevalentretient).`ID` (`FK_DET_CAT`, ENABLED).
- [ENTRETIENRH_DETAIL](tables.md#entretienrh-detail).`IDENTRETIENTRH` → [ENTRETIENRH](tables.md#entretienrh).`ID` (`FK_DET_ENT`, ENABLED).

Vues dépendantes directes (1) : [ENTRETIENRH_DETAIL_LIB](vues.md#entretienrh-detail-lib).

Références dans le code : [entretien/EntretienRHDetails.java:75](<../../projet-standard - Copie/arbiochem-ejb/src/java/entretien/EntretienRHDetails.java#L75>), [entretient/entretientrh-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/entretient/entretientrh-saisie.jsp#L21>).

<a id="entretient"></a>

## ENTRETIENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDCANDIDATURE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDINTERVIEWER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATEENTRETIENT` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `SCORE` | `NUMBER(5,2)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `SYS_C007253` (primaire) : `ID`.

Références dans le code : [entretien/Entretient.java:23](<../../projet-standard - Copie/arbiochem-ejb/src/java/entretien/Entretient.java#L23>), [entretient/entretient-saisie.jsp:14](<../../projet-standard - Copie/arbiochem-war/web/pages/entretient/entretient-saisie.jsp#L14>).

<a id="equipe"></a>

## EQUIPE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007254` (primaire) : `ID`.

Références dans le code : [fabrication/equipe/Equipe.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/equipe/Equipe.java#L10>), [fabrication/equipe/equipe-fiche.jsp:17](<../../projet-standard - Copie/arbiochem-war/web/pages/fabrication/equipe/equipe-fiche.jsp#L17>), [fabrication/equipe/equipe-liste.jsp:8](<../../projet-standard - Copie/arbiochem-war/web/pages/fabrication/equipe/equipe-liste.jsp#L8>).

<a id="equipeemp"></a>

## EQUIPEEMP

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `EQUIPEEMP_PK` (primaire) : `ID`.

Références dans le code : [fabrication/equipe/EquipeEmp.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/equipe/EquipeEmp.java#L10>).

<a id="equivalence"></a>

## EQUIVALENCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDPRODUIT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDUNITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `QTE` | `NUMBER(10,2)` | Oui |  |
| `POIDS` | `NUMBER(20,2)` | Oui |  |

Clés : `EQUIVALENCE_PK` (primaire) : `ID` ; `UNIK_PRODUIT_UNITE` (unique) : `IDPRODUIT, IDUNITE`.

Vues dépendantes directes (9) : [AS_RECETTEBC](vues.md#as-recettebc), [AS_RECETTEFAB](vues.md#as-recettefab), [AS_RECETTEOF](vues.md#as-recetteof), [AS_RECETTEOFABRICATION](vues.md#as-recetteofabrication), [AS_RECETTEOFF](vues.md#as-recetteoff), [AS_RECETTEREC](vues.md#as-recetterec), [EQUIVALENCE_LIB](vues.md#equivalence-lib), [ETAT_VENTE_DETAILS_POIDS](vues.md#etat-vente-details-poids), [OFFILLEEQUIVALENCE](vues.md#offilleequivalence).

Références dans le code : [equivalence/EquivalenceIngredient.java:56](<../../projet-standard - Copie/arbiochem-ejb/src/java/equivalence/EquivalenceIngredient.java#L56>).

<a id="equivalencecarton"></a>

## EQUIVALENCECARTON

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPETRIS` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `IDCARTON` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `NBCARTON` | `NUMBER(*,0)` | Oui |  |

Clés : `EQUIVALENCECARTON_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [EQUIVALENCECARTON](tables.md#equivalencecarton).`IDCARTON` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`EQUIVALENCECARTON_CARTON_FK`, ENABLED).
- [EQUIVALENCECARTON](tables.md#equivalencecarton).`IDPETRIS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`EQUIVALENCECARTON_PETRIS_FK`, ENABLED).

Vues dépendantes directes (3) : [EQUIVALENCECARTONLIB](vues.md#equivalencecartonlib), [OFNONRATTACHE](vues.md#ofnonrattache), [OFNONRATTACHEREEL](vues.md#ofnonrattachereel).

Références dans le code : [annexe/EquivalenceCarton.java:14](<../../projet-standard - Copie/arbiochem-ejb/src/java/annexe/EquivalenceCarton.java#L14>), [fabrication/OfFille.java:151](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/OfFille.java#L151>).

<a id="equivalencevente"></a>

## EQUIVALENCEVENTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPRODUIT1` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDPRODUIT2` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QUANTITE` | `NUMBER(*,0)` | Oui |  |
| `POIDS` | `NUMBER(30,2)` | Oui |  |

Clés : `EQUIVALENCEVENTE_PK` (primaire) : `ID` ; `UK_EQUIVALENCEVENTE_IDPRODUIT` (unique) : `IDPRODUIT1`.

Vues dépendantes directes (6) : [AS_INGREDIENTS_LIB](vues.md#as-ingredients-lib), [AS_INGREDIENT_VENTE_LIB](vues.md#as-ingredient-vente-lib), [BC_CLIENT_FILLE_CPL_LIB_PDF](vues.md#bc-client-fille-cpl-lib-pdf), [PROFORMADETAILS_CPL_ING](vues.md#proformadetails-cpl-ing), [PROFORMADETAILS_CPL_ING_PDF](vues.md#proformadetails-cpl-ing-pdf), [VENTE_DETAILS_POIDS_ING](vues.md#vente-details-poids-ing).

Références dans le code : [vente/EquivalenceVente.java:56](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/EquivalenceVente.java#L56>).

<a id="escompte"></a>

## ESCOMPTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDTRAITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `FRAIS` | `NUMBER` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `BANQUE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `ESCOMPTE_PK` (primaire) : `ID`.

Vues dépendantes directes (2) : [ESCOMPTE_LIBV](vues.md#escompte-libv), [TRAITE_LIBESC](vues.md#traite-libesc).

Références dans le code : [facture/tr/Escompte.java:110](<../../projet-standard - Copie/arbiochem-ejb/src/java/facture/tr/Escompte.java#L110>), [facture/escompte-modif.jsp:15](<../../projet-standard - Copie/arbiochem-war/web/pages/facture/escompte-modif.jsp#L15>), [facture/inc/escompte-liste.jsp:6](<../../projet-standard - Copie/arbiochem-war/web/pages/facture/inc/escompte-liste.jsp#L6>).

<a id="etatdemande"></a>

## ETATDEMANDE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `RANG` | `NUMBER(*,0)` | Oui |  |
| `IDTYPEDEMANDE` | `VARCHAR2(100 BYTE)` | Oui | FK → TYPEDEMANDE |
| `IDETATHIERARCHIE` | `VARCHAR2(100 BYTE)` | Oui | FK → ETATHIERARCHIE |

Clés : `ETATDEMANDE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [ETATDEMANDE](tables.md#etatdemande).`IDTYPEDEMANDE` → [TYPEDEMANDE](tables.md#typedemande).`ID` (`ETATDEMANDE_TYPEDEMANDE_ID_FK`, ENABLED).
- [ETATDEMANDE](tables.md#etatdemande).`IDETATHIERARCHIE` → [ETATHIERARCHIE](tables.md#etathierarchie).`ID` (`ETATDEMA_ETATHIER_ID_FK`, ENABLED).

Vues dépendantes directes (2) : [ETATDEMANDE_ETAT](vues.md#etatdemande-etat), [ETATDEMANDE_LIBCPL](vues.md#etatdemande-libcpl).

Références dans le code : [paie/demande/EtatDemande.java:20](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/demande/EtatDemande.java#L20>).

<a id="etathierarchie"></a>

## ETATHIERARCHIE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `ETATVISA` | `NUMBER(*,0)` | Oui |  |
| `ETATANNULE` | `NUMBER(*,0)` | Oui |  |
| `IDROLE` | `VARCHAR2(100 BYTE)` | Oui | FK → ROLES |

Clés : `ETATHIERARCHIE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [ETATHIERARCHIE](tables.md#etathierarchie).`IDROLE` → [ROLES](tables.md#roles).`IDROLE` (`ETATHIERAR_ROLE_ID_FK`, ENABLED).

Tables qui la référencent :

- [ETATDEMANDE](tables.md#etatdemande).`IDETATHIERARCHIE` → [ETATHIERARCHIE](tables.md#etathierarchie).`ID`.

Vues dépendantes directes (5) : [EMPLOYE_COMPLET](vues.md#employe-complet), [EMPLOYE_COMPLET2](vues.md#employe-complet2), [EMPLOYE_COMPLET_NOU2](vues.md#employe-complet-nou2), [ETATDEMANDE_ETAT](vues.md#etatdemande-etat), [ETATDEMANDE_LIBCPL](vues.md#etatdemande-libcpl).

Références dans le code : [paie/demande/EtatHierarchie.java:20](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/demande/EtatHierarchie.java#L20>).

<a id="etatinspection"></a>

## ETATINSPECTION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007272` (primaire) : `ID`.

Vues dépendantes directes (2) : [ETATINSPECTIONMOTCLES](vues.md#etatinspectionmotcles), [INSPECTIONFILLELIB](vues.md#inspectionfillelib).

Références dans le code : [etatInspection/EtatInspection.java:38](<../../projet-standard - Copie/arbiochem-ejb/src/java/etatInspection/EtatInspection.java#L38>), [etatInspection/etatInspection-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/etatInspection/etatInspection-fiche.jsp#L11>), [etatInspection/etatInspection-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/etatInspection/etatInspection-saisie.jsp#L13>), [inspection/inspectionFille-liste.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/inspection/inspectionFille-liste.jsp#L23>).

<a id="etatmachine"></a>

## ETATMACHINE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `ETATMACHINE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [RESULTATMAINTENANCE](tables.md#resultatmaintenance).`ETATMACHINE` → [ETATMACHINE](tables.md#etatmachine).`ID`.

Vues dépendantes directes (1) : [RESULTATMAINTENANCELIB](vues.md#resultatmaintenancelib).

Références dans le code : [maintenance/etats/EtatMachine.java:8](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/etats/EtatMachine.java#L8>), [etatMachine/etatMachine-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/etatMachine/etatMachine-fiche.jsp#L11>), [etatMachine/etatMachine-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/etatMachine/etatMachine-liste.jsp#L7>), [etatMachine/etatMachine-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/etatMachine/etatMachine-saisie.jsp#L13>), [maintenance/travaux/resultat-maintenance-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/travaux/resultat-maintenance-saisie.jsp#L23>).

<a id="etatobjetmaintenance"></a>

## ETATOBJETMAINTENANCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `SYS_C007276` (primaire) : `ID`.

Tables qui la référencent :

- [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ETATOBJET` → [ETATOBJETMAINTENANCE](tables.md#etatobjetmaintenance).`ID`.

Vues dépendantes directes (1) : [AS_INGREDIENT_MAINTENANCE_LIB](vues.md#as-ingredient-maintenance-lib).

Références dans le code : [maintenance/ressources/machine/machine-liste.jsp:37](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/machine/machine-liste.jsp#L37>), [maintenance/ressources/machine/machine-saisie.jsp:31](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/machine/machine-saisie.jsp#L31>), [maintenance/ressources/outils/outils-saisie.jsp:59](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/outils/outils-saisie.jsp#L59>).

<a id="etatsortie"></a>

## ETATSORTIE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `FORMULE1` | `VARCHAR2(900 BYTE)` | Oui |  |
| `FORMULE2` | `VARCHAR2(900 BYTE)` | Oui |  |
| `NOM` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CATEGORIE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `RANG` | `NUMBER` | Oui |  |
| `NIVEAU` | `NUMBER` | Oui |  |
| `IDPARENT` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `PK_ETATSORTIE` (primaire) : `ID`.

Références dans le code : [mg/cnaps/compta/EtatSortie.java:91](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/compta/EtatSortie.java#L91>).

<a id="etatstock"></a>

## ETATSTOCK

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui | FK → PRODUIT |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui | FK → MAGASIN2 |
| `IDPOINT` | `VARCHAR2(255 BYTE)` | Oui | FK → POINT |
| `IDTYPEPRODUIT` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPE_PRODUIT |
| `IDUNITE` | `VARCHAR2(255 BYTE)` | Oui | FK → UNITE |
| `REPORT` | `NUMBER(*,0)` | Oui |  |
| `ENTREE` | `NUMBER(*,0)` | Oui |  |
| `SORTIE` | `NUMBER(*,0)` | Oui |  |
| `RESTE` | `NUMBER(*,0)` | Oui |  |
| `DATY` | `DATE` | Oui |  |

Clés : `ETATSTOCK_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [ETATSTOCK](tables.md#etatstock).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` (`ETATSTOCK_MAGASIN_FK`, ENABLED).
- [ETATSTOCK](tables.md#etatstock).`IDPOINT` → [POINT](tables.md#point).`ID` (`ETATSTOCK_POINT_FK`, ENABLED).
- [ETATSTOCK](tables.md#etatstock).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID` (`ETATSTOCK_PRODUIT_FK`, ENABLED).
- [ETATSTOCK](tables.md#etatstock).`IDTYPEPRODUIT` → [TYPE_PRODUIT](tables.md#type-produit).`ID` (`ETATSTOCK_TYPEPRODUIT_FK`, ENABLED).
- [ETATSTOCK](tables.md#etatstock).`IDUNITE` → [UNITE](tables.md#unite).`ID` (`ETATSTOCK_UNITE_FK`, ENABLED).

Vues dépendantes directes (1) : [ETATSTOCKLIB](vues.md#etatstocklib).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="etat-categ-qualif2"></a>

## ETAT_CATEG_QUALIF2

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Non |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Non |  |

Clés : `ETATCATEG2_PK` (primaire) : `ID`.

Vues dépendantes directes (1) : [CATEG_QUALILIBCOMPLET](vues.md#categ-qualilibcomplet).

Références dans le code : [paie/categorie/categoriequalification-liste.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/categorie/categoriequalification-liste.jsp#L27>).

<a id="evaluation-annuelle"></a>

## EVALUATION_ANNUELLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ANNEE` | `NUMBER(*,0)` | Oui |  |
| `NOTEGLOBALE` | `NUMBER(30,2)` | Oui |  |
| `COMMENTAIRE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `SYS_C007285` (primaire) : `ID`.

Tables qui la référencent :

- [EVALUATION_DETAIL](tables.md#evaluation-detail).`IDEVALUATION` → [EVALUATION_ANNUELLE](tables.md#evaluation-annuelle).`ID`.

Vues dépendantes directes (1) : [EVALUATION_ANNUELLE_LIB](vues.md#evaluation-annuelle-lib).

Références dans le code : [paie/evaluation/EvaluationAnnuelle.java:58](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/evaluation/EvaluationAnnuelle.java#L58>), [paie/evaluation/evaluationannuelle-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/evaluation/evaluationannuelle-saisie.jsp#L22>).

<a id="evaluation-a-chaud"></a>

## EVALUATION_A_CHAUD

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDFORMATIONSUIVIE` | `VARCHAR2(50 BYTE)` | Oui | FK → ACTION_FORMATION |
| `IDPERSONNEL` | `VARCHAR2(50 BYTE)` | Oui | FK → PAIE_INFO_PERSONNEL |
| `IDINTERVENANT` | `VARCHAR2(50 BYTE)` | Oui | FK → PAIE_INFO_PERSONNEL |
| `DATEFORMATION` | `DATE` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `SYS_C007281` (primaire) : `ID`.

Clés étrangères sortantes :

- [EVALUATION_A_CHAUD](tables.md#evaluation-a-chaud).`IDFORMATIONSUIVIE` → [ACTION_FORMATION](tables.md#action-formation).`ID` (`SYS_C007841`, ENABLED).
- [EVALUATION_A_CHAUD](tables.md#evaluation-a-chaud).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` (`SYS_C008227`, ENABLED).
- [EVALUATION_A_CHAUD](tables.md#evaluation-a-chaud).`IDINTERVENANT` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` (`SYS_C008228`, ENABLED).

Tables qui la référencent :

- [EVALUATION_A_CHAUD_FILLE](tables.md#evaluation-a-chaud-fille).`IDEVALUATIONCHAUD` → [EVALUATION_A_CHAUD](tables.md#evaluation-a-chaud).`ID`.

Vues dépendantes directes (1) : [EVALUATION_A_CHAUD_LIB](vues.md#evaluation-a-chaud-lib).

Références dans le code : [paie/evaluation/EvaluationAChaud.java:12](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/evaluation/EvaluationAChaud.java#L12>).

<a id="evaluation-a-chaud-fille"></a>

## EVALUATION_A_CHAUD_FILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDEVALUATIONCHAUD` | `VARCHAR2(50 BYTE)` | Oui | FK → EVALUATION_A_CHAUD |
| `IDEVALUATIONCRITERE` | `VARCHAR2(50 BYTE)` | Oui | FK → CRITERE_EVAL_A_CHAUD |
| `NOTE` | `NUMBER(*,0)` | Oui |  |

Clés : `SYS_C007283` (primaire) : `ID`.

Clés étrangères sortantes :

- [EVALUATION_A_CHAUD_FILLE](tables.md#evaluation-a-chaud-fille).`IDEVALUATIONCHAUD` → [EVALUATION_A_CHAUD](tables.md#evaluation-a-chaud).`ID` (`SYS_C007915`, ENABLED).
- [EVALUATION_A_CHAUD_FILLE](tables.md#evaluation-a-chaud-fille).`IDEVALUATIONCRITERE` → [CRITERE_EVAL_A_CHAUD](tables.md#critere-eval-a-chaud).`ID` (`SYS_C008336`, ENABLED).

Vues dépendantes directes (1) : [EVALUATION_A_CHAUD_FILLE_LIB](vues.md#evaluation-a-chaud-fille-lib).

Références dans le code : [paie/evaluation/EvaluationAChaudFille.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/evaluation/EvaluationAChaudFille.java#L10>).

<a id="evaluation-detail"></a>

## EVALUATION_DETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDEVALUATION` | `VARCHAR2(100 BYTE)` | Oui | FK → EVALUATION_ANNUELLE |
| `IDCRITERE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `NOTE` | `NUMBER(30,2)` | Oui |  |
| `COMMENTAIRE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `IDTYPECOMPETENCEFP` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPE_COMPETENCES_FP |
| `COMPETENCE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `AUTOEVALUATION` | `NUMBER` | Oui |  |
| `EVALUATIONSUPERIEUR` | `NUMBER` | Oui |  |
| `SYNTHESE` | `NUMBER` | Oui |  |
| `APPRECIATION` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `SYS_C007287` (primaire) : `ID`.

Clés étrangères sortantes :

- [EVALUATION_DETAIL](tables.md#evaluation-detail).`IDTYPECOMPETENCEFP` → [TYPE_COMPETENCES_FP](tables.md#type-competences-fp).`ID` (`FK_ED_TYPE_COMP_FP`, ENABLED).
- [EVALUATION_DETAIL](tables.md#evaluation-detail).`IDEVALUATION` → [EVALUATION_ANNUELLE](tables.md#evaluation-annuelle).`ID` (`SYS_C007914`, ENABLED).

Vues dépendantes directes (1) : [EVALUATION_DETAIL_LIB](vues.md#evaluation-detail-lib).

Références dans le code : [paie/evaluation/EvaluationDetail.java:131](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/evaluation/EvaluationDetail.java#L131>), [paie/evaluation/evaluationannuelle-saisie.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/evaluation/evaluationannuelle-saisie.jsp#L24>).

<a id="evaluation-froid"></a>

## EVALUATION_FROID

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDFORMATIONSUIVI` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDPERSONNEL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `NOTE` | `NUMBER(30,2)` | Oui |  |
| `COMMENTAIRE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `DATEEVALUATION` | `DATE` | Oui |  |

Clés : `EVALUATION_FROID_PK` (primaire) : `ID`.

Vues dépendantes directes (1) : [EVALUATION_FROID_LIB](vues.md#evaluation-froid-lib).

Références dans le code : [paie/evaluation/EvaluationFroid.java:72](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/evaluation/EvaluationFroid.java#L72>), [paie/evaluation/evaluationfroid-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/evaluation/evaluationfroid-fiche.jsp#L11>), [paie/evaluation/evaluationfroid-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/evaluation/evaluationfroid-saisie.jsp#L13>).

<a id="fabrication"></a>

## FABRICATION

Document de production, lié aux ordres et aux productions précédentes ou suivantes.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `LANCEPAR` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CIBLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `BESOIN` | `DATE` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(38,0)` | Non |  |
| `IDBC` | `VARCHAR2(500 BYTE)` | Oui | FK → BONDECOMMANDE_CLIENT |
| `IDOFFILLE` | `VARCHAR2(255 BYTE)` | Oui | FK → OFFILLE |
| `IDOF` | `VARCHAR2(255 BYTE)` | Oui |  |
| `FABRICATIONPREC` | `VARCHAR2(100 BYTE)` | Oui |  |
| `FABRICATIONSUIV` | `VARCHAR2(50 BYTE)` | Oui |  |
| `EQUIPE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `LANCEUR` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007292` (primaire) : `ID`.

Clés étrangères sortantes :

- [FABRICATION](tables.md#fabrication).`IDOFFILLE` → [OFFILLE](tables.md#offille).`ID` (`FAB_OFFILE_FK`, ENABLED).
- [FABRICATION](tables.md#fabrication).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID` (`FK_FABRICATION_BDC`, ENABLED).

Tables qui la référencent :

- [CHARGE](tables.md#charge).`IDFABRICATION` → [FABRICATION](tables.md#fabrication).`ID`.
- [DEMANDETRANSFERT](tables.md#demandetransfert).`IDFABRICATION` → [FABRICATION](tables.md#fabrication).`ID`.
- [FABRICATIONFILLE](tables.md#fabricationfille).`IDMERE` → [FABRICATION](tables.md#fabrication).`ID`.
- [RESSOURCEPARFABRICATION](tables.md#ressourceparfabrication).`IDFABRICATION` → [FABRICATION](tables.md#fabrication).`ID`.

Vues dépendantes directes (37) : [AS_RECFOFABLIBGROUPE](vues.md#as-recfofablibgroupe), [BONCOMMANDEFABDETAILS](vues.md#boncommandefabdetails), [CHARGEGROUPBYOFF](vues.md#chargegroupbyoff), [CHARGEGROUPEBYOFF](vues.md#chargegroupebyoff), [CHARGE_LIB](vues.md#charge-lib), [COMPTEURLIB](vues.md#compteurlib), [DEPENSEFAB](vues.md#depensefab), [DUREE_CYCLE_FAB](vues.md#duree-cycle-fab), [FABRGROUPBYIDBC](vues.md#fabrgroupbyidbc), [FABRICATIONAUTOCOMPLETE](vues.md#fabricationautocomplete), [FABRICATIONCPL](vues.md#fabricationcpl), [FABRICATIONFILLECPL](vues.md#fabricationfillecpl), [FABRICATIONFILLECPL2](vues.md#fabricationfillecpl2), [FABRICATIONFILLEFABRIQUEVISE](vues.md#fabricationfillefabriquevise), [FABRICATIONFILLEPETRI](vues.md#fabricationfillepetri), [FABRICATIONMEREFILLE](vues.md#fabricationmerefille), [FABRICATIONOFFILLE](vues.md#fabricationoffille), [FABRICATION_OF](vues.md#fabrication-of), [HEURESUPFABRICATION_CPL](vues.md#heuresupfabrication-cpl), [HEURESUPFABRICATION_CUMUL](vues.md#heuresupfabrication-cumul), [HEURESUPFABRICATION_TOTAL](vues.md#heuresupfabrication-total), [HS_FABRICATION_SEMAINE](vues.md#hs-fabrication-semaine), [HS_FAB_SEMAINE_PARTRANCHE](vues.md#hs-fab-semaine-partranche), [HS_PAR_FAB](vues.md#hs-par-fab), [HS_PAR_OF](vues.md#hs-par-of), [HS_PAR_OFFILLE](vues.md#hs-par-offille), [MVTSTOCKAUTOCOMPLETE](vues.md#mvtstockautocomplete), [MVTSTOCKFILLEFABOFCATVISE](vues.md#mvtstockfillefabofcatvise), [MVTSTOCKFILLEFABOFCATVISETOUS](vues.md#mvtstockfillefabofcatvisetous), [MVTSTOCKFILLERESIDUOF](vues.md#mvtstockfilleresiduof), [MVTSTOCKPRODUIT](vues.md#mvtstockproduit), [PROCESSFABPETRI](vues.md#processfabpetri), [RESSOURCEPARFABRICATIONCOMPLET](vues.md#ressourceparfabricationcomplet), [RESULTATFABRICATION](vues.md#resultatfabrication), [STOCKETDEPENSEFABNC](vues.md#stocketdepensefabnc), [VW_HS_CUMUL_WEEK](vues.md#vw-hs-cumul-week), [V_HS_FABRICATION_DETAIL](vues.md#v-hs-fabrication-detail).

Références dans le code : [fabrication/Fabrication.java:91](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/Fabrication.java#L91>), [fabrication/charge/charge-saisie-multiple.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/fabrication/charge/charge-saisie-multiple.jsp#L25>), [demande/demandetransfert-saisie.jsp:112](<../../projet-standard - Copie/arbiochem-war/web/pages/demande/demandetransfert-saisie.jsp#L112>).

<a id="fabricationfille"></a>

## FABRICATIONFILLE

Lignes et ressources de production.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDINGREDIENTS` | `VARCHAR2(255 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → FABRICATION |
| `DATYBESOIN` | `DATE` | Oui |  |
| `IDUNITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDBCFILLE` | `VARCHAR2(1000 BYTE)` | Oui | FK → BONDECOMMANDE_CLIENT_FILLE |
| `OPERATEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → PERSONNEL |
| `NIVEAU` | `NUMBER(*,0)` | Oui |  |
| `IDMACHINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PU` | `NUMBER(30,5)` | Oui |  |
| `QTE` | `NUMBER(30,5)` | Oui |  |

Clés : `SYS_C007294` (primaire) : `ID`.

Clés étrangères sortantes :

- [FABRICATIONFILLE](tables.md#fabricationfille).`IDBCFILLE` → [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`ID` (`FK_FABFILLE_BDCFILLE`, ENABLED).
- [FABRICATIONFILLE](tables.md#fabricationfille).`OPERATEUR` → [PERSONNEL](tables.md#personnel).`ID` (`FK_FABFILLE_OPERATEUR`, ENABLED).
- [FABRICATIONFILLE](tables.md#fabricationfille).`IDMERE` → [FABRICATION](tables.md#fabrication).`ID` (`SYS_C007917`, ENABLED).

Vues dépendantes directes (14) : [AS_RECETTEFAB](vues.md#as-recettefab), [BONCOMMANDEFABDETAILS](vues.md#boncommandefabdetails), [FABNONRATTACHE](vues.md#fabnonrattache), [FABRGROUPBYIDBC](vues.md#fabrgroupbyidbc), [FABRICATIONFILLEAUTOCOMPLETE](vues.md#fabricationfilleautocomplete), [FABRICATIONFILLECPL](vues.md#fabricationfillecpl), [FABRICATIONFILLECPL2](vues.md#fabricationfillecpl2), [FABRICATIONFILLEFABRIQUEVISE](vues.md#fabricationfillefabriquevise), [FABRICATIONFILLEPETRI](vues.md#fabricationfillepetri), [FABRICATIONFILLEPU](vues.md#fabricationfillepu), [FABRICATION_OF](vues.md#fabrication-of), [PROCESSFABPETRI](vues.md#processfabpetri), [QTEFABANDRESTFABBYIDBC](vues.md#qtefabandrestfabbyidbc), [RESULTATFABRICATION](vues.md#resultatfabrication).

Références dans le code : [fabrication/Fabrication.java:217](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/Fabrication.java#L217>), [fabrication/FabricationFille.java:137](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/FabricationFille.java#L137>), [vente/BonDeCommande.java:592](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/BonDeCommande.java#L592>).

<a id="factureclient"></a>

## FACTURECLIENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDCLIENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATEECHEANCEPAIEMENT` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `TVA` | `NUMBER(*,0)` | Oui |  |
| `IDRESERVATION` | `VARCHAR2(100 BYTE)` | Oui | FK → RESERVATION |

Clés : `FACTURECLIENT_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [FACTURECLIENT](tables.md#factureclient).`IDRESERVATION` → [RESERVATION](tables.md#reservation).`ID` (`FC_RESERV_FK`, ENABLED).

Tables qui la référencent :

- [FACTURECLIENTDETAILS](tables.md#factureclientdetails).`IDFACTURECLIENT` → [FACTURECLIENT](tables.md#factureclient).`ID`.

Vues dépendantes directes (2) : [FACTURECLIENTCPL](vues.md#factureclientcpl), [FACTURECLIENTMONTANT](vues.md#factureclientmontant).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="factureclientdetails"></a>

## FACTURECLIENTDETAILS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDFACTURECLIENT` | `VARCHAR2(100 BYTE)` | Oui | FK → FACTURECLIENT |
| `QTE` | `NUMBER(*,0)` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `REMISES` | `NUMBER(30,2)` | Oui |  |
| `TVA` | `NUMBER(30,2)` | Oui |  |
| `COMPTE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui | FK → PRODUIT |
| `DESIGNATION` | `VARCHAR2(150 BYTE)` | Oui |  |
| `IDACTE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `FACTURECLIENTDETAILS_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [FACTURECLIENTDETAILS](tables.md#factureclientdetails).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID` (`FACTURECLIENTDET_PROD_FK`, ENABLED).
- [FACTURECLIENTDETAILS](tables.md#factureclientdetails).`IDFACTURECLIENT` → [FACTURECLIENT](tables.md#factureclient).`ID` (`FACTURECLIENT_MEREFILLE_FK`, ENABLED).

Vues dépendantes directes (4) : [ACTE_LIB_FACT](vues.md#acte-lib-fact), [ACTE_LIB_NONFACT](vues.md#acte-lib-nonfact), [FACTURECLIENTDETAILSLIB](vues.md#factureclientdetailslib), [FACTURECLIENTMONTANT](vues.md#factureclientmontant).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="facturedeclaration"></a>

## FACTUREDECLARATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → FOURNISSEUR |
| `IDMODEPAIEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → MODEPAIEMENT |
| `DATY` | `DATE` | Oui |  |
| `DESIGNATION` | `VARCHAR2(400 BYTE)` | Oui |  |
| `DATEECHEANCEPAIEMENT` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `REFERENCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDBC` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `TAUX` | `NUMBER(30,2)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(255 BYTE)` | Oui | FK → DEVISE |
| `ESTPREVU` | `NUMBER(1,0)` | Oui |  |
| `DATYPREVU` | `DATE` | Oui |  |
| `NUMERO` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TYPEACHAT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPEFACTURE` | `VARCHAR2(100 BYTE)` | Oui | FK → TYPE_FACTURE |
| `IDOBJET` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDREF` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDDMDACHAT` | `VARCHAR2(255 BYTE)` | Oui | FK → DMDACHAT |

Clés : `FACTUREDECLARATION_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [FACTUREDECLARATION](tables.md#facturedeclaration).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` (`FD_FK`, ENABLED).
- [FACTUREDECLARATION](tables.md#facturedeclaration).`IDMODEPAIEMENT` → [MODEPAIEMENT](tables.md#modepaiement).`ID` (`FD_MODEPAIEMENT_FK`, ENABLED).
- [FACTUREDECLARATION](tables.md#facturedeclaration).`IDDMDACHAT` → [DMDACHAT](tables.md#dmdachat).`ID` (`FK_IDDMDACHAT_FD`, ENABLED).
- [FACTUREDECLARATION](tables.md#facturedeclaration).`IDTYPEFACTURE` → [TYPE_FACTURE](tables.md#type-facture).`ID` (`SYS_C008041`, ENABLED).
- [FACTUREDECLARATION](tables.md#facturedeclaration).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`SYS_C008084`, ENABLED).
- [FACTUREDECLARATION](tables.md#facturedeclaration).`DEVISE` → [DEVISE](tables.md#devise).`ID` (`SYS_C008085`, ENABLED).

Tables qui la référencent :

- [FACTUREDECLARATIONFILLE](tables.md#facturedeclarationfille).`IDFACTUREFOURNISSEUR` → [FACTUREDECLARATION](tables.md#facturedeclaration).`ID`.

Vues dépendantes directes (3) : [FACTUREDECLARATIONCPL](vues.md#facturedeclarationcpl), [FACTUREDECLARATIONMONTANT](vues.md#facturedeclarationmontant), [FACTUREDECLARATION_FILLECPL](vues.md#facturedeclaration-fillecpl).

Références dans le code : [faturefournisseur/FactureDeclaration.java:203](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/FactureDeclaration.java#L203>).

<a id="facturedeclarationfille"></a>

## FACTUREDECLARATIONFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non |  |
| `IDFACTUREFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → FACTUREDECLARATION |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `REMISES` | `NUMBER(10,2)` | Oui |  |
| `IDBCDETAIL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `TVA` | `NUMBER(10,2)` | Oui |  |
| `DEVISE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `TAUXDECHANGE` | `NUMBER(30,2)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(255 BYTE)` | Oui | FK → DEVISE |
| `DESIGNATION` | `VARCHAR2(200 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MOIS` | `NUMBER(*,0)` | Oui |  |
| `ANNEE` | `NUMBER(*,0)` | Oui |  |
| `QTE` | `NUMBER(30,10)` | Oui |  |
| `MONTANTPERTEGAIN` | `NUMBER(38,2)` | Oui |  |
| `IDPREVISION` | `VARCHAR2(50 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Clés étrangères sortantes :

- [FACTUREDECLARATIONFILLE](tables.md#facturedeclarationfille).`IDFACTUREFOURNISSEUR` → [FACTUREDECLARATION](tables.md#facturedeclaration).`ID` (`SYS_C007921`, ENABLED).
- [FACTUREDECLARATIONFILLE](tables.md#facturedeclarationfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`SYS_C008088`, ENABLED).

Vues dépendantes directes (3) : [FACTUREDECLARATIONFILLECPL](vues.md#facturedeclarationfillecpl), [FACTUREDECLARATIONMONTANT](vues.md#facturedeclarationmontant), [FACTUREDECLARATION_FILLECPL](vues.md#facturedeclaration-fillecpl).

Références dans le code : [faturefournisseur/FactureDeclarationDetails.java:135](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/FactureDeclarationDetails.java#L135>).

<a id="facturefournisseur"></a>

## FACTUREFOURNISSEUR

Document principal de facture fournisseur.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → FOURNISSEUR |
| `IDMODEPAIEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → MODEPAIEMENT |
| `DATY` | `DATE` | Oui |  |
| `DESIGNATION` | `VARCHAR2(400 BYTE)` | Oui |  |
| `DATEECHEANCEPAIEMENT` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `REFERENCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDBC` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `TAUX` | `NUMBER(30,2)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(255 BYTE)` | Oui | FK → DEVISE |
| `ESTPREVU` | `NUMBER(1,0)` | Oui |  |
| `DATYPREVU` | `DATE` | Oui |  |
| `NUMERO` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TYPEACHAT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPEFACTURE` | `VARCHAR2(100 BYTE)` | Oui | FK → TYPE_FACTURE |
| `IDOBJET` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDREF` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDDMDACHAT` | `VARCHAR2(255 BYTE)` | Oui | FK → DMDACHAT |
| `IDFACTUREPRINCIPALE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `SERVICE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TYPEFACTUREFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ECHEANCEFACTURE` | `NUMBER(30,2)` | Oui |  |
| `REMISE` | `NUMBER(30,2)` | Oui |  |

Clés : `FACTUREFOURNISSEUR_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDMODEPAIEMENT` → [MODEPAIEMENT](tables.md#modepaiement).`ID` (`FACTFRNS_MODEPAIEMENT_FK`, ENABLED).
- [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` (`FACTURE_FOURNISSEUR_FK`, ENABLED).
- [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDDMDACHAT` → [DMDACHAT](tables.md#dmdachat).`ID` (`FK_IDDMDACHAT_FF`, ENABLED).
- [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDTYPEFACTURE` → [TYPE_FACTURE](tables.md#type-facture).`ID` (`SYS_C008042`, ENABLED).
- [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`SYS_C008086`, ENABLED).
- [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`DEVISE` → [DEVISE](tables.md#devise).`ID` (`SYS_C008087`, ENABLED).

Tables qui la référencent :

- [AS_BONDELIVRAISON](tables.md#as-bondelivraison).`IDFACTUREFOURNISSEUR` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID`.
- [AS_BONDELIVRAISON_FILLE](tables.md#as-bondelivraison-fille).`IDFACTUREFOURNISSEUR` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID`.
- [AVOIRACHAT](tables.md#avoirachat).`IDFACTURE` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID`.
- [FACTUREFOURNISSEURFILLE](tables.md#facturefournisseurfille).`IDFACTUREFOURNISSEUR` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID`.
- [ORDONNERPAIEMENTDETAIL](tables.md#ordonnerpaiementdetail).`IDFF` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID`.
- [PAIEMENTFF](tables.md#paiementff).`IDFF` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID`.

Vues dépendantes directes (32) : [COMPARAISONPRIXFACTBC](vues.md#comparaisonprixfactbc), [COMPTA_SOUSECRITURE_LETTRE2](vues.md#compta-sousecriture-lettre2), [DEPENSE_MAT_PREM](vues.md#depense-mat-prem), [FACTFOURNISSEURCALC](vues.md#factfournisseurcalc), [FACTUREDECLARATIONFILLECPL](vues.md#facturedeclarationfillecpl), [FACTUREFOURNISSEURAUTOCOMPLETE](vues.md#facturefournisseurautocomplete), [FACTUREFOURNISSEURAVECMACHINE](vues.md#facturefournisseuravecmachine), [FACTUREFOURNISSEURCPL_M](vues.md#facturefournisseurcpl-m), [FACTUREFOURNISSEURCPL_MONTANT](vues.md#facturefournisseurcpl-montant), [FACTUREFOURNISSEURCPL_TRAVAUX](vues.md#facturefournisseurcpl-travaux), [FACTUREFOURNISSEURFILLECPL](vues.md#facturefournisseurfillecpl), [FACTUREFOURNISSEURFILLEVALIDE](vues.md#facturefournisseurfillevalide), [FACTUREFOURNISSEURMONTANT](vues.md#facturefournisseurmontant), [FACTUREFOURNISSEUR_CPL](vues.md#facturefournisseur-cpl), [FACTUREFOURNISSEUR_FILLECOMPTE](vues.md#facturefournisseur-fillecompte), [FACTUREFOURNISSEUR_FILLECPL](vues.md#facturefournisseur-fillecpl), [FACTUREFOURNISSEUR_MF](vues.md#facturefournisseur-mf), [FACTUREFOURNISSEUR_PERTE](vues.md#facturefournisseur-perte), [FFFILLECPL_MONTANT](vues.md#fffillecpl-montant), [FFFILLECPL_VISEE](vues.md#fffillecpl-visee), [FFFILLERESTEALIVRERLIB](vues.md#fffillerestealivrerlib), [FF_FILLEBC_GRP](vues.md#ff-fillebc-grp), [FF_FILLEBC_GRP_MERE](vues.md#ff-fillebc-grp-mere), [INSERTION_FACTURE_FOURNISSEUR](vues.md#insertion-facture-fournisseur), [MONTANTAPAYER](vues.md#montantapayer), [MVTSTOCKLIBFACTURE](vues.md#mvtstocklibfacture), [PLANNING_CPL](vues.md#planning-cpl), [STAT_DEPENSE_CAT](vues.md#stat-depense-cat), [STAT_DEPENSE_MAT_PREM](vues.md#stat-depense-mat-prem), [V_ETATSTOCK_ENTREE](vues.md#v-etatstock-entree), [V_LIAISONPAIEMENT_FACTUREFOURN](vues.md#v-liaisonpaiement-facturefourn), [V_LIAISONPAIEMENT_VENTE](vues.md#v-liaisonpaiement-vente).

Références dans le code : [faturefournisseur/DepenseSaisie.java:100](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/DepenseSaisie.java#L100>), [faturefournisseur/FactureFournisseur.java:291](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/FactureFournisseur.java#L291>), [faturefournisseur/InsertionFactureFournisseur.java:31](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/InsertionFactureFournisseur.java#L31>), [stock/EtatStockParEntreeFournisseur.java:183](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStockParEntreeFournisseur.java#L183>), [stock/EtatStockParEntreeStandard.java:202](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStockParEntreeStandard.java#L202>).

<a id="facturefournisseurfille"></a>

## FACTUREFOURNISSEURFILLE

Lignes des factures fournisseur.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDFACTUREFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → FACTUREFOURNISSEUR |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `REMISES` | `NUMBER(10,2)` | Oui |  |
| `IDBCDETAIL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `TVA` | `NUMBER(10,2)` | Oui |  |
| `DEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `TAUXDECHANGE` | `NUMBER(30,2)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(255 BYTE)` | Oui | FK → DEVISE |
| `DESIGNATION` | `VARCHAR2(200 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MOIS` | `NUMBER(*,0)` | Oui |  |
| `ANNEE` | `NUMBER(*,0)` | Oui |  |
| `QTE` | `NUMBER(30,10)` | Oui |  |
| `MONTANTPERTEGAIN` | `NUMBER(38,2)` | Oui |  |
| `IDPREVISION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `REMISE` | `NUMBER(30,2)` | Oui |  |
| `RISTOURNE` | `NUMBER(30,2)` | Oui |  |
| `COMPTEANALYTIQUE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `FACTUREFOURNISSEURFILLE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [FACTUREFOURNISSEURFILLE](tables.md#facturefournisseurfille).`IDFACTUREFOURNISSEUR` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID` (`FACTFRNS_MEREFILLE_FK`, ENABLED).
- [FACTUREFOURNISSEURFILLE](tables.md#facturefournisseurfille).`DEVISE` → [DEVISE](tables.md#devise).`ID` (`FFFILLE_DEVISE_FK`, ENABLED).
- [FACTUREFOURNISSEURFILLE](tables.md#facturefournisseurfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`SYS_C008082`, ENABLED).

Tables qui la référencent :

- [AVOIRACHATFILLE](tables.md#avoirachatfille).`IDFACTUREDETAILS` → [FACTUREFOURNISSEURFILLE](tables.md#facturefournisseurfille).`ID`.

Vues dépendantes directes (21) : [DEPENSE_MAT_PREM](vues.md#depense-mat-prem), [FACTFRNSFILLEAUTOCOMPLETE](vues.md#factfrnsfilleautocomplete), [FACTUREFOURNISSEURFILLECPL](vues.md#facturefournisseurfillecpl), [FACTUREFOURNISSEURFILLECPLC](vues.md#facturefournisseurfillecplc), [FACTUREFOURNISSEURFILLEVALIDE](vues.md#facturefournisseurfillevalide), [FACTUREFOURNISSEURFILLE_U](vues.md#facturefournisseurfille-u), [FACTUREFOURNISSEURMONTANT](vues.md#facturefournisseurmontant), [FACTUREFOURNISSEUR_FILLECPL](vues.md#facturefournisseur-fillecpl), [FACTUREFOURNISSEUR_MONTANT](vues.md#facturefournisseur-montant), [FFFILLECALC](vues.md#fffillecalc), [FFFILLECPL_MONTANT](vues.md#fffillecpl-montant), [FFFILLECPL_VISEE](vues.md#fffillecpl-visee), [FFFILLERESTEALIVRER](vues.md#fffillerestealivrer), [FF_FILLEBC_GRP](vues.md#ff-fillebc-grp), [FF_FILLEBC_GRP_MERE](vues.md#ff-fillebc-grp-mere), [FF_GRPMERE](vues.md#ff-grpmere), [PLANNING_CPL](vues.md#planning-cpl), [PREVISIONGROUPE](vues.md#previsiongroupe), [PREVISION_COMPLET_CPL](vues.md#prevision-complet-cpl), [RAPPROCHEMENTGLOBALE_PIE](vues.md#rapprochementglobale-pie), [STAT_DEPENSE_MAT_PREM](vues.md#stat-depense-mat-prem).

Références dans le code : [faturefournisseur/DepenseFilleSaisie.java:87](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/DepenseFilleSaisie.java#L87>), [faturefournisseur/DepenseSaisie.java:137](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/DepenseSaisie.java#L137>), [faturefournisseur/FactureFournisseurDetails.java:200](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/FactureFournisseurDetails.java#L200>), [facturefournisseur/facturefournisseur-arbiochem-saisie.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/facturefournisseur-arbiochem-saisie.jsp#L27>), [facturefournisseur/facturefournisseur-saisie.jsp:28](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/facturefournisseur-saisie.jsp#L28>) ; 4 autres fichiers dans `usages-code.json`.

<a id="familleproduit"></a>

## FAMILLEPRODUIT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `FAMILLEPRODUIT_PK` (primaire) : `ID`.

Vues dépendantes directes (3) : [AS_INGREDIENTS_LIB](vues.md#as-ingredients-lib), [AS_INGREDIENTS_LIB_PIECE](vues.md#as-ingredients-lib-piece), [BALANCE_CLIENT](vues.md#balance-client).

Références dans le code : [produits/as-ingredients-arbiochem-saisie.jsp:55](<../../projet-standard - Copie/arbiochem-war/web/pages/produits/as-ingredients-arbiochem-saisie.jsp#L55>), [produits/as-ingredients-saisie.jsp:55](<../../projet-standard - Copie/arbiochem-war/web/pages/produits/as-ingredients-saisie.jsp#L55>).

<a id="famille-professionnelle"></a>

## FAMILLE_PROFESSIONNELLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007304` (primaire) : `ID`.

Tables qui la référencent :

- [SOUS_FAMILLE_PRO](tables.md#sous-famille-pro).`IDFAMILLE` → [FAMILLE_PROFESSIONNELLE](tables.md#famille-professionnelle).`ID`.

Vues dépendantes directes (4) : [FICHE_POSTE_LIB](vues.md#fiche-poste-lib), [METIERLIB](vues.md#metierlib), [SOUS_FAMILLE_PRO_LIB](vues.md#sous-famille-pro-lib), [V_HIERARCHIE_PROFESSIONNELLE](vues.md#v-hierarchie-professionnelle).

Références dans le code : [paie/competence/FamilleProfessionnelle.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/competence/FamilleProfessionnelle.java#L10>), [paie/competence/famillepro-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/competence/famillepro-liste.jsp#L7>), [paie/competence/famillepro-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/competence/famillepro-saisie.jsp#L13>), [paie/competence/sousfamillepro-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/competence/sousfamillepro-saisie.jsp#L21>), [poste/ficheposte-saisie.jsp:41](<../../projet-standard - Copie/arbiochem-war/web/pages/poste/ficheposte-saisie.jsp#L41>).

<a id="fiche-poste"></a>

## FICHE_POSTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDDEPARTEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → DEPARTEMENT |
| `IDTYPECONTRAT` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPE_CONTRAT |
| `TITRE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REFERENCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCRIPTION` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `MISSIONS` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `EXIGENCEPOSTE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `SALAIREMIN` | `NUMBER(15,2)` | Oui |  |
| `SALAIREMAX` | `NUMBER(15,2)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `LIEUTRAVAIL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MATERIELDOCUMENT` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `OUTILS` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `CONDITIONTRAVAIL` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `MODECONTROLE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `IDNIVEAUFORMATION` | `VARCHAR2(50 BYTE)` | Oui | FK → FORMATION_DIPLOME |
| `IDPERMIS` | `VARCHAR2(50 BYTE)` | Oui | FK → PERMIS |
| `IDFONCTION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDBU` | `VARCHAR2(250 BYTE)` | Oui |  |
| `AUTRE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `IDCATEGORIEPAIE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDQUALIFICATIONPAIE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDFAMILLEPROFESSIONEL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDMETIER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDEMPLOI` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDCODEROME` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SYS_C007305` (primaire) : `ID`.

Clés étrangères sortantes :

- [FICHE_POSTE](tables.md#fiche-poste).`IDDEPARTEMENT` → [DEPARTEMENT](tables.md#departement).`ID` (`FK_FICHE_POSTE_DEPARTEMENT`, ENABLED).
- [FICHE_POSTE](tables.md#fiche-poste).`IDTYPECONTRAT` → [TYPE_CONTRAT](tables.md#type-contrat).`ID` (`FK_FICHE_POSTE_TYPECONTRAT`, ENABLED).
- [FICHE_POSTE](tables.md#fiche-poste).`IDNIVEAUFORMATION` → [FORMATION_DIPLOME](tables.md#formation-diplome).`ID` (`FK_FP_NIVEAUFORMATION`, ENABLED).
- [FICHE_POSTE](tables.md#fiche-poste).`IDPERMIS` → [PERMIS](tables.md#permis).`ID` (`FK_FP_PERMIS`, ENABLED).

Tables qui la référencent :

- [CV](tables.md#cv).`IDFICHEPOSTE` → [FICHE_POSTE](tables.md#fiche-poste).`ID`.
- [FICHE_POSTE_FILLE](tables.md#fiche-poste-fille).`IDFICHEPOSTE` → [FICHE_POSTE](tables.md#fiche-poste).`ID`.
- [FP_OBJECTIF_INDIVIDUEL](tables.md#fp-objectif-individuel).`IDFICHEPOSTE` → [FICHE_POSTE](tables.md#fiche-poste).`ID`.

Vues dépendantes directes (3) : [CV_LIB](vues.md#cv-lib), [FICHE_POSTE_LIB](vues.md#fiche-poste-lib), [OFFRE_EMPLOILIB](vues.md#offre-emploilib).

Références dans le code : [paie/log/Fiche_poste.java:18](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/log/Fiche_poste.java#L18>), [poste/FichePoste.java:164](<../../projet-standard - Copie/arbiochem-ejb/src/java/poste/FichePoste.java#L164>), [poste/ficheposte-saisie.jsp:20](<../../projet-standard - Copie/arbiochem-war/web/pages/poste/ficheposte-saisie.jsp#L20>), [paie/cv/cv-saisie.jsp:34](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/cv-saisie.jsp#L34>), [paie/recrutement/offreemploi-saisie.jsp:53](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/recrutement/offreemploi-saisie.jsp#L53>) ; 1 autres fichiers dans `usages-code.json`.

<a id="fiche-poste-competences"></a>

## FICHE_POSTE_COMPETENCES

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDFICHEPOSTE` | `VARCHAR2(50 BYTE)` | Non |  |
| `IDTYPECOMPETENCESFP` | `VARCHAR2(50 BYTE)` | Non |  |
| `DESCRIPTION` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `NIVEAU` | `NUMBER(1,0)` | Oui |  |

Clés : `SYS_C007309` (primaire) : `ID`.

Vues dépendantes directes (3) : [FICHE_POSTE_COMPETENCES_LIB](vues.md#fiche-poste-competences-lib), [FICHE_POSTE_COMPETENCES_VIDE](vues.md#fiche-poste-competences-vide), [V_MATCHING_CV_FP](vues.md#v-matching-cv-fp).

Références dans le code : [poste/FicheCompetenceFP.java:57](<../../projet-standard - Copie/arbiochem-ejb/src/java/poste/FicheCompetenceFP.java#L57>).

<a id="fiche-poste-fille"></a>

## FICHE_POSTE_FILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDFICHEPOSTE` | `VARCHAR2(50 BYTE)` | Oui | FK → FICHE_POSTE |
| `TITREACTIVITES` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `DESCRIPTIONACTIVITES` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `SYS_C007310` (primaire) : `ID`.

Clés étrangères sortantes :

- [FICHE_POSTE_FILLE](tables.md#fiche-poste-fille).`IDFICHEPOSTE` → [FICHE_POSTE](tables.md#fiche-poste).`ID` (`FK_FPF_FICHE_POSTE`, ENABLED).

Références dans le code : [poste/FichePosteFille.java:57](<../../projet-standard - Copie/arbiochem-ejb/src/java/poste/FichePosteFille.java#L57>), [poste/ficheposte-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/poste/ficheposte-saisie.jsp#L22>), [poste/inc/detail.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/poste/inc/detail.jsp#L7>).

<a id="formateur"></a>

## FORMATEUR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `EMAIL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TELEPHONE` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `FORMATEUR_PK` (primaire) : `ID`.

Tables qui la référencent :

- [MODULE_PRESTATAIRE](tables.md#module-prestataire).`IDFORMATEUR` → [FORMATEUR](tables.md#formateur).`ID`.

Vues dépendantes directes (2) : [V_MODULE_PRESTATAIRE_LIB](vues.md#v-module-prestataire-lib), [V_RECAP_GLOBAL_FORMATION](vues.md#v-recap-global-formation).

Références dans le code : [paie/formateur/Formateur.java:48](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formateur/Formateur.java#L48>), [paie/formateur/formateur-fiche.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formateur/formateur-fiche.jsp#L13>), [paie/formateur/formateur-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formateur/formateur-liste.jsp#L7>), [paie/formateur/formateur-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formateur/formateur-saisie.jsp#L13>), [paie/formation/recap-global-formation.jsp:30](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/recap-global-formation.jsp#L30>) ; 2 autres fichiers dans `usages-code.json`.

<a id="formation-diplome"></a>

## FORMATION_DIPLOME

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `FORMATION_DIPLOME_PK` (primaire) : `ID`.

Tables qui la référencent :

- [FICHE_POSTE](tables.md#fiche-poste).`IDNIVEAUFORMATION` → [FORMATION_DIPLOME](tables.md#formation-diplome).`ID`.

Vues dépendantes directes (3) : [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [FICHE_POSTE_LIB](vues.md#fiche-poste-lib).

Références dans le code : [paie/DeroulanteEmbaucheData.java:65](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/DeroulanteEmbaucheData.java#L65>), [paie/contrat/contrat-modif.jsp:100](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/contrat/contrat-modif.jsp#L100>), [paie/employe/infopersonnel-saisie.jsp:61](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/infopersonnel-saisie.jsp#L61>), [poste/ficheposte-saisie.jsp:49](<../../projet-standard - Copie/arbiochem-war/web/pages/poste/ficheposte-saisie.jsp#L49>).

<a id="formation-suivi"></a>

## FORMATION_SUIVI

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDFORMATION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDPERSONNEL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATEDEBUT` | `DATE` | Oui |  |
| `DATEFIN` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(10,0)` | Oui |  |

Clés : `FORMATION_SUIVI_PK` (primaire) : `ID`.

Références dans le code : [paie/formation/FormationSuivi.java:58](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formation/FormationSuivi.java#L58>), [paie/formation/formationsuivi-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/formationsuivi-saisie.jsp#L13>), [paie/evaluation/evaluationfroid-saisie.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/evaluation/evaluationfroid-saisie.jsp#L25>).

<a id="fournisseur"></a>

## FOURNISSEUR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `NOM` | `VARCHAR2(255 BYTE)` | Oui |  |
| `NIF` | `VARCHAR2(255 BYTE)` | Oui |  |
| `STAT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ADRESSE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CONTACT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CODEPOSTAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDTYPEFOURNISSEUR` | `VARCHAR2(100 BYTE)` | Oui | FK → TYPEFOURNISSEUR |
| `COMPTEAUXILIAIRE` | `VARCHAR2(20 BYTE)` | Oui |  |
| `ESTACTIF` | `NUMBER(*,0)` | Oui |  |
| `ECHEANCE` | `NUMBER(30,2)` | Oui |  |
| `DEVISE` | `VARCHAR2(255 BYTE)` | Oui | FK → DEVISE |
| `MAIL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `BANQUE` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `FOURNISSEUR_PK` (primaire) : `ID` ; `SYS_C007318` (unique) : `COMPTEAUXILIAIRE`.

Clés étrangères sortantes :

- [FOURNISSEUR](tables.md#fournisseur).`DEVISE` → [DEVISE](tables.md#devise).`ID` (`FK_FOURNISSEUR_DEVISE`, ENABLED).
- [FOURNISSEUR](tables.md#fournisseur).`IDTYPEFOURNISSEUR` → [TYPEFOURNISSEUR](tables.md#typefournisseur).`ID` (`FRNS_TYPE_FK`, ENABLED).

Tables qui la référencent :

- [AS_BONDELIVRAISON](tables.md#as-bondelivraison).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID`.
- [AVOIRACHAT](tables.md#avoirachat).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID`.
- [BONCOMMANDE](tables.md#boncommande).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID`.
- [DEPENSEDIVERS](tables.md#depensedivers).`FOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID`.
- [DMDACHAT](tables.md#dmdachat).`FOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID`.
- [FACTUREDECLARATION](tables.md#facturedeclaration).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID`.
- [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID`.
- [LIVRAISONINTERNE](tables.md#livraisoninterne).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID`.
- [PLANPAIEMENTACHAT](tables.md#planpaiementachat).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID`.
- [TRANSFERTSTOCKDETAILS](tables.md#transfertstockdetails).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID`.

Vues dépendantes directes (25) : [AS_BONDECOMMANDE_CPL](vues.md#as-bondecommande-cpl), [AS_BONDECOMMANDE_MERECPL](vues.md#as-bondecommande-merecpl), [AS_BONDELIVRAISON_LIB](vues.md#as-bondelivraison-lib), [AS_INGREDIENTS_LIB](vues.md#as-ingredients-lib), [AS_INGREDIENTS_LIB_PIECE](vues.md#as-ingredients-lib-piece), [AVOIRACHATCALC_AVEC_LIB](vues.md#avoirachatcalc-avec-lib), [AVOIRACHATLIB](vues.md#avoirachatlib), [COMPTE_AUX](vues.md#compte-aux), [DEPENSEDIVERSLIB](vues.md#depensediverslib), [DMDACHATLIB](vues.md#dmdachatlib), [FACTUREDECLARATIONCPL](vues.md#facturedeclarationcpl), [FACTUREFOURNISSEURAUTOCOMPLETE](vues.md#facturefournisseurautocomplete), [FACTUREFOURNISSEURAVECMACHINE](vues.md#facturefournisseuravecmachine), [FACTUREFOURNISSEURCPL](vues.md#facturefournisseurcpl), [FACTUREFOURNISSEURCPL_M](vues.md#facturefournisseurcpl-m), [FACTUREFOURNISSEURCPL_MONTANT](vues.md#facturefournisseurcpl-montant), [FACTUREFOURNISSEURCPL_TRAVAUX](vues.md#facturefournisseurcpl-travaux), [FACTUREFOURNISSEUR_CPL](vues.md#facturefournisseur-cpl), [FOURNISSEURCPL](vues.md#fournisseurcpl), [PLANPAIEMENTACHATLIB](vues.md#planpaiementachatlib), [TIERS](vues.md#tiers), [TIERSENSEMBLE](vues.md#tiersensemble), [V_ETATSTOCK_ENTREE](vues.md#v-etatstock-entree), [V_FORMATEUR_FF](vues.md#v-formateur-ff), [V_FOURNISSEUR_LIB](vues.md#v-fournisseur-lib).

Références dans le code : [faturefournisseur/Fournisseur.java:52](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/Fournisseur.java#L52>), [stock/EtatStockParEntreeFournisseur.java:195](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStockParEntreeFournisseur.java#L195>), [stock/EtatStockParEntreeStandard.java:214](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStockParEntreeStandard.java#L214>), [bondecommande/bondecommande-arbiochem-saisie.jsp:50](<../../projet-standard - Copie/arbiochem-war/web/pages/bondecommande/bondecommande-arbiochem-saisie.jsp#L50>), [bondecommande/bondecommande-modif.jsp:32](<../../projet-standard - Copie/arbiochem-war/web/pages/bondecommande/bondecommande-modif.jsp#L32>) ; 28 autres fichiers dans `usages-code.json`.

<a id="fp-objectif-individuel"></a>

## FP_OBJECTIF_INDIVIDUEL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDFICHEPOSTE` | `VARCHAR2(255 BYTE)` | Non | FK → FICHE_POSTE |
| `OBJECTIF` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `KPI` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `FP_OBJECTIF_INDIVIDUEL_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [FP_OBJECTIF_INDIVIDUEL](tables.md#fp-objectif-individuel).`IDFICHEPOSTE` → [FICHE_POSTE](tables.md#fiche-poste).`ID` (`FK_FP_OBJECTIF_FP`, ENABLED).

Références dans le code : [paie/poste/ObjectifIndividuel.java:48](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/poste/ObjectifIndividuel.java#L48>), [poste/inc/objectif.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/poste/inc/objectif.jsp#L7>).

<a id="frequence-conge"></a>

## FREQUENCE_CONGE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007323` (primaire) : `ID`.

Vues dépendantes directes (1) : [TYPEABSENCE_CPL](vues.md#typeabsence-cpl).

Références dans le code : [paie/absence/typeabsence-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/absence/typeabsence-saisie.jsp#L22>).

<a id="fumigation"></a>

## FUMIGATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDNUMEROVAGUE` | `VARCHAR2(100 BYTE)` | Oui | FK → NUMEROCOLLECTE |
| `IDOPERATEUR` | `VARCHAR2(100 BYTE)` | Oui | FK → LOG_PERSONNEL |
| `IDLOT` | `VARCHAR2(100 BYTE)` | Oui | FK → LOT |
| `NOMBREOAC` | `NUMBER(30,2)` | Oui |  |
| `HEUREDEBUTFUMIGATION` | `VARCHAR2(20 BYTE)` | Oui |  |
| `HEUREFINFUMIGATION` | `VARCHAR2(20 BYTE)` | Oui |  |
| `HEUREDEBUTEXTRACTION` | `VARCHAR2(20 BYTE)` | Oui |  |
| `HEUREFINEXTRACTION` | `VARCHAR2(20 BYTE)` | Oui |  |
| `IDPRODUIT` | `VARCHAR2(100 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `QTE` | `NUMBER(30,2)` | Oui |  |
| `TEMPERATUREMIN` | `NUMBER(30,2)` | Oui |  |
| `TEMPERATUREMAX` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER(30,2)` | Oui |  |
| `IDBATIMENT` | `VARCHAR2(100 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUET` | `VARCHAR2(100 BYTE)` | Oui | FK → PARQUET |

Clés : `FUMIGATION_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [FUMIGATION](tables.md#fumigation).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` (`FUMIGATION_BATIMENT_FK`, ENABLED).
- [FUMIGATION](tables.md#fumigation).`IDLOT` → [LOT](tables.md#lot).`ID` (`FUMIGATION_LOT_FK`, ENABLED).
- [FUMIGATION](tables.md#fumigation).`IDNUMEROVAGUE` → [NUMEROCOLLECTE](tables.md#numerocollecte).`ID` (`FUMIGATION_NUMVAGUE_FK`, ENABLED).
- [FUMIGATION](tables.md#fumigation).`IDOPERATEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`FUMIGATION_OPER_FK`, ENABLED).
- [FUMIGATION](tables.md#fumigation).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` (`FUMIGATION_PARQUET_FK`, ENABLED).
- [FUMIGATION](tables.md#fumigation).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`FUMIGATION_PRODUIT_FK`, ENABLED).

Vues dépendantes directes (1) : [FUMIGATION_LIB](vues.md#fumigation-lib).

Références dans le code : [ferme/production/Fumigation.java:155](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/production/Fumigation.java#L155>), [ferme/production/fumigation-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/fumigation-saisie.jsp#L21>), [ferme/production/fumigationsimple-saisie.jsp:17](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/fumigationsimple-saisie.jsp#L17>).

<a id="gravite-accident"></a>

## GRAVITE_ACCIDENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `SYS_C007326` (primaire) : `ID`.

Tables qui la référencent :

- [ACCIDENT](tables.md#accident).`ID_GRAVITE` → [GRAVITE_ACCIDENT](tables.md#gravite-accident).`ID`.

Vues dépendantes directes (2) : [V_ACCIDENT_LIB](vues.md#v-accident-lib), [V_ACCIDENT_PDF](vues.md#v-accident-pdf).

Références dans le code : [paie/accident/accident-liste.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/accident/accident-liste.jsp#L24>), [paie/accident/accident-saisie.jsp:29](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/accident/accident-saisie.jsp#L29>).

<a id="heuresupfabrication"></a>

## HEURESUPFABRICATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDRESSPARFAB` | `VARCHAR2(100 BYTE)` | Oui |  |
| `HS` | `NUMBER(30,2)` | Oui |  |
| `MN` | `NUMBER(30,2)` | Oui |  |
| `JF` | `NUMBER(30,2)` | Oui |  |
| `HD` | `NUMBER(30,2)` | Oui |  |
| `IF` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TEMPORAIRE` | `NUMBER(*,0)` | Oui |  |
| `HEURENORMALE` | `NUMBER(30,2)` | Oui |  |
| `POSTE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `EQUIPE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MONTANT` | `NUMBER(30,10)` | Oui |  |
| `IDFABRICATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MONTANTJF` | `NUMBER(30,2)` | Oui |  |
| `MONTANTIF` | `NUMBER(30,2)` | Oui |  |
| `MONTANTHD` | `NUMBER(30,2)` | Oui |  |
| `MONTANTMN` | `NUMBER(30,2)` | Oui |  |
| `MONTANTTMP` | `NUMBER(30,2)` | Oui |  |
| `MONTANTHN` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `MONTANTHEURESUPP` | `NUMBER(30,2)` | Oui |  |
| `DATEIMPORT` | `DATE` | Oui |  |
| `TAUXHORAIRE` | `NUMBER(30,2)` | Oui |  |

Clés : `HEURESUPFABRICATION_PK` (primaire) : `ID`.

Vues dépendantes directes (10) : [HEURESUPFABRICATION_CPL](vues.md#heuresupfabrication-cpl), [HEURESUPFABRICATION_CUMUL](vues.md#heuresupfabrication-cumul), [HEURESUPFABRICATION_TOTAL](vues.md#heuresupfabrication-total), [HS_FAB_SEMAINE_PARTRANCHE](vues.md#hs-fab-semaine-partranche), [HS_PAR_FAB](vues.md#hs-par-fab), [HS_PAR_OF](vues.md#hs-par-of), [HS_PAR_OFFILLE](vues.md#hs-par-offille), [RESSOURCEPARFABRICATIONCOMPLET](vues.md#ressourceparfabricationcomplet), [STOCKETDEPENSEFABNC](vues.md#stocketdepensefabnc), [VW_HS_CUMUL_WEEK](vues.md#vw-hs-cumul-week).

Références dans le code : [fabrication/HeureSupFabrication.java:225](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/HeureSupFabrication.java#L225>).

<a id="heuresuptemporaire"></a>

## HEURESUPTEMPORAIRE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non |  |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="histoinsert"></a>

## HISTOINSERT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `IDHISTORIQUE` | `VARCHAR2(20 BYTE)` | Non | PK |
| `DATEHISTORIQUE` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(25 BYTE)` | Oui |  |
| `OBJET` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ACTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDUTILISATEUR` | `NUMBER` | Non |  |
| `REFOBJET` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `HISTOINSERT_PK` (primaire) : `IDHISTORIQUE`.

Vues dépendantes directes (2) : [HISTOINSERTVUE](vues.md#histoinsertvue), [V_HISTOINSERT](vues.md#v-histoinsert).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="historique"></a>

## HISTORIQUE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `IDHISTORIQUE` | `VARCHAR2(20 BYTE)` | Non | PK |
| `DATEHISTORIQUE` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(25 BYTE)` | Oui |  |
| `OBJET` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ACTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDUTILISATEUR` | `NUMBER` | Non |  |
| `REFOBJET` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `PK_HISTORIQUE` (primaire) : `IDHISTORIQUE`.

Vues dépendantes directes (1) : [HISTORIQUEAVECUSER](vues.md#historiqueavecuser).

Références dans le code : [produits/Historique.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/produits/Historique.java#L10>), [user/UserEJBBean.java:733](<../../projet-standard - Copie/arbiochem-ejb/src/java/user/UserEJBBean.java#L733>), [historique/historique-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/historique/historique-liste.jsp#L7>).

<a id="historiquedemande"></a>

## HISTORIQUEDEMANDE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(100 BYTE)` | Oui | FK → PAIE_INFO_PERSONNEL |
| `IDDEMANDE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEMANDE |
| `DATY` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ETATDEMANDE` | `NUMBER(*,0)` | Oui |  |

Clés : `HISTORIQUEDEMANDE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [HISTORIQUEDEMANDE](tables.md#historiquedemande).`IDDEMANDE` → [DEMANDE](tables.md#demande).`ID` (`HISTDEMANDE_DEMANDE_ID_FK`, ENABLED).
- [HISTORIQUEDEMANDE](tables.md#historiquedemande).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` (`HISTDEMANDE_PAIEINFOPERS_ID_FK`, ENABLED).

Vues dépendantes directes (1) : [HISTORIQUEDEMANDEMAX](vues.md#historiquedemandemax).

Références dans le code : [paie/demande/HistoriqueDemande.java:22](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/demande/HistoriqueDemande.java#L22>).

<a id="historiqueinspectionfille"></a>

## HISTORIQUEINSPECTIONFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDELEMENT` | `VARCHAR2(50 BYTE)` | Oui | FK → ELEMENTINSPECTION |
| `ETATINSPECTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007338` (primaire) : `ID`.

Clés étrangères sortantes :

- [HISTORIQUEINSPECTIONFILLE](tables.md#historiqueinspectionfille).`IDELEMENT` → [ELEMENTINSPECTION](tables.md#elementinspection).`ID` (`FK_HISTOINSPECTIONF_ELEMENT`, ENABLED).

Vues dépendantes directes (1) : [HISTORIQUEINSPECTIONFILLELIB](vues.md#historiqueinspectionfillelib).

Références dans le code : [maintenance/inspection/HistoriqueInspectionFille.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/inspection/HistoriqueInspectionFille.java#L10>).

<a id="historiqueinspectionmere"></a>

## HISTORIQUEINSPECTIONMERE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDINSPECTEUR` | `VARCHAR2(50 BYTE)` | Oui | FK → PERSONNEL |
| `IDELEMENT` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENT_MAINTENANCE |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `SYS_C007340` (primaire) : `ID`.

Clés étrangères sortantes :

- [HISTORIQUEINSPECTIONMERE](tables.md#historiqueinspectionmere).`IDINSPECTEUR` → [PERSONNEL](tables.md#personnel).`ID` (`SYS_C007968`, ENABLED).
- [HISTORIQUEINSPECTIONMERE](tables.md#historiqueinspectionmere).`IDELEMENT` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` (`SYS_C008299`, ENABLED).

Vues dépendantes directes (1) : [HISTORIQUEINSPECTIONLIB](vues.md#historiqueinspectionlib).

Références dans le code : [maintenance/inspection/HistoriqueInspectionMere.java:11](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/inspection/HistoriqueInspectionMere.java#L11>).

<a id="historiqueprix"></a>

## HISTORIQUEPRIX

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `PV` | `NUMBER(30,2)` | Oui |  |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDFACTUREFOURNISSEURFILLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `HISTORIQUEPRIX_PK` (primaire) : `ID`.

Vues dépendantes directes (1) : [HISTORIQUEPRIXLIB](vues.md#historiqueprixlib).

Références dans le code : [stock/HistoriquePrix.java:13](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/HistoriquePrix.java#L13>).

<a id="historiquepuing"></a>

## HISTORIQUEPUING

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `PU` | `NUMBER(10,2)` | Oui |  |
| `REMARQUE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDINGREDIENTS` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SYS_C007344` (primaire) : `ID`.

Vues dépendantes directes (1) : [HISTORIQUEPUINGTRIE](vues.md#historiquepuingtrie).

Références dans le code : [produits/HistoriquePrixIng.java:22](<../../projet-standard - Copie/arbiochem-ejb/src/java/produits/HistoriquePrixIng.java#L22>).

<a id="historiquepving"></a>

## HISTORIQUEPVING

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `PU` | `NUMBER(10,2)` | Oui |  |
| `REMARQUE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDINGREDIENTS` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SYS_C007345` (primaire) : `ID`.

Vues dépendantes directes (1) : [HISTORIQUEPVINGTRIE](vues.md#historiquepvingtrie).

Références dans le code : [produits/Ingredients.java:499](<../../projet-standard - Copie/arbiochem-ejb/src/java/produits/Ingredients.java#L499>).

<a id="historiquevalidationdmdachat"></a>

## HISTORIQUEVALIDATIONDMDACHAT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDDMDACHAT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REFUSER` | `VARCHAR2(255 BYTE)` | Oui |  |
| `NOMUSER` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007346` (primaire) : `ID`.

Références dans le code : [faturefournisseur/DmdAchat.java:217](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/DmdAchat.java#L217>), [faturefournisseur/historique/HistoriqueValidationDmdAchat.java:66](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/historique/HistoriqueValidationDmdAchat.java#L66>), [facturefournisseur/dmdachat/inc/historique-validation.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/dmdachat/inc/historique-validation.jsp#L7>).

<a id="historique-produit"></a>

## HISTORIQUE_PRODUIT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui | FK → PRODUIT |
| `PUACHAT` | `NUMBER(30,2)` | Oui |  |
| `PUVENTE` | `NUMBER(30,2)` | Oui |  |

Clés : `HISTORIQUE_PRODUIT_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [HISTORIQUE_PRODUIT](tables.md#historique-produit).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID` (`HISTOPRODUIT_PRODUIT_FK`, ENABLED).

Vues dépendantes directes (1) : [HISTORIQUE_PRODUIT_LIB](vues.md#historique-produit-lib).

Références dans le code : [annexe/HistoriqueProduit.java:25](<../../projet-standard - Copie/arbiochem-ejb/src/java/annexe/HistoriqueProduit.java#L25>), [annexe/produit/inc/historique-liste.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/produit/inc/historique-liste.jsp#L19>).

<a id="hsmois"></a>

## HSMOIS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDCATEGORIE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `MOIS` | `NUMBER(2,0)` | Oui |  |
| `ANNEE` | `NUMBER(4,0)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `IDDEPARTEMENT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(2,0)` | Oui |  |

Clés : `SYS_C007348` (primaire) : `ID`.

Vues dépendantes directes (1) : [HSMOIS_CPL](vues.md#hsmois-cpl).

Références dans le code : [paie/hs/HsMois.java:31](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/hs/HsMois.java#L31>), [paie/hs/hsmois-calcul.jsp:20](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/hs/hsmois-calcul.jsp#L20>).

<a id="hs-fabrication-detail-paie"></a>

## HS_FABRICATION_DETAIL_PAIE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDFABRICATION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDPERSONNEL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `TYPE_HS` | `VARCHAR2(10 BYTE)` | Oui |  |
| `HEURES` | `NUMBER` | Oui |  |
| `TAUX` | `NUMBER` | Oui |  |
| `MONTANT` | `NUMBER` | Oui |  |
| `CUMUL_AVANT` | `NUMBER` | Oui |  |
| `ID_HSMOIS` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |

Clés : `SYS_C007347` (primaire) : `ID`.

Références dans le code : [fabrication/HeureSupFabricationDetail.java:21](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/HeureSupFabricationDetail.java#L21>).

<a id="imprimedeclaration"></a>

## IMPRIMEDECLARATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `NUMERO` | `VARCHAR2(255 BYTE)` | Oui |  |
| `RUBRIQUE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007349` (primaire) : `ID`.

Vues dépendantes directes (2) : [IMPRIMEDECLARATIONLIB](vues.md#imprimedeclarationlib), [LIAISONCODELIB](vues.md#liaisoncodelib).

Références dans le code : [declaration/ImprimerDeclaration.java:45](<../../projet-standard - Copie/arbiochem-ejb/src/java/declaration/ImprimerDeclaration.java#L45>).

<a id="imprimervente"></a>

## IMPRIMERVENTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007351` (primaire) : `ID`.

Références dans le code : [vente/ImprimerVente.java:12](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/ImprimerVente.java#L12>).

<a id="incubateur"></a>

## INCUBATEUR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CAPACITE` | `NUMBER(30,2)` | Oui |  |

Clés : `SYS_C007352` (primaire) : `ID`.

Tables qui la référencent :

- [ECLOSION](tables.md#eclosion).`IDINCUBATEUR` → [INCUBATEUR](tables.md#incubateur).`ID`.
- [MISEENINCUBATEUR](tables.md#miseenincubateur).`IDINCUBATEUR` → [INCUBATEUR](tables.md#incubateur).`ID`.
- [TRIAGEQUALITEPOUSSIN](tables.md#triagequalitepoussin).`IDINCUBATEUR` → [INCUBATEUR](tables.md#incubateur).`ID`.

Vues dépendantes directes (3) : [ECLOSION_LIB](vues.md#eclosion-lib), [MISEENINCUBATEUR_LIB](vues.md#miseenincubateur-lib), [TRIAGEQUALITEPOUSSIN_LIB](vues.md#triagequalitepoussin-lib).

Références dans le code : [ferme/configuration/Incubateur.java:14](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/configuration/Incubateur.java#L14>), [ferme/configuration/incubateur-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/incubateur-saisie.jsp#L19>), [ferme/couvoir/eclosion-saisie.jsp:35](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/eclosion-saisie.jsp#L35>), [ferme/couvoir/miseneincubateur-saisie.jsp:31](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/miseneincubateur-saisie.jsp#L31>), [ferme/couvoir/triagequalitepoussin-saisie.jsp:36](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/triagequalitepoussin-saisie.jsp#L36>).

<a id="indisponibilite"></a>

## INDISPONIBILITE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDPOINT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDPRODUIT` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SYS_C007353` (primaire) : `ID`.

Vues dépendantes directes (4) : [AS_INGREDIENTS_LIB](vues.md#as-ingredients-lib), [AS_INGREDIENTS_LIB2](vues.md#as-ingredients-lib2), [AS_INGREDIENTS_LIB_PIECE](vues.md#as-ingredients-lib-piece), [AS_INGREDIENTS_PRODUIT_FINIE](vues.md#as-ingredients-produit-finie).

Références dans le code : [produits/Indisponibilite.java:20](<../../projet-standard - Copie/arbiochem-ejb/src/java/produits/Indisponibilite.java#L20>).

<a id="infosauto"></a>

## INFOSAUTO

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDINGREDIENT` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `DESCRIPTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `NUMERODEPARC` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATEPREMIEREMISEENCIRCULATION` | `DATE` | Oui |  |
| `IMMATRICULATION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `NOTE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `FOURNISSEUR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `NUMERO` | `VARCHAR2(50 BYTE)` | Oui |  |
| `VOLUME` | `NUMBER(10,2)` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `TYPE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `VIN` | `VARCHAR2(50 BYTE)` | Oui |  |
| `MARQUE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `MODELE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ANNEE` | `NUMBER(4,0)` | Oui |  |
| `NOMBREDEPLACES` | `NUMBER(3,0)` | Oui |  |
| `NOMBREDEPORTES` | `NUMBER(3,0)` | Oui |  |
| `PUISSANCEFISCALE` | `NUMBER(10,2)` | Oui |  |
| `BAILLEUR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `VALEURINITIALE` | `NUMBER(15,2)` | Oui |  |
| `DATEDEBUT` | `DATE` | Oui |  |
| `DURREEENMOIS` | `NUMBER(5,0)` | Oui |  |
| `MENSUALITE` | `NUMBER(15,2)` | Oui |  |
| `VENDEUR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `PRIX` | `NUMBER(15,2)` | Oui |  |
| `DATEDACHAT` | `DATE` | Oui |  |
| `NUMERODIMMOBILISATION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DUREEDAMORTISSEMENTENMOIS` | `NUMBER(5,0)` | Oui |  |
| `PNEUS` | `VARCHAR2(50 BYTE)` | Oui |  |
| `BATTERIE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `HUILEMOTEUR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `HUILEBOITEDEVITESSE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `TYPEDECARBURANT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CONSOMMATION` | `NUMBER(10,2)` | Oui |  |
| `UNITEDECONSOMMATION` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SYS_C007355` (primaire) : `ID`.

Clés étrangères sortantes :

- [INFOSAUTO](tables.md#infosauto).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`SYS_C008275`, ENABLED).

Vues dépendantes directes (2) : [AUTOLIB](vues.md#autolib), [INFOSAUTOLIB](vues.md#infosautolib).

Références dans le code : [maintenance/ressources/InfosAuto.java:21](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/ressources/InfosAuto.java#L21>).

<a id="inspectionfille"></a>

## INSPECTIONFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(100 BYTE)` | Oui | FK → INSPECTIONMERE |
| `IDELEMENT` | `VARCHAR2(100 BYTE)` | Oui | FK → ELEMENTINSPECTION |
| `IDETATINSPECTION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007356` (primaire) : `ID`.

Clés étrangères sortantes :

- [INSPECTIONFILLE](tables.md#inspectionfille).`IDELEMENT` → [ELEMENTINSPECTION](tables.md#elementinspection).`ID` (`FK_INSPECTIONFILLE_ELEMENT`, ENABLED).
- [INSPECTIONFILLE](tables.md#inspectionfille).`IDMERE` → [INSPECTIONMERE](tables.md#inspectionmere).`ID` (`FK_INSPECTION_FILLE_MERE`, ENABLED).

Vues dépendantes directes (1) : [INSPECTIONFILLELIB](vues.md#inspectionfillelib).

Références dans le code : [machine/InspectionFille.java:65](<../../projet-standard - Copie/arbiochem-ejb/src/java/machine/InspectionFille.java#L65>), [inspection/inspection-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/inspection/inspection-saisie.jsp#L23>).

<a id="inspectionmere"></a>

## INSPECTIONMERE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DATY` | `DATE` | Non |  |
| `HEURE` | `VARCHAR2(10 BYTE)` | Oui |  |
| `IDINSPECTEUR` | `VARCHAR2(100 BYTE)` | Oui | FK → PERSONNEL |
| `IDELEMENT` | `VARCHAR2(100 BYTE)` | Oui | FK → AS_INGREDIENT_MAINTENANCE |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `SYS_C007358` (primaire) : `ID`.

Clés étrangères sortantes :

- [INSPECTIONMERE](tables.md#inspectionmere).`IDELEMENT` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` (`FK_ELEMENT_MERE`, ENABLED).
- [INSPECTIONMERE](tables.md#inspectionmere).`IDINSPECTEUR` → [PERSONNEL](tables.md#personnel).`ID` (`FK_INSPECTEUR`, ENABLED).

Tables qui la référencent :

- [INSPECTIONFILLE](tables.md#inspectionfille).`IDMERE` → [INSPECTIONMERE](tables.md#inspectionmere).`ID`.

Vues dépendantes directes (3) : [AS_INGREDIENT_MACHINE](vues.md#as-ingredient-machine), [INSPECTIONFILLECPL](vues.md#inspectionfillecpl), [INSPECTIONMERELIB](vues.md#inspectionmerelib).

Références dans le code : [machine/InspectionMere.java:76](<../../projet-standard - Copie/arbiochem-ejb/src/java/machine/InspectionMere.java#L76>), [inspection/inspection-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/inspection/inspection-saisie.jsp#L21>).

<a id="interdureepanne"></a>

## INTERDUREEPANNE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDMACHINE` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENT_MAINTENANCE |
| `DATEOT` | `DATE` | Oui |  |
| `DUREE` | `NUMBER(*,0)` | Oui |  |

Clés : `SYS_C007360` (primaire) : `ID`.

Clés étrangères sortantes :

- [INTERDUREEPANNE](tables.md#interdureepanne).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` (`FK_INTERDUREEPANNE_MACHINE`, ENABLED).

Références dans le code : [maintenance/etats/InterDureePanne.java:17](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/etats/InterDureePanne.java#L17>).

<a id="inventaire"></a>

## INVENTAIRE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(255 BYTE)` | Oui | FK → CATEGORIEINGREDIENT |
| `HEURE` | `VARCHAR2(10 BYTE)` | Oui |  |

Clés : `INVENTAIRE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [INVENTAIRE](tables.md#inventaire).`IDCATEGORIE` → [CATEGORIEINGREDIENT](tables.md#categorieingredient).`ID` (`FK_CATEGORIE_INGREDIENT`, ENABLED).

Tables qui la référencent :

- [INVENTAIREFILLE](tables.md#inventairefille).`IDINVENTAIRE` → [INVENTAIRE](tables.md#inventaire).`ID`.

Vues dépendantes directes (9) : [INVENTAIREAVECVIDE](vues.md#inventaireavecvide), [INVENTAIREDATEHEURE](vues.md#inventairedateheure), [INVENTAIREFILLEMERE](vues.md#inventairefillemere), [INVENTAIRELIB](vues.md#inventairelib), [INVENTAIRE_FILLE_CPL](vues.md#inventaire-fille-cpl), [INVENTAIRE_FILLE_CPL_ING](vues.md#inventaire-fille-cpl-ing), [INVENTAIRE_FILLE_CPL_VALIDE](vues.md#inventaire-fille-cpl-valide), [MVTSTOCKFILLESANSINVENTAIRE](vues.md#mvtstockfillesansinventaire), [V_INVENTAIREFILLECPL](vues.md#v-inventairefillecpl).

Références dans le code : [inventaire/Inventaire.java:44](<../../projet-standard - Copie/arbiochem-ejb/src/java/inventaire/Inventaire.java#L44>), [inventaire/inventaire-categorie-saisie2.jsp:26](<../../projet-standard - Copie/arbiochem-war/web/pages/inventaire/inventaire-categorie-saisie2.jsp#L26>), [inventaire/inventaire-modif.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/inventaire/inventaire-modif.jsp#L22>), [inventaire/inventaire-saisie.jsp:39](<../../projet-standard - Copie/arbiochem-war/web/pages/inventaire/inventaire-saisie.jsp#L39>), [stock/EtatStock.java:554](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStock.java#L554>) ; 1 autres fichiers dans `usages-code.json`.

<a id="inventairefille"></a>

## INVENTAIREFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDINVENTAIRE` | `VARCHAR2(255 BYTE)` | Oui | FK → INVENTAIRE |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `EXPLICATION` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDJAUGE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QUANTITETHEORIQUE` | `NUMBER(30,10)` | Oui |  |
| `QUANTITE` | `NUMBER(30,10)` | Oui |  |
| `MVTSRC` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PU` | `NUMBER(30,5)` | Oui |  |
| `IDFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `INVENTAIREFILLE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [INVENTAIREFILLE](tables.md#inventairefille).`IDINVENTAIRE` → [INVENTAIRE](tables.md#inventaire).`ID` (`INVENTAIRE_MEREFILLE_FK`, ENABLED).

Vues dépendantes directes (15) : [INVENTAIREFILLEAUTOCOMPLETE](vues.md#inventairefilleautocomplete), [INVENTAIREFILLEAVECVIDE](vues.md#inventairefilleavecvide), [INVENTAIREFILLEGROUPEMERE](vues.md#inventairefillegroupemere), [INVENTAIREFILLELIB](vues.md#inventairefillelib), [INVENTAIREFILLEMERE](vues.md#inventairefillemere), [INVENTAIREFILLETYPEMVT](vues.md#inventairefilletypemvt), [INVENTAIREFILLEUPDATE](vues.md#inventairefilleupdate), [INVENTAIRE_FILLE_CPL](vues.md#inventaire-fille-cpl), [INVENTAIRE_FILLE_CPL_ING](vues.md#inventaire-fille-cpl-ing), [MVTSTOCKFILLESANSINVENTAIRE](vues.md#mvtstockfillesansinventaire), [V_ETATSTOCK_ENTREE](vues.md#v-etatstock-entree), [V_ETATSTOCK_ENTREE_STANDARD](vues.md#v-etatstock-entree-standard), [V_ETATSTOCK_ING](vues.md#v-etatstock-ing), [V_ETATSTOCK_ING_TOUS](vues.md#v-etatstock-ing-tous), [V_INVENTAIREFILLECPL](vues.md#v-inventairefillecpl).

Références dans le code : [inventaire/Inventaire.java:163](<../../projet-standard - Copie/arbiochem-ejb/src/java/inventaire/Inventaire.java#L163>), [inventaire/InventaireFille.java:56](<../../projet-standard - Copie/arbiochem-ejb/src/java/inventaire/InventaireFille.java#L56>), [inventaire/inventaire-modif.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/inventaire/inventaire-modif.jsp#L24>), [inventaire/inventaire-saisie.jsp:41](<../../projet-standard - Copie/arbiochem-war/web/pages/inventaire/inventaire-saisie.jsp#L41>), [stock/EtatStock.java:553](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStock.java#L553>) ; 2 autres fichiers dans `usages-code.json`.

<a id="jauge"></a>

## JAUGE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui | FK → MAGASIN2 |
| `QTE` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `JAUGE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [JAUGE](tables.md#jauge).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` (`JAUGE_MAGASIN_FK`, ENABLED).

Vues dépendantes directes (1) : [JAUGELIB](vues.md#jaugelib).

Références dans le code : [jauge/Jauge.java:31](<../../projet-standard - Copie/arbiochem-ejb/src/java/jauge/Jauge.java#L31>), [jauge/jauge-fiche.jsp:26](<../../projet-standard - Copie/arbiochem-war/web/pages/jauge/jauge-fiche.jsp#L26>), [jauge/jauge-saisie.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/jauge/jauge-saisie.jsp#L25>).

<a id="joursemaine"></a>

## JOURSEMAINE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `NUMSEMAINE` | `NUMBER(2,0)` | Oui |  |
| `NUMJOUR` | `NUMBER(2,0)` | Oui |  |
| `LIBJOUR` | `VARCHAR2(20 BYTE)` | Oui |  |

Clés : `SYS_C007364` (primaire) : `ID`.

Vues dépendantes directes (3) : [CA_JOUR_DETAILS](vues.md#ca-jour-details), [CA_JOUR_DETAILS_CA](vues.md#ca-jour-details-ca), [CA_JOUR_DETAILS_CA_V2](vues.md#ca-jour-details-ca-v2).

Références dans le code : [vente/stat/CaJourSemaine.java:11](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/stat/CaJourSemaine.java#L11>).

<a id="liaisonbcbl"></a>

## LIAISONBCBL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `ID1` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ID2` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `LIAISONBCBL_PK` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="liaisonbcfc"></a>

## LIAISONBCFC

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `ID1` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ID2` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `LIAISONBCFC_PK` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="liaisoncodeimpot"></a>

## LIAISONCODEIMPOT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `IDCODEIMPOT` | `VARCHAR2(250 BYTE)` | Oui |  |
| `IDCOMPTE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `FORMULE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `TAXABLE` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SYS_C007367` (primaire) : `ID`.

Vues dépendantes directes (2) : [LIAISONCODELIB](vues.md#liaisoncodelib), [LIAISONCODESAISIE](vues.md#liaisoncodesaisie).

Références dans le code : [declaration/LiaisonCodeImpot.java:60](<../../projet-standard - Copie/arbiochem-ejb/src/java/declaration/LiaisonCodeImpot.java#L60>).

<a id="liaisonfacturefournisseurs"></a>

## LIAISONFACTUREFOURNISSEURS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(500 BYTE)` | Non | PK |
| `ID1` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ID2` | `VARCHAR2(500 BYTE)` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SYS_C007369` (primaire) : `ID`.

Vues dépendantes directes (3) : [FACTUREFOURNISSEURCPL_FD](vues.md#facturefournisseurcpl-fd), [FACTUREFOURNISSEURCPL_LIER](vues.md#facturefournisseurcpl-lier), [PERTE_GRPORIGINE_FACT](vues.md#perte-grporigine-fact).

Références dans le code : [faturefournisseur/LiaisonIntraTable.java:26](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/LiaisonIntraTable.java#L26>), [choix/facture/facturefournisseur-choix.jsp:20](<../../projet-standard - Copie/arbiochem-war/web/pages/choix/facture/facturefournisseur-choix.jsp#L20>), [choix/facture/facturefournisseurPrincipale-choix.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/choix/facture/facturefournisseurPrincipale-choix.jsp#L21>).

<a id="liaisonpaiement"></a>

## LIAISONPAIEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `ID1` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ID2` | `VARCHAR2(100 BYTE)` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SYS_C007371` (primaire) : `ID`.

Vues dépendantes directes (12) : [LIAISONPAIEMENTMVTCAISSEGRP](vues.md#liaisonpaiementmvtcaissegrp), [LIAISONPAIEMENTMVTCAISSEGRP2](vues.md#liaisonpaiementmvtcaissegrp2), [LIAISONPAIEMENTTOTAL](vues.md#liaisonpaiementtotal), [MOUVEMENTCAISSECPL_V_DISPATCH](vues.md#mouvementcaissecpl-v-dispatch), [MOUVEMENTCAISSECPL_V_D_AVOIR](vues.md#mouvementcaissecpl-v-d-avoir), [MOUVEMENTCAISSEGRPAVOIR_LP](vues.md#mouvementcaissegrpavoir-lp), [MVTCAISSECPLORIGINE](vues.md#mvtcaissecplorigine), [MVTCAISSEGROUPEFACTURE_PDF](vues.md#mvtcaissegroupefacture-pdf), [TRAITEMTTFC](vues.md#traitemttfc), [TRAITE_FC](vues.md#traite-fc), [V_LIAISONPAIEMENT_FACTUREFOURN](vues.md#v-liaisonpaiement-facturefourn), [V_LIAISONPAIEMENT_VENTE](vues.md#v-liaisonpaiement-vente).

Références dans le code : [paiement/LiaisonPaiement.java:59](<../../projet-standard - Copie/arbiochem-ejb/src/java/paiement/LiaisonPaiement.java#L59>), [vente/inc/paiementFacture-details.jsp:17](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/inc/paiementFacture-details.jsp#L17>).

<a id="lieu-accident-travail"></a>

## LIEU_ACCIDENT_TRAVAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `SYS_C007373` (primaire) : `ID`.

Tables qui la référencent :

- [ACCIDENT](tables.md#accident).`ID_LIEU` → [LIEU_ACCIDENT_TRAVAIL](tables.md#lieu-accident-travail).`ID`.

Vues dépendantes directes (2) : [V_ACCIDENT_LIB](vues.md#v-accident-lib), [V_ACCIDENT_PDF](vues.md#v-accident-pdf).

Références dans le code : [paie/sanction/configuration/LieuAccident.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/sanction/configuration/LieuAccident.java#L9>), [paie/accident/accident-saisie.jsp:62](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/accident/accident-saisie.jsp#L62>).

<a id="ligne"></a>

## LIGNE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `LIGNE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [COMPTEURELECTRICITE](tables.md#compteurelectricite).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID`.
- [COMPTEURMAINTENANCE](tables.md#compteurmaintenance).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID`.
- [MACHINE](tables.md#machine).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID`.
- [MAGASIN2](tables.md#magasin2).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID`.
- [PLANNING](tables.md#planning).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID`.
- [TYPE_PRODUIT](tables.md#type-produit).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID`.

Vues dépendantes directes (16) : [AS_INGREDIENT_MAINTENANCE_LIB](vues.md#as-ingredient-maintenance-lib), [COMPTEURCPL](vues.md#compteurcpl), [COMPTEURELECTRICITECPL](vues.md#compteurelectricitecpl), [COMPTEURELECTRICITELIB](vues.md#compteurelectricitelib), [COMPTEURELECTRICITEMERELIB](vues.md#compteurelectricitemerelib), [COUTSMAINTENANCE](vues.md#coutsmaintenance), [FABNONRATTACHE](vues.md#fabnonrattache), [FABRICATIONFILLEPETRI](vues.md#fabricationfillepetri), [FACTUREFOURNISSEURAVECMACHINE](vues.md#facturefournisseuravecmachine), [INSPECTIONFILLECPL](vues.md#inspectionfillecpl), [INSPECTIONFILLELIB](vues.md#inspectionfillelib), [MAGASINLIB](vues.md#magasinlib), [OFNONRATTACHE](vues.md#ofnonrattache), [OFNONRATTACHEREEL](vues.md#ofnonrattachereel), [PLANNING_CPL](vues.md#planning-cpl), [TAUXDISPONIBILITEMACHINE](vues.md#tauxdisponibilitemachine).

Références dans le code : [machine/Ligne.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/machine/Ligne.java#L10>), [compteur/compteur-recent-liste.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/compteur/compteur-recent-liste.jsp#L22>), [compteur/initialisation-releve-electricite.jsp:30](<../../projet-standard - Copie/arbiochem-war/web/pages/compteur/initialisation-releve-electricite.jsp#L30>), [compteur/releve-electricite-liste.jsp:42](<../../projet-standard - Copie/arbiochem-war/web/pages/compteur/releve-electricite-liste.jsp#L42>), [compteur/releve-electricite-multiple-liste.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/compteur/releve-electricite-multiple-liste.jsp#L25>) ; 11 autres fichiers dans `usages-code.json`.

<a id="livraison"></a>

## LIVRAISON

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDVENTE` | `VARCHAR2(100 BYTE)` | Oui | FK → VENTE |
| `REMARQUE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |

Clés : `LIVRAISON_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [LIVRAISON](tables.md#livraison).`IDVENTE` → [VENTE](tables.md#vente).`ID` (`LIVRAISON_VENTE_FK`, ENABLED).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="livraisonfictif"></a>

## LIVRAISONFICTIF

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007377` (primaire) : `ID`.

Références dans le code : [vente/LivraisonFictif.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/LivraisonFictif.java#L10>), [vente/vente-arbiochem-liste.jsp:67](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/vente-arbiochem-liste.jsp#L67>), [vente/vente-liste.jsp:67](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/vente-liste.jsp#L67>), [vente/ventelistenonlivrer.jsp:51](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/ventelistenonlivrer.jsp#L51>).

<a id="livraisoninterne"></a>

## LIVRAISONINTERNE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → FOURNISSEUR |
| `DATY` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `LIVRAISONINTERNE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [LIVRAISONINTERNE](tables.md#livraisoninterne).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` (`LIVINTERNE_FRNS_FK`, ENABLED).

Tables qui la référencent :

- [LIVRAISONINTERNEFILLE](tables.md#livraisoninternefille).`IDMERE` → [LIVRAISONINTERNE](tables.md#livraisoninterne).`ID`.

Références dans le code : [stock/LivraisonInterne.java:20](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/LivraisonInterne.java#L20>).

<a id="livraisoninternefille"></a>

## LIVRAISONINTERNEFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → LIVRAISONINTERNE |
| `IDINGREDIENT` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `QTE` | `NUMBER(*,0)` | Oui |  |

Clés : `LIVRAISONINTERNEFILLE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [LIVRAISONINTERNEFILLE](tables.md#livraisoninternefille).`IDMERE` → [LIVRAISONINTERNE](tables.md#livraisoninterne).`ID` (`LIVINTERNE_MEREFILLE_FK`, ENABLED).
- [LIVRAISONINTERNEFILLE](tables.md#livraisoninternefille).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`LIVINTERNFILLE_ING_FK`, ENABLED).

Références dans le code : [stock/LivraisonInterneFille.java:13](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/LivraisonInterneFille.java#L13>).

<a id="log-departement"></a>

## LOG_DEPARTEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007381` (primaire) : `ID`.

Vues dépendantes directes (1) : [AS_INGREDIENT_MAINTENANCE_LIB](vues.md#as-ingredient-maintenance-lib).

Références dans le code : [maintenance/ressources/machine/machine-liste.jsp:50](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/machine/machine-liste.jsp#L50>), [maintenance/ressources/machine/machine-saisie.jsp:35](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/machine/machine-saisie.jsp#L35>).

<a id="log-direction"></a>

## LOG_DIRECTION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007383` (primaire) : `ID`.

Tables qui la référencent :

- [CHECKLIST_FILLE](tables.md#checklist-fille).`IDRESPONSABLE` → [LOG_DIRECTION](tables.md#log-direction).`ID`.

Vues dépendantes directes (29) : [CHECKLIST_MERE_LIB](vues.md#checklist-mere-lib), [DEMANDE_LIBCOMPLET](vues.md#demande-libcomplet), [DEMANDE_LIBCOMPLET2](vues.md#demande-libcomplet2), [DEMANDE_LIBCOMPLET3](vues.md#demande-libcomplet3), [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [EMPLOYE_COMPLET_PDF](vues.md#employe-complet-pdf), [ENTRETIENRH_LIB](vues.md#entretienrh-lib), [LOG_PERSONNEL_AVECCONGE](vues.md#log-personnel-avecconge), [LOG_PERSONNEL_FIN](vues.md#log-personnel-fin), [LOG_PERSONNEL_FIN_CONGE](vues.md#log-personnel-fin-conge), [LOG_PERSONNEL_GRAPHE](vues.md#log-personnel-graphe), [LOG_SERVICE_LIB](vues.md#log-service-lib), [PAIE_AVANCEMENT_LIBELLE2](vues.md#paie-avancement-libelle2), [PAIE_AVANCEMENT_LIBELLE4](vues.md#paie-avancement-libelle4), [PAIE_EDITIONMOISANNEE_LIB](vues.md#paie-editionmoisannee-lib), [PAIE_EDITIONMOISANNEE_LIB_2](vues.md#paie-editionmoisannee-lib-2), [PAIE_EDITIONMOISANNEE_LIB_3](vues.md#paie-editionmoisannee-lib-3), [POINTAGEVISEE_VISA_MULTIPLE](vues.md#pointagevisee-visa-multiple), [POINTAGE_LIB](vues.md#pointage-lib), [RETRAIT_FRAIS_MEDICAUX_ANALYSE](vues.md#retrait-frais-medicaux-analyse), [SITUATION_SALAIRE_EDITION_DIST](vues.md#situation-salaire-edition-dist), [TEST_SITUATION_SALAIRE_EDITION](vues.md#test-situation-salaire-edition), [UTILISATEURROLE](vues.md#utilisateurrole), [V1_OSTIE_AFFICHE_T1](vues.md#v1-ostie-affiche-t1), [V1_OSTIE_AFFICHE_T2](vues.md#v1-ostie-affiche-t2), [V1_OSTIE_AFFICHE_T3](vues.md#v1-ostie-affiche-t3), [V1_OSTIE_AFFICHE_T4](vues.md#v1-ostie-affiche-t4), [VUE_ID_MATRICULE](vues.md#vue-id-matricule).

Références dans le code : [paie/DeroulanteEmbaucheData.java:46](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/DeroulanteEmbaucheData.java#L46>), [paie/configuration/LogDirection.java:14](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/configuration/LogDirection.java#L14>), [paie/employe/EmployeComplet.java:664](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/EmployeComplet.java#L664>), [paie/employe/EmployeService.java:61](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/EmployeService.java#L61>), [user/UserEJBBean.java:1429](<../../projet-standard - Copie/arbiochem-ejb/src/java/user/UserEJBBean.java#L1429>) ; 20 autres fichiers dans `usages-code.json`.

<a id="log-personnel"></a>

## LOG_PERSONNEL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `PERMIS_CONDUIRE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CHEMIN_PERMIS` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ID_PERS` | `VARCHAR2(50 BYTE)` | Oui |  |
| `NOM` | `VARCHAR2(100 BYTE)` | Oui |  |
| `PRENOM` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATE_NAISSANCE` | `DATE` | Oui |  |
| `SEXE` | `CHAR(1 BYTE)` | Oui |  |
| `NUMERO_CIN` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATE_CIN` | `DATE` | Oui |  |
| `DATE_DUPL_CIN` | `DATE` | Oui |  |
| `NATIONALITE` | `VARCHAR2(50 BYTE)` | Non |  |
| `ADRESSE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `FOKOTANY` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ACTE_NAISSANCE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DIRECTION` | `VARCHAR2(50 BYTE)` | Non |  |
| `SERVICE` | `VARCHAR2(50 BYTE)` | Non |  |
| `REFUSER` | `NUMBER(*,0)` | Oui | FK → UTILISATEUR |
| `IDSUP` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDHIERARCHIE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `CHEMINIMAGE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDCIVILITE` | `VARCHAR2(255 BYTE)` | Oui | FK → CIVILITE |
| `MERE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PERE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TELEPHONE` | `NUMBER(10,0)` | Oui |  |

Clés : `SYS_C007388` (primaire) : `ID`.

Clés étrangères sortantes :

- [LOG_PERSONNEL](tables.md#log-personnel).`IDCIVILITE` → [CIVILITE](tables.md#civilite).`ID` (`FK_LOG_PERSONNEL_CIVILITE`, ENABLED).
- [LOG_PERSONNEL](tables.md#log-personnel).`REFUSER` → [UTILISATEUR](tables.md#utilisateur).`REFUSER` (`LOGPERS_UTILISATEUR_ID_FK`, ENABLED).

Tables qui la référencent :

- [ACCIDENT](tables.md#accident).`ID_PERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [BATIMENTVIDESANITAIRE](tables.md#batimentvidesanitaire).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [CHECKLIST_MERE](tables.md#checklist-mere).`IDPERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [ENFANTPERSONNEL](tables.md#enfantpersonnel).`IDPERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [FUMIGATION](tables.md#fumigation).`IDOPERATEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [MISEENINCUBATEUR](tables.md#miseenincubateur).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [PESEEPOUSSIN](tables.md#peseepoussin).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [PROGRAMME_INTEGRATION](tables.md#programme-integration).`IDPERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [PROGRAMME_INTEGRATION_DETAIL](tables.md#programme-integration-detail).`IDINTERVENANT` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [RECEPTIONOAC](tables.md#receptionoac).`IDCHAUFFEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [RECEPTIONOAC](tables.md#receptionoac).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [SUIVICHAMBREFROIDEDETAIL](tables.md#suivichambrefroidedetail).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDCHAUFFEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDCONTROLEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [TRIAGEOEUF](tables.md#triageoeuf).`IDOPERATEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.
- [UTILISATEUR_PERSONNEL](tables.md#utilisateur-personnel).`IDPERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID`.

Vues dépendantes directes (80) : [AVANCE_LIB](vues.md#avance-lib), [AVANCE_LIB2](vues.md#avance-lib2), [BATIMENTVIDESANITAIRE_LIB](vues.md#batimentvidesanitaire-lib), [CHECKLIST_MERE_LIB](vues.md#checklist-mere-lib), [CONGE_DROIT_LIBCOMPLET](vues.md#conge-droit-libcomplet), [DEMANDE_LIBCOMPLET](vues.md#demande-libcomplet), [DEMANDE_LIBCOMPLET2](vues.md#demande-libcomplet2), [DEMANDE_LIBCOMPLET3](vues.md#demande-libcomplet3), [EMPLOYE_COMPLET](vues.md#employe-complet), [EMPLOYE_COMPLET2](vues.md#employe-complet2), [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [EMPLOYE_COMPLET_NOU2](vues.md#employe-complet-nou2), [EMPLOYE_COMPLET_PDF](vues.md#employe-complet-pdf), [ENTRETIENRH_LIB](vues.md#entretienrh-lib), [EVALUATION_A_CHAUD_LIB](vues.md#evaluation-a-chaud-lib), [EVALUATION_FROID_LIB](vues.md#evaluation-froid-lib), [FABRICATIONAUTOCOMPLETE](vues.md#fabricationautocomplete), [FABRICATIONCPL](vues.md#fabricationcpl), [FRAIS_MEDICAUX_ALL](vues.md#frais-medicaux-all), [FUMIGATION_LIB](vues.md#fumigation-lib), [HEURESUPFABRICATION_CPL](vues.md#heuresupfabrication-cpl), [HS_FABBRICATION_SEMAINECPL](vues.md#hs-fabbrication-semainecpl), [IMPORTOAC_LIB](vues.md#importoac-lib), [IMPORTRECEPTIONOAC](vues.md#importreceptionoac), [LOG_PERSONNEL_AVECCONGE](vues.md#log-personnel-avecconge), [LOG_PERSONNEL_FIN](vues.md#log-personnel-fin), [LOG_PERSONNEL_FIN_CONGE](vues.md#log-personnel-fin-conge), [LOG_PERSONNEL_GRAPHE](vues.md#log-personnel-graphe), [LOG_PERSONNEL_INFOCOMPLET](vues.md#log-personnel-infocomplet), [LOG_PERSONNEL_INFOCOMPLET3](vues.md#log-personnel-infocomplet3), [LOG_PERSONNEL_INFOPOINTAGE](vues.md#log-personnel-infopointage), [LOG_PERS_NON_VALIDE_LIB](vues.md#log-pers-non-valide-lib), [LOG_PERS_NON_VALIDE_LIB_3](vues.md#log-pers-non-valide-lib-3), [LOG_PERS_NON_VALIDE_LIB_4](vues.md#log-pers-non-valide-lib-4), [LOG_PERS_NON_VALIDE_LIB_5](vues.md#log-pers-non-valide-lib-5), [LOG_PERS_NON_VALIDE_LIB_5_TEST](vues.md#log-pers-non-valide-lib-5-test), [LOG_PERS_STC](vues.md#log-pers-stc), [MISEENINCUBATEUR_LIB](vues.md#miseenincubateur-lib), [OBJECTIF_ANNUEL_LIB](vues.md#objectif-annuel-lib), [PAIEPERS_ELP_CPL](vues.md#paiepers-elp-cpl), [PAIE_AVANCEMENT_LIBELLE2](vues.md#paie-avancement-libelle2), [PAIE_AVANCEMENT_LIBELLE4](vues.md#paie-avancement-libelle4), [PAIE_EDITIONMOISANNEE_LIB](vues.md#paie-editionmoisannee-lib), [PAIE_EDITIONMOISANNEE_LIB_2](vues.md#paie-editionmoisannee-lib-2), [PAIE_EDITIONMOISANNEE_LIB_3](vues.md#paie-editionmoisannee-lib-3), [PAIE_INFO_EMBAUCHE](vues.md#paie-info-embauche), [PAIE_INFO_PERSONNELDIRECT](vues.md#paie-info-personneldirect), [PAIE_INFO_PERSONNEL_ENFANT](vues.md#paie-info-personnel-enfant), [PAIE_INFO_PERSONNEL_LIBCOMPLET](vues.md#paie-info-personnel-libcomplet), [PAIE_PERSONNEL_ELEMENTPAIE_LIB](vues.md#paie-personnel-elementpaie-lib), [PAIE_PERS_ELTPAIE_LIB2](vues.md#paie-pers-eltpaie-lib2), [PERSONNELDEMAINTENANCE](vues.md#personneldemaintenance), [PESEEPOUSSIN_LIB](vues.md#peseepoussin-lib), [POINTAGECANTINE_CPL](vues.md#pointagecantine-cpl), [POINTAGEVISEE_VISA_MULTIPLE](vues.md#pointagevisee-visa-multiple), [POINTAGEVISEE_VISA_MULTIPLE_1](vues.md#pointagevisee-visa-multiple-1), [RECEPTIONOAC_LIB](vues.md#receptionoac-lib), [REMBOURSEMENTLIB](vues.md#remboursementlib), [SITUATION_SALAIRE_EDITION](vues.md#situation-salaire-edition), [SITUATION_SALAIRE_EDITION_DIST](vues.md#situation-salaire-edition-dist), [SOLDECONGE_PERS](vues.md#soldeconge-pers), [SOLDECONGE_PERS_CPL](vues.md#soldeconge-pers-cpl), [SUIVICHAMBREFROIDEDETAIL_LIB](vues.md#suivichambrefroidedetail-lib), [SUIVI_PRESENCE_FILLE_LIB](vues.md#suivi-presence-fille-lib), [TEST_SITUATION_SALAIRE_EDITION](vues.md#test-situation-salaire-edition), [TRANSFERTPOULETDETAIL_LIB](vues.md#transfertpouletdetail-lib), [TRIAGEOEUF_LIB](vues.md#triageoeuf-lib), [UTILISATEURCPL](vues.md#utilisateurcpl), [UTILISATEURROLE](vues.md#utilisateurrole), [V1_OSTIE_AFFICHE_T1](vues.md#v1-ostie-affiche-t1), [V1_OSTIE_AFFICHE_T2](vues.md#v1-ostie-affiche-t2), [V1_OSTIE_AFFICHE_T3](vues.md#v1-ostie-affiche-t3), [V1_OSTIE_AFFICHE_T4](vues.md#v1-ostie-affiche-t4), [VUE_ID_MATRICULE](vues.md#vue-id-matricule), [V_ACCIDENT_LIB](vues.md#v-accident-lib), [V_ACCIDENT_PDF](vues.md#v-accident-pdf), [V_PAIE_RECAP](vues.md#v-paie-recap), [V_PROGRAMME_INTEGRATION_LIB](vues.md#v-programme-integration-lib), [V_PROG_INTEGRATION_DETAIL_LIB](vues.md#v-prog-integration-detail-lib).

Références dans le code : [paie/log/LogPersonnel.java:73](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/log/LogPersonnel.java#L73>), [paie/conge/Conge.java:166](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/conge/Conge.java#L166>), [fabrication/ordre-fabrication-saisie.jsp:37](<../../projet-standard - Copie/arbiochem-war/web/pages/fabrication/ordre-fabrication-saisie.jsp#L37>), [ferme/batiment/batimentvidesanitaire-saisie.jsp:34](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/batiment/batimentvidesanitaire-saisie.jsp#L34>), [ferme/couvoir/miseneincubateur-saisie.jsp:43](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/miseneincubateur-saisie.jsp#L43>) ; 13 autres fichiers dans `usages-code.json`.

<a id="log-personnel-non-valide"></a>

## LOG_PERSONNEL_NON_VALIDE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDLOGPERS` | `VARCHAR2(100 BYTE)` | Non |  |
| `DATEAPPLICATION` | `DATE` | Non |  |
| `IDTYPEDEBAUCHE` | `VARCHAR2(100 BYTE)` | Non |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDUSER` | `VARCHAR2(100 BYTE)` | Oui |  |
| `MOTIF` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATE_REINTEGRATION` | `DATE` | Oui |  |
| `DATE_DECISION` | `DATE` | Oui |  |
| `REFDECISION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDAVANCEMENT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATEFIN` | `DATE` | Oui |  |
| `IDPASSATION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DUREEPREAVIS` | `NUMBER(30,2)` | Oui |  |
| `STC` | `NUMBER` | Oui |  |

Clés : `LOG_EMPLOYE_VALIDE_PK` (primaire) : `ID`.

Vues dépendantes directes (12) : [DERNIER_DEBAUCHE_BY_EMPLOYE](vues.md#dernier-debauche-by-employe), [DERNIER_DEBAUCHE_LPNV](vues.md#dernier-debauche-lpnv), [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [LOG_PERSONNEL_INFOCOMPLET3](vues.md#log-personnel-infocomplet3), [LOG_PERSONNEL_V](vues.md#log-personnel-v), [LOG_PERS_NON_VALIDE_LIB](vues.md#log-pers-non-valide-lib), [LOG_PERS_NON_VALIDE_LIB_3](vues.md#log-pers-non-valide-lib-3), [LOG_PERS_NON_VALIDE_LIB_4](vues.md#log-pers-non-valide-lib-4), [LOG_PERS_NON_VALIDE_LIB_5](vues.md#log-pers-non-valide-lib-5), [LOG_PERS_NON_VALIDE_LIB_5_TEST](vues.md#log-pers-non-valide-lib-5-test), [LOG_PERS_STC](vues.md#log-pers-stc).

Références dans le code : [paie/log/LogPersonnelNonValide.java:49](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/log/LogPersonnelNonValide.java#L49>), [paie/employe/AdminPaieInfoPers.java:63](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/AdminPaieInfoPers.java#L63>).

<a id="log-service"></a>

## LOG_SERVICE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CODE_DR` | `VARCHAR2(50 BYTE)` | Non |  |
| `DR_RATTACHE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CODE_SERVICE` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SYS_C007396` (primaire) : `ID`.

Vues dépendantes directes (24) : [CHECKLIST_MERE_LIB](vues.md#checklist-mere-lib), [EMPLOYE_COMPLET](vues.md#employe-complet), [EMPLOYE_COMPLET2](vues.md#employe-complet2), [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [EMPLOYE_COMPLET_NOU2](vues.md#employe-complet-nou2), [EMPLOYE_COMPLET_PDF](vues.md#employe-complet-pdf), [LOG_PERSONNEL_AVECCONGE](vues.md#log-personnel-avecconge), [LOG_PERSONNEL_FIN](vues.md#log-personnel-fin), [LOG_PERSONNEL_FIN_CONGE](vues.md#log-personnel-fin-conge), [LOG_PERSONNEL_GRAPHE](vues.md#log-personnel-graphe), [LOG_PERSONNEL_INFOPOINTAGE](vues.md#log-personnel-infopointage), [LOG_SERVICE_CRT](vues.md#log-service-crt), [LOG_SERVICE_LIB](vues.md#log-service-lib), [LOG_SERVICE_LIBELLE](vues.md#log-service-libelle), [PAIE_AVANCEMENT_LIBELLE2](vues.md#paie-avancement-libelle2), [PAIE_AVANCEMENT_LIBELLE4](vues.md#paie-avancement-libelle4), [PERSONNELDEMAINTENANCE](vues.md#personneldemaintenance), [SERVICEMAINTENANCE](vues.md#servicemaintenance), [SITUATION_SALAIRE_EDITION_DIST](vues.md#situation-salaire-edition-dist), [TEST_SITUATION_SALAIRE_EDITION](vues.md#test-situation-salaire-edition), [UTILISATEURROLE](vues.md#utilisateurrole), [V_PROGRAMME_INTEGRATION_LIB](vues.md#v-programme-integration-lib), [V_PROG_INTEGRATION_DETAIL_LIB](vues.md#v-prog-integration-detail-lib).

Références dans le code : [paie/log/LogService.java:58](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/log/LogService.java#L58>), [paie/editionmoisannee/salaire-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/editionmoisannee/salaire-saisie.jsp#L33>), [paie/avancement/avancement-categorie.jsp:44](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-categorie.jsp#L44>), [paie/avancement/avancement-contrat.jsp:60](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-contrat.jsp#L60>), [paie/avancement/avancement-direction.jsp:44](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-direction.jsp#L44>) ; 2 autres fichiers dans `usages-code.json`.

<a id="log-unite"></a>

## LOG_UNITE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `PK_LOG_UNITE` (primaire) : `ID`.

Vues dépendantes directes (1) : [PAIE_AVANCEMENT_LIBELLE4](vues.md#paie-avancement-libelle4).

Références dans le code : [paie/avancement/avancement-saisie.jsp:63](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-saisie.jsp#L63>).

<a id="lot"></a>

## LOT

Lot d’élevage : référence, dates, ferme, article, origine, souche, catégorie, programme et état.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `NOMLOT` | `VARCHAR2(200 BYTE)` | Oui |  |
| `REFERENCE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DATEECLOSION` | `DATE` | Oui |  |
| `DATEARRIVEE` | `DATE` | Oui |  |
| `SOURCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDFERME` | `VARCHAR2(100 BYTE)` | Oui | FK → MAGASIN2 |
| `IDARTICLE` | `VARCHAR2(100 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `IDORIGINE` | `VARCHAR2(100 BYTE)` | Oui | FK → ORIGINELOT |
| `IDPROGRAMME` | `VARCHAR2(100 BYTE)` | Oui | FK → PROGRAMMEZOOTECHNIQUE |
| `ETAT` | `NUMBER` | Oui |  |
| `IDSOUCHE` | `VARCHAR2(50 BYTE)` | Oui | FK → SOUCHE |
| `IDCATEGORIELOT` | `VARCHAR2(50 BYTE)` | Oui | FK → CATEGORIELOT |
| `DATECLOTURE` | `DATE` | Oui |  |

Clés : `LOT_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [LOT](tables.md#lot).`IDCATEGORIELOT` → [CATEGORIELOT](tables.md#categorielot).`ID` (`FK_LOT_CATEGORIELOT`, ENABLED).
- [LOT](tables.md#lot).`IDARTICLE` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`LOT_ARTICLE_FK`, ENABLED).
- [LOT](tables.md#lot).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID` (`LOT_FERME_FK`, ENABLED).
- [LOT](tables.md#lot).`IDORIGINE` → [ORIGINELOT](tables.md#originelot).`ID` (`LOT_ORIGINE_FK`, ENABLED).
- [LOT](tables.md#lot).`IDPROGRAMME` → [PROGRAMMEZOOTECHNIQUE](tables.md#programmezootechnique).`ID` (`LOT_PROGRAMME_FK`, ENABLED).
- [LOT](tables.md#lot).`IDSOUCHE` → [SOUCHE](tables.md#souche).`ID` (`SYS_C007905`, ENABLED).

Tables qui la référencent :

- [BATIMENTDETAIL](tables.md#batimentdetail).`IDLOT` → [LOT](tables.md#lot).`ID`.
- [DISTRIBUTIONALIMENT](tables.md#distributionaliment).`IDLOT` → [LOT](tables.md#lot).`ID`.
- [ECLOSION](tables.md#eclosion).`IDLOT` → [LOT](tables.md#lot).`ID`.
- [FUMIGATION](tables.md#fumigation).`IDLOT` → [LOT](tables.md#lot).`ID`.
- [MISEENINCUBATEURDETAIL](tables.md#miseenincubateurdetail).`IDLOT` → [LOT](tables.md#lot).`ID`.
- [PESEEPOUSSIN](tables.md#peseepoussin).`IDLOT` → [LOT](tables.md#lot).`ID`.
- [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDLOT` → [LOT](tables.md#lot).`ID`.
- [RECEPTIONPOUSSINAEROPORT](tables.md#receptionpoussinaeroport).`IDLOT` → [LOT](tables.md#lot).`ID`.
- [SUIVIJOURNALIER](tables.md#suivijournalier).`IDLOT` → [LOT](tables.md#lot).`ID`.
- [TRANSFERTPOULET](tables.md#transfertpoulet).`IDLOT` → [LOT](tables.md#lot).`ID`.
- [TRIAGEBATIMENTPARQUET](tables.md#triagebatimentparquet).`IDLOT` → [LOT](tables.md#lot).`ID`.
- [TRIAGEQUALITEPOUSSIN](tables.md#triagequalitepoussin).`IDLOT` → [LOT](tables.md#lot).`ID`.
- [VACCINATIONPOUSSIN](tables.md#vaccinationpoussin).`IDLOT` → [LOT](tables.md#lot).`ID`.

Vues dépendantes directes (13) : [BATIMENTDETAIL_LIB](vues.md#batimentdetail-lib), [DISTRIBUTIONALIMENT_LIB](vues.md#distributionaliment-lib), [FUMIGATION_LIB](vues.md#fumigation-lib), [LOT_LIB](vues.md#lot-lib), [MISEENINCUBATEURDETAIL_LIB](vues.md#miseenincubateurdetail-lib), [PESEEPOUSSIN_LIB](vues.md#peseepoussin-lib), [RECEPTIONOACDETAIL_LIB](vues.md#receptionoacdetail-lib), [RECEPTIONPOUSSINAEROPORT_LIB](vues.md#receptionpoussinaeroport-lib), [SUIVIJOURNALIER_LIB](vues.md#suivijournalier-lib), [TRANSFERTPOULET_LIB](vues.md#transfertpoulet-lib), [TRIAGEBATIMENTPARQUET_LIB](vues.md#triagebatimentparquet-lib), [TRIAGEQUALITEPOUSSIN_LIB](vues.md#triagequalitepoussin-lib), [VACCINATIONPOUSSIN_LIB](vues.md#vaccinationpoussin-lib).

Références dans le code : [ferme/lot/Lot.java:125](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/lot/Lot.java#L125>), [ferme/lot/lot-saisie.jsp:15](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/lot/lot-saisie.jsp#L15>), [ferme/aliment/distributionaliment-saisie.jsp:31](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/aliment/distributionaliment-saisie.jsp#L31>), [ferme/configuration/batiment-saisie.jsp:45](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/batiment-saisie.jsp#L45>), [ferme/couvoir/eclosion-saisie.jsp:52](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/eclosion-saisie.jsp#L52>) ; 12 autres fichiers dans `usages-code.json`.

<a id="machine"></a>

## MACHINE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDLIGNE` | `VARCHAR2(255 BYTE)` | Oui | FK → LIGNE |

Clés : `MACHINE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [MACHINE](tables.md#machine).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID` (`MACHINE_LIGNE_FK`, ENABLED).

Tables qui la référencent :

- [ACCIDENT](tables.md#accident).`ID_MACHINE` → [MACHINE](tables.md#machine).`ID`.
- [MIRAGE](tables.md#mirage).`IDMACHINE` → [MACHINE](tables.md#machine).`ID`.
- [TRAVAUXFILLE](tables.md#travauxfille).`IDMACHINE` → [MACHINE](tables.md#machine).`ID`.

Vues dépendantes directes (5) : [MIRAGE_LIB](vues.md#mirage-lib), [RESULTATFABRICATION](vues.md#resultatfabrication), [TRAVAUXFILLECPL](vues.md#travauxfillecpl), [V_ACCIDENT_LIB](vues.md#v-accident-lib), [V_ACCIDENT_PDF](vues.md#v-accident-pdf).

Références dans le code : [machine/Machine.java:21](<../../projet-standard - Copie/arbiochem-ejb/src/java/machine/Machine.java#L21>), [maintenance/ressources/Machine.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/ressources/Machine.java#L10>), [ferme/production/mirage-saisie.jsp:32](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/mirage-saisie.jsp#L32>), [ligne/inc/machine-details.jsp:15](<../../projet-standard - Copie/arbiochem-war/web/pages/ligne/inc/machine-details.jsp#L15>), [paie/accident/accident-saisie.jsp:63](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/accident/accident-saisie.jsp#L63>).

<a id="magasin2"></a>

## MAGASIN2

Référentiel auquel renvoient notamment les IDFERME des lots et bâtiments.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDPOINT` | `VARCHAR2(255 BYTE)` | Oui | FK → POINT |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPEMAGASIN` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPEMAGASIN |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `CAPACITE` | `NUMBER(30,2)` | Oui |  |
| `COMPTEUR` | `NUMBER(30,2)` | Oui |  |
| `IDMAGASINMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → MAGASIN2 |
| `IDLIGNE` | `VARCHAR2(255 BYTE)` | Oui | FK → LIGNE |
| `ACTIF` | `NUMBER` | Oui |  |

Clés : `MAGASIN_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [MAGASIN2](tables.md#magasin2).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID` (`FK_MAGASIN2_LIGNE`, ENABLED).
- [MAGASIN2](tables.md#magasin2).`IDMAGASINMERE` → [MAGASIN2](tables.md#magasin2).`ID` (`MAGASIN2_MERE_FK`, ENABLED).
- [MAGASIN2](tables.md#magasin2).`IDPOINT` → [POINT](tables.md#point).`ID` (`MAGASIN_POINT_FK`, ENABLED).
- [MAGASIN2](tables.md#magasin2).`IDTYPEMAGASIN` → [TYPEMAGASIN](tables.md#typemagasin).`ID` (`MAGASIN_TYPE_FK`, ENABLED).

Tables qui la référencent :

- [AVOIRACHAT](tables.md#avoirachat).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID`.
- [AVOIRFC](tables.md#avoirfc).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID`.
- [BATIMENT](tables.md#batiment).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID`.
- [CAISSE](tables.md#caisse).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID`.
- [COMPTEUR](tables.md#compteur).`IDORIGINE` → [MAGASIN2](tables.md#magasin2).`ID`.
- [COMPTEURELECTRICITE](tables.md#compteurelectricite).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID`.
- [COMPTEURMAINTENANCE](tables.md#compteurmaintenance).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID`.
- [DISTRIBUTIONALIMENT](tables.md#distributionaliment).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID`.
- [ETATSTOCK](tables.md#etatstock).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID`.
- [JAUGE](tables.md#jauge).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID`.
- [LOT](tables.md#lot).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID`.
- [MAGASIN2](tables.md#magasin2).`IDMAGASINMERE` → [MAGASIN2](tables.md#magasin2).`ID`.
- [PESEEPOUSSIN](tables.md#peseepoussin).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID`.
- [POMPE](tables.md#pompe).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID`.
- [PREVISIONFERME](tables.md#previsionferme).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID`.
- [RECEPTIONOAC](tables.md#receptionoac).`IDCHAMBREFROIDE` → [MAGASIN2](tables.md#magasin2).`ID`.
- [SUIVICHAMBREFROIDE](tables.md#suivichambrefroide).`IDSALLESTOCKAGEOEUF` → [MAGASIN2](tables.md#magasin2).`ID`.
- [SUIVIJOURNALIER](tables.md#suivijournalier).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID`.
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDFERMEARRIVE` → [MAGASIN2](tables.md#magasin2).`ID`.
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDFERMEDEPART` → [MAGASIN2](tables.md#magasin2).`ID`.
- [TRIAGEOEUFDETAIL](tables.md#triageoeufdetail).`IDDESTINATION` → [MAGASIN2](tables.md#magasin2).`ID`.
- [VENTELUBRIFIANT](tables.md#ventelubrifiant).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID`.

Vues dépendantes directes (43) : [AS_BONDELIVRAISONCLIENT_LIBCPL](vues.md#as-bondelivraisonclient-libcpl), [AS_BONDELIVRAISON_LIB](vues.md#as-bondelivraison-lib), [AS_INGREDIENTXMAGASIN2](vues.md#as-ingredientxmagasin2), [AVOIRACHATCALC_AVEC_LIB](vues.md#avoirachatcalc-avec-lib), [AVOIRACHATLIB](vues.md#avoirachatlib), [AVOIRFCLIB](vues.md#avoirfclib), [AVOIRFCLIB_PDF](vues.md#avoirfclib-pdf), [BATIMENTVIDESANITAIRE_LIB](vues.md#batimentvidesanitaire-lib), [BATIMENT_LIB](vues.md#batiment-lib), [BONDECOMMANDE_CLIENT_CPL](vues.md#bondecommande-client-cpl), [BONDECOMMANDE_CLIENT_CPL_M](vues.md#bondecommande-client-cpl-m), [CAISSECPL](vues.md#caissecpl), [COMMANDECPL](vues.md#commandecpl), [COMPTEURCPL](vues.md#compteurcpl), [COMPTEURELECTRICITECPL](vues.md#compteurelectricitecpl), [DEPENSEBONDELIVRAISON](vues.md#depensebondelivraison), [DEPENSEDIVERSLIB](vues.md#depensediverslib), [DISTRIBUTIONALIMENT_LIB](vues.md#distributionaliment-lib), [DMDACHATLIB](vues.md#dmdachatlib), [ETAT_VENTE_DETAILS_POIDS](vues.md#etat-vente-details-poids), [IMPORTOAC_LIB](vues.md#importoac-lib), [IMPORTRECEPTIONOAC](vues.md#importreceptionoac), [INVENTAIREMEREVIDEMAGASIN](vues.md#inventairemerevidemagasin), [LOT_LIB](vues.md#lot-lib), [MAGASIN2_ACTIF](vues.md#magasin2-actif), [MAGASINLIB](vues.md#magasinlib), [MAGASINLIBCOMPTA](vues.md#magasinlibcompta), [MAGASINPOINT](vues.md#magasinpoint), [MAGASINVENTE](vues.md#magasinvente), [MVTSTOCKFILLELIB](vues.md#mvtstockfillelib), [MVTSTOCKFILLELIB_ENG](vues.md#mvtstockfillelib-eng), [MVTSTOCKLIB](vues.md#mvtstocklib), [PESEEPOUSSIN_LIB](vues.md#peseepoussin-lib), [PREVISIONFERMELIB](vues.md#previsionfermelib), [PROFORMA_CPL](vues.md#proforma-cpl), [PROFORMA_CPL2](vues.md#proforma-cpl2), [RECEPTIONOAC_LIB](vues.md#receptionoac-lib), [SUIVICHAMBREFROIDE_LIB](vues.md#suivichambrefroide-lib), [SUIVIJOURNALIER_LIB](vues.md#suivijournalier-lib), [TRANSFERTPOULETDETAIL_LIB](vues.md#transfertpouletdetail-lib), [TRIAGEOEUFDETAIL_LIB](vues.md#triageoeufdetail-lib), [VENTEDETCALCREMGLOVISE](vues.md#ventedetcalcremglovise), [VENTE_DETAILS_CPL_2](vues.md#vente-details-cpl-2).

Références dans le code : [magasin/Magasin.java:29](<../../projet-standard - Copie/arbiochem-ejb/src/java/magasin/Magasin.java#L29>), [stock/MvtStock.java:448](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/MvtStock.java#L448>), [bondecommande/bondecommande-arbiochem-saisie.jsp:34](<../../projet-standard - Copie/arbiochem-war/web/pages/bondecommande/bondecommande-arbiochem-saisie.jsp#L34>), [bondecommande/bondecommande-saisie.jsp:34](<../../projet-standard - Copie/arbiochem-war/web/pages/bondecommande/bondecommande-saisie.jsp#L34>), [bondelivraison/bondelivraison-arbiochem-saisie.jsp:69](<../../projet-standard - Copie/arbiochem-war/web/pages/bondelivraison/bondelivraison-arbiochem-saisie.jsp#L69>) ; 42 autres fichiers dans `usages-code.json`.

<a id="magasin-compte"></a>

## MAGASIN_COMPTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SYS_C007402` (primaire) : `ID`.

Vues dépendantes directes (2) : [MAGASINLIBCOMPTA](vues.md#magasinlibcompta), [MAGASIN_COMPTE_CPL](vues.md#magasin-compte-cpl).

Références dans le code : [magasin/MagasinCompte.java:18](<../../projet-standard - Copie/arbiochem-ejb/src/java/magasin/MagasinCompte.java#L18>), [magasin/magasin-compte-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/magasin/magasin-compte-fiche.jsp#L11>), [magasin/magasin-compte-saisie.jsp:16](<../../projet-standard - Copie/arbiochem-war/web/pages/magasin/magasin-compte-saisie.jsp#L16>).

<a id="mailrapport"></a>

## MAILRAPPORT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007404` (primaire) : `ID`.

Références dans le code : [rapport/MailRapport.java:19](<../../projet-standard - Copie/arbiochem-ejb/src/java/rapport/MailRapport.java#L19>).

<a id="maladiepoussin"></a>

## MALADIEPOUSSIN

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(256 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(256 BYTE)` | Oui |  |

Clés : `SYS_C007405` (primaire) : `ID`.

Tables qui la référencent :

- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDMALADIEPOUSSIN` → [MALADIEPOUSSIN](tables.md#maladiepoussin).`ID`.

Vues dépendantes directes (1) : [VACCINATIONPOUSSINDETAIL_LIB](vues.md#vaccinationpoussindetail-lib).

Références dans le code : [ferme/vaccination/vaccinationpoussin-saisie.jsp:48](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/vaccination/vaccinationpoussin-saisie.jsp#L48>).

<a id="masociete"></a>

## MASOCIETE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `IDSPAT` | `VARCHAR2(20 BYTE)` | Non | PK |
| `NOM` | `VARCHAR2(75 BYTE)` | Oui |  |
| `REGIME` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ADRESSE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `TELEPHONE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `FAX` | `VARCHAR2(50 BYTE)` | Oui |  |
| `EMAIL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `GERANT` | `CHAR(50 BYTE)` | Oui |  |
| `NIF` | `VARCHAR2(50 BYTE)` | Oui |  |
| `NUMSTAT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `RC` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CAPITAL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `BANQUE1` | `VARCHAR2(50 BYTE)` | Oui |  |
| `BANQUE2` | `VARCHAR2(50 BYTE)` | Oui |  |
| `LOGO` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TP` | `VARCHAR2(50 BYTE)` | Oui |  |
| `QUITTANCE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ENTITE` | `VARCHAR2(20 BYTE)` | Oui |  |
| `CF` | `VARCHAR2(150 BYTE)` | Oui |  |
| `ADRESSE_CENTRE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CENTRE_FISCAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `LOGOHEADER` | `VARCHAR2(255 BYTE)` | Oui |  |
| `FAVICON` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `MASOCIETE_PK` (primaire) : `IDSPAT`.

Références dans le code : [societe/Societe.java:13](<../../projet-standard - Copie/arbiochem-ejb/src/java/societe/Societe.java#L13>), [societe/societe-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/societe/societe-fiche.jsp#L11>), [societe/societe-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/societe/societe-liste.jsp#L7>), [societe/societe-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/societe/societe-saisie.jsp#L13>).

<a id="menudynamique"></a>

## MENUDYNAMIQUE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `LIBELLE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ICONE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `HREF` | `VARCHAR2(250 BYTE)` | Oui |  |
| `RANG` | `NUMBER` | Oui |  |
| `NIVEAU` | `NUMBER` | Oui |  |
| `ID_PERE` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SYS_C007408` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="menudynamique2"></a>

## MENUDYNAMIQUE2

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ICONE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `HREF` | `VARCHAR2(250 BYTE)` | Oui |  |
| `RANG` | `NUMBER` | Oui |  |
| `NIVEAU` | `NUMBER` | Oui |  |
| `ID_PERE` | `VARCHAR2(50 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="message"></a>

## MESSAGE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDCONVERSATION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `SENDER` | `VARCHAR2(50 BYTE)` | Non |  |
| `RECEIVER` | `VARCHAR2(50 BYTE)` | Non |  |
| `MSG` | `VARCHAR2(1000 BYTE)` | Non |  |
| `DATEHEURE` | `TIMESTAMP(6)` | Oui |  |
| `STATUT` | `VARCHAR2(10 BYTE)` | Oui |  |

Clés : `PK_MESSAGE` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="metier"></a>

## METIER

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDCODEROME` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDFONCTION` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007414` (primaire) : `ID`.

Tables qui la référencent :

- [EMPLOI](tables.md#emploi).`IDMETIER` → [METIER](tables.md#metier).`ID`.

Vues dépendantes directes (3) : [FICHE_POSTE_LIB](vues.md#fiche-poste-lib), [METIERLIB](vues.md#metierlib), [V_HIERARCHIE_PROFESSIONNELLE](vues.md#v-hierarchie-professionnelle).

Références dans le code : [paie/competence/Metier.java:64](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/competence/Metier.java#L64>), [paie/competence/metier-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/competence/metier-saisie.jsp#L13>), [paie/competence/metiercompetence-saisie.jsp:20](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/competence/metiercompetence-saisie.jsp#L20>), [paie/competence/emploi-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/competence/emploi-saisie.jsp#L22>), [poste/ficheposte-saisie.jsp:42](<../../projet-standard - Copie/arbiochem-war/web/pages/poste/ficheposte-saisie.jsp#L42>).

<a id="mirage"></a>

## MIRAGE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `NOMBREOEUFSINITIAL` | `NUMBER(30,2)` | Oui |  |
| `IDMACHINE` | `VARCHAR2(100 BYTE)` | Oui | FK → MACHINE |

Clés : `MIRAGE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [MIRAGE](tables.md#mirage).`IDMACHINE` → [MACHINE](tables.md#machine).`ID` (`MIRAGE_MACHINE_FK`, ENABLED).

Tables qui la référencent :

- [MIRAGEDETAIL](tables.md#miragedetail).`IDMERE` → [MIRAGE](tables.md#mirage).`ID`.

Vues dépendantes directes (1) : [MIRAGE_LIB](vues.md#mirage-lib).

Références dans le code : [ferme/production/Mirage.java:48](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/production/Mirage.java#L48>), [ferme/production/mirage-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/mirage-saisie.jsp#L22>).

<a id="miragedetail"></a>

## MIRAGEDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(100 BYTE)` | Oui | FK → MIRAGE |
| `IDBATIMENT` | `VARCHAR2(100 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUET` | `VARCHAR2(100 BYTE)` | Oui | FK → PARQUET |
| `IDQUALITEMIRAGE` | `VARCHAR2(100 BYTE)` | Oui | FK → QUALITEMIRAGE |
| `QTE` | `NUMBER(30,2)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `MIRAGEDET_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [MIRAGEDETAIL](tables.md#miragedetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` (`MIRAGEDET_BAT_FK`, ENABLED).
- [MIRAGEDETAIL](tables.md#miragedetail).`IDMERE` → [MIRAGE](tables.md#mirage).`ID` (`MIRAGEDET_MERE_FK`, ENABLED).
- [MIRAGEDETAIL](tables.md#miragedetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` (`MIRAGEDET_PARQ_FK`, ENABLED).
- [MIRAGEDETAIL](tables.md#miragedetail).`IDQUALITEMIRAGE` → [QUALITEMIRAGE](tables.md#qualitemirage).`ID` (`MIRAGEDET_QUAL_FK`, ENABLED).

Vues dépendantes directes (1) : [MIRAGEDETAIL_LIB](vues.md#miragedetail-lib).

Références dans le code : [ferme/production/MirageDetail.java:83](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/production/MirageDetail.java#L83>), [ferme/production/mirage-saisie.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/mirage-saisie.jsp#L24>).

<a id="miseenincubateur"></a>

## MISEENINCUBATEUR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DATEMISEENMACHINE` | `DATE` | Oui |  |
| `DATEECLOSIONPREVUE` | `DATE` | Oui |  |
| `IDINCUBATEUR` | `VARCHAR2(100 BYTE)` | Oui | FK → INCUBATEUR |
| `IDRESPONSABLE` | `VARCHAR2(100 BYTE)` | Oui | FK → LOG_PERSONNEL |
| `TEMPERATEURCIBLE` | `NUMBER(30,2)` | Oui |  |
| `HUMIDITECIBLE` | `NUMBER(30,2)` | Oui |  |
| `HEUREPRECHAUFFAGE` | `VARCHAR2(20 BYTE)` | Oui |  |
| `HEUREDEBUTINCUBATION` | `VARCHAR2(20 BYTE)` | Oui |  |

Clés : `MISEENINCUB_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [MISEENINCUBATEUR](tables.md#miseenincubateur).`IDINCUBATEUR` → [INCUBATEUR](tables.md#incubateur).`ID` (`MISEENINCUB_INCUB_FK`, ENABLED).
- [MISEENINCUBATEUR](tables.md#miseenincubateur).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`MISEENINCUB_RESP_FK`, ENABLED).

Tables qui la référencent :

- [MISEENINCUBATEURDETAIL](tables.md#miseenincubateurdetail).`IDMERE` → [MISEENINCUBATEUR](tables.md#miseenincubateur).`ID`.

Vues dépendantes directes (1) : [MISEENINCUBATEUR_LIB](vues.md#miseenincubateur-lib).

Références dans le code : [ferme/couvoir/MiseEnIncubateur.java:93](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/couvoir/MiseEnIncubateur.java#L93>), [ferme/couvoir/miseneincubateur-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/miseneincubateur-saisie.jsp#L21>).

<a id="miseenincubateurdetail"></a>

## MISEENINCUBATEURDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(100 BYTE)` | Oui | FK → MISEENINCUBATEUR |
| `IDLOT` | `VARCHAR2(100 BYTE)` | Oui | FK → LOT |
| `IDBATIMENT` | `VARCHAR2(100 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUET` | `VARCHAR2(100 BYTE)` | Oui | FK → PARQUET |
| `HEUREDEMARRAGE` | `VARCHAR2(20 BYTE)` | Oui |  |
| `HEUREFIN` | `VARCHAR2(20 BYTE)` | Oui |  |
| `DATEPONTE` | `DATE` | Oui |  |
| `QTE` | `NUMBER(30,2)` | Oui |  |
| `POIDSMOYEN` | `NUMBER(30,2)` | Oui |  |

Clés : `MISEENINCUBDET_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [MISEENINCUBATEURDETAIL](tables.md#miseenincubateurdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` (`MISEENINCUBDET_BAT_FK`, ENABLED).
- [MISEENINCUBATEURDETAIL](tables.md#miseenincubateurdetail).`IDLOT` → [LOT](tables.md#lot).`ID` (`MISEENINCUBDET_LOT_FK`, ENABLED).
- [MISEENINCUBATEURDETAIL](tables.md#miseenincubateurdetail).`IDMERE` → [MISEENINCUBATEUR](tables.md#miseenincubateur).`ID` (`MISEENINCUBDET_MERE_FK`, ENABLED).
- [MISEENINCUBATEURDETAIL](tables.md#miseenincubateurdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` (`MISEENINCUBDET_PARQ_FK`, ENABLED).

Vues dépendantes directes (1) : [MISEENINCUBATEURDETAIL_LIB](vues.md#miseenincubateurdetail-lib).

Références dans le code : [ferme/couvoir/MiseEnIncubateurDetail.java:111](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/couvoir/MiseEnIncubateurDetail.java#L111>), [ferme/couvoir/miseneincubateur-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/miseneincubateur-saisie.jsp#L23>).

<a id="modeadministrationvaccin"></a>

## MODEADMINISTRATIONVACCIN

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(256 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(256 BYTE)` | Oui |  |

Clés : `SYS_C007419` (primaire) : `ID`.

Tables qui la référencent :

- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDMODEADMINISTRATION` → [MODEADMINISTRATIONVACCIN](tables.md#modeadministrationvaccin).`ID`.

Vues dépendantes directes (1) : [VACCINATIONPOUSSINDETAIL_LIB](vues.md#vaccinationpoussindetail-lib).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="modepaiement"></a>

## MODEPAIEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(400 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(400 BYTE)` | Oui |  |

Clés : `MODEPAIEMENT_PK` (primaire) : `ID`.

Tables qui la référencent :

- [BONCOMMANDE](tables.md#boncommande).`IDMODEPAIEMENT` → [MODEPAIEMENT](tables.md#modepaiement).`ID`.
- [COMMISSION](tables.md#commission).`IDMODEPAIEMENT` → [MODEPAIEMENT](tables.md#modepaiement).`ID`.
- [FACTUREDECLARATION](tables.md#facturedeclaration).`IDMODEPAIEMENT` → [MODEPAIEMENT](tables.md#modepaiement).`ID`.
- [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDMODEPAIEMENT` → [MODEPAIEMENT](tables.md#modepaiement).`ID`.

Vues dépendantes directes (28) : [AS_BONDECOMMANDE_CPL](vues.md#as-bondecommande-cpl), [AS_BONDECOMMANDE_MERECPL](vues.md#as-bondecommande-merecpl), [BONDECOMMANDE_CLIENT_CPL](vues.md#bondecommande-client-cpl), [BONDECOMMANDE_CLIENT_CPL_M](vues.md#bondecommande-client-cpl-m), [COMMANDECPL](vues.md#commandecpl), [DEPENSEDIVERSLIB](vues.md#depensediverslib), [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [FACTUREDECLARATIONCPL](vues.md#facturedeclarationcpl), [FACTUREFOURNISSEURAVECMACHINE](vues.md#facturefournisseuravecmachine), [FACTUREFOURNISSEURCPL](vues.md#facturefournisseurcpl), [FACTUREFOURNISSEURCPL_M](vues.md#facturefournisseurcpl-m), [FACTUREFOURNISSEURCPL_MONTANT](vues.md#facturefournisseurcpl-montant), [FACTUREFOURNISSEURCPL_TRAVAUX](vues.md#facturefournisseurcpl-travaux), [FACTUREFOURNISSEUR_CPL](vues.md#facturefournisseur-cpl), [MODEPAIEMENTMAJ](vues.md#modepaiementmaj), [MOUVEMENTCAISSECPL](vues.md#mouvementcaissecpl), [MOUVEMENTCAISSEMERELIB](vues.md#mouvementcaissemerelib), [MVTCAISSECPLORIGINE](vues.md#mvtcaissecplorigine), [MVTINTRACAISSETRAITEV](vues.md#mvtintracaissetraitev), [MVTINTRACAISSE_LIB](vues.md#mvtintracaisse-lib), [MVTINTRACAISSE_LIBCOMPLET](vues.md#mvtintracaisse-libcomplet), [PAIE_AVANCEMENT_LIBELLE4](vues.md#paie-avancement-libelle4), [PAIE_MODEPAIEMENT](vues.md#paie-modepaiement), [VENTE_CPL](vues.md#vente-cpl), [VENTE_CPL_CL](vues.md#vente-cpl-cl), [VENTE_CPL_SANSAVOIR](vues.md#vente-cpl-sansavoir), [VENTE_DIRECTE_CPL_PDF](vues.md#vente-directe-cpl-pdf).

Références dans le code : [faturefournisseur/ModePaiement.java:17](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/ModePaiement.java#L17>), [paie/DeroulanteEmbaucheData.java:62](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/DeroulanteEmbaucheData.java#L62>), [bondecommande/bondecommande-arbiochem-liste.jsp:39](<../../projet-standard - Copie/arbiochem-war/web/pages/bondecommande/bondecommande-arbiochem-liste.jsp#L39>), [bondecommande/bondecommande-liste.jsp:39](<../../projet-standard - Copie/arbiochem-war/web/pages/bondecommande/bondecommande-liste.jsp#L39>), [caisse/mvtcaisse-saisie-multiple.jsp:40](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/mvtcaisse-saisie-multiple.jsp#L40>) ; 6 autres fichiers dans `usages-code.json`.

<a id="module-prestataire"></a>

## MODULE_PRESTATAIRE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDFORMATEUR` | `VARCHAR2(100 BYTE)` | Oui | FK → FORMATEUR |
| `MODULE` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `MODULE_PRESTATAIRE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [MODULE_PRESTATAIRE](tables.md#module-prestataire).`IDFORMATEUR` → [FORMATEUR](tables.md#formateur).`ID` (`MODULPRESTA_FORMATEUR_FK`, ENABLED).

Vues dépendantes directes (1) : [V_MODULE_PRESTATAIRE_LIB](vues.md#v-module-prestataire-lib).

Références dans le code : [paie/formateur/ModulePrestataire.java:39](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formateur/ModulePrestataire.java#L39>), [paie/formateur/formateurmodule-saisie.jsp:15](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formateur/formateurmodule-saisie.jsp#L15>).

<a id="moiscp"></a>

## MOISCP

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `NUMBER(*,0)` | Non | PK |
| `VAL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `MOISCP_PKEY` (primaire) : `ID`.

Vues dépendantes directes (2) : [ETAT_IRSA](vues.md#etat-irsa), [FRAIS_MEDICAUX_ALL](vues.md#frais-medicaux-all).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="motifavoirfc"></a>

## MOTIFAVOIRFC

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `MOTIFAVOIRFC_PK` (primaire) : `ID`.

Vues dépendantes directes (2) : [AVOIRFCLIB](vues.md#avoirfclib), [AVOIRFCLIB_PDF](vues.md#avoirfclib-pdf).

Références dans le code : [avoir/MotifAvoirfc.java:11](<../../projet-standard - Copie/arbiochem-ejb/src/java/avoir/MotifAvoirfc.java#L11>), [avoir/avoirFC-arbiochem-liste.jsp:51](<../../projet-standard - Copie/arbiochem-war/web/pages/avoir/avoirFC-arbiochem-liste.jsp#L51>), [avoir/avoirFC-arbiochem-saisie.jsp:42](<../../projet-standard - Copie/arbiochem-war/web/pages/avoir/avoirFC-arbiochem-saisie.jsp#L42>), [avoir/avoirFC-liste.jsp:51](<../../projet-standard - Copie/arbiochem-war/web/pages/avoir/avoirFC-liste.jsp#L51>), [avoir/avoirFC-saisie.jsp:42](<../../projet-standard - Copie/arbiochem-war/web/pages/avoir/avoirFC-saisie.jsp#L42>) ; 3 autres fichiers dans `usages-code.json`.

<a id="motravaux"></a>

## MOTRAVAUX

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTRAVAUX` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DUREEESTIMATIF` | `VARCHAR2(50 BYTE)` | Oui |  |
| `TAUXHORAIRE` | `NUMBER` | Oui |  |

Clés : `SYS_C007427` (primaire) : `ID`.

Vues dépendantes directes (1) : [MOTRAVAUXLIB](vues.md#motravauxlib).

Références dans le code : [maintenance/travaux/MoTravaux.java:25](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/travaux/MoTravaux.java#L25>), [maintenance/travaux/MoTravaux-saisie-multiple.jsp:16](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/travaux/MoTravaux-saisie-multiple.jsp#L16>).

<a id="mouvementabsence"></a>

## MOUVEMENTABSENCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDSOURCE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDPERSONNEL` | `VARCHAR2(50 BYTE)` | Oui | FK → PAIE_INFO_PERSONNEL |
| `DATEDEBUT` | `DATE` | Oui |  |
| `MOIS` | `NUMBER(*,0)` | Oui |  |
| `ANNEE` | `NUMBER(*,0)` | Oui |  |
| `PLUS` | `NUMBER(30,2)` | Oui |  |
| `MOINS` | `NUMBER(30,2)` | Oui |  |
| `MOTIF` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDREMPLACANT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATEDEMANDE` | `DATE` | Oui |  |
| `IDTYPE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `MOUVEMENTABSENCE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [MOUVEMENTABSENCE](tables.md#mouvementabsence).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` (`MVTABS_PAIEINFO_FK`, ENABLED).

Vues dépendantes directes (7) : [MVTCONGEBYMOISANNEE](vues.md#mvtcongebymoisannee), [SOLDECONGEPRIS_PERS](vues.md#soldecongepris-pers), [SOLDECONGE_PERS](vues.md#soldeconge-pers), [SOLDECONGE_PERS_CPL](vues.md#soldeconge-pers-cpl), [SOLDEPERMISSION_PERS](vues.md#soldepermission-pers), [SOLDE_CONGE_PERS](vues.md#solde-conge-pers), [SOLDE_FORMATION_SYNDICALE](vues.md#solde-formation-syndicale).

Références dans le code : [paie/conge/MouvementAbsence.java:46](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/conge/MouvementAbsence.java#L46>).

<a id="mouvementcaisse"></a>

## MOUVEMENTCAISSE

Mouvement d’argent en caisse.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDCAISSE` | `VARCHAR2(255 BYTE)` | Oui | FK → CAISSE |
| `IDVENTEDETAIL` | `VARCHAR2(255 BYTE)` | Oui | FK → VENTE_DETAILS |
| `IDVIREMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDOP` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `IDTIERS` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDPREVISION` | `VARCHAR2(255 BYTE)` | Oui | FK → PREVISION |
| `IDTRAITE` | `VARCHAR2(100 BYTE)` | Oui | FK → TRAITE |
| `ETATVERSEMENT` | `NUMBER(2,0)` | Oui |  |
| `IDMODEPAIEMENT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDMVTCAISSEMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → MOUVEMENTCAISSEMERE |
| `REFERENCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `UPDATED_AT` | `TIMESTAMP(6)` | Oui |  |
| `DATYCOMPTABILISATION` | `DATE` | Oui |  |
| `ACQUEREUR` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPEPAIEMENT` | `VARCHAR2(250 BYTE)` | Oui | FK → TYPEPAIEMENT |
| `DEBIT` | `NUMBER(36,5)` | Oui |  |
| `CREDIT` | `NUMBER(36,5)` | Oui |  |
| `TAUX` | `NUMBER(10,5)` | Oui |  |
| `HEURE` | `VARCHAR2(10 BYTE)` | Oui |  |
| `IDREPORT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDCAISSIER` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MONTANTRETOURNER` | `NUMBER(10,2)` | Oui |  |
| `IDBC` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `MOUVEMENTCAISSE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` (`MOUVEMENTCAISSE_CAISSE_FK`, ENABLED).
- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID` (`MOUVEMENTCAISSE_VENTEDETAIL_FK`, ENABLED).
- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`MVTCAISSE_DEVISE_FK`, ENABLED).
- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDMVTCAISSEMERE` → [MOUVEMENTCAISSEMERE](tables.md#mouvementcaissemere).`ID` (`MVTCAISSE_MERE_FK`, ENABLED).
- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDPREVISION` → [PREVISION](tables.md#prevision).`ID` (`MVTCAISSE_PREVISION_FK`, ENABLED).
- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDTRAITE` → [TRAITE](tables.md#traite).`ID` (`SYS_C007981`, ENABLED).
- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDTYPEPAIEMENT` → [TYPEPAIEMENT](tables.md#typepaiement).`ID` (`SYS_C008009`, ENABLED).

Tables qui la référencent :

- [MVTCAISSEPREVISION](tables.md#mvtcaisseprevision).`ID1` → [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`ID`.

Vues dépendantes directes (22) : [COMPTA_SOUSECRITURE_LETTRE](vues.md#compta-sousecriture-lettre), [COMPTA_SOUSECRITURE_LETTRE2](vues.md#compta-sousecriture-lettre2), [DECLARATIONTVALIB](vues.md#declarationtvalib), [DEPENSEDIVERSLIB](vues.md#depensediverslib), [ETATRECAPITULATIFCOMMANDE](vues.md#etatrecapitulatifcommande), [FACTURECLIENTPAYE](vues.md#factureclientpaye), [MONTANTAPAYER](vues.md#montantapayer), [MOUVEMENTCAISSEAUTOCOMPLETE](vues.md#mouvementcaisseautocomplete), [MOUVEMENTCAISSEAVECHEURE](vues.md#mouvementcaisseavecheure), [MOUVEMENTCAISSECPL](vues.md#mouvementcaissecpl), [MOUVEMENTCAISSEFILLECPL](vues.md#mouvementcaissefillecpl), [MOUVEMENTCAISSEGROUPEFACTURE](vues.md#mouvementcaissegroupefacture), [MOUVEMENTCAISSEGROUPERESA](vues.md#mouvementcaissegrouperesa), [MOUVEMENTCAISSE_VISE](vues.md#mouvementcaisse-vise), [MVTCAISSECPLORIGINE](vues.md#mvtcaissecplorigine), [MVTCAISSEGROUPEFACTURE_PDF](vues.md#mvtcaissegroupefacture-pdf), [PERTEGAINIMPREVUELIB_NP](vues.md#pertegainimprevuelib-np), [PERTEGAINIMPREVUELIB_P](vues.md#pertegainimprevuelib-p), [PREVISION_EFFECTIF](vues.md#prevision-effectif), [TRAITE_FC](vues.md#traite-fc), [TRAITE_JC](vues.md#traite-jc), [VW_MOUVEMENTCAISSE_TOTAL_DEBIT](vues.md#vw-mouvementcaisse-total-debit).

Références dans le code : [caisse/MouvementCaisseFille.java:30](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/MouvementCaisseFille.java#L30>), [caisse/MvtCaisse.java:130](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/MvtCaisse.java#L130>), [paie/avance/PaiementAvance2.java:209](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/avance/PaiementAvance2.java#L209>), [caisse/mvtcaissefille-liste.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/mvtcaissefille-liste.jsp#L11>).

<a id="mouvementcaissemere"></a>

## MOUVEMENTCAISSEMERE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMODEPAIEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CREDIT` | `NUMBER(30,5)` | Oui |  |
| `DEBIT` | `NUMBER(30,5)` | Oui |  |
| `IDTIERS` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `MOUVEMENTCAISSEMERE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDMVTCAISSEMERE` → [MOUVEMENTCAISSEMERE](tables.md#mouvementcaissemere).`ID`.

Vues dépendantes directes (1) : [MOUVEMENTCAISSEMERELIB](vues.md#mouvementcaissemerelib).

Références dans le code : [caisse/MouvementCaisseMere.java:14](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/MouvementCaisseMere.java#L14>).

<a id="multiplication-prevision"></a>

## MULTIPLICATION_PREVISION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(20 BYTE)` | Non | PK |
| `IDPREVISION` | `VARCHAR2(20 BYTE)` | Non | FK → PREVISION |
| `FREQUENCEUNITE` | `VARCHAR2(20 BYTE)` | Oui |  |
| `FREQUENCE` | `NUMBER(*,0)` | Non |  |
| `DATY` | `DATE` | Non |  |

Clés : `PK_MULTIPLICATION_PREVISION` (primaire) : `ID`.

Clés étrangères sortantes :

- [MULTIPLICATION_PREVISION](tables.md#multiplication-prevision).`IDPREVISION` → [PREVISION](tables.md#prevision).`ID` (`FK_MULTIPREV_PREVISION`, ENABLED).

Références dans le code : [prevision/MultiplicationPrevision.java:24](<../../projet-standard - Copie/arbiochem-ejb/src/java/prevision/MultiplicationPrevision.java#L24>).

<a id="mvtcaisseprevision"></a>

## MVTCAISSEPREVISION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `ID1` | `VARCHAR2(100 BYTE)` | Oui | FK → MOUVEMENTCAISSE |
| `ID2` | `VARCHAR2(100 BYTE)` | Oui | FK → PREVISION |
| `MONTANTMERE` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `REMARQUE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `MONTANTCREDIT` | `NUMBER(30,2)` | Oui |  |
| `DEVISE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `TAUX` | `NUMBER(10,2)` | Oui |  |

Clés : `SYS_C007438` (primaire) : `ID`.

Clés étrangères sortantes :

- [MVTCAISSEPREVISION](tables.md#mvtcaisseprevision).`ID1` → [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`ID` (`MVT_MVTCAISSE_FK`, ENABLED).
- [MVTCAISSEPREVISION](tables.md#mvtcaisseprevision).`ID2` → [PREVISION](tables.md#prevision).`ID` (`MVT_PREVISION_FK`, ENABLED).

Vues dépendantes directes (2) : [MOUVEMENTCAISSECPL_NATTACH](vues.md#mouvementcaissecpl-nattach), [MVTCAISSEPREVISIONVISE](vues.md#mvtcaisseprevisionvise).

Références dans le code : [prevision/MvtCaissePrevision.java:57](<../../projet-standard - Copie/arbiochem-ejb/src/java/prevision/MvtCaissePrevision.java#L57>).

<a id="mvtintracaisse"></a>

## MVTINTRACAISSE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `CAISSEDEPART` | `VARCHAR2(100 BYTE)` | Oui |  |
| `CAISSEARRIVEE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `MONTANT` | `NUMBER(20,2)` | Oui |  |
| `MODEPAIEMENT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(10,0)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDTRAITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ETATVERSEMENT` | `NUMBER` | Oui |  |
| `IDFINALEDESTINATION` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `MVTINTRACAISSE_PK` (primaire) : `ID`.

Vues dépendantes directes (8) : [MVTINTRACAISSETRAITE](vues.md#mvtintracaissetraite), [MVTINTRACAISSETRAITENONVERSEE](vues.md#mvtintracaissetraitenonversee), [MVTINTRACAISSETRAITEV](vues.md#mvtintracaissetraitev), [MVTINTRACAISSETRAITEVCAISSE](vues.md#mvtintracaissetraitevcaisse), [MVTINTRACAISSE_LIB](vues.md#mvtintracaisse-lib), [MVTINTRACAISSE_LIBCOMPLET](vues.md#mvtintracaisse-libcomplet), [TRAITEETATVERSEMENT](vues.md#traiteetatversement), [TRAITEMTTRESTE_NONVERSEE](vues.md#traitemttreste-nonversee).

Références dans le code : [facture/tr/MvttIntraCaisse.java:114](<../../projet-standard - Copie/arbiochem-ejb/src/java/facture/tr/MvttIntraCaisse.java#L114>), [facture/apresVerserTraite.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/facture/apresVerserTraite.jsp#L22>), [facture/traite-non-versee-liste.jsp:10](<../../projet-standard - Copie/arbiochem-war/web/pages/facture/traite-non-versee-liste.jsp#L10>).

<a id="mvtintracaisse-fille"></a>

## MVTINTRACAISSE_FILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `REFERENCE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `MVTINTRACAISSE_FILLE_PK` (primaire) : `ID`.

Références dans le code : [facture/tr/MvtIntraCaisseFille.java:20](<../../projet-standard - Copie/arbiochem-ejb/src/java/facture/tr/MvtIntraCaisseFille.java#L20>).

<a id="mvtstock"></a>

## MVTSTOCK

Document principal de mouvement physique de stock.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDVENTE` | `VARCHAR2(255 BYTE)` | Oui | FK → VENTE |
| `IDTRANSFERT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPEMVSTOCK` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPEMVTSTOCK |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDPOINT` | `VARCHAR2(255 BYTE)` | Oui | FK → POINT |
| `IDOBJET` | `VARCHAR2(100 BYTE)` | Oui |  |
| `FABPRECEDENT` | `VARCHAR2(150 BYTE)` | Oui |  |
| `IDCATEGORIESTOCK` | `VARCHAR2(50 BYTE)` | Oui | FK → CATEGORIESTOCK |
| `HEURE` | `VARCHAR2(10 BYTE)` | Oui |  |

Clés : `MVTSTOCK_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [MVTSTOCK](tables.md#mvtstock).`IDCATEGORIESTOCK` → [CATEGORIESTOCK](tables.md#categoriestock).`ID` (`FK_MVTSTOCK_CAT`, ENABLED).
- [MVTSTOCK](tables.md#mvtstock).`IDPOINT` → [POINT](tables.md#point).`ID` (`FK_POINT`, ENABLED).
- [MVTSTOCK](tables.md#mvtstock).`IDTYPEMVSTOCK` → [TYPEMVTSTOCK](tables.md#typemvtstock).`ID` (`MVTSTOCK_TYPE_FK`, ENABLED).
- [MVTSTOCK](tables.md#mvtstock).`IDVENTE` → [VENTE](tables.md#vente).`ID` (`MVTSTOCK_VENTE_FK`, ENABLED).

Tables qui la référencent :

- [MVTSTOCKFILLE](tables.md#mvtstockfille).`IDMVTSTOCK` → [MVTSTOCK](tables.md#mvtstock).`ID`.

Vues dépendantes directes (25) : [ENTREEPRODUIT](vues.md#entreeproduit), [MONTANT_STOCK](vues.md#montant-stock), [MVTSTOCKAUTOCOMPLETE](vues.md#mvtstockautocomplete), [MVTSTOCKDATEHEURE](vues.md#mvtstockdateheure), [MVTSTOCKENTREEAVECRESTE](vues.md#mvtstockentreeavecreste), [MVTSTOCKENTREEAVECRESTEGROUPE](vues.md#mvtstockentreeavecrestegroupe), [MVTSTOCKFILLEFAB](vues.md#mvtstockfillefab), [MVTSTOCKFILLEFABVISE](vues.md#mvtstockfillefabvise), [MVTSTOCKFILLELIB](vues.md#mvtstockfillelib), [MVTSTOCKFILLELIB_VISE](vues.md#mvtstockfillelib-vise), [MVTSTOCKFILLEPARDATE](vues.md#mvtstockfillepardate), [MVTSTOCKFILLESANSINVENTAIRE](vues.md#mvtstockfillesansinventaire), [MVTSTOCKFILLETRANSFERT](vues.md#mvtstockfilletransfert), [MVTSTOCKFILLEVRAISOURCE](vues.md#mvtstockfillevraisource), [MVTSTOCKLIB](vues.md#mvtstocklib), [MVTSTOCKPRODUIT](vues.md#mvtstockproduit), [MVTSTOCK_ENG](vues.md#mvtstock-eng), [RAPPROCHEMENT_BF_CLIENT](vues.md#rapprochement-bf-client), [SORTIEENTREE](vues.md#sortieentree), [SORTIEPRODUIT](vues.md#sortieproduit), [SORTIEPRODUITPARORIGINE](vues.md#sortieproduitparorigine), [V_ETATSTOCK_ENTREE](vues.md#v-etatstock-entree), [V_ETATSTOCK_ING_MAGASIN](vues.md#v-etatstock-ing-magasin), [V_ETATSTOCK_ING_POINT](vues.md#v-etatstock-ing-point), [V_ETATSTOCK_ING_VENTE](vues.md#v-etatstock-ing-vente).

Références dans le code : [faturefournisseur/FactureDeclaration.java:773](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/FactureDeclaration.java#L773>), [faturefournisseur/FactureFournisseur.java:1109](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/FactureFournisseur.java#L1109>), [stock/MvtStock.java:69](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/MvtStock.java#L69>), [stock/mvtstock-arbiochem-saisie.jsp:75](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/mvtstock-arbiochem-saisie.jsp#L75>), [stock/mvtstock-modif.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/mvtstock-modif.jsp#L23>) ; 7 autres fichiers dans `usages-code.json`.

<a id="mvtstock0309"></a>

## MVTSTOCK0309

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDVENTE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTRANSFERT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPEMVSTOCK` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDPOINT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDOBJET` | `VARCHAR2(100 BYTE)` | Oui |  |
| `FABPRECEDENT` | `VARCHAR2(150 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="mvtstockback"></a>

## MVTSTOCKBACK

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDVENTE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTRANSFERT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPEMVSTOCK` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDPOINT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDOBJET` | `VARCHAR2(100 BYTE)` | Oui |  |
| `FABPRECEDENT` | `VARCHAR2(150 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="mvtstockfille"></a>

## MVTSTOCKFILLE

Lignes de mouvement : article, entrée, sortie, prix, source et inventaire.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDMVTSTOCK` | `VARCHAR2(255 BYTE)` | Oui | FK → MVTSTOCK |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDVENTEDETAIL` | `VARCHAR2(255 BYTE)` | Oui | FK → VENTE_DETAILS |
| `IDTRANSFERTDETAIL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MVTSRC` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ENTREE` | `NUMBER(30,5)` | Oui |  |
| `SORTIE` | `NUMBER(30,5)` | Oui |  |
| `PU` | `NUMBER(30,5)` | Oui |  |
| `RESTE` | `NUMBER(30,5)` | Oui |  |
| `IDINVENTAIREFILLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATEINVENTAIRE` | `DATE` | Oui |  |
| `QTEINVENTAIRE` | `NUMBER(30,2)` | Oui |  |

Clés : `MVTSTOCKFILLE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [MVTSTOCKFILLE](tables.md#mvtstockfille).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID` (`MVTSTOCKFILLE_VENTEDETAIL_FK`, ENABLED).
- [MVTSTOCKFILLE](tables.md#mvtstockfille).`IDMVTSTOCK` → [MVTSTOCK](tables.md#mvtstock).`ID` (`MVTSTOCKMERE_FILLE_FK`, ENABLED).

Tables qui la référencent :

- [PREVISIONFERME](tables.md#previsionferme).`IDMVTSTOCKFILLE` → [MVTSTOCKFILLE](tables.md#mvtstockfille).`ID`.

Vues dépendantes directes (34) : [ENTREEPRODUIT](vues.md#entreeproduit), [MVTSTOCKENTREEAVECRESTE](vues.md#mvtstockentreeavecreste), [MVTSTOCKENTREEAVECRESTEGROUPE](vues.md#mvtstockentreeavecrestegroupe), [MVTSTOCKFILLEAUTOCOMPLETE](vues.md#mvtstockfilleautocomplete), [MVTSTOCKFILLEAVECSOURCE](vues.md#mvtstockfilleavecsource), [MVTSTOCKFILLECPTSTOCK](vues.md#mvtstockfillecptstock), [MVTSTOCKFILLEFAB](vues.md#mvtstockfillefab), [MVTSTOCKFILLEFABVISE](vues.md#mvtstockfillefabvise), [MVTSTOCKFILLEGROUPEMERE](vues.md#mvtstockfillegroupemere), [MVTSTOCKFILLEGRP](vues.md#mvtstockfillegrp), [MVTSTOCKFILLEGRPVARIATION](vues.md#mvtstockfillegrpvariation), [MVTSTOCKFILLELIB](vues.md#mvtstockfillelib), [MVTSTOCKFILLELIB_VISE](vues.md#mvtstockfillelib-vise), [MVTSTOCKFILLEMONTANT](vues.md#mvtstockfillemontant), [MVTSTOCKFILLEMONTANT_ENG](vues.md#mvtstockfillemontant-eng), [MVTSTOCKFILLEPARDATE](vues.md#mvtstockfillepardate), [MVTSTOCKFILLESANSINVENTAIRE](vues.md#mvtstockfillesansinventaire), [MVTSTOCKFILLEVRAISOURCE](vues.md#mvtstockfillevraisource), [MVTSTOCKFILLE_ENG](vues.md#mvtstockfille-eng), [MVTSTOCKPRODUIT](vues.md#mvtstockproduit), [RAPPROCHEMENT_BF_FOURNISSEUR](vues.md#rapprochement-bf-fournisseur), [RAPPROCHEMENT_BF_LIVREE](vues.md#rapprochement-bf-livree), [SORTIEENTREE](vues.md#sortieentree), [SORTIEPRODUIT](vues.md#sortieproduit), [SORTIEPRODUITPARORIGINE](vues.md#sortieproduitparorigine), [SORTIESTOCKFILLE](vues.md#sortiestockfille), [STOCKETDEPENSEFABNC](vues.md#stocketdepensefabnc), [V_ETATSTOCK_ENTREE](vues.md#v-etatstock-entree), [V_ETATSTOCK_ENTREE_STANDARD](vues.md#v-etatstock-entree-standard), [V_ETATSTOCK_ING](vues.md#v-etatstock-ing), [V_ETATSTOCK_ING_MAGASIN](vues.md#v-etatstock-ing-magasin), [V_ETATSTOCK_ING_POINT](vues.md#v-etatstock-ing-point), [V_ETATSTOCK_ING_TOUS](vues.md#v-etatstock-ing-tous), [V_ETATSTOCK_ING_VENTE](vues.md#v-etatstock-ing-vente).

Références dans le code : [faturefournisseur/FactureDeclaration.java:796](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/FactureDeclaration.java#L796>), [faturefournisseur/FactureFournisseur.java:1132](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/FactureFournisseur.java#L1132>), [stock/MvtStockFille.java:221](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/MvtStockFille.java#L221>), [stock/mvtstock-arbiochem-saisie.jsp:77](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/mvtstock-arbiochem-saisie.jsp#L77>), [stock/mvtstock-modif.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/mvtstock-modif.jsp#L25>) ; 4 autres fichiers dans `usages-code.json`.

<a id="mvtstockfille0309"></a>

## MVTSTOCKFILLE0309

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMVTSTOCK` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ENTREE` | `NUMBER(15,2)` | Oui |  |
| `SORTIE` | `NUMBER(15,2)` | Oui |  |
| `IDVENTEDETAIL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTRANSFERTDETAIL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PU` | `NUMBER(20,2)` | Oui |  |
| `MVTSRC` | `VARCHAR2(100 BYTE)` | Oui |  |
| `RESTE` | `NUMBER(20,2)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(500 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="mvtstockfilleback"></a>

## MVTSTOCKFILLEBACK

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMVTSTOCK` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ENTREE` | `NUMBER(*,0)` | Oui |  |
| `SORTIE` | `NUMBER(*,0)` | Oui |  |
| `IDVENTEDETAIL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTRANSFERTDETAIL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PU` | `NUMBER(20,2)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="my-table"></a>

## MY_TABLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `IDPRODUIT` | `VARCHAR2(2000 BYTE)` | Oui |  |
| `PUMP` | `NUMBER` | Oui |  |
| `DESIGNATION` | `VARCHAR2(200 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="notification"></a>

## NOTIFICATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `OBJET` | `VARCHAR2(250 BYTE)` | Oui |  |
| `MESSAGE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `IDUSER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `DIRECTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `SERVICE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DESTINATAIRE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDOBJET` | `VARCHAR2(50 BYTE)` | Oui |  |
| `LIEN` | `VARCHAR2(250 BYTE)` | Oui |  |
| `IDUSER_RECEVANT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `PRIORITE` | `NUMBER(*,0)` | Oui |  |
| `CLASSEE` | `NUMBER(*,0)` | Oui |  |
| `PRESTATION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `HEURE` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SYS_C007446` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="notification2"></a>

## NOTIFICATION2

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `RECEIVER` | `NUMBER` | Non | FK → UTILISATEUR |
| `MESSAGE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(10 BYTE)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `REF` | `VARCHAR2(50 BYTE)` | Oui |  |
| `LIEN` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `NOTIFICATION_PKEY` (primaire) : `ID`.

Clés étrangères sortantes :

- [NOTIFICATION2](tables.md#notification2).`RECEIVER` → [UTILISATEUR](tables.md#utilisateur).`REFUSER` (`NOTIFICATION_RECEIVER_FKEY`, ENABLED).

Vues dépendantes directes (1) : [NOTIFICATIONLIBCPLT](vues.md#notificationlibcplt).

Références dans le code : [notification/apresnotif.jsp:26](<../../projet-standard - Copie/arbiochem-war/web/pages/notification/apresnotif.jsp#L26>).

<a id="numerocollecte"></a>

## NUMEROCOLLECTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `NUMEROCOLLECTE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [FUMIGATION](tables.md#fumigation).`IDNUMEROVAGUE` → [NUMEROCOLLECTE](tables.md#numerocollecte).`ID`.
- [RECEPTIONOAC](tables.md#receptionoac).`IDNUMEROCOLLECTE` → [NUMEROCOLLECTE](tables.md#numerocollecte).`ID`.
- [TRIAGEOEUF](tables.md#triageoeuf).`IDNUMEROCOLLECTE` → [NUMEROCOLLECTE](tables.md#numerocollecte).`ID`.

Vues dépendantes directes (5) : [FUMIGATION_LIB](vues.md#fumigation-lib), [IMPORTOAC_LIB](vues.md#importoac-lib), [IMPORTRECEPTIONOAC](vues.md#importreceptionoac), [RECEPTIONOAC_LIB](vues.md#receptionoac-lib), [TRIAGEOEUF_LIB](vues.md#triageoeuf-lib).

Références dans le code : [ferme/production/fumigation-saisie.jsp:49](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/fumigation-saisie.jsp#L49>), [ferme/production/fumigationsimple-saisie.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/fumigationsimple-saisie.jsp#L25>), [ferme/production/importoac-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/importoac-saisie.jsp#L33>), [ferme/production/receptionoac-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/receptionoac-saisie.jsp#L33>), [ferme/production/triageoeuf-saisie.jsp:53](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/triageoeuf-saisie.jsp#L53>).

<a id="objectif-annuel"></a>

## OBJECTIF_ANNUEL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TITRE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |

Clés : `SYS_C007451` (primaire) : `ID`.

Vues dépendantes directes (1) : [OBJECTIF_ANNUEL_LIB](vues.md#objectif-annuel-lib).

Références dans le code : [paie/evaluation/ObjectifAnnuel.java:49](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/evaluation/ObjectifAnnuel.java#L49>), [paie/evaluation/objectifannuel-saisie.jsp:17](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/evaluation/objectifannuel-saisie.jsp#L17>).

<a id="objectif-annuel-detail"></a>

## OBJECTIF_ANNUEL_DETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDOBJECTIFANNUEL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `OBJECTIF` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `INDICATEURATTEINTE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `MOYENATTEINTE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `POURCENTAGEATTEINTE` | `NUMBER` | Oui |  |
| `COMMENTAIRE` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `SYS_C007452` (primaire) : `ID`.

Références dans le code : [paie/evaluation/ObjectifAnnuelDetail.java:84](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/evaluation/ObjectifAnnuelDetail.java#L84>), [paie/evaluation/inc/objectifannuel-detail.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/evaluation/inc/objectifannuel-detail.jsp#L7>), [paie/evaluation/objectifannuel-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/evaluation/objectifannuel-saisie.jsp#L19>).

<a id="ofab"></a>

## OFAB

Ordre de fabrication.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `LANCEPAR` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CIBLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `BESOIN` | `DATE` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDBC` | `VARCHAR2(500 BYTE)` | Oui | FK → BONDECOMMANDE_CLIENT |
| `LANCEUR` | `NUMBER(32,0)` | Oui | FK → UTILISATEUR |

Clés : `SYS_C007454` (primaire) : `ID`.

Clés étrangères sortantes :

- [OFAB](tables.md#ofab).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID` (`FK_OFAB_BDC`, ENABLED).
- [OFAB](tables.md#ofab).`LANCEUR` → [UTILISATEUR](tables.md#utilisateur).`REFUSER` (`FK_OFAB_LANCEUR`, ENABLED).

Tables qui la référencent :

- [DEMANDETRANSFERT](tables.md#demandetransfert).`IDOF` → [OFAB](tables.md#ofab).`ID`.
- [OFFILLE](tables.md#offille).`IDMERE` → [OFAB](tables.md#ofab).`ID`.
- [TRANSFERTSTOCK](tables.md#transfertstock).`IDOF` → [OFAB](tables.md#ofab).`ID`.

Vues dépendantes directes (13) : [AS_RECETTEOFABRICATION](vues.md#as-recetteofabrication), [BONDECOMMANDE_OFDETAILS](vues.md#bondecommande-ofdetails), [COUT_FAB_PAR_OF](vues.md#cout-fab-par-of), [COUT_FAB_PAR_OF_TEMP](vues.md#cout-fab-par-of-temp), [DUREE_CYCLE_FAB](vues.md#duree-cycle-fab), [OFABLIB](vues.md#ofablib), [OFFILLELIBQTERESTE](vues.md#offillelibqtereste), [OFFILLELIBSTOCK](vues.md#offillelibstock), [OFFILLELIBSTOCKIA](vues.md#offillelibstockia), [OFGROUPBYIDBC](vues.md#ofgroupbyidbc), [OFNONRATTACHE](vues.md#ofnonrattache), [OFNONRATTACHEREEL](vues.md#ofnonrattachereel), [OTRAVFILLELIBSTOCK](vues.md#otravfillelibstock).

Références dans le code : [fabrication/Of.java:31](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/Of.java#L31>), [fabrication/ordre-fabrication-modif.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/fabrication/ordre-fabrication-modif.jsp#L22>), [demande/demandetransfert-saisie.jsp:114](<../../projet-standard - Copie/arbiochem-war/web/pages/demande/demandetransfert-saisie.jsp#L114>), [stat/comparaison-duree-of.jsp:35](<../../projet-standard - Copie/arbiochem-war/web/pages/stat/comparaison-duree-of.jsp#L35>), [stat/repartition-cout-of.jsp:17](<../../projet-standard - Copie/arbiochem-war/web/pages/stat/repartition-cout-of.jsp#L17>) ; 2 autres fichiers dans `usages-code.json`.

<a id="offille"></a>

## OFFILLE

Lignes de l’ordre de fabrication.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDINGREDIENTS` | `VARCHAR2(255 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → OFAB |
| `DATYBESOIN` | `DATE` | Oui |  |
| `IDUNITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDBCFILLE` | `VARCHAR2(1000 BYTE)` | Oui | FK → BONDECOMMANDE_CLIENT_FILLE |
| `QTE` | `NUMBER(30,5)` | Oui |  |
| `PRIXVENTE` | `NUMBER(30,2)` | Oui |  |

Clés : `SYS_C007456` (primaire) : `ID`.

Clés étrangères sortantes :

- [OFFILLE](tables.md#offille).`IDBCFILLE` → [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`ID` (`FK_OFFILLE_BDCFILE`, ENABLED).
- [OFFILLE](tables.md#offille).`IDMERE` → [OFAB](tables.md#ofab).`ID` (`SYS_C007958`, ENABLED).

Tables qui la référencent :

- [FABRICATION](tables.md#fabrication).`IDOFFILLE` → [OFFILLE](tables.md#offille).`ID`.

Vues dépendantes directes (26) : [AS_RECETTEOF](vues.md#as-recetteof), [AS_RECETTEOFABRICATION](vues.md#as-recetteofabrication), [AS_RECETTEOFF](vues.md#as-recetteoff), [AS_RECFOFABLIBGROUPE](vues.md#as-recfofablibgroupe), [BONDECOMMANDE_OFDETAILS](vues.md#bondecommande-ofdetails), [CHARGEGROUPBYOFF](vues.md#chargegroupbyoff), [CHARGEGROUPEBYOFF](vues.md#chargegroupebyoff), [DEPENSEFAB](vues.md#depensefab), [DUREE_CYCLE_FAB](vues.md#duree-cycle-fab), [FABRICATIONAUTOCOMPLETE](vues.md#fabricationautocomplete), [FABRICATIONCPL](vues.md#fabricationcpl), [FABRICATIONOFFILLE](vues.md#fabricationoffille), [HS_PAR_OF](vues.md#hs-par-of), [HS_PAR_OFFILLE](vues.md#hs-par-offille), [MVTSTOCKFILLEFABOFCATVISE](vues.md#mvtstockfillefabofcatvise), [MVTSTOCKFILLEFABOFCATVISETOUS](vues.md#mvtstockfillefabofcatvisetous), [MVTSTOCKFILLERESIDUOF](vues.md#mvtstockfilleresiduof), [OFFILLEEQUIVALENCE](vues.md#offilleequivalence), [OFFILLELIB](vues.md#offillelib), [OFFILLELIBQTERESTE](vues.md#offillelibqtereste), [OFFILLELIBSTOCK](vues.md#offillelibstock), [OFFILLELIBSTOCKIA](vues.md#offillelibstockia), [OFGROUPBYIDBC](vues.md#ofgroupbyidbc), [OFNONRATTACHE](vues.md#ofnonrattache), [QTEOFANDRESTOFBYIDBC](vues.md#qteofandrestofbyidbc), [STOCKETDEPENSEFABNC](vues.md#stocketdepensefabnc).

Références dans le code : [fabrication/OfFille.java:249](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/OfFille.java#L249>), [fabrication/ordre-fabrication-modif.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/fabrication/ordre-fabrication-modif.jsp#L24>).

<a id="offillebackup"></a>

## OFFILLEBACKUP

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non |  |
| `IDINGREDIENTS` | `VARCHAR2(255 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATYBESOIN` | `DATE` | Oui |  |
| `IDUNITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDBCFILLE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `QTE` | `NUMBER(30,5)` | Oui |  |
| `PRIXVENTE` | `NUMBER(30,2)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="offre-emploi"></a>

## OFFRE_EMPLOI

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDFICHEPOSTE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `TITRE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCRIPTION` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `MISSION` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `EXIGENCEPOSTE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `IDTYPECONTRAT` | `VARCHAR2(50 BYTE)` | Oui | FK → TYPE_CONTRAT |
| `SALAIREMIN` | `NUMBER(30,2)` | Oui |  |
| `SALAIREMAX` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `DATEPUBLICATION` | `DATE` | Oui |  |
| `DATEFERMETURE` | `DATE` | Oui |  |

Clés : `SYS_C007458` (primaire) : `ID`.

Clés étrangères sortantes :

- [OFFRE_EMPLOI](tables.md#offre-emploi).`IDTYPECONTRAT` → [TYPE_CONTRAT](tables.md#type-contrat).`ID` (`FK_OFFRE_TYPE_CONTRAT`, ENABLED).

Tables qui la référencent :

- [CANDIDATURES](tables.md#candidatures).`IDOFFREEMPLOIE` → [OFFRE_EMPLOI](tables.md#offre-emploi).`ID`.

Vues dépendantes directes (2) : [CANDIDATURESLIB](vues.md#candidatureslib), [OFFRE_EMPLOILIB](vues.md#offre-emploilib).

Références dans le code : [paie/recrutement/OffreEmploi.java:116](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/recrutement/OffreEmploi.java#L116>), [paie/recrutement/offreemploi-saisie.jsp:18](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/recrutement/offreemploi-saisie.jsp#L18>), [paie/recrutement/candidature-saisie.jsp:31](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/recrutement/candidature-saisie.jsp#L31>).

<a id="onboarding-fille"></a>

## ONBOARDING_FILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Non | FK → ONBOARDING_MERE |
| `TITRE` | `VARCHAR2(255 BYTE)` | Non |  |
| `DESCRIPTION` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `RANG` | `NUMBER(10,0)` | Non |  |
| `OBJECTIF` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `SYS_C007462` (primaire) : `ID`.

Clés étrangères sortantes :

- [ONBOARDING_FILLE](tables.md#onboarding-fille).`IDMERE` → [ONBOARDING_MERE](tables.md#onboarding-mere).`ID` (`FK_FILLE_MERE`, ENABLED).

Vues dépendantes directes (1) : [EMPLOYEEONBOARDINGCHECKLISTCPL](vues.md#employeeonboardingchecklistcpl).

Références dans le code : [onBoarding/OnboardingFille.java:66](<../../projet-standard - Copie/arbiochem-ejb/src/java/onBoarding/OnboardingFille.java#L66>), [onBoarding/inc/onBoarding-details.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/onBoarding/inc/onBoarding-details.jsp#L7>), [onBoarding/onBoarding-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/onBoarding/onBoarding-saisie.jsp#L19>), [onBoarding/onboardingspecific-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/onBoarding/onboardingspecific-saisie.jsp#L19>), [onBoarding/employeeonboarding-saisie.jsp:60](<../../projet-standard - Copie/arbiochem-war/web/pages/onBoarding/employeeonboarding-saisie.jsp#L60>) ; 1 autres fichiers dans `usages-code.json`.

<a id="onboarding-mere"></a>

## ONBOARDING_MERE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `NOM` | `VARCHAR2(255 BYTE)` | Non |  |
| `DESCRIPTION` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `IDFONCTION` | `VARCHAR2(255 BYTE)` | Oui | FK → PAIE_FONCTION |

Clés : `SYS_C007464` (primaire) : `ID`.

Clés étrangères sortantes :

- [ONBOARDING_MERE](tables.md#onboarding-mere).`IDFONCTION` → [PAIE_FONCTION](tables.md#paie-fonction).`ID` (`FK_ONB_MERE_FONCTION`, ENABLED).

Tables qui la référencent :

- [EMPLOYEE_ONBOARDING_SESSIONS](tables.md#employee-onboarding-sessions).`IDONBOARDING` → [ONBOARDING_MERE](tables.md#onboarding-mere).`ID`.
- [ONBOARDING_FILLE](tables.md#onboarding-fille).`IDMERE` → [ONBOARDING_MERE](tables.md#onboarding-mere).`ID`.

Vues dépendantes directes (5) : [EMPLOYEEONBOARDINGSESSIONSCPL](vues.md#employeeonboardingsessionscpl), [EMP_ONBOARDING_COM](vues.md#emp-onboarding-com), [EMP_ONBOARDING_SPEC](vues.md#emp-onboarding-spec), [ONBOARDING_MERE_LIB](vues.md#onboarding-mere-lib), [ONBOARDING_MERE_TC](vues.md#onboarding-mere-tc).

Références dans le code : [onBoarding/OnboardingMere.java:46](<../../projet-standard - Copie/arbiochem-ejb/src/java/onBoarding/OnboardingMere.java#L46>), [onBoarding/employeeonboarding-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/onBoarding/employeeonboarding-saisie.jsp#L33>), [onBoarding/onBoarding-saisie.jsp:17](<../../projet-standard - Copie/arbiochem-war/web/pages/onBoarding/onBoarding-saisie.jsp#L17>), [onBoarding/onboardingspecific-saisie.jsp:17](<../../projet-standard - Copie/arbiochem-war/web/pages/onBoarding/onboardingspecific-saisie.jsp#L17>), [onBoarding/onboardingspecpersonnel-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/onBoarding/onboardingspecpersonnel-saisie.jsp#L33>).

<a id="ordonnerpaiement"></a>

## ORDONNERPAIEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `ORDONNERPAIEMENT_PK` (primaire) : `ID`.

Tables qui la référencent :

- [DEPENSE](tables.md#depense).`IDOP` → [ORDONNERPAIEMENT](tables.md#ordonnerpaiement).`ID`.
- [ORDONNERPAIEMENTDETAIL](tables.md#ordonnerpaiementdetail).`IDOP` → [ORDONNERPAIEMENT](tables.md#ordonnerpaiement).`ID`.

Vues dépendantes directes (1) : [PREVISION_CPL](vues.md#prevision-cpl).

Références dans le code : [ordonnerpaiement/OrdonnerPaiement.java:25](<../../projet-standard - Copie/arbiochem-ejb/src/java/ordonnerpaiement/OrdonnerPaiement.java#L25>).

<a id="ordonnerpaiementdetail"></a>

## ORDONNERPAIEMENTDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDOP` | `VARCHAR2(255 BYTE)` | Oui | FK → ORDONNERPAIEMENT |
| `IDFF` | `VARCHAR2(255 BYTE)` | Oui | FK → FACTUREFOURNISSEUR |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |

Clés : `ORDONNERPAIEMENTDETAIL_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [ORDONNERPAIEMENTDETAIL](tables.md#ordonnerpaiementdetail).`IDFF` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID` (`OPDETAIL_FF_FK`, ENABLED).
- [ORDONNERPAIEMENTDETAIL](tables.md#ordonnerpaiementdetail).`IDOP` → [ORDONNERPAIEMENT](tables.md#ordonnerpaiement).`ID` (`OP_MEREFILLE_FK`, ENABLED).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="ordretravaux"></a>

## ORDRETRAVAUX

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `LANCEPAR` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CIBLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `BESOIN` | `DATE` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `IDBC` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `SYS_C007468` (primaire) : `ID`.

Tables qui la référencent :

- [ORDRETRAVAUXFILLE](tables.md#ordretravauxfille).`IDMERE` → [ORDRETRAVAUX](tables.md#ordretravaux).`ID`.
- [RESULTATMAINTENANCE](tables.md#resultatmaintenance).`IDORDRETRAVAUX` → [ORDRETRAVAUX](tables.md#ordretravaux).`ID`.

Vues dépendantes directes (5) : [DEMANDETRAVAUX_CPL](vues.md#demandetravaux-cpl), [MTBFDETAIL](vues.md#mtbfdetail), [ORDRETRAVAUXCPL](vues.md#ordretravauxcpl), [OTRAVLIB](vues.md#otravlib), [PLANNING_CPL](vues.md#planning-cpl).

Références dans le code : [maintenance/travaux/OrdreTravaux.java:16](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/travaux/OrdreTravaux.java#L16>).

<a id="ordretravauxfille"></a>

## ORDRETRAVAUXFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDINGREDIENTS` | `VARCHAR2(255 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → ORDRETRAVAUX |
| `DATYBESOIN` | `DATE` | Oui |  |
| `QTE` | `NUMBER(20,2)` | Oui |  |
| `IDUNITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDBCFILLE` | `VARCHAR2(1000 BYTE)` | Oui | FK → BONDECOMMANDE_CLIENT_FILLE |

Clés : `SYS_C007470` (primaire) : `ID`.

Clés étrangères sortantes :

- [ORDRETRAVAUXFILLE](tables.md#ordretravauxfille).`IDBCFILLE` → [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`ID` (`FK_OTFILLE_BDCFILE`, ENABLED).
- [ORDRETRAVAUXFILLE](tables.md#ordretravauxfille).`IDMERE` → [ORDRETRAVAUX](tables.md#ordretravaux).`ID` (`SYS_C008210`, ENABLED).

Tables qui la référencent :

- [TRAVAUX](tables.md#travaux).`IDOFFILLE` → [ORDRETRAVAUXFILLE](tables.md#ordretravauxfille).`ID`.

Vues dépendantes directes (10) : [COUTSMAINTENANCE](vues.md#coutsmaintenance), [DEMANDETRAVAUX_CPL](vues.md#demandetravaux-cpl), [MTBFDETAIL](vues.md#mtbfdetail), [ORDRETRAVAUXFILLELIB](vues.md#ordretravauxfillelib), [OTRAVFILLELIBSTOCK](vues.md#otravfillelibstock), [PLANNING_CPL](vues.md#planning-cpl), [PLANNING_DUREENONPROGRAMME](vues.md#planning-dureenonprogramme), [TEMPSMOYENPANNES](vues.md#tempsmoyenpannes), [TRAVAUXCPL](vues.md#travauxcpl), [V_DUREE_TRAVAUX_MACHINE](vues.md#v-duree-travaux-machine).

Références dans le code : [maintenance/travaux/OrdreTravauxFille.java:22](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/travaux/OrdreTravauxFille.java#L22>).

<a id="organigramme"></a>

## ORGANIGRAMME

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `RANG` | `NUMBER(*,0)` | Oui |  |

Clés : `ORGANIGRAMME_PK` (primaire) : `ID`.

Vues dépendantes directes (1) : [ORGANIGRAMMELIB](vues.md#organigrammelib).

Références dans le code : [paie/log/Organigramme.java:26](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/log/Organigramme.java#L26>).

<a id="originelot"></a>

## ORIGINELOT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `ORIGINELOT_PK` (primaire) : `ID`.

Tables qui la référencent :

- [LOT](tables.md#lot).`IDORIGINE` → [ORIGINELOT](tables.md#originelot).`ID`.
- [RECEPTIONOAC](tables.md#receptionoac).`IDPROVENANCE` → [ORIGINELOT](tables.md#originelot).`ID`.

Vues dépendantes directes (2) : [IMPORTOAC](vues.md#importoac), [LOT_LIB](vues.md#lot-lib).

Références dans le code : [ferme/configuration/OrigineLot.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/configuration/OrigineLot.java#L9>), [ferme/configuration/originelot-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/originelot-fiche.jsp#L11>), [ferme/configuration/originelot-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/originelot-liste.jsp#L7>), [ferme/configuration/originelot-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/originelot-saisie.jsp#L13>), [ferme/lot/lot-saisie.jsp:37](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/lot/lot-saisie.jsp#L37>) ; 1 autres fichiers dans `usages-code.json`.

<a id="ouverturecaisse"></a>

## OUVERTURECAISSE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDPOINT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(2,0)` | Oui |  |

Clés : `SYS_C007474` (primaire) : `ID`.

Tables qui la référencent :

- [OUVERTURECAISSEFILLE](tables.md#ouverturecaissefille).`IDOUVERTURE` → [OUVERTURECAISSE](tables.md#ouverturecaisse).`ID`.

Références dans le code : [caisse/OuvertureCaisse.java:17](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/OuvertureCaisse.java#L17>).

<a id="ouverturecaissefille"></a>

## OUVERTURECAISSEFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDOUVERTURE` | `VARCHAR2(255 BYTE)` | Oui | FK → OUVERTURECAISSE |
| `IDCAISSE` | `VARCHAR2(255 BYTE)` | Oui | FK → CAISSE |
| `MONTANTTHEORIQUE` | `NUMBER(32,5)` | Oui |  |
| `MONTANT` | `NUMBER(32,5)` | Oui |  |
| `EXPLICATION` | `VARCHAR2(255 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Clés étrangères sortantes :

- [OUVERTURECAISSEFILLE](tables.md#ouverturecaissefille).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` (`SYS_C007876`, ENABLED).
- [OUVERTURECAISSEFILLE](tables.md#ouverturecaissefille).`IDOUVERTURE` → [OUVERTURECAISSE](tables.md#ouverturecaisse).`ID` (`SYS_C008214`, ENABLED).

Références dans le code : [caisse/OuvertureCaisseFille.java:17](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/OuvertureCaisseFille.java#L17>).

<a id="packinglistachat"></a>

## PACKINGLISTACHAT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDBR` | `VARCHAR2(255 BYTE)` | Oui | FK → AS_BONDELIVRAISON |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SYS_C007475` (primaire) : `ID`.

Clés étrangères sortantes :

- [PACKINGLISTACHAT](tables.md#packinglistachat).`IDBR` → [AS_BONDELIVRAISON](tables.md#as-bondelivraison).`ID` (`SYS_C008263`, ENABLED).

Tables qui la référencent :

- [PACKINGLISTACHATFILLE](tables.md#packinglistachatfille).`IDMERE` → [PACKINGLISTACHAT](tables.md#packinglistachat).`ID`.

Vues dépendantes directes (1) : [PACKINGLISTACHATLIB](vues.md#packinglistachatlib).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="packinglistachatfille"></a>

## PACKINGLISTACHATFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → PACKINGLISTACHAT |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QTE` | `NUMBER(30,2)` | Oui |  |

Clés : `SYS_C007476` (primaire) : `ID`.

Clés étrangères sortantes :

- [PACKINGLISTACHATFILLE](tables.md#packinglistachatfille).`IDMERE` → [PACKINGLISTACHAT](tables.md#packinglistachat).`ID` (`SYS_C008215`, ENABLED).
- [PACKINGLISTACHATFILLE](tables.md#packinglistachatfille).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`SYS_C008272`, ENABLED).

Vues dépendantes directes (2) : [PACKINGLISTACHATFILLELIB](vues.md#packinglistachatfillelib), [PACKINGLISTACHATFILLEUNITE](vues.md#packinglistachatfilleunite).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="paiementbon"></a>

## PAIEMENTBON

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDCLIENT` | `VARCHAR2(255 BYTE)` | Oui | FK → CLIENT |
| `IDCAISSEBON` | `VARCHAR2(255 BYTE)` | Oui | FK → CAISSE |
| `IDCAISSEPAIEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → CAISSE |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `PAIEMENTBON_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PAIEMENTBON](tables.md#paiementbon).`IDCAISSEBON` → [CAISSE](tables.md#caisse).`ID` (`PAIEMENTBON_CAISSEBON_FK`, ENABLED).
- [PAIEMENTBON](tables.md#paiementbon).`IDCAISSEPAIEMENT` → [CAISSE](tables.md#caisse).`ID` (`PAIEMENTBON_CAISSEPAIEMENT_FK`, ENABLED).
- [PAIEMENTBON](tables.md#paiementbon).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`PAIEMENTBON_CLIENT_FK`, ENABLED).

Références dans le code : [caisse/PaiementBon.java:24](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/PaiementBon.java#L24>), [caisse/bon/paiementbon-fiche.jsp:17](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/bon/paiementbon-fiche.jsp#L17>), [caisse/bon/paiementbon-liste.jsp:8](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/bon/paiementbon-liste.jsp#L8>).

<a id="paiementff"></a>

## PAIEMENTFF

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDOP` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDFF` | `VARCHAR2(255 BYTE)` | Oui | FK → FACTUREFOURNISSEUR |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |

Clés : `PAIEMENTFF_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PAIEMENTFF](tables.md#paiementff).`IDFF` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID` (`PAIEMENTFF_FF_FK`, ENABLED).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="paiementheuresup"></a>

## PAIEMENTHEURESUP

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non |  |
| `IDMVTCAISSE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDHS` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDFABRICATION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDPERSONNEL` | `VARCHAR2(250 BYTE)` | Oui | FK → PAIE_INFO_PERSONNEL |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Clés étrangères sortantes :

- [PAIEMENTHEURESUP](tables.md#paiementheuresup).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` (`SYS_C008223`, ENABLED).

Vues dépendantes directes (1) : [HS_NON_PAYE](vues.md#hs-non-paye).

Références dans le code : [paie/hs/PaiementHeureSup.java:14](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/hs/PaiementHeureSup.java#L14>).

<a id="paieperseltmere"></a>

## PAIEPERSELTMERE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDRATTACHEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDDEPARTEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MOISREGULARISATION` | `VARCHAR2(10 BYTE)` | Oui |  |
| `ANNEEREGULARISATION` | `VARCHAR2(10 BYTE)` | Oui |  |
| `DATEDEBUT` | `DATE` | Oui |  |
| `DATEFIN` | `DATE` | Oui |  |
| `IDELEMENTPAIE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `PAIEPERSELTMERE_PK` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="paie-archive"></a>

## PAIE_ARCHIVE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(50 BYTE)` | Oui | FK → PAIE_INFO_PERSONNEL |
| `MOIS` | `NUMBER(*,0)` | Oui |  |
| `ANNEE` | `NUMBER(*,0)` | Oui |  |
| `FONCTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |

Clés : `PAIE_ARCHIVE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PAIE_ARCHIVE](tables.md#paie-archive).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` (`PAIE_ARCHIVE_PERSONNEL_FK`, ENABLED).

Références dans le code : [paie/archive/PaieArchive.java:90](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/archive/PaieArchive.java#L90>).

<a id="paie-avancement"></a>

## PAIE_AVANCEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `ID_LOGPERS` | `VARCHAR2(50 BYTE)` | Non |  |
| `DATE_APPLICATION` | `DATE` | Oui |  |
| `DIRECTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `SERVICE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDFONCTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ECHELON` | `NUMBER(*,0)` | Oui |  |
| `DATEDECISION` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REFDECISION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CLASSEE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `INDICEGRADE` | `NUMBER(*,0)` | Oui |  |
| `INDICE_FONCTIONNEL` | `NUMBER(*,0)` | Oui |  |
| `MATRICULE_PATRON` | `VARCHAR2(50 BYTE)` | Oui |  |
| `STATUT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DROIT_HS` | `VARCHAR2(20 BYTE)` | Oui |  |
| `VEHICULEE` | `NUMBER(*,0)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `CTG` | `VARCHAR2(50 BYTE)` | Oui |  |
| `MOTIF` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDUSER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `INDICE_CT` | `NUMBER(*,0)` | Oui |  |
| `CODE_BANQUE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `REGION` | `VARCHAR2(500 BYTE)` | Oui |  |
| `CONTRAT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TYPEPERSONNEL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DUREECONTRAT` | `NUMBER` | Oui |  |
| `MODEPAIEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPEAVANCEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `UNITE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `PAIE_AVANCEMENT_PKEY` (primaire) : `ID`.

Vues dépendantes directes (8) : [EMPLOYE_COMPLET](vues.md#employe-complet), [EMPLOYE_COMPLET2](vues.md#employe-complet2), [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [EMPLOYE_COMPLET_NOU2](vues.md#employe-complet-nou2), [EMPLOYE_COMPLET_PDF](vues.md#employe-complet-pdf), [PAIE_AVANCEMENT_LIBELLE2](vues.md#paie-avancement-libelle2), [PAIE_AVANCEMENT_LIBELLE4](vues.md#paie-avancement-libelle4).

Références dans le code : [paie/avancement/PaieAvancement.java:41](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/avancement/PaieAvancement.java#L41>).

<a id="paie-categorie"></a>

## PAIE_CATEGORIE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TAUX` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `PAIE_CATEGORIE_PKEY` (primaire) : `ID`.

Vues dépendantes directes (8) : [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [LOG_PERSONNEL_AVECCONGE](vues.md#log-personnel-avecconge), [LOG_PERSONNEL_FIN](vues.md#log-personnel-fin), [LOG_PERSONNEL_FIN_CONGE](vues.md#log-personnel-fin-conge), [LOG_PERSONNEL_GRAPHE](vues.md#log-personnel-graphe), [PAIE_AVANCEMENT_LIBELLE2](vues.md#paie-avancement-libelle2), [PAIE_AVANCEMENT_LIBELLE4](vues.md#paie-avancement-libelle4).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="paie-edition"></a>

## PAIE_EDITION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(50 BYTE)` | Non |  |
| `IDELEMENTPAIE` | `VARCHAR2(50 BYTE)` | Non |  |
| `MOIS` | `NUMBER(*,0)` | Non |  |
| `ANNEE` | `NUMBER(*,0)` | Non |  |
| `GAIN` | `NUMBER(30,2)` | Oui |  |
| `RETENUE` | `NUMBER(30,2)` | Oui |  |
| `DATEDEBUT` | `DATE` | Oui |  |
| `DATEFIN` | `DATE` | Oui |  |
| `IDEDITION` | `VARCHAR2(100 BYTE)` | Oui | FK → PAIE_EDITIONMOISANNEE |
| `REMARQUE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `COMPTEGEN_DB` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPTEANA_DB` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPTEGEN_CR` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPTEANA_CR` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDFONCTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `TAUXHORAIRE` | `NUMBER(30,2)` | Oui |  |
| `SALAIREDEBASE` | `NUMBER(30,2)` | Oui |  |
| `MATRICULE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DIRECTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `SERVICE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `MODEPAIEMENT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `NBENFANT` | `NUMBER` | Oui |  |
| `REGROUPEMENT` | `NUMBER` | Oui |  |
| `TEMPORAIRE` | `NUMBER` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `IDPERIODEPAIE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `PAIE_EDITION_PKEY` (primaire) : `ID`.

Clés étrangères sortantes :

- [PAIE_EDITION](tables.md#paie-edition).`IDEDITION` → [PAIE_EDITIONMOISANNEE](tables.md#paie-editionmoisannee).`ID` (`FK_PAIE_EDITIONMOISANNEE`, ENABLED).

Vues dépendantes directes (23) : [DETAILS_PAIE_EDITION_PDF](vues.md#details-paie-edition-pdf), [FRAIS_MEDICAUXMOIS](vues.md#frais-medicauxmois), [NET_MOISANNEE](vues.md#net-moisannee), [PAIE_EDITION_CNAPS](vues.md#paie-edition-cnaps), [PAIE_EDITION_ECRITURE_LIGNE](vues.md#paie-edition-ecriture-ligne), [PAIE_EDITION_ELTPAIE](vues.md#paie-edition-eltpaie), [PAIE_EDITION_GAIN_IMP](vues.md#paie-edition-gain-imp), [PAIE_EDITION_GRP_PERSONNE2](vues.md#paie-edition-grp-personne2), [PAIE_EDITION_LIBCOMPLET](vues.md#paie-edition-libcomplet), [RECAP_SAL_ALL](vues.md#recap-sal-all), [RETRAIT_FRAIS_MEDICAUX_ANALYSE](vues.md#retrait-frais-medicaux-analyse), [SALAIREBASEMOIS](vues.md#salairebasemois), [SITUATION_SALAIRE_AUTRE](vues.md#situation-salaire-autre), [SITUATION_SALAIRE_EDITION_DIST](vues.md#situation-salaire-edition-dist), [TEST_SITUATION_SALAIRE_EDITION](vues.md#test-situation-salaire-edition), [TRAITEMENT_PAIE_LIB](vues.md#traitement-paie-lib), [V1_OSTIE_AFFICHE_T1](vues.md#v1-ostie-affiche-t1), [V1_OSTIE_AFFICHE_T2](vues.md#v1-ostie-affiche-t2), [V1_OSTIE_AFFICHE_T3](vues.md#v1-ostie-affiche-t3), [V1_OSTIE_AFFICHE_T4](vues.md#v1-ostie-affiche-t4), [VUE_CNAPS](vues.md#vue-cnaps), [V_MOYENNE_SALAIRE_PARFONCTION](vues.md#v-moyenne-salaire-parfonction), [V_PAIE_RECAP](vues.md#v-paie-recap).

Références dans le code : [paie/edition/EditionCalcul.java:324](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/EditionCalcul.java#L324>), [paie/edition/Paie_edition.java:73](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/Paie_edition.java#L73>), [paie/employe/AdminPaieInfoPers.java:117](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/AdminPaieInfoPers.java#L117>).

<a id="paie-editionmoisannee"></a>

## PAIE_EDITIONMOISANNEE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(150 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(150 BYTE)` | Oui |  |
| `MOIS` | `NUMBER(*,0)` | Non |  |
| `ANNEE` | `NUMBER(*,0)` | Non |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `GAIN` | `NUMBER(30,2)` | Oui |  |
| `RETENUE` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDUSER` | `VARCHAR2(150 BYTE)` | Oui |  |
| `IDDIRECTION` | `VARCHAR2(150 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `IDPERIODEPAIE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDDEPARTEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `PAIE_EDITIONMOISANNEE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [PAIE_EDITION](tables.md#paie-edition).`IDEDITION` → [PAIE_EDITIONMOISANNEE](tables.md#paie-editionmoisannee).`ID`.
- [TRAITEMENT_PAIE](tables.md#traitement-paie).`IDEDITION` → [PAIE_EDITIONMOISANNEE](tables.md#paie-editionmoisannee).`ID`.

Vues dépendantes directes (6) : [PAIE_EDITIONMOISANNEE_LIB](vues.md#paie-editionmoisannee-lib), [PAIE_EDITIONMOISANNEE_LIB_2](vues.md#paie-editionmoisannee-lib-2), [PAIE_EDITIONMOISANNEE_LIB_3](vues.md#paie-editionmoisannee-lib-3), [PAIE_EDITION_ECRITURE_LIGNE](vues.md#paie-edition-ecriture-ligne), [PAIE_EDITION_LIBCOMPLET](vues.md#paie-edition-libcomplet), [V_MOYENNE_SALAIRE_PARFONCTION](vues.md#v-moyenne-salaire-parfonction).

Références dans le code : [paie/edition/EditionCalcul.java:426](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/EditionCalcul.java#L426>), [paie/edition/PaieEditionmoisannee.java:63](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/PaieEditionmoisannee.java#L63>), [paie/employe/traitement-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/traitement-saisie.jsp#L21>).

<a id="paie-editionmoisannee-stc"></a>

## PAIE_EDITIONMOISANNEE_STC

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(150 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(150 BYTE)` | Oui |  |
| `MOIS` | `NUMBER(*,0)` | Non |  |
| `ANNEE` | `NUMBER(*,0)` | Non |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `GAIN` | `NUMBER(30,2)` | Oui |  |
| `RETENUE` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDUSER` | `VARCHAR2(150 BYTE)` | Oui |  |
| `IDDIRECTION` | `VARCHAR2(150 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |

Clés : `PAIE_EDITIONMOISANNEE_STC_PK` (primaire) : `ID`.

Références dans le code : [paie/edition/EditionCalcul.java:357](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/EditionCalcul.java#L357>).

<a id="paie-edition-stc"></a>

## PAIE_EDITION_STC

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(50 BYTE)` | Non |  |
| `IDELEMENTPAIE` | `VARCHAR2(50 BYTE)` | Non |  |
| `MOIS` | `NUMBER(*,0)` | Non |  |
| `ANNEE` | `NUMBER(*,0)` | Non |  |
| `GAIN` | `NUMBER(30,2)` | Oui |  |
| `RETENUE` | `NUMBER(30,2)` | Oui |  |
| `DATEDEBUT` | `DATE` | Oui |  |
| `DATEFIN` | `DATE` | Oui |  |
| `IDEDITION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `COMPTEGEN_DB` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPTEANA_DB` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPTEGEN_CR` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPTEANA_CR` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDFONCTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `TAUXHORAIRE` | `NUMBER(30,2)` | Oui |  |
| `SALAIREDEBASE` | `NUMBER(30,2)` | Oui |  |
| `MATRICULE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DIRECTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `SERVICE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `MODEPAIEMENT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `NBENFANT` | `NUMBER` | Oui |  |
| `REGROUPEMENT` | `NUMBER` | Oui |  |
| `TEMPORAIRE` | `NUMBER` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `PAIE_EDITION_STC_PKEY` (primaire) : `ID`.

Références dans le code : [paie/edition/EditionCalcul.java:317](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/EditionCalcul.java#L317>).

<a id="paie-fonction"></a>

## PAIE_FONCTION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDGROUPEFONCTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `GRATIFICATION` | `VARCHAR2(5 BYTE)` | Oui |  |
| `IDEMPLOIE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDCONFIG` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `PAIE_FONCTION_PKEY` (primaire) : `ID`.

Tables qui la référencent :

- [ENTRETIENRH](tables.md#entretienrh).`IDFONCTION` → [PAIE_FONCTION](tables.md#paie-fonction).`ID`.
- [ONBOARDING_MERE](tables.md#onboarding-mere).`IDFONCTION` → [PAIE_FONCTION](tables.md#paie-fonction).`ID`.
- [PAIE_PERSONNEL_ELEMENTPAIE](tables.md#paie-personnel-elementpaie).`IDFONCTION` → [PAIE_FONCTION](tables.md#paie-fonction).`ID`.

Vues dépendantes directes (42) : [CHECKLIST_MERE_LIB](vues.md#checklist-mere-lib), [DEMANDE_LIBCOMPLET](vues.md#demande-libcomplet), [DEMANDE_LIBCOMPLET2](vues.md#demande-libcomplet2), [DEMANDE_LIBCOMPLET3](vues.md#demande-libcomplet3), [DETAILS_PAIE_EDITION_FINALPDF](vues.md#details-paie-edition-finalpdf), [DET_PAIE_EDIT_FINAL_PDF_CONID](vues.md#det-paie-edit-final-pdf-conid), [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [EMPLOYE_COMPLET_PDF](vues.md#employe-complet-pdf), [EMP_ONBOARDING_COM](vues.md#emp-onboarding-com), [EMP_ONBOARDING_SPEC](vues.md#emp-onboarding-spec), [ENTRETIENRH_LIB](vues.md#entretienrh-lib), [EVALUATION_ANNUELLE_LIB](vues.md#evaluation-annuelle-lib), [EVALUATION_A_CHAUD_LIB](vues.md#evaluation-a-chaud-lib), [FICHE_POSTE_LIB](vues.md#fiche-poste-lib), [FRAIS_MEDICAUX_ALL](vues.md#frais-medicaux-all), [HEURESUPFABRICATION_CPL](vues.md#heuresupfabrication-cpl), [LOG_PERSONNEL_INFOCOMPLET3](vues.md#log-personnel-infocomplet3), [LOG_PERSONNEL_INFOPOINTAGE](vues.md#log-personnel-infopointage), [OBJECTIF_ANNUEL_LIB](vues.md#objectif-annuel-lib), [ONBOARDING_MERE_LIB](vues.md#onboarding-mere-lib), [ORGANIGRAMMELIB](vues.md#organigrammelib), [PAIEINFOPERSELTPAIECOMPLET2](vues.md#paieinfoperseltpaiecomplet2), [PAIEPERS_ELP_CPL](vues.md#paiepers-elp-cpl), [PAIE_AVANCEMENT_LIBELLE2](vues.md#paie-avancement-libelle2), [PAIE_AVANCEMENT_LIBELLE4](vues.md#paie-avancement-libelle4), [PAIE_FONCTIONLIBELLE](vues.md#paie-fonctionlibelle), [PAIE_INFO_PERSONNEL_HISTORIC_3](vues.md#paie-info-personnel-historic-3), [PAIE_PERSONNEL_ELEMENTPAIE_LIB](vues.md#paie-personnel-elementpaie-lib), [PAIE_PERS_ELTPAIE_LIB2](vues.md#paie-pers-eltpaie-lib2), [SITUATION_SALAIRE_EDITION_DIST](vues.md#situation-salaire-edition-dist), [TEST_SITUATION_SALAIRE_EDITION](vues.md#test-situation-salaire-edition), [V1_OSTIE_AFFICHE_T1](vues.md#v1-ostie-affiche-t1), [V1_OSTIE_AFFICHE_T2](vues.md#v1-ostie-affiche-t2), [V1_OSTIE_AFFICHE_T3](vues.md#v1-ostie-affiche-t3), [V1_OSTIE_AFFICHE_T4](vues.md#v1-ostie-affiche-t4), [V_ACCIDENT_PDF](vues.md#v-accident-pdf), [V_HIERARCHIE_PROFESSIONNELLE](vues.md#v-hierarchie-professionnelle), [V_MOYENNE_SALAIRE_PARFONCTION](vues.md#v-moyenne-salaire-parfonction), [V_MOYENNE_SALAIRE_PAR_FONCTION](vues.md#v-moyenne-salaire-par-fonction), [V_PROGRAMME_INTEGRATION_LIB](vues.md#v-programme-integration-lib), [V_PROG_INTEGRATION_DETAIL_LIB](vues.md#v-prog-integration-detail-lib).

Références dans le code : [paie/PaieFonction.java:12](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/PaieFonction.java#L12>), [paie/edition/PaieFonction.java:22](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/PaieFonction.java#L22>), [paie/avancement/avancement-liste.jsp:40](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-liste.jsp#L40>), [paie/editions/etatirsa.jsp:37](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/editions/etatirsa.jsp#L37>), [entretient/entretientrh-saisie.jsp:62](<../../projet-standard - Copie/arbiochem-war/web/pages/entretient/entretientrh-saisie.jsp#L62>) ; 11 autres fichiers dans `usages-code.json`.

<a id="paie-groupefonction"></a>

## PAIE_GROUPEFONCTION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `PK_ID_PAIE_GROUPEFONCTION` (primaire) : `ID`.

Vues dépendantes directes (1) : [PAIE_FONCTIONLIBELLE](vues.md#paie-fonctionlibelle).

Références dans le code : [paie/fonction/paiefonction-saisie.jsp:31](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/fonction/paiefonction-saisie.jsp#L31>).

<a id="paie-info-personnel"></a>

## PAIE_INFO_PERSONNEL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATESAISIE` | `DATE` | Oui |  |
| `MATRICULE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `LIEU_NAISSANCE_COMMUNE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `LIEU_DELIVRANCE_CIN` | `VARCHAR2(50 BYTE)` | Oui |  |
| `SITUATION_MATRIMONIAL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `INITIALE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CTURGENCE_NOM_PRENOM` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CTURGENCE_TELEPHONE1` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CTURGENCE_TELEPHONE2` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CTURGENCE_TELEPHONE3` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDCONJOINT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CODE_AGENCE_BANQUE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `BANQUE_NUMERO_COMPTE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `BANQUE_COMPTE_CLE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATEEMBAUCHE` | `DATE` | Oui |  |
| `IDFONCTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDCATEGORIE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `MODE_PAIEMENT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CLASSEE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `INDICEGRADE` | `NUMBER(*,0)` | Oui |  |
| `INDICE_FONCTIONNEL` | `NUMBER(*,0)` | Oui |  |
| `MATRICULE_PATRON` | `VARCHAR2(50 BYTE)` | Oui |  |
| `STATUT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DROIT_HS` | `VARCHAR2(1 BYTE)` | Oui |  |
| `VEHICULEE` | `NUMBER(*,0)` | Oui |  |
| `ECHELON` | `NUMBER(*,0)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `CTG` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDUSER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `INDICE_CT` | `NUMBER(*,0)` | Oui |  |
| `DATEPROMOTION` | `DATE` | Oui |  |
| `NUMERO_CNAPS` | `VARCHAR2(50 BYTE)` | Oui |  |
| `NUMERO_OSTIE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `TEMPORAIRE` | `NUMBER(*,0)` | Oui |  |
| `N_EMBAUCHE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATE_DEPART` | `DATE` | Oui |  |
| `N_DEPART` | `VARCHAR2(50 BYTE)` | Oui |  |
| `NBENFANT` | `NUMBER(*,0)` | Oui |  |
| `HEUREJOURNALIER` | `NUMBER(30,2)` | Oui |  |
| `HEUREHEBDOMADAIRE` | `NUMBER(30,2)` | Oui |  |
| `HEUREMENSUEL` | `NUMBER(30,2)` | Oui |  |
| `INDESIRABLE` | `NUMBER(*,0)` | Oui |  |
| `DUREE` | `NUMBER(30,2)` | Oui |  |
| `TELEPHONE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `MAIL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ADRESSE_LIGNE1` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ADRESSE_LIGNE2` | `VARCHAR2(100 BYTE)` | Oui |  |
| `CODE_POSTAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `REGION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDCATEGORIE_PAIE` | `VARCHAR2(500 BYTE)` | Oui | FK → CATEGORIE_PAIE |
| `IDQUALIFICATION` | `VARCHAR2(500 BYTE)` | Oui | FK → QUALIFICATION_PAIE |
| `FORMATION` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `DISCIPLINE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `ANNEEEXPERIENCE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `PERSONNEL_ETAT` | `NUMBER(*,0)` | Oui |  |
| `PERIODE_ESSAI` | `NUMBER(*,0)` | Oui |  |
| `DEBUTCONTRAT` | `DATE` | Oui |  |
| `FINCONTRAT` | `DATE` | Oui |  |
| `REFUSER` | `NUMBER(*,0)` | Oui |  |
| `TYPECONTRAT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDDEPARTEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDBANQUE` | `VARCHAR2(255 BYTE)` | Oui | FK → BANQUE |
| `IDAGENCE` | `VARCHAR2(255 BYTE)` | Oui | FK → BANQUE_AGENCE |
| `IDSTATUT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `SALAIREBASE` | `NUMBER(30,2)` | Oui |  |
| `TAUXHORAIRE` | `NUMBER(30,2)` | Oui |  |
| `UNITE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `RETRAITECOMPL` | `NUMBER(10,0)` | Oui |  |

Clés : `PAIE_INFO_PERSONNEL_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`IDCATEGORIE_PAIE` → [CATEGORIE_PAIE](tables.md#categorie-paie).`ID` (`CATEGORIE_PAIE_FK`, ENABLED).
- [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`IDAGENCE` → [BANQUE_AGENCE](tables.md#banque-agence).`ID` (`FK_PAIEINFO_AGENCE`, ENABLED).
- [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`IDBANQUE` → [BANQUE](tables.md#banque).`ID` (`FK_PAIEINFO_BANQUE`, ENABLED).
- [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`IDQUALIFICATION` → [QUALIFICATION_PAIE](tables.md#qualification-paie).`ID` (`QUALIFICATION_PAIE_FK`, ENABLED).

Tables qui la référencent :

- [CHARGEPERSONNELTEMP](tables.md#chargepersonneltemp).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID`.
- [DEMANDE](tables.md#demande).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID`.
- [ENTRETIENRH](tables.md#entretienrh).`IDEVALUATEUR` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID`.
- [ENTRETIENRH](tables.md#entretienrh).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID`.
- [EVALUATION_A_CHAUD](tables.md#evaluation-a-chaud).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID`.
- [EVALUATION_A_CHAUD](tables.md#evaluation-a-chaud).`IDINTERVENANT` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID`.
- [HISTORIQUEDEMANDE](tables.md#historiquedemande).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID`.
- [MOUVEMENTABSENCE](tables.md#mouvementabsence).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID`.
- [PAIEMENTHEURESUP](tables.md#paiementheuresup).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID`.
- [PAIE_ARCHIVE](tables.md#paie-archive).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID`.
- [RESSOURCEPARFABRICATION](tables.md#ressourceparfabrication).`IDRESSOURCE` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID`.
- [SANCTION](tables.md#sanction).`IDPERSONNE` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID`.

Vues dépendantes directes (83) : [AVANCE_LIB](vues.md#avance-lib), [AVANCE_LIB2](vues.md#avance-lib2), [CHECKLIST_MERE_LIB](vues.md#checklist-mere-lib), [CONGE_DROIT](vues.md#conge-droit), [DEMANDE_LIBCOMPLET](vues.md#demande-libcomplet), [DEMANDE_LIBCOMPLET2](vues.md#demande-libcomplet2), [DEMANDE_LIBCOMPLET3](vues.md#demande-libcomplet3), [DETAILS_PAIE_EDITION_FINALPDF](vues.md#details-paie-edition-finalpdf), [DETAILS_PAIE_EDITION_PDF](vues.md#details-paie-edition-pdf), [DET_PAIE_EDIT_FINAL_PDF_CONID](vues.md#det-paie-edit-final-pdf-conid), [EMPLOYE_COMPLET](vues.md#employe-complet), [EMPLOYE_COMPLET2](vues.md#employe-complet2), [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [EMPLOYE_COMPLET_NOU2](vues.md#employe-complet-nou2), [EMPLOYE_COMPLET_PDF](vues.md#employe-complet-pdf), [EVALUATION_ANNUELLE_LIB](vues.md#evaluation-annuelle-lib), [EVALUATION_A_CHAUD_LIB](vues.md#evaluation-a-chaud-lib), [EVALUATION_FROID_LIB](vues.md#evaluation-froid-lib), [FRAIS_MEDICAUX_ALL](vues.md#frais-medicaux-all), [HEURESUPFABRICATION_CPL](vues.md#heuresupfabrication-cpl), [HEURESUPFABRICATION_CUMUL](vues.md#heuresupfabrication-cumul), [HEURESUPFABRICATION_TOTAL](vues.md#heuresupfabrication-total), [HS_FABBRICATION_SEMAINECPL](vues.md#hs-fabbrication-semainecpl), [HS_FAB_SEMAINE_PARTRANCHE](vues.md#hs-fab-semaine-partranche), [HS_MOIS](vues.md#hs-mois), [HS_MOIS_PARTRANCHE](vues.md#hs-mois-partranche), [LOG_PERSONNEL_AVECCONGE](vues.md#log-personnel-avecconge), [LOG_PERSONNEL_FIN](vues.md#log-personnel-fin), [LOG_PERSONNEL_FIN_CONGE](vues.md#log-personnel-fin-conge), [LOG_PERSONNEL_GRAPHE](vues.md#log-personnel-graphe), [LOG_PERSONNEL_INFOCOMPLET](vues.md#log-personnel-infocomplet), [LOG_PERSONNEL_INFOCOMPLET3](vues.md#log-personnel-infocomplet3), [LOG_PERSONNEL_INFOPOINTAGE](vues.md#log-personnel-infopointage), [LOG_PERSONNEL_V2](vues.md#log-personnel-v2), [LOG_PERS_NON_VALIDE_LIB](vues.md#log-pers-non-valide-lib), [LOG_PERS_NON_VALIDE_LIB_3](vues.md#log-pers-non-valide-lib-3), [LOG_PERS_NON_VALIDE_LIB_4](vues.md#log-pers-non-valide-lib-4), [LOG_PERS_NON_VALIDE_LIB_5](vues.md#log-pers-non-valide-lib-5), [LOG_PERS_NON_VALIDE_LIB_5_TEST](vues.md#log-pers-non-valide-lib-5-test), [LOG_PERS_STC](vues.md#log-pers-stc), [OBJECTIF_ANNUEL_LIB](vues.md#objectif-annuel-lib), [ORGANIGRAMMELIB](vues.md#organigrammelib), [PAIEPERS_ELP_CPL](vues.md#paiepers-elp-cpl), [PAIE_AVANCEMENT_LIBELLE2](vues.md#paie-avancement-libelle2), [PAIE_AVANCEMENT_LIBELLE4](vues.md#paie-avancement-libelle4), [PAIE_EDITION_ECRITURE_LIGNE](vues.md#paie-edition-ecriture-ligne), [PAIE_INFO_EMBAUCHE](vues.md#paie-info-embauche), [PAIE_INFO_JOURS_MOIS](vues.md#paie-info-jours-mois), [PAIE_INFO_PERSONNELDIRECT](vues.md#paie-info-personneldirect), [PAIE_INFO_PERSONNEL_ENFANT](vues.md#paie-info-personnel-enfant), [PAIE_INFO_PERSONNEL_GROUPE](vues.md#paie-info-personnel-groupe), [PAIE_INFO_PERSONNEL_LIBCOMPLET](vues.md#paie-info-personnel-libcomplet), [PAIE_INFO_PERSONNEL_SPEC](vues.md#paie-info-personnel-spec), [PAIE_PERS_ELTPAIE_LIB2](vues.md#paie-pers-eltpaie-lib2), [PARTICIPATION_FORMATION_LIB](vues.md#participation-formation-lib), [PERSONNEL_MATRICULE](vues.md#personnel-matricule), [POINTAGECANTINE_CPL](vues.md#pointagecantine-cpl), [POINTAGEVISEE_VISA_MULTIPLE](vues.md#pointagevisee-visa-multiple), [POINTAGEVISEE_VISA_MULTIPLE_1](vues.md#pointagevisee-visa-multiple-1), [REMBOURSEMENTLIB](vues.md#remboursementlib), [RESSOURCEPARFABRICATIONCOMPLET](vues.md#ressourceparfabricationcomplet), [RESSOURCEPARFAB_CPL_RECTIF](vues.md#ressourceparfab-cpl-rectif), [SITUATION_SALAIRE_EDITION](vues.md#situation-salaire-edition), [SITUATION_SALAIRE_EDITION_DIST](vues.md#situation-salaire-edition-dist), [SOLDECONGE_FIN_2023](vues.md#soldeconge-fin-2023), [SOLDECONGE_PERS_CPL](vues.md#soldeconge-pers-cpl), [SOLDE_CONGE_PERS](vues.md#solde-conge-pers), [SOLDE_FORMATION_SYNDICALE](vues.md#solde-formation-syndicale), [SUIVI_PRESENCE_FILLE_LIB](vues.md#suivi-presence-fille-lib), [TEST_SITUATION_SALAIRE_EDITION](vues.md#test-situation-salaire-edition), [V1_OSTIE_AFFICHE_T1](vues.md#v1-ostie-affiche-t1), [V1_OSTIE_AFFICHE_T2](vues.md#v1-ostie-affiche-t2), [V1_OSTIE_AFFICHE_T3](vues.md#v1-ostie-affiche-t3), [V1_OSTIE_AFFICHE_T4](vues.md#v1-ostie-affiche-t4), [VUE_CONTRAT_LIB](vues.md#vue-contrat-lib), [VUE_ID_MATRICULE](vues.md#vue-id-matricule), [VW_HS_CUMUL_WEEK](vues.md#vw-hs-cumul-week), [V_ACCIDENT_LIB](vues.md#v-accident-lib), [V_ACCIDENT_PDF](vues.md#v-accident-pdf), [V_MOYENNE_SALAIRE_PARFONCTION](vues.md#v-moyenne-salaire-parfonction), [V_PROGRAMME_INTEGRATION_LIB](vues.md#v-programme-integration-lib), [V_PROG_INTEGRATION_DETAIL_LIB](vues.md#v-prog-integration-detail-lib).

Références dans le code : [paie/CategorieQualification.java:181](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/CategorieQualification.java#L181>), [paie/avancement/PaieAvancement.java:217](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/avancement/PaieAvancement.java#L217>), [paie/employe/PaieInfoPersonnel.java:548](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/PaieInfoPersonnel.java#L548>), [paie/employe/PaieInfoPersonnelEnfant.java:52](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/PaieInfoPersonnelEnfant.java#L52>), [paie/employe/PaieInfoPersonnelEnfantUpdate.java:19](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/PaieInfoPersonnelEnfantUpdate.java#L19>) ; 1 autres fichiers dans `usages-code.json`.

<a id="paie-personnel-elementpaie"></a>

## PAIE_PERSONNEL_ELEMENTPAIE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `CODE_RUBRIQUE` | `VARCHAR2(100 BYTE)` | Non |  |
| `DATE_DEBUT` | `DATE` | Oui |  |
| `DATE_FIN` | `DATE` | Oui |  |
| `GAIN` | `NUMBER(30,2)` | Oui |  |
| `RETENUE` | `NUMBER(30,2)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDPERSONNEL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Non |  |
| `ID_OBJET` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDUSER` | `VARCHAR2(100 BYTE)` | Oui |  |
| `MOISREGULARISATION` | `VARCHAR2(10 BYTE)` | Oui |  |
| `ANNEEREGULARISATION` | `VARCHAR2(10 BYTE)` | Oui |  |
| `IDCATEGORIE_QUALIFICATION` | `VARCHAR2(100 BYTE)` | Oui | FK → CATEGORIE_QUALIFICATION |
| `IDFONCTION` | `VARCHAR2(100 BYTE)` | Oui | FK → PAIE_FONCTION |
| `POURCENTAGE` | `NUMBER(30,2)` | Oui |  |
| `QUANTITE` | `NUMBER(30,2)` | Oui |  |
| `UNITE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `PAIE_PERS_ELPAIE_PKEY` (primaire) : `ID`.

Clés étrangères sortantes :

- [PAIE_PERSONNEL_ELEMENTPAIE](tables.md#paie-personnel-elementpaie).`IDCATEGORIE_QUALIFICATION` → [CATEGORIE_QUALIFICATION](tables.md#categorie-qualification).`ID` (`PAIE_CATEGORIE_FK`, ENABLED).
- [PAIE_PERSONNEL_ELEMENTPAIE](tables.md#paie-personnel-elementpaie).`IDFONCTION` → [PAIE_FONCTION](tables.md#paie-fonction).`ID` (`PAIE_PERSONNEL_FONCTION_FK`, ENABLED).

Vues dépendantes directes (4) : [PAIEINFOPERSELTPAIECOMPLET2](vues.md#paieinfoperseltpaiecomplet2), [PAIEPERS_ELP_CPL](vues.md#paiepers-elp-cpl), [PAIE_PERSONNEL_ELEMENTPAIE_LIB](vues.md#paie-personnel-elementpaie-lib), [PAIE_PERS_ELTPAIE_LIB2](vues.md#paie-pers-eltpaie-lib2).

Références dans le code : [mg/cnaps/paie/PaiePersonnelElementpaie.java:49](<../../projet-standard - Copie/arbiochem-ejb/src/java/mg/cnaps/paie/PaiePersonnelElementpaie.java#L49>), [paie/elementpaie/PaiePersonnelElementpaie.java:83](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/elementpaie/PaiePersonnelElementpaie.java#L83>), [paie/hs/HsMois.java:38](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/hs/HsMois.java#L38>), [paie/fonction/paiepersonnelelementpaie-saisie.jsp:15](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/fonction/paiepersonnelelementpaie-saisie.jsp#L15>), [paie/edition/EditionCalcul.java:42](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/EditionCalcul.java#L42>).

<a id="paie-rubrique"></a>

## PAIE_RUBRIQUE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `RANG` | `NUMBER(*,0)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `COMPTEPCG` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CODE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `TYPERUBRIQUE` | `VARCHAR2(1 BYTE)` | Oui |  |
| `BCS` | `VARCHAR2(50 BYTE)` | Oui |  |
| `BG` | `VARCHAR2(1 BYTE)` | Oui |  |
| `IMPOSABLE` | `VARCHAR2(1 BYTE)` | Oui |  |
| `NATURE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `AVANTAGE` | `VARCHAR2(1 BYTE)` | Oui |  |
| `FORMULE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ISINFINI` | `NUMBER(*,0)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Non |  |
| `CPT_GEN_DB` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CPT_GEN_CR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CPT_ANA_DB` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CPT_ANA_CR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `AFFICHER` | `NUMBER(*,0)` | Oui |  |
| `REGROUPEMENT` | `NUMBER(*,0)` | Oui |  |
| `ARRONDI` | `NUMBER(*,0)` | Oui |  |
| `INSERTED` | `NUMBER(*,0)` | Oui |  |
| `SOMMABLE` | `NUMBER(*,0)` | Oui |  |
| `BENEFICIAIRE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `REMARQUEFORMULE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `UNITEFORMULE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `QTEFORMULE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `MAJORATION` | `NUMBER(*,0)` | Oui |  |
| `QTE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `RANGBULLETIN` | `NUMBER(*,0)` | Oui |  |

Clés : `PAIE_RUBRIQUE_PKEY` (primaire) : `ID`.

Tables qui la référencent :

- [DETFORMU](tables.md#detformu).`MERE` → [PAIE_RUBRIQUE](tables.md#paie-rubrique).`ID`.

Vues dépendantes directes (13) : [FRAIS_MEDICAUXMOIS](vues.md#frais-medicauxmois), [PAIEINFOPERSELTPAIECOMPLET2](vues.md#paieinfoperseltpaiecomplet2), [PAIEPERS_ELP_CPL](vues.md#paiepers-elp-cpl), [PAIE_EDITION_CNAPS](vues.md#paie-edition-cnaps), [PAIE_EDITION_ECRITURE_LIGNE](vues.md#paie-edition-ecriture-ligne), [PAIE_EDITION_ELTPAIE](vues.md#paie-edition-eltpaie), [PAIE_EDITION_GAIN_IMP](vues.md#paie-edition-gain-imp), [PAIE_EDITION_LIBCOMPLET](vues.md#paie-edition-libcomplet), [PAIE_PERSONNEL_ELEMENTPAIE_LIB](vues.md#paie-personnel-elementpaie-lib), [PAIE_PERS_ELTPAIE_LIB2](vues.md#paie-pers-eltpaie-lib2), [SALAIREBASEMOIS](vues.md#salairebasemois), [SITUATION_SALAIRE_EDITION_DIST](vues.md#situation-salaire-edition-dist), [TEST_SITUATION_SALAIRE_EDITION](vues.md#test-situation-salaire-edition).

Références dans le code : [paie/employe/PaieRubrique.java:44](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/PaieRubrique.java#L44>), [paie/fonction/paiepersonnelelementpaie-liste.jsp:40](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/fonction/paiepersonnelelementpaie-liste.jsp#L40>), [paie/avance/paieperseltpaie-avance-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avance/paieperseltpaie-avance-saisie.jsp#L33>), [paie/eltpaie/paieperseltpaie-indemnite-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/eltpaie/paieperseltpaie-indemnite-saisie.jsp#L33>), [paie/fonction/paiepersonnelelementpaie-modif.jsp:36](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/fonction/paiepersonnelelementpaie-modif.jsp#L36>) ; 1 autres fichiers dans `usages-code.json`.

<a id="paie-soldetoutcompte"></a>

## PAIE_SOLDETOUTCOMPTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `ID_EMPLOYER` | `VARCHAR2(100 BYTE)` | Non |  |
| `DATE_SOLDE` | `DATE` | Non |  |
| `MONTANT` | `NUMBER(30,2)` | Non |  |
| `MOTIF` | `VARCHAR2(250 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDUSER` | `VARCHAR2(150 BYTE)` | Oui |  |
| `MONTANTCONGE` | `NUMBER(30,2)` | Oui |  |

Clés : `PAIE_SOLDETOUTCOMPTE_PK` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="paie-statut"></a>

## PAIE_STATUT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `PAIE_STATUT_PK` (primaire) : `ID`.

Vues dépendantes directes (2) : [EMPLOYE_COMPLET](vues.md#employe-complet), [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2).

Références dans le code : [paie/DeroulanteEmbaucheData.java:52](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/DeroulanteEmbaucheData.java#L52>), [paie/employe/infopersonnel-saisie.jsp:77](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/infopersonnel-saisie.jsp#L77>).

<a id="paramcompta"></a>

## PARAMCOMPTA

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `PARAMCOMPTA_PK` (primaire) : `ID`.

Références dans le code : [paramCompta/ParamComptaStatique.java:23](<../../projet-standard - Copie/arbiochem-ejb/src/java/paramCompta/ParamComptaStatique.java#L23>), [compta/paramCompta/paramCompta-fiche.jsp:12](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/paramCompta/paramCompta-fiche.jsp#L12>), [compta/paramCompta/paramCompta-liste.jsp:8](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/paramCompta/paramCompta-liste.jsp#L8>), [compta/paramCompta/paramCompta-saisie.jsp:14](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/paramCompta/paramCompta-saisie.jsp#L14>).

<a id="paramcrypt"></a>

## PARAMCRYPT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `NIVEAU` | `NUMBER(*,0)` | Oui |  |
| `CROISSANTE` | `NUMBER(*,0)` | Oui |  |
| `IDUTILISATEUR` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `PK_PARAMCRYPT` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="parquet"></a>

## PARQUET

Référentiel des parquets utilisés dans les bâtiments.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007531` (primaire) : `ID`.

Tables qui la référencent :

- [BATIMENTDETAIL](tables.md#batimentdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID`.
- [DISTRIBUTIONALIMENTDETAIL](tables.md#distributionalimentdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID`.
- [ECLOSION](tables.md#eclosion).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID`.
- [FUMIGATION](tables.md#fumigation).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID`.
- [MIRAGEDETAIL](tables.md#miragedetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID`.
- [MISEENINCUBATEURDETAIL](tables.md#miseenincubateurdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID`.
- [PESEEPOUSSIN](tables.md#peseepoussin).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID`.
- [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID`.
- [SUIVIJOURNALIERDETAIL](tables.md#suivijournalierdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID`.
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDPARQUETARRIVE` → [PARQUET](tables.md#parquet).`ID`.
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDPARQUETDEPART` → [PARQUET](tables.md#parquet).`ID`.
- [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID`.
- [TRIAGEOEUF](tables.md#triageoeuf).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID`.
- [TRIAGEQUALITEPOUSSINDETAIL](tables.md#triagequalitepoussindetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID`.
- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID`.

Vues dépendantes directes (15) : [BATIMENTDETAIL_LIB](vues.md#batimentdetail-lib), [DISTRIBUTIONALIMENTDETAIL_LIB](vues.md#distributionalimentdetail-lib), [ECLOSION_LIB](vues.md#eclosion-lib), [FUMIGATION_LIB](vues.md#fumigation-lib), [MIRAGEDETAIL_LIB](vues.md#miragedetail-lib), [MISEENINCUBATEURDETAIL_LIB](vues.md#miseenincubateurdetail-lib), [PARQUET_BATIMENT_LIB](vues.md#parquet-batiment-lib), [PESEEPOUSSIN_LIB](vues.md#peseepoussin-lib), [RECEPTIONOACDETAIL_LIB](vues.md#receptionoacdetail-lib), [SUIVIJOURNALIERDETAIL_LIB](vues.md#suivijournalierdetail-lib), [TRANSFERTPOULETDETAIL_LIB](vues.md#transfertpouletdetail-lib), [TRIAGEBATPARQUETDETAIL_LIB](vues.md#triagebatparquetdetail-lib), [TRIAGEOEUF_LIB](vues.md#triageoeuf-lib), [TRIAGEQUALITEPOUSSINDETAIL_LIB](vues.md#triagequalitepoussindetail-lib), [VACCINATIONPOUSSINDETAIL_LIB](vues.md#vaccinationpoussindetail-lib).

Références dans le code : [ferme/configuration/Parquet.java:12](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/configuration/Parquet.java#L12>), [ferme/configuration/parquet-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/parquet-saisie.jsp#L19>), [ferme/aliment/distributionaliment-saisie.jsp:50](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/aliment/distributionaliment-saisie.jsp#L50>), [ferme/configuration/batiment-saisie.jsp:42](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/batiment-saisie.jsp#L42>), [ferme/pesee/peseepoussin-saisie.jsp:92](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/pesee/peseepoussin-saisie.jsp#L92>) ; 3 autres fichiers dans `usages-code.json`.

<a id="participation-formation"></a>

## PARTICIPATION_FORMATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDACTIONFORMATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDPERSONNEL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATEINSCRIPTION` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(38,0)` | Oui |  |

Clés : `SYS_C007532` (primaire) : `ID`.

Tables qui la référencent :

- [SUIVI_PRESENCE_FILLE](tables.md#suivi-presence-fille).`IDPARTICIPATIONFORMATION` → [PARTICIPATION_FORMATION](tables.md#participation-formation).`ID`.

Vues dépendantes directes (1) : [PARTICIPATION_FORMATION_LIB](vues.md#participation-formation-lib).

Références dans le code : [paie/formation/ParticipationFormation.java:59](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formation/ParticipationFormation.java#L59>).

<a id="pays"></a>

## PAYS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `PK_PAYS` (primaire) : `ID`.

Vues dépendantes directes (2) : [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3).

Références dans le code : [paie/annexe/Pays.java:12](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/annexe/Pays.java#L12>).

<a id="periodepaie"></a>

## PERIODEPAIE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `MOIS` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MOISLIB` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATEDEBUT` | `DATE` | Oui |  |
| `DATEFIN` | `DATE` | Oui |  |
| `IDCATEGORIEPAIE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ANNEE` | `NUMBER(10,0)` | Oui |  |
| `ETAT` | `NUMBER(38,0)` | Oui |  |

Clés : `SYS_C007535` (primaire) : `ID`.

Vues dépendantes directes (5) : [HS_FABRICATION_SEMAINE](vues.md#hs-fabrication-semaine), [HS_FAB_SEMAINE_PARTRANCHE](vues.md#hs-fab-semaine-partranche), [PAIE_EDITIONMOISANNEE_LIB_3](vues.md#paie-editionmoisannee-lib-3), [PERIODEPAIELIB](vues.md#periodepaielib), [V_HS_FABRICATION_DETAIL](vues.md#v-hs-fabrication-detail).

Références dans le code : [paie/edition/EditionCalcul.java:52](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/EditionCalcul.java#L52>), [paie/edition/PeriodePaie.java:20](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/PeriodePaie.java#L20>).

<a id="permis"></a>

## PERMIS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007537` (primaire) : `ID`.

Tables qui la référencent :

- [FICHE_POSTE](tables.md#fiche-poste).`IDPERMIS` → [PERMIS](tables.md#permis).`ID`.

Vues dépendantes directes (1) : [FICHE_POSTE_LIB](vues.md#fiche-poste-lib).

Références dans le code : [poste/ficheposte-saisie.jsp:30](<../../projet-standard - Copie/arbiochem-war/web/pages/poste/ficheposte-saisie.jsp#L30>).

<a id="personnel"></a>

## PERSONNEL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `NOM` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TELEPHONE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MAIL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ADRESSE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDDEPARTEMENT` | `VARCHAR2(50 BYTE)` | Oui | FK → DEPARTEMENTMAINTENANCE |

Clés : `SYS_C007539` (primaire) : `ID`.

Clés étrangères sortantes :

- [PERSONNEL](tables.md#personnel).`IDDEPARTEMENT` → [DEPARTEMENTMAINTENANCE](tables.md#departementmaintenance).`ID` (`SYS_C008074`, ENABLED).

Tables qui la référencent :

- [ATTRIBUTIONELEMENT](tables.md#attributionelement).`IDPERSONNEL` → [PERSONNEL](tables.md#personnel).`ID`.
- [FABRICATIONFILLE](tables.md#fabricationfille).`OPERATEUR` → [PERSONNEL](tables.md#personnel).`ID`.
- [HISTORIQUEINSPECTIONMERE](tables.md#historiqueinspectionmere).`IDINSPECTEUR` → [PERSONNEL](tables.md#personnel).`ID`.
- [INSPECTIONMERE](tables.md#inspectionmere).`IDINSPECTEUR` → [PERSONNEL](tables.md#personnel).`ID`.
- [TRAVAUXFILLE](tables.md#travauxfille).`OPERATEUR` → [PERSONNEL](tables.md#personnel).`ID`.

Vues dépendantes directes (10) : [ATTRIBUTIONELEMENTLIB](vues.md#attributionelementlib), [FABRICATIONFILLECPL](vues.md#fabricationfillecpl), [HISTORIQUEINSPECTIONLIB](vues.md#historiqueinspectionlib), [INSPECTIONMERELIB](vues.md#inspectionmerelib), [MOTRAVAUXLIB](vues.md#motravauxlib), [PERSONNEL_MATRICULE](vues.md#personnel-matricule), [PERSONNEMAINTENANCECPL](vues.md#personnemaintenancecpl), [PROCESSLIB](vues.md#processlib), [PROCESSMAINTENANCELIB](vues.md#processmaintenancelib), [TRAVAUXFILLECPL](vues.md#travauxfillecpl).

Références dans le code : [personnel/Personnel.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/personnel/Personnel.java#L10>), [personnel/personnel-fiche.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/personnel/personnel-fiche.jsp#L23>), [personnel/personnel-liste.jsp:14](<../../projet-standard - Copie/arbiochem-war/web/pages/personnel/personnel-liste.jsp#L14>), [fabrication/ressource-modif-multiple.jsp:36](<../../projet-standard - Copie/arbiochem-war/web/pages/fabrication/ressource-modif-multiple.jsp#L36>), [inspection/inspection-saisie.jsp:36](<../../projet-standard - Copie/arbiochem-war/web/pages/inspection/inspection-saisie.jsp#L36>) ; 6 autres fichiers dans `usages-code.json`.

<a id="pertegainimprevue"></a>

## PERTEGAINIMPREVUE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(200 BYTE)` | Oui |  |
| `IDTYPEGAINPERTE` | `VARCHAR2(100 BYTE)` | Oui | FK → TYPEGAINPERTE |
| `PERTE` | `NUMBER(12,2)` | Oui |  |
| `GAIN` | `NUMBER(12,2)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `TVA` | `NUMBER(4,2)` | Oui |  |
| `TIERS` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `PERTEGAINIMPREVUE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PERTEGAINIMPREVUE](tables.md#pertegainimprevue).`IDTYPEGAINPERTE` → [TYPEGAINPERTE](tables.md#typegainperte).`ID` (`PERTE_TYPEGAIN_FK`, ENABLED).

Vues dépendantes directes (2) : [COMPTA_SOUSECRITURE_SANSPG](vues.md#compta-sousecriture-sanspg), [PERTEGAINIMPREVUELIB](vues.md#pertegainimprevuelib).

Références dans le code : [pertegain/PerteGainImprevue.java:34](<../../projet-standard - Copie/arbiochem-ejb/src/java/pertegain/PerteGainImprevue.java#L34>).

<a id="pertegainutilise"></a>

## PERTEGAINUTILISE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `PGUTILISE_PK` (primaire) : `ID`.

Vues dépendantes directes (1) : [PERTE_GRPORIGINE_FACT](vues.md#perte-grporigine-fact).

Références dans le code : [faturefournisseur/RepartirionPG.java:69](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/RepartirionPG.java#L69>).

<a id="peseepoussin"></a>

## PESEEPOUSSIN

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DATEPESEE` | `DATE` | Oui |  |
| `IDTYPEPESEE` | `VARCHAR2(100 BYTE)` | Oui | FK → TYPEPESEE |
| `IDRESPONSABLE` | `VARCHAR2(100 BYTE)` | Oui | FK → LOG_PERSONNEL |
| `IDFERME` | `VARCHAR2(100 BYTE)` | Oui | FK → MAGASIN2 |
| `IDBATIMENT` | `VARCHAR2(100 BYTE)` | Oui | FK → BATIMENT |
| `IDLOT` | `VARCHAR2(100 BYTE)` | Oui | FK → LOT |
| `IDPARQUET` | `VARCHAR2(100 BYTE)` | Oui | FK → PARQUET |
| `IDSEXE` | `VARCHAR2(100 BYTE)` | Oui | FK → SEXE |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(30,2)` | Oui |  |

Clés : `PESEEPOUSSIN_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PESEEPOUSSIN](tables.md#peseepoussin).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` (`PESEEPOUSSIN_BAT_FK`, ENABLED).
- [PESEEPOUSSIN](tables.md#peseepoussin).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID` (`PESEEPOUSSIN_FERME_FK`, ENABLED).
- [PESEEPOUSSIN](tables.md#peseepoussin).`IDLOT` → [LOT](tables.md#lot).`ID` (`PESEEPOUSSIN_LOT_FK`, ENABLED).
- [PESEEPOUSSIN](tables.md#peseepoussin).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` (`PESEEPOUSSIN_PARQ_FK`, ENABLED).
- [PESEEPOUSSIN](tables.md#peseepoussin).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`PESEEPOUSSIN_RESP_FK`, ENABLED).
- [PESEEPOUSSIN](tables.md#peseepoussin).`IDSEXE` → [SEXE](tables.md#sexe).`ID` (`PESEEPOUSSIN_SEXE_FK`, ENABLED).
- [PESEEPOUSSIN](tables.md#peseepoussin).`IDTYPEPESEE` → [TYPEPESEE](tables.md#typepesee).`ID` (`PESEEPOUSSIN_TYPE_FK`, ENABLED).

Tables qui la référencent :

- [PESEEPOUSSINDETAIL](tables.md#peseepoussindetail).`IDMERE` → [PESEEPOUSSIN](tables.md#peseepoussin).`ID`.

Vues dépendantes directes (1) : [PESEEPOUSSIN_LIB](vues.md#peseepoussin-lib).

Références dans le code : [ferme/pesee/PeseePoussin.java:104](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/pesee/PeseePoussin.java#L104>), [ferme/pesee/peseepoussin-saisie.jsp:46](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/pesee/peseepoussin-saisie.jsp#L46>).

<a id="peseepoussindetail"></a>

## PESEEPOUSSINDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(100 BYTE)` | Oui | FK → PESEEPOUSSIN |
| `POIDS` | `NUMBER(30,2)` | Oui |  |
| `NOMBREOISEAUX` | `NUMBER(30,2)` | Oui |  |

Clés : `PESEEPOUSSINDET_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PESEEPOUSSINDETAIL](tables.md#peseepoussindetail).`IDMERE` → [PESEEPOUSSIN](tables.md#peseepoussin).`ID` (`PESEEPOUSSINDET_MERE_FK`, ENABLED).

Vues dépendantes directes (2) : [PESEEPOUSSINDETAIL_LIB](vues.md#peseepoussindetail-lib), [PESEEPOUSSIN_LIB](vues.md#peseepoussin-lib).

Références dans le code : [ferme/pesee/PeseePoussinDetail.java:56](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/pesee/PeseePoussinDetail.java#L56>), [ferme/pesee/peseepoussin-saisie.jsp:48](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/pesee/peseepoussin-saisie.jsp#L48>).

<a id="piecemachine"></a>

## PIECEMACHINE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDPIECE` | `VARCHAR2(50 BYTE)` | Non |  |
| `IDMACHINE` | `VARCHAR2(50 BYTE)` | Non |  |

Clés : `PK_PIECE_MACHINE` (primaire) : `ID`.

Vues dépendantes directes (1) : [PIECEMACHINELIB](vues.md#piecemachinelib).

Références dans le code : [piece/PieceMachine.java:42](<../../projet-standard - Copie/arbiochem-ejb/src/java/piece/PieceMachine.java#L42>), [maintenance/ressources/piecemachine/piece-machine-saisie.jsp:15](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/piecemachine/piece-machine-saisie.jsp#L15>).

<a id="plancommande"></a>

## PLANCOMMANDE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDDMDACHAT` | `VARCHAR2(255 BYTE)` | Oui | FK → DMDACHAT |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Non | FK → AS_INGREDIENTS |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QUANTITE` | `NUMBER(10,2)` | Non |  |
| `DATY` | `DATE` | Non |  |

Clés : `PK_PLANCOMMANDE` (primaire) : `ID`.

Clés étrangères sortantes :

- [PLANCOMMANDE](tables.md#plancommande).`IDDMDACHAT` → [DMDACHAT](tables.md#dmdachat).`ID` (`FK_PLANCOMMANDE_DMDACHAT`, ENABLED).
- [PLANCOMMANDE](tables.md#plancommande).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`FK_PLANCOMMANDE_PRODUIT`, ENABLED).

Références dans le code : [faturefournisseur/PlanCommande.java:64](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/PlanCommande.java#L64>), [facturefournisseur/plancommande-arbiochem-saisie.jsp:32](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/plancommande-arbiochem-saisie.jsp#L32>), [facturefournisseur/plancommande-saisie.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/plancommande-saisie.jsp#L27>).

<a id="planning"></a>

## PLANNING

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `REFOBJET` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ESTPERIODIQUE` | `NUMBER(*,0)` | Oui |  |
| `IDTYPEMAINTENANCE` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPEMAINTENANCE |
| `IDMACHINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `UNITE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `FREQUENCE` | `NUMBER` | Oui |  |
| `DATEDEBUT` | `DATE` | Oui |  |
| `DATEFIN` | `DATE` | Oui |  |
| `DUREE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `HEURE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDSOURCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDLIGNE` | `VARCHAR2(255 BYTE)` | Oui | FK → LIGNE |
| `IDSITUATION` | `VARCHAR2(255 BYTE)` | Oui | FK → SITUATION |

Clés : `PLANNING_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PLANNING](tables.md#planning).`IDTYPEMAINTENANCE` → [TYPEMAINTENANCE](tables.md#typemaintenance).`ID` (`PLANNINGTPMAINTENANCE_FK`, ENABLED).
- [PLANNING](tables.md#planning).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID` (`PLANNING_LIGNE_FK`, ENABLED).
- [PLANNING](tables.md#planning).`IDSITUATION` → [SITUATION](tables.md#situation).`ID` (`SITUATION_LIGNE_FK`, ENABLED).

Vues dépendantes directes (3) : [DEMANDETRAVAUX_CPL](vues.md#demandetravaux-cpl), [ORDRETRAVAUXCPL](vues.md#ordretravauxcpl), [PLANNING_CPL](vues.md#planning-cpl).

Références dans le code : [maintenance/planning/Planning.java:79](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/planning/Planning.java#L79>).

<a id="planpaiementachat"></a>

## PLANPAIEMENTACHAT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → FOURNISSEUR |
| `IDBCF` | `VARCHAR2(255 BYTE)` | Oui | FK → AS_BONDECOMMANDE |
| `IDTYPEDEPART` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPEDEPART |
| `DUREE` | `NUMBER` | Oui |  |
| `TAUX` | `NUMBER(5,2)` | Oui |  |

Clés : `SYS_C007557` (primaire) : `ID`.

Clés étrangères sortantes :

- [PLANPAIEMENTACHAT](tables.md#planpaiementachat).`IDTYPEDEPART` → [TYPEDEPART](tables.md#typedepart).`ID` (`SYS_C007999`, ENABLED).
- [PLANPAIEMENTACHAT](tables.md#planpaiementachat).`IDBCF` → [AS_BONDECOMMANDE](tables.md#as-bondecommande).`ID` (`SYS_C008261`, ENABLED).
- [PLANPAIEMENTACHAT](tables.md#planpaiementachat).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` (`SYS_C008352`, ENABLED).

Vues dépendantes directes (1) : [PLANPAIEMENTACHATLIB](vues.md#planpaiementachatlib).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="plan-formation-annuel"></a>

## PLAN_FORMATION_ANNUEL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `ANNEE` | `NUMBER(*,0)` | Oui |  |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `BUDGETTOTALPREVISIONEL` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |

Clés : `PLAN_FORMATION_ANNUEL_PK` (primaire) : `ID`.

Vues dépendantes directes (6) : [ACTION_FORMATION_LIB](vues.md#action-formation-lib), [PLANFORMATIONANNUELLELIB](vues.md#planformationannuellelib), [V_FORMATION_BILAN_PAR_STATUT](vues.md#v-formation-bilan-par-statut), [V_FORMATION_BILAN_PAR_TYPE](vues.md#v-formation-bilan-par-type), [V_FORMATION_CROISE_TYPE_STATUT](vues.md#v-formation-croise-type-statut), [V_RECAP_GLOBAL_FORMATION](vues.md#v-recap-global-formation).

Références dans le code : [paie/formation/plan/PlanFormationAnnuel.java:60](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formation/plan/PlanFormationAnnuel.java#L60>), [paie/formation/plan/planformation-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/plan/planformation-saisie.jsp#L13>), [paie/formation/action/actionformation-saisie-back.jsp:58](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/action/actionformation-saisie-back.jsp#L58>), [paie/formation/action/actionformation-saisie.jsp:73](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/action/actionformation-saisie.jsp#L73>).

<a id="point"></a>

## POINT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ACTIF` | `NUMBER` | Oui |  |

Clés : `POINT_PK` (primaire) : `ID`.

Tables qui la référencent :

- [CAISSE](tables.md#caisse).`IDPOINT` → [POINT](tables.md#point).`ID`.
- [ETATSTOCK](tables.md#etatstock).`IDPOINT` → [POINT](tables.md#point).`ID`.
- [MAGASIN2](tables.md#magasin2).`IDPOINT` → [POINT](tables.md#point).`ID`.
- [MVTSTOCK](tables.md#mvtstock).`IDPOINT` → [POINT](tables.md#point).`ID`.
- [REMISEFILLE](tables.md#remisefille).`IDPOINT` → [POINT](tables.md#point).`ID`.

Vues dépendantes directes (22) : [CAISSECPL](vues.md#caissecpl), [CAISSE_POMPISTE](vues.md#caisse-pompiste), [CLOTURECAISSE_CPL](vues.md#cloturecaisse-cpl), [DETAILSBONCAISSECPL](vues.md#detailsboncaissecpl), [ETATSTOCKLIB](vues.md#etatstocklib), [ETAT_VENTE_DETAILS_POIDS](vues.md#etat-vente-details-poids), [FACTUREFOURNISSEURFILLECPL](vues.md#facturefournisseurfillecpl), [FFFILLECPL_MONTANT](vues.md#fffillecpl-montant), [MAGASIN](vues.md#magasin), [MAGASINLIB](vues.md#magasinlib), [MAGASINLIBCOMPTA](vues.md#magasinlibcompta), [MAGASINPOINT](vues.md#magasinpoint), [POINT_ACTIF](vues.md#point-actif), [REMISEFILLELIB](vues.md#remisefillelib), [REMISEFILLEMERELIB](vues.md#remisefillemerelib), [VENTEDETCALCREMGLOVISE](vues.md#ventedetcalcremglovise), [VENTE_CPL_ANALYSE](vues.md#vente-cpl-analyse), [VENTE_DETAILS_CPL_2](vues.md#vente-details-cpl-2), [V_ETATCAISSE](vues.md#v-etatcaisse), [V_ETATCAISSE_CLOTURE](vues.md#v-etatcaisse-cloture), [V_ETATSTOCK_ING_MAGASIN](vues.md#v-etatstock-ing-magasin), [V_ETATSTOCK_ING_POINT](vues.md#v-etatstock-ing-point).

Références dans le code : [annexe/Point.java:24](<../../projet-standard - Copie/arbiochem-ejb/src/java/annexe/Point.java#L24>), [annexe/point/point-fiche.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/point/point-fiche.jsp#L22>), [annexe/point/point-liste.jsp:14](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/point/point-liste.jsp#L14>), [annexe/point/point-saisie.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/point/point-saisie.jsp#L25>), [caisse/caisse-liste.jsp:28](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/caisse-liste.jsp#L28>) ; 14 autres fichiers dans `usages-code.json`.

<a id="pointage"></a>

## POINTAGE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DIRECTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `HEURENORMAL` | `NUMBER(30,2)` | Oui |  |
| `HEURESUPNORMAL` | `NUMBER(30,2)` | Oui |  |
| `HEURESUPNUIT` | `NUMBER(30,2)` | Oui |  |
| `HEURESUPFERIE` | `NUMBER(30,2)` | Oui |  |
| `HEURESUPWEEKEND` | `NUMBER(30,2)` | Oui |  |
| `ABSENCE` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `MOIS` | `NUMBER(*,0)` | Oui |  |
| `ANNEE` | `NUMBER(*,0)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `POINTAGE_PK` (primaire) : `ID`.

Vues dépendantes directes (8) : [PAIE_EDITION_ELTPAIE](vues.md#paie-edition-eltpaie), [POINTAGEVISEE_VISA_MULTIPLE](vues.md#pointagevisee-visa-multiple), [POINTAGEVISEE_VISA_MULTIPLE_1](vues.md#pointagevisee-visa-multiple-1), [POINTAGE_LIB](vues.md#pointage-lib), [SITUATION_SALAIRE_EDITION_DIST](vues.md#situation-salaire-edition-dist), [TAUXABSENTEISME](vues.md#tauxabsenteisme), [TEST_SITUATION_SALAIRE_EDITION](vues.md#test-situation-salaire-edition), [V_POINTAGE_TOTAL_HEURE_SUP](vues.md#v-pointage-total-heure-sup).

Références dans le code : [paie/pointage/Pointage.java:21](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/pointage/Pointage.java#L21>), [paie/service/PointageService.java:47](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/service/PointageService.java#L47>).

<a id="pointagecantine"></a>

## POINTAGECANTINE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDDEPARTEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MOIS` | `NUMBER(38,0)` | Oui |  |
| `ANNEE` | `NUMBER(38,0)` | Oui |  |
| `NOMBRE` | `NUMBER(38,0)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(38,0)` | Oui |  |

Clés : `SYS_C007561` (primaire) : `ID`.

Vues dépendantes directes (1) : [POINTAGECANTINE_CPL](vues.md#pointagecantine-cpl).

Références dans le code : [paie/cantine/PointageCantine.java:79](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/cantine/PointageCantine.java#L79>), [paie/pointage/PointageCantine.java:15](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/pointage/PointageCantine.java#L15>).

<a id="pompe"></a>

## POMPE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui | FK → MAGASIN2 |
| `MAX` | `NUMBER(30,2)` | Oui |  |

Clés : `POMPE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [POMPE](tables.md#pompe).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` (`POMPE_MAGASIN_FK`, ENABLED).

Tables qui la référencent :

- [PRELEVEMENT](tables.md#prelevement).`IDPOMPE` → [POMPE](tables.md#pompe).`ID`.

Vues dépendantes directes (5) : [PRELEVEMENTCPL](vues.md#prelevementcpl), [PRELEVEMENTLIB](vues.md#prelevementlib), [PRELEVEMENTLIB_VALIDE](vues.md#prelevementlib-valide), [PRELEVEMENTLIB_VISEE](vues.md#prelevementlib-visee), [PRELEVEMENT_POMPISTE](vues.md#prelevement-pompiste).

Références dans le code : [pompe/Pompe.java:20](<../../projet-standard - Copie/arbiochem-ejb/src/java/pompe/Pompe.java#L20>), [pompe/pompe-fiche.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/pompe/pompe-fiche.jsp#L21>), [pompe/pompe-liste.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/pompe/pompe-liste.jsp#L13>), [pompe/pompe-saisie.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/pompe/pompe-saisie.jsp#L24>), [prelevement/prelevement-modif.jsp:44](<../../projet-standard - Copie/arbiochem-war/web/pages/prelevement/prelevement-modif.jsp#L44>) ; 1 autres fichiers dans `usages-code.json`.

<a id="poste"></a>

## POSTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `POSTE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [AS_INGREDIENTS](tables.md#as-ingredients).`REFPOST` → [POSTE](tables.md#poste).`ID`.
- [CATEGORIE_QUALIFICATION](tables.md#categorie-qualification).`IDPOSTE` → [POSTE](tables.md#poste).`ID`.
- [QUALIFICATION_PAIE](tables.md#qualification-paie).`IDPOSTE` → [POSTE](tables.md#poste).`ID`.
- [RESSOURCEPARFABRICATION](tables.md#ressourceparfabrication).`IDPOSTE` → [POSTE](tables.md#poste).`ID`.

Vues dépendantes directes (5) : [AS_INGREDIENTS_LIB](vues.md#as-ingredients-lib), [AS_INGREDIENTS_LIB2](vues.md#as-ingredients-lib2), [AS_INGREDIENTS_LIB_PIECE](vues.md#as-ingredients-lib-piece), [RESSOURCEPARFABRICATIONCOMPLET](vues.md#ressourceparfabricationcomplet), [RESSOURCEPARFAB_CPL_RECTIF](vues.md#ressourceparfab-cpl-rectif).

Références dans le code : [annexe/Poste.java:8](<../../projet-standard - Copie/arbiochem-ejb/src/java/annexe/Poste.java#L8>), [annexe/poste/poste-fiche.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/poste/poste-fiche.jsp#L19>), [annexe/poste/poste-liste.jsp:14](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/poste/poste-liste.jsp#L14>), [produits/as-ingredients-arbiochem-saisie.jsp:44](<../../projet-standard - Copie/arbiochem-war/web/pages/produits/as-ingredients-arbiochem-saisie.jsp#L44>), [produits/as-ingredients-modif.jsp:35](<../../projet-standard - Copie/arbiochem-war/web/pages/produits/as-ingredients-modif.jsp#L35>) ; 1 autres fichiers dans `usages-code.json`.

<a id="precision-detail-encaissement"></a>

## PRECISION_DETAIL_ENCAISSEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDENCAISSEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → ENCAISSEMENT |
| `IDCATEGORIECAISSE` | `VARCHAR2(255 BYTE)` | Oui | FK → CATEGORIECAISSE |
| `IDCLIENT` | `VARCHAR2(255 BYTE)` | Oui | FK → CLIENT |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `REFERENCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |

Clés : `PRECISIONDETAIL_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`IDCATEGORIECAISSE` → [CATEGORIECAISSE](tables.md#categoriecaisse).`ID` (`PRECISDET_CATEGORIECAISSE_FK`, ENABLED).
- [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`PRECISDET_CLIENT_FK`, ENABLED).
- [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`IDENCAISSEMENT` → [ENCAISSEMENT](tables.md#encaissement).`ID` (`PRECISDET_ENCAISSEMENT_FK`, ENABLED).

Tables qui la référencent :

- [CHEQUE](tables.md#cheque).`IDPRECISIONDETAILENCAISSEMENT` → [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`ID`.
- [DETAILSBONCAISSE](tables.md#detailsboncaisse).`IDPRECISIONDETAILENCAISSEMENT` → [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`ID`.

Vues dépendantes directes (2) : [MONTANTPRECISIONENCAISSEMENT](vues.md#montantprecisionencaissement), [PRECISDETENCAISSEMENT_LIB](vues.md#precisdetencaissement-lib).

Références dans le code : [encaissement/PrecisionDetailEncaissement.java:33](<../../projet-standard - Copie/arbiochem-ejb/src/java/encaissement/PrecisionDetailEncaissement.java#L33>).

<a id="prelevement"></a>

## PRELEVEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPRELEVEMENTANTERIEUR` | `VARCHAR2(255 BYTE)` | Oui |  |
| `COMPTEUR` | `NUMBER` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(10 BYTE)` | Oui |  |
| `IDPOMPISTE` | `NUMBER` | Oui | FK → UTILISATEUR |
| `IDPOMPE` | `VARCHAR2(255 BYTE)` | Oui | FK → POMPE |
| `ETAT` | `NUMBER` | Oui |  |
| `DESIGNATION` | `VARCHAR2(300 BYTE)` | Oui |  |

Clés : `SYS_C007566` (primaire) : `ID`.

Clés étrangères sortantes :

- [PRELEVEMENT](tables.md#prelevement).`IDPOMPE` → [POMPE](tables.md#pompe).`ID` (`SYS_C007976`, ENABLED).
- [PRELEVEMENT](tables.md#prelevement).`IDPOMPISTE` → [UTILISATEUR](tables.md#utilisateur).`REFUSER` (`SYS_C008051`, ENABLED).

Tables qui la référencent :

- [PRELEVEMENT_ENCAISSE](tables.md#prelevement-encaisse).`IDPRELEVEMENT` → [PRELEVEMENT](tables.md#prelevement).`ID`.

Vues dépendantes directes (4) : [PRELEVEMENTCPL](vues.md#prelevementcpl), [PRELEVEMENTLIB](vues.md#prelevementlib), [PRELEVEMENT_POMPISTE](vues.md#prelevement-pompiste), [VENTE_PRELEVEMENT](vues.md#vente-prelevement).

Références dans le code : [prelevement/Prelevement.java:41](<../../projet-standard - Copie/arbiochem-ejb/src/java/prelevement/Prelevement.java#L41>), [choix/pompe/prelevement/prelevement-choix.jsp:18](<../../projet-standard - Copie/arbiochem-war/web/pages/choix/pompe/prelevement/prelevement-choix.jsp#L18>).

<a id="prelevement-encaisse"></a>

## PRELEVEMENT_ENCAISSE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPRELEVEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → PRELEVEMENT |
| `IDENCAISSEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → ENCAISSEMENT |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `PRELEVEMENT_ENCAISSE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PRELEVEMENT_ENCAISSE](tables.md#prelevement-encaisse).`IDPRELEVEMENT` → [PRELEVEMENT](tables.md#prelevement).`ID` (`ENCAISSE_PRELEVEMENT_FK`, ENABLED).
- [PRELEVEMENT_ENCAISSE](tables.md#prelevement-encaisse).`IDENCAISSEMENT` → [ENCAISSEMENT](tables.md#encaissement).`ID` (`PRELEVEMENT_ENCAISSEMENT_FK`, ENABLED).

Vues dépendantes directes (4) : [ENCAISSEMENTVENTE](vues.md#encaissementvente), [PRELEVEMENTLIB_VISEE_POP](vues.md#prelevementlib-visee-pop), [PRELEVEMENT_POMPISTE](vues.md#prelevement-pompiste), [VENTE_PRELEVEMENT](vues.md#vente-prelevement).

Références dans le code : [encaissement/PrelevementEncaisse.java:26](<../../projet-standard - Copie/arbiochem-ejb/src/java/encaissement/PrelevementEncaisse.java#L26>).

<a id="prevision"></a>

## PREVISION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDCAISSE` | `VARCHAR2(255 BYTE)` | Oui | FK → CAISSE |
| `IDVENTEDETAIL` | `VARCHAR2(255 BYTE)` | Oui | FK → VENTE_DETAILS |
| `IDVIREMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DEBIT` | `NUMBER(36,2)` | Oui |  |
| `CREDIT` | `NUMBER(36,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDOP` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `TAUX` | `NUMBER(10,2)` | Oui |  |
| `IDTIERS` | `VARCHAR2(100 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDFACTURE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATEINITIAL` | `DATE` | Oui |  |
| `DUREERETARD` | `NUMBER(*,0)` | Oui |  |
| `MOIS` | `NUMBER` | Oui |  |
| `ANNEE` | `NUMBER` | Oui |  |
| `SERVICE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `PREVISION_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PREVISION](tables.md#prevision).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` (`PREVISION_CAISSE_FK`, ENABLED).
- [PREVISION](tables.md#prevision).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`PREVISION_DEVISE_FK`, ENABLED).
- [PREVISION](tables.md#prevision).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID` (`PREVISION_VENTEDET_FK`, ENABLED).

Tables qui la référencent :

- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDPREVISION` → [PREVISION](tables.md#prevision).`ID`.
- [MULTIPLICATION_PREVISION](tables.md#multiplication-prevision).`IDPREVISION` → [PREVISION](tables.md#prevision).`ID`.
- [MVTCAISSEPREVISION](tables.md#mvtcaisseprevision).`ID2` → [PREVISION](tables.md#prevision).`ID`.
- [SCINDERPREVISION](tables.md#scinderprevision).`IDPREVISION` → [PREVISION](tables.md#prevision).`ID`.

Vues dépendantes directes (12) : [FACTFRNSFILLEAUTOCOMPLETE](vues.md#factfrnsfilleautocomplete), [FACTUREDECLARATIONCPL](vues.md#facturedeclarationcpl), [FACTUREFOURNISSEURAVECMACHINE](vues.md#facturefournisseuravecmachine), [FACTUREFOURNISSEURCPL](vues.md#facturefournisseurcpl), [FACTUREFOURNISSEURCPL_M](vues.md#facturefournisseurcpl-m), [FACTUREFOURNISSEURCPL_TRAVAUX](vues.md#facturefournisseurcpl-travaux), [MOUVEMENTCAISSEAUTOCOMPLETE](vues.md#mouvementcaisseautocomplete), [PREVISIONGROUPE](vues.md#previsiongroupe), [PREVISIONVALIDE](vues.md#previsionvalide), [PREVISION_CPL](vues.md#prevision-cpl), [PREVISION_EFFECTIF](vues.md#prevision-effectif), [VENTE_DETAILS_VIDEAUTOCOMPLETE](vues.md#vente-details-videautocomplete).

Références dans le code : [budget/Budget.java:19](<../../projet-standard - Copie/arbiochem-ejb/src/java/budget/Budget.java#L19>), [prevision/Prevision.java:71](<../../projet-standard - Copie/arbiochem-ejb/src/java/prevision/Prevision.java#L71>), [caisse/mvt/mvtCaisse-saisie-entree-avoir.jsp:69](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/mvt/mvtCaisse-saisie-entree-avoir.jsp#L69>), [caisse/mvt/mvtCaisse-saisie-entree-fc.jsp:77](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/mvt/mvtCaisse-saisie-entree-fc.jsp#L77>), [caisse/mvt/mvtCaisse-saisie-entree-vente-arbiochem.jsp:75](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/mvt/mvtCaisse-saisie-entree-vente-arbiochem.jsp#L75>) ; 14 autres fichiers dans `usages-code.json`.

<a id="previsionferme"></a>

## PREVISIONFERME

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui | FK → MAGASIN2 |
| `IDMVTSTOCKFILLE` | `VARCHAR2(255 BYTE)` | Oui | FK → MVTSTOCKFILLE |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `ENTREE` | `NUMBER(30,2)` | Oui |  |
| `SORTIE` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTIERS` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007569` (primaire) : `ID`.

Clés étrangères sortantes :

- [PREVISIONFERME](tables.md#previsionferme).`IDMVTSTOCKFILLE` → [MVTSTOCKFILLE](tables.md#mvtstockfille).`ID` (`SYS_C007953`, ENABLED).
- [PREVISIONFERME](tables.md#previsionferme).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` (`SYS_C008146`, ENABLED).
- [PREVISIONFERME](tables.md#previsionferme).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`SYS_C008271`, ENABLED).

Vues dépendantes directes (1) : [PREVISIONFERMELIB](vues.md#previsionfermelib).

Références dans le code : [previsionFerme/PrevisionFerme.java:170](<../../projet-standard - Copie/arbiochem-ejb/src/java/previsionFerme/PrevisionFerme.java#L170>), [previsionFerme/AdminPrevisionFerme.java:112](<../../projet-standard - Copie/arbiochem-ejb/src/java/previsionFerme/AdminPrevisionFerme.java#L112>).

<a id="priorite"></a>

## PRIORITE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007570` (primaire) : `ID`.

Vues dépendantes directes (1) : [DEMANDETRAVAUX_CPL](vues.md#demandetravaux-cpl).

Références dans le code : [maintenance/demandetravaux/demandetravaux-saisie.jsp:37](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/demandetravaux/demandetravaux-saisie.jsp#L37>).

<a id="process"></a>

## PROCESS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `IDHISTORIQUE` | `VARCHAR2(20 BYTE)` | Non | PK |
| `DATEHISTORIQUE` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(25 BYTE)` | Oui |  |
| `OBJET` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ACTION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDUTILISATEUR` | `NUMBER` | Oui |  |
| `REFOBJET` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ACTEUR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(150 BYTE)` | Oui |  |
| `ECART` | `NUMBER(30,2)` | Oui |  |

Clés : `SYS_C007572` (primaire) : `IDHISTORIQUE`.

Vues dépendantes directes (4) : [DUREE_CYCLE_FAB](vues.md#duree-cycle-fab), [PROCESSFABPETRI](vues.md#processfabpetri), [PROCESSLIB](vues.md#processlib), [V_DUREE_REELLE_TRAVAUX](vues.md#v-duree-reelle-travaux).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="processmaintenance"></a>

## PROCESSMAINTENANCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTRAVAUX` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATEDEBUT` | `DATE` | Oui |  |
| `DATEFIN` | `DATE` | Oui |  |
| `HEUREDEBUT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `HEUREFIN` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SYS_C007574` (primaire) : `ID`.

Vues dépendantes directes (1) : [PROCESSMAINTENANCELIB](vues.md#processmaintenancelib).

Références dans le code : [maintenance/travaux/ProcessMaintenance.java:22](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/travaux/ProcessMaintenance.java#L22>), [maintenance/travaux/process/processmaintenance-saisie.jsp:17](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/travaux/process/processmaintenance-saisie.jsp#L17>).

<a id="produit"></a>

## PRODUIT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPEPRODUIT` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPE_PRODUIT |
| `PUACHAT` | `NUMBER(30,2)` | Oui |  |
| `PUVENTE` | `NUMBER(30,2)` | Oui |  |
| `IDUNITE` | `VARCHAR2(255 BYTE)` | Oui | FK → UNITE |
| `IDCATEGORIE` | `VARCHAR2(255 BYTE)` | Oui | FK → CATEGORIE |
| `IDSOUSCATEGORIE` | `VARCHAR2(100 BYTE)` | Oui | FK → SOUSCATEGORIE |
| `PRESENTATION` | `VARCHAR2(500 BYTE)` | Oui |  |
| `SEUILMIN` | `NUMBER(30,2)` | Oui |  |
| `SEUILMAX` | `NUMBER(30,2)` | Oui |  |
| `PUACHATUSD` | `NUMBER(30,2)` | Oui |  |
| `PUACHATEURO` | `NUMBER(30,2)` | Oui |  |
| `PUACHATAUTREDEVISE` | `NUMBER(30,2)` | Oui |  |
| `PUVENTEUSD` | `NUMBER(30,2)` | Oui |  |
| `PUVENTEEURO` | `NUMBER(30,2)` | Oui |  |
| `PUVENTEAUTREDEVISE` | `NUMBER(30,2)` | Oui |  |
| `ISACHAT` | `NUMBER(30,0)` | Oui |  |
| `ISVENTE` | `NUMBER(30,0)` | Oui |  |

Clés : `PRODUIT_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PRODUIT](tables.md#produit).`IDCATEGORIE` → [CATEGORIE](tables.md#categorie).`ID` (`PRODUIT_CATEGORIE_FK`, ENABLED).
- [PRODUIT](tables.md#produit).`IDTYPEPRODUIT` → [TYPE_PRODUIT](tables.md#type-produit).`ID` (`PRODUIT_TYPE_FK`, ENABLED).
- [PRODUIT](tables.md#produit).`IDUNITE` → [UNITE](tables.md#unite).`ID` (`PRODUIT_UNITE_FK`, ENABLED).
- [PRODUIT](tables.md#produit).`IDSOUSCATEGORIE` → [SOUSCATEGORIE](tables.md#souscategorie).`ID` (`SYS_C007906`, ENABLED).

Tables qui la référencent :

- [ETATSTOCK](tables.md#etatstock).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID`.
- [FACTURECLIENTDETAILS](tables.md#factureclientdetails).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID`.
- [HISTORIQUE_PRODUIT](tables.md#historique-produit).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID`.
- [SEUIL](tables.md#seuil).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID`.
- [VENTELUBRIFIANT](tables.md#ventelubrifiant).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID`.

Vues dépendantes directes (13) : [AS_BONDELIVRAISON_FILLE_LIB](vues.md#as-bondelivraison-fille-lib), [BCFILLERESTEALIVRERLIB](vues.md#bcfillerestealivrerlib), [EQUIVALENCE_LIB](vues.md#equivalence-lib), [ETATSTOCKLIB](vues.md#etatstocklib), [FACTURECLIENTDETAILSLIB](vues.md#factureclientdetailslib), [FFFILLECPL_MONTANT](vues.md#fffillecpl-montant), [FFFILLERESTEALIVRERLIB](vues.md#fffillerestealivrerlib), [HISTORIQUE_PRODUIT_LIB](vues.md#historique-produit-lib), [PRELEVEMENTCPL](vues.md#prelevementcpl), [PRELEVEMENT_POMPISTE](vues.md#prelevement-pompiste), [VENTELUBRIFIANTLIB](vues.md#ventelubrifiantlib), [VENTE_DETAILS_BC](vues.md#vente-details-bc), [V_ETATSTOCK](vues.md#v-etatstock).

Références dans le code : [annexe/Produit.java:139](<../../projet-standard - Copie/arbiochem-ejb/src/java/annexe/Produit.java#L139>), [annexe/produit/produit-saisie.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/produit/produit-saisie.jsp#L27>), [annexe/produit/produit-saisie_1.jsp:26](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/produit/produit-saisie_1.jsp#L26>), [magasin/magasin-reservoir-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/magasin/magasin-reservoir-saisie.jsp#L22>), [popup/produit/produit-popup.jsp:29](<../../projet-standard - Copie/arbiochem-war/web/pages/popup/produit/produit-popup.jsp#L29>) ; 2 autres fichiers dans `usages-code.json`.

<a id="proforma"></a>

## PROFORMA

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Non |  |
| `DATY` | `DATE` | Non |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDCLIENT` | `VARCHAR2(100 BYTE)` | Oui | FK → CLIENT |
| `ESTPREVU` | `NUMBER(1,0)` | Oui |  |
| `DATYPREVU` | `DATE` | Oui |  |
| `IDRESERVATION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `TVA` | `NUMBER(10,2)` | Oui |  |
| `ECHEANCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REGLEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMISE` | `NUMBER(5,2)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(20 BYTE)` | Oui |  |
| `FRAISLIVRAISON` | `NUMBER(30,2)` | Oui |  |
| `NUMEROPROFORMA` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDCOMMANDE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `MODELIVRAISON` | `NUMBER` | Oui |  |
| `LIEULIVRAISON` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATELIVRAISON` | `DATE` | Oui |  |
| `REFERENCE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDREPRESENTANT` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `SYS_C007579` (primaire) : `ID`.

Clés étrangères sortantes :

- [PROFORMA](tables.md#proforma).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`SYS_C008190`, ENABLED).

Tables qui la référencent :

- [PROFORMA_DETAILS](tables.md#proforma-details).`IDPROFORMA` → [PROFORMA](tables.md#proforma).`ID`.

Vues dépendantes directes (10) : [PROFORMADETAILS_CPL](vues.md#proformadetails-cpl), [PROFORMADETAILS_CPL2](vues.md#proformadetails-cpl2), [PROFORMADETAILS_CPL_ING](vues.md#proformadetails-cpl-ing), [PROFORMADETAILS_CPL_ING_PDF](vues.md#proformadetails-cpl-ing-pdf), [PROFORMAMONTANT2](vues.md#proformamontant2), [PROFORMAMONTANTLEGER](vues.md#proformamontantleger), [PROFORMAMONTANTLEGER2](vues.md#proformamontantleger2), [PROFORMA_CPL](vues.md#proforma-cpl), [PROFORMA_CPL2](vues.md#proforma-cpl2), [V_NUMEROPROFORMA_EN_COURS](vues.md#v-numeroproforma-en-cours).

Références dans le code : [proforma/Proforma.java:115](<../../projet-standard - Copie/arbiochem-ejb/src/java/proforma/Proforma.java#L115>), [proforma/ProformaArbichem.java:7](<../../projet-standard - Copie/arbiochem-ejb/src/java/proforma/ProformaArbichem.java#L7>).

<a id="proforma-details"></a>

## PROFORMA_DETAILS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPROFORMA` | `VARCHAR2(255 BYTE)` | Oui | FK → PROFORMA |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QTE` | `NUMBER` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `REMISE` | `NUMBER(30,2)` | Oui |  |
| `TVA` | `NUMBER(30,2)` | Oui |  |
| `PUACHAT` | `NUMBER(30,2)` | Oui |  |
| `PUVENTE` | `NUMBER(30,2)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `TAUXDECHANGE` | `NUMBER(30,2)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(250 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PUREVIENT` | `NUMBER(20,2)` | Oui |  |
| `IDDEMANDEPRIXFILLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `UNITE` | `VARCHAR2(255 BYTE)` | Oui | FK → AS_UNITE |
| `DATEDEBUT` | `DATE` | Oui |  |
| `RISTOURNE` | `NUMBER(5,2)` | Oui |  |
| `REMISEARBIOCHEM` | `NUMBER(30,2)` | Oui |  |
| `RISTOURNEARBIOCHEM` | `NUMBER(30,2)` | Oui |  |

Clés : `SYS_C007581` (primaire) : `ID`.

Clés étrangères sortantes :

- [PROFORMA_DETAILS](tables.md#proforma-details).`UNITE` → [AS_UNITE](tables.md#as-unite).`ID` (`PROFORMDET_UNITE_FK`, ENABLED).
- [PROFORMA_DETAILS](tables.md#proforma-details).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`SYS_C008078`, ENABLED).
- [PROFORMA_DETAILS](tables.md#proforma-details).`IDPROFORMA` → [PROFORMA](tables.md#proforma).`ID` (`SYS_C008323`, ENABLED).

Vues dépendantes directes (7) : [PROFORMADETAILS_CPL](vues.md#proformadetails-cpl), [PROFORMADETAILS_CPL2](vues.md#proformadetails-cpl2), [PROFORMADETAILS_CPL_ING](vues.md#proformadetails-cpl-ing), [PROFORMADETAILS_CPL_ING_PDF](vues.md#proformadetails-cpl-ing-pdf), [PROFORMAMONTANTLEGER](vues.md#proformamontantleger), [PROFORMAMONTANTLEGER2](vues.md#proformamontantleger2), [PROFORMA_DETAILS_VIDE](vues.md#proforma-details-vide).

Références dans le code : [proforma/ProformaDetails.java:27](<../../projet-standard - Copie/arbiochem-ejb/src/java/proforma/ProformaDetails.java#L27>), [proforma/ProformaDetailsArbiochem.java:23](<../../projet-standard - Copie/arbiochem-ejb/src/java/proforma/ProformaDetailsArbiochem.java#L23>).

<a id="programmezootechnique"></a>

## PROGRAMMEZOOTECHNIQUE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `CODE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `IDSOUCHE` | `VARCHAR2(100 BYTE)` | Oui | FK → SOUCHE |
| `VERSION` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `PROGRAMMEZOOTECHNIQUE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PROGRAMMEZOOTECHNIQUE](tables.md#programmezootechnique).`IDSOUCHE` → [SOUCHE](tables.md#souche).`ID` (`PROGZOOTECH_SOUCHE_FK`, ENABLED).

Tables qui la référencent :

- [LOT](tables.md#lot).`IDPROGRAMME` → [PROGRAMMEZOOTECHNIQUE](tables.md#programmezootechnique).`ID`.
- [PROGRAMMEZOOTECHNIQUEDETAILS](tables.md#programmezootechniquedetails).`IDMERE` → [PROGRAMMEZOOTECHNIQUE](tables.md#programmezootechnique).`ID`.

Vues dépendantes directes (1) : [PROGRAMMEZOOTECHNIQUE_LIB](vues.md#programmezootechnique-lib).

Références dans le code : [ferme/programme/ProgrammeZootechnique.java:75](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/programme/ProgrammeZootechnique.java#L75>), [ferme/programme/programmezoo-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/programme/programmezoo-saisie.jsp#L19>), [ferme/lot/lot-saisie.jsp:38](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/lot/lot-saisie.jsp#L38>).

<a id="programmezootechniquedetails"></a>

## PROGRAMMEZOOTECHNIQUEDETAILS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(100 BYTE)` | Oui | FK → PROGRAMMEZOOTECHNIQUE |
| `AGE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `IDSEXE` | `VARCHAR2(100 BYTE)` | Oui | FK → SEXE |
| `ALIMENT` | `NUMBER(30,2)` | Oui |  |
| `POIDS` | `NUMBER(30,2)` | Oui |  |
| `MORTALITE` | `NUMBER(30,2)` | Oui |  |
| `PONTEHEBDOMADAIRE` | `NUMBER(30,2)` | Oui |  |
| `PONTECUMULEE` | `NUMBER(30,2)` | Oui |  |
| `OEUFCUMULE` | `NUMBER(30,2)` | Oui |  |
| `OACPOURCENTAGE` | `NUMBER(30,2)` | Oui |  |
| `OACHH` | `NUMBER(30,2)` | Oui |  |
| `POIDSOEUF` | `NUMBER(30,2)` | Oui |  |
| `TAUXECLOSION` | `NUMBER(30,2)` | Oui |  |
| `POUSSINS` | `NUMBER(30,2)` | Oui |  |
| `CONSOALIMENTFEMELLE` | `NUMBER(30,2)` | Oui |  |
| `FEMELLEBW` | `NUMBER(30,2)` | Oui |  |
| `MALEBW` | `NUMBER(30,2)` | Oui |  |
| `RATIOPRODUCTION` | `NUMBER(30,2)` | Oui |  |
| `FERTILITE` | `NUMBER(30,2)` | Oui |  |
| `CONSOALIMENTMALE` | `NUMBER(30,2)` | Oui |  |
| `CONSOMMATIONEAU` | `NUMBER(10,2)` | Oui |  |
| `TEMPERATUREMIN` | `NUMBER(10,2)` | Oui |  |
| `TEMPERATUREMAX` | `NUMBER(10,2)` | Oui |  |
| `HUMIDITEMIN` | `NUMBER(10,2)` | Oui |  |
| `HUMIDITEMAX` | `NUMBER(10,2)` | Oui |  |
| `DUREEECLAIRAGE` | `NUMBER(10,2)` | Oui |  |
| `UNIFORMITECIBLE` | `NUMBER(10,2)` | Oui |  |
| `CVMAX` | `NUMBER(10,2)` | Oui |  |

Clés : `PROGZOOTECHDETAILS_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [PROGRAMMEZOOTECHNIQUEDETAILS](tables.md#programmezootechniquedetails).`IDMERE` → [PROGRAMMEZOOTECHNIQUE](tables.md#programmezootechnique).`ID` (`PROGZOOTECHDET_MERE_FK`, ENABLED).
- [PROGRAMMEZOOTECHNIQUEDETAILS](tables.md#programmezootechniquedetails).`IDSEXE` → [SEXE](tables.md#sexe).`ID` (`PROGZOOTECHDET_SEXE_FK`, ENABLED).

Vues dépendantes directes (1) : [PROGRAMMEZOOTECHNIQUEDT_LIB](vues.md#programmezootechniquedt-lib).

Références dans le code : [ferme/programme/ProgrammeZootechniqueDetails.java:212](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/programme/ProgrammeZootechniqueDetails.java#L212>), [ferme/programme/programmezoo-saisie.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/programme/programmezoo-saisie.jsp#L21>).

<a id="programme-integration"></a>

## PROGRAMME_INTEGRATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(250 BYTE)` | Non | FK → LOG_PERSONNEL |
| `DATY` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `PK_PROGRAMME_INTEGRATION` (primaire) : `ID`.

Clés étrangères sortantes :

- [PROGRAMME_INTEGRATION](tables.md#programme-integration).`IDPERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`FK_PROG_PERSONNEL`, ENABLED).

Tables qui la référencent :

- [PROGRAMME_INTEGRATION_DETAIL](tables.md#programme-integration-detail).`IDPROGRAMEDETAIL` → [PROGRAMME_INTEGRATION](tables.md#programme-integration).`ID`.

Vues dépendantes directes (1) : [V_PROGRAMME_INTEGRATION_LIB](vues.md#v-programme-integration-lib).

Références dans le code : [paie/onBoarding/ProgrammeIntegration.java:49](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/onBoarding/ProgrammeIntegration.java#L49>), [paie/onBoarding/programmeIntegration-saisie.jsp:18](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/onBoarding/programmeIntegration-saisie.jsp#L18>).

<a id="programme-integration-detail"></a>

## PROGRAMME_INTEGRATION_DETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `IDPROGRAMEDETAIL` | `VARCHAR2(250 BYTE)` | Non | FK → PROGRAMME_INTEGRATION |
| `JOURDELASEMAINE` | `VARCHAR2(20 BYTE)` | Oui |  |
| `HEURE` | `VARCHAR2(20 BYTE)` | Oui |  |
| `DUREE` | `NUMBER(10,2)` | Oui |  |
| `ACTIONTHEME` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `CONTENUE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `IDINTERVENANT` | `VARCHAR2(250 BYTE)` | Oui | FK → LOG_PERSONNEL |

Clés : `PK_PROGRAMME_INTEGRATION_DET` (primaire) : `ID`.

Clés étrangères sortantes :

- [PROGRAMME_INTEGRATION_DETAIL](tables.md#programme-integration-detail).`IDINTERVENANT` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`FK_PROG_INTERVENANT`, ENABLED).
- [PROGRAMME_INTEGRATION_DETAIL](tables.md#programme-integration-detail).`IDPROGRAMEDETAIL` → [PROGRAMME_INTEGRATION](tables.md#programme-integration).`ID` (`FK_PROG_MERE`, ENABLED).

Vues dépendantes directes (1) : [V_PROG_INTEGRATION_DETAIL_LIB](vues.md#v-prog-integration-detail-lib).

Références dans le code : [paie/onBoarding/ProgrammeIntegrationDetail.java:93](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/onBoarding/ProgrammeIntegrationDetail.java#L93>), [paie/onBoarding/programmeIntegration-saisie.jsp:20](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/onBoarding/programmeIntegration-saisie.jsp#L20>).

<a id="provenance"></a>

## PROVENANCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `PK_PROVENANCE` (primaire) : `ID`.

Vues dépendantes directes (1) : [DMDACHATLIB](vues.md#dmdachatlib).

Références dans le code : [facturefournisseur/dmdachat/dmdachat-arbiochem-liste.jsp:60](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/dmdachat/dmdachat-arbiochem-liste.jsp#L60>), [facturefournisseur/dmdachat/dmdachat-arbiochem-saisie.jsp:40](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/dmdachat/dmdachat-arbiochem-saisie.jsp#L40>), [facturefournisseur/dmdachat/dmdachat-fusionner-liste.jsp:65](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/dmdachat/dmdachat-fusionner-liste.jsp#L65>), [facturefournisseur/dmdachat/dmdachat-liste.jsp:61](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/dmdachat/dmdachat-liste.jsp#L61>), [facturefournisseur/dmdachat/dmdachat-saisie.jsp:31](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/dmdachat/dmdachat-saisie.jsp#L31>).

<a id="province"></a>

## PROVINCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `PROVINCE_PK` (primaire) : `ID`.

Vues dépendantes directes (8) : [BALANCE_CLIENT](vues.md#balance-client), [CLIENTLIB](vues.md#clientlib), [ETAT_VENTE_DETAILS_POIDS](vues.md#etat-vente-details-poids), [VENTEDETCALCREMGLOVISE](vues.md#ventedetcalcremglovise), [VENTE_CPL](vues.md#vente-cpl), [VENTE_CPL_CL](vues.md#vente-cpl-cl), [VENTE_CPL_SANSAVOIR](vues.md#vente-cpl-sansavoir), [VENTE_DETAILS_CPL_2](vues.md#vente-details-cpl-2).

Références dans le code : [client/Client.java:216](<../../projet-standard - Copie/arbiochem-ejb/src/java/client/Client.java#L216>), [vente/balance-client.jsp:55](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/balance-client.jsp#L55>), [vente/vente-analyse-client.jsp:84](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/vente-analyse-client.jsp#L84>), [vente/vente-analyse.jsp:91](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/vente-analyse.jsp#L91>), [vente/vente-arbiochem-liste.jsp:113](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/vente-arbiochem-liste.jsp#L113>) ; 4 autres fichiers dans `usages-code.json`.

<a id="qualification-paie"></a>

## QUALIFICATION_PAIE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDPOSTE` | `VARCHAR2(100 BYTE)` | Oui | FK → POSTE |

Clés : `QUALIFICATION_PAIE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [QUALIFICATION_PAIE](tables.md#qualification-paie).`IDPOSTE` → [POSTE](tables.md#poste).`ID` (`FK_POSTE`, ENABLED).

Tables qui la référencent :

- [AS_INGREDIENTS](tables.md#as-ingredients).`REFQUALIFICATION` → [QUALIFICATION_PAIE](tables.md#qualification-paie).`ID`.
- [CATEGORIE_QUALIFICATION](tables.md#categorie-qualification).`IDQUALIFICATION` → [QUALIFICATION_PAIE](tables.md#qualification-paie).`ID`.
- [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`IDQUALIFICATION` → [QUALIFICATION_PAIE](tables.md#qualification-paie).`ID`.
- [RESSOURCEPARFABRICATION](tables.md#ressourceparfabrication).`IDQUALIFICATION` → [QUALIFICATION_PAIE](tables.md#qualification-paie).`ID`.

Vues dépendantes directes (17) : [AS_INGREDIENTS_LIB](vues.md#as-ingredients-lib), [AS_INGREDIENTS_LIB2](vues.md#as-ingredients-lib2), [AS_INGREDIENTS_LIB_PIECE](vues.md#as-ingredients-lib-piece), [CATEGORIEQUALIFICATION_LIB](vues.md#categoriequalification-lib), [CATEGORIE_QUALIFICATION_LIBC](vues.md#categorie-qualification-libc), [CATEGORIE_QUALIFICATION_VW](vues.md#categorie-qualification-vw), [CATEG_QUALILIBCOMPLET](vues.md#categ-qualilibcomplet), [CATEG_QUALI_LIBCOMPLET](vues.md#categ-quali-libcomplet), [EMPLOYE_COMPLET](vues.md#employe-complet), [EMPLOYE_COMPLET2](vues.md#employe-complet2), [EMPLOYE_COMPLET_PDF](vues.md#employe-complet-pdf), [FICHE_POSTE_LIB](vues.md#fiche-poste-lib), [LOG_PERSONNEL_AVECCONGE](vues.md#log-personnel-avecconge), [LOG_PERSONNEL_FIN](vues.md#log-personnel-fin), [LOG_PERSONNEL_FIN_CONGE](vues.md#log-personnel-fin-conge), [LOG_PERSONNEL_V2](vues.md#log-personnel-v2), [PAIE_INFO_PERSONNEL_HISTORIC_3](vues.md#paie-info-personnel-historic-3).

Références dans le code : [rh/QualificationPaie.java:16](<../../projet-standard - Copie/arbiochem-ejb/src/java/rh/QualificationPaie.java#L16>), [paie/categorie/categoriequalification-liste.jsp:31](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/categorie/categoriequalification-liste.jsp#L31>), [paie/categorie/categoriequalification-saisie.jsp:37](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/categorie/categoriequalification-saisie.jsp#L37>), [paie/categorie/salaireparcategorie-liste.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/categorie/salaireparcategorie-liste.jsp#L21>), [paie/categorie/salaireparcategorie-saisie.jsp:38](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/categorie/salaireparcategorie-saisie.jsp#L38>) ; 3 autres fichiers dans `usages-code.json`.

<a id="qualiteeclosion"></a>

## QUALITEECLOSION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `QUALITEECLOSION_PK` (primaire) : `ID`.

Tables qui la référencent :

- [ECLOSIONDETAIL](tables.md#eclosiondetail).`IDQUALITEECLOSION` → [QUALITEECLOSION](tables.md#qualiteeclosion).`ID`.

Vues dépendantes directes (1) : [ECLOSIONDETAIL_LIB](vues.md#eclosiondetail-lib).

Références dans le code : [ferme/couvoir/eclosion-saisie.jsp:56](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/eclosion-saisie.jsp#L56>).

<a id="qualitemirage"></a>

## QUALITEMIRAGE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `QUALITEMIRAGE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [MIRAGEDETAIL](tables.md#miragedetail).`IDQUALITEMIRAGE` → [QUALITEMIRAGE](tables.md#qualitemirage).`ID`.

Vues dépendantes directes (1) : [MIRAGEDETAIL_LIB](vues.md#miragedetail-lib).

Références dans le code : [ferme/production/mirage-saisie.jsp:50](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/mirage-saisie.jsp#L50>).

<a id="qualitepoussin"></a>

## QUALITEPOUSSIN

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007597` (primaire) : `ID`.

Tables qui la référencent :

- [RECEPTIONPOUSSINAEROPORTDETAIL](tables.md#receptionpoussinaeroportdetail).`IDQUALITEPOUSSIN` → [QUALITEPOUSSIN](tables.md#qualitepoussin).`ID`.
- [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDQUALITE` → [QUALITEPOUSSIN](tables.md#qualitepoussin).`ID`.
- [TRIAGEQUALITEPOUSSINDETAIL](tables.md#triagequalitepoussindetail).`IDQUALITE` → [QUALITEPOUSSIN](tables.md#qualitepoussin).`ID`.

Vues dépendantes directes (3) : [RECEPTIONPOUSSINAEDETAIL_LIB](vues.md#receptionpoussinaedetail-lib), [TRIAGEBATPARQUETDETAIL_LIB](vues.md#triagebatparquetdetail-lib), [TRIAGEQUALITEPOUSSINDETAIL_LIB](vues.md#triagequalitepoussindetail-lib).

Références dans le code : [ferme/configuration/QualitePoussin.java:12](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/configuration/QualitePoussin.java#L12>), [ferme/configuration/qualitepoussin-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/qualitepoussin-saisie.jsp#L19>), [ferme/couvoir/triagequalitepoussin-saisie.jsp:58](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/triagequalitepoussin-saisie.jsp#L58>), [ferme/triagebatiment/triagebatimentparquet-saisie.jsp:73](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/triagebatiment/triagebatimentparquet-saisie.jsp#L73>).

<a id="qualitesobjetmaintenance"></a>

## QUALITESOBJETMAINTENANCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `SYS_C007599` (primaire) : `ID`.

Tables qui la référencent :

- [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`QUALITEOBJET` → [QUALITESOBJETMAINTENANCE](tables.md#qualitesobjetmaintenance).`ID`.
- [ATTRIBUTIONELEMENT](tables.md#attributionelement).`ETATELEMENT` → [QUALITESOBJETMAINTENANCE](tables.md#qualitesobjetmaintenance).`ID`.

Vues dépendantes directes (2) : [AS_INGREDIENT_MAINTENANCE_LIB](vues.md#as-ingredient-maintenance-lib), [ATTRIBUTIONELEMENTLIB](vues.md#attributionelementlib).

Références dans le code : [maintenance/ressources/machine/machine-liste.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/machine/machine-liste.jsp#L33>), [maintenance/ressources/machine/machine-saisie.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/machine/machine-saisie.jsp#L27>), [maintenance/ressources/outils/attribution/attribution-saisie.jsp:34](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/outils/attribution/attribution-saisie.jsp#L34>), [maintenance/ressources/outils/outils-saisie.jsp:55](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/outils/outils-saisie.jsp#L55>).

<a id="qualitetriageoeuf"></a>

## QUALITETRIAGEOEUF

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `QUALITETRIAGEOEUF_PK` (primaire) : `ID`.

Tables qui la référencent :

- [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDQUALITETRIAGEOEUF` → [QUALITETRIAGEOEUF](tables.md#qualitetriageoeuf).`ID`.
- [TRIAGEOEUFDETAIL](tables.md#triageoeufdetail).`IDQUALITETRIAGEOEUF` → [QUALITETRIAGEOEUF](tables.md#qualitetriageoeuf).`ID`.

Vues dépendantes directes (2) : [RECEPTIONOACDETAIL_LIB](vues.md#receptionoacdetail-lib), [TRIAGEOEUFDETAIL_LIB](vues.md#triageoeufdetail-lib).

Références dans le code : [ferme/production/QualiteTriageOeuf.java:11](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/production/QualiteTriageOeuf.java#L11>), [ferme/production/importoac-saisie.jsp:66](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/importoac-saisie.jsp#L66>), [ferme/production/qualitetriageoeuf-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/qualitetriageoeuf-fiche.jsp#L11>), [ferme/production/qualitetriageoeuf-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/qualitetriageoeuf-liste.jsp#L7>), [ferme/production/qualitetriageoeuf-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/qualitetriageoeuf-saisie.jsp#L13>) ; 2 autres fichiers dans `usages-code.json`.

<a id="rapprochement"></a>

## RAPPROCHEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDRELEVERDETAIL` | `VARCHAR2(50 BYTE)` | Oui | FK → RELEVERDETAIL |
| `IDSECRITURE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATE_RAPPROCH` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(2,0)` | Oui |  |

Clés : `SYS_C007604` (primaire) : `ID`.

Clés étrangères sortantes :

- [RAPPROCHEMENT](tables.md#rapprochement).`IDRELEVERDETAIL` → [RELEVERDETAIL](tables.md#releverdetail).`ID` (`FK_RAPPROCHEMENT_DETAIL`, ENABLED).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="rapprochementbc"></a>

## RAPPROCHEMENTBC

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `IDSOUSECRITURE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `IDRELEVERDETAIL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `VALEURSOUSECRITURE` | `NUMBER` | Oui |  |
| `VALEURRELEVERDETAIL` | `NUMBER` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `IDMERE` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `SYS_C007605` (primaire) : `ID`.

Vues dépendantes directes (5) : [RAPPROCHEMENTBCETAT](vues.md#rapprochementbcetat), [RELEVERDETAILNR](vues.md#releverdetailnr), [RELEVERDETAILR](vues.md#releverdetailr), [SOUSECRITURENR](vues.md#sousecriturenr), [SOUSECRITURER](vues.md#sousecriturer).

Références dans le code : [rapprochement/RapprochementBC.java:95](<../../projet-standard - Copie/arbiochem-ejb/src/java/rapprochement/RapprochementBC.java#L95>).

<a id="rapprochementbcmere"></a>

## RAPPROCHEMENTBCMERE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `IDBANQUE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `VALEUR` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SYS_C007606` (primaire) : `ID`.

Vues dépendantes directes (6) : [RAPPROCHEMENTBCETAT](vues.md#rapprochementbcetat), [RAPPROCHEMENTBCMERELIB](vues.md#rapprochementbcmerelib), [RELEVERDETAILNR](vues.md#releverdetailnr), [RELEVERDETAILR](vues.md#releverdetailr), [SOUSECRITURENR](vues.md#sousecriturenr), [SOUSECRITURER](vues.md#sousecriturer).

Références dans le code : [rapprochement/RapprochementDBMere.java:28](<../../projet-standard - Copie/arbiochem-ejb/src/java/rapprochement/RapprochementDBMere.java#L28>).

<a id="rap-operationnel"></a>

## RAP_OPERATIONNEL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDACTIVITE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `OBJET` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDUSER` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SYS_C007602` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="receptionoac"></a>

## RECEPTIONOAC

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DATERECEPTION` | `DATE` | Oui |  |
| `DATEPONTE` | `DATE` | Oui |  |
| `DATECOLLECTE` | `DATE` | Oui |  |
| `IDNUMEROCOLLECTE` | `VARCHAR2(100 BYTE)` | Oui | FK → NUMEROCOLLECTE |
| `HEUREDEPARTFERME` | `VARCHAR2(20 BYTE)` | Oui |  |
| `HEUREARRIVEECOUVOIR` | `VARCHAR2(20 BYTE)` | Oui |  |
| `IDRESPONSABLE` | `VARCHAR2(100 BYTE)` | Oui | FK → LOG_PERSONNEL |
| `IDCHAMBREFROIDE` | `VARCHAR2(100 BYTE)` | Oui | FK → MAGASIN2 |
| `IDCHAUFFEUR` | `VARCHAR2(100 BYTE)` | Oui | FK → LOG_PERSONNEL |
| `IDVEHICULE` | `VARCHAR2(100 BYTE)` | Oui | FK → VEHICULE |
| `TEMPERATUREMINVEHICULE` | `NUMBER(30,2)` | Oui |  |
| `TEMPERATUREMAXVEHICULE` | `NUMBER(30,2)` | Oui |  |
| `IDPROVENANCE` | `VARCHAR2(100 BYTE)` | Oui | FK → ORIGINELOT |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `RECEPTIONOAC_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [RECEPTIONOAC](tables.md#receptionoac).`IDCHAMBREFROIDE` → [MAGASIN2](tables.md#magasin2).`ID` (`RECEPTIONOAC_CHAMBFROID_FK`, ENABLED).
- [RECEPTIONOAC](tables.md#receptionoac).`IDCHAUFFEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`RECEPTIONOAC_CHAUFF_FK`, ENABLED).
- [RECEPTIONOAC](tables.md#receptionoac).`IDNUMEROCOLLECTE` → [NUMEROCOLLECTE](tables.md#numerocollecte).`ID` (`RECEPTIONOAC_NUMCOL_FK`, ENABLED).
- [RECEPTIONOAC](tables.md#receptionoac).`IDPROVENANCE` → [ORIGINELOT](tables.md#originelot).`ID` (`RECEPTIONOAC_PROV_FK`, ENABLED).
- [RECEPTIONOAC](tables.md#receptionoac).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`RECEPTIONOAC_RESP_FK`, ENABLED).
- [RECEPTIONOAC](tables.md#receptionoac).`IDVEHICULE` → [VEHICULE](tables.md#vehicule).`ID` (`RECEPTIONOAC_VEHIC_FK`, ENABLED).

Tables qui la référencent :

- [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDMERE` → [RECEPTIONOAC](tables.md#receptionoac).`ID`.

Vues dépendantes directes (3) : [IMPORTOAC_LIB](vues.md#importoac-lib), [IMPORTRECEPTIONOAC](vues.md#importreceptionoac), [RECEPTIONOAC_LIB](vues.md#receptionoac-lib).

Références dans le code : [ferme/production/ReceptionOAC.java:136](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/production/ReceptionOAC.java#L136>), [ferme/production/importoac-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/importoac-saisie.jsp#L23>), [ferme/production/receptionoac-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/receptionoac-saisie.jsp#L23>).

<a id="receptionoacdetail"></a>

## RECEPTIONOACDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(100 BYTE)` | Oui | FK → RECEPTIONOAC |
| `IDLOT` | `VARCHAR2(100 BYTE)` | Oui | FK → LOT |
| `IDBATIMENT` | `VARCHAR2(100 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUET` | `VARCHAR2(100 BYTE)` | Oui | FK → PARQUET |
| `IDQUALITETRIAGEOEUF` | `VARCHAR2(100 BYTE)` | Oui | FK → QUALITETRIAGEOEUF |
| `QTERECUS` | `NUMBER(30,2)` | Oui |  |

Clés : `RECEPTIONOACDET_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` (`RECEPTIONOACDET_BAT_FK`, ENABLED).
- [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDLOT` → [LOT](tables.md#lot).`ID` (`RECEPTIONOACDET_LOT_FK`, ENABLED).
- [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDMERE` → [RECEPTIONOAC](tables.md#receptionoac).`ID` (`RECEPTIONOACDET_MERE_FK`, ENABLED).
- [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` (`RECEPTIONOACDET_PARQ_FK`, ENABLED).
- [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDQUALITETRIAGEOEUF` → [QUALITETRIAGEOEUF](tables.md#qualitetriageoeuf).`ID` (`RECEPTIONOACDET_QUAL_FK`, ENABLED).

Vues dépendantes directes (1) : [RECEPTIONOACDETAIL_LIB](vues.md#receptionoacdetail-lib).

Références dans le code : [ferme/production/ReceptionOACDetail.java:83](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/production/ReceptionOACDetail.java#L83>), [ferme/production/importoac-saisie.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/importoac-saisie.jsp#L25>), [ferme/production/receptionoac-saisie.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/receptionoac-saisie.jsp#L25>).

<a id="receptionpoussinaeroport"></a>

## RECEPTIONPOUSSINAEROPORT

Réception d’un lot de poussins : date, quantité reçue, cartons par sexe, horaires et état.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDLOT` | `VARCHAR2(50 BYTE)` | Non | FK → LOT |
| `DATY` | `DATE` | Oui |  |
| `QTERECUS` | `NUMBER(10,2)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `NBRCARTONMALE` | `NUMBER(*,0)` | Oui |  |
| `NBRCARTONFEMELLE` | `NUMBER(*,0)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `HEUREDEPART` | `VARCHAR2(10 BYTE)` | Oui |  |
| `HEUREARRIVE` | `VARCHAR2(10 BYTE)` | Oui |  |

Clés : `SYS_C007610` (primaire) : `ID`.

Clés étrangères sortantes :

- [RECEPTIONPOUSSINAEROPORT](tables.md#receptionpoussinaeroport).`IDLOT` → [LOT](tables.md#lot).`ID` (`FK_RECPOUSS_LOT`, ENABLED).

Tables qui la référencent :

- [RECEPTIONPOUSSINAEROPORTDETAIL](tables.md#receptionpoussinaeroportdetail).`IDMERE` → [RECEPTIONPOUSSINAEROPORT](tables.md#receptionpoussinaeroport).`ID`.

Vues dépendantes directes (2) : [RECEPTIONPOUSSINAEDETAIL_LIB](vues.md#receptionpoussinaedetail-lib), [RECEPTIONPOUSSINAEROPORT_LIB](vues.md#receptionpoussinaeroport-lib).

Références dans le code : [ferme/receptionaeroport/ReceptionPoussinAeroport.java:17](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/receptionaeroport/ReceptionPoussinAeroport.java#L17>).

<a id="receptionpoussinaeroportdetail"></a>

## RECEPTIONPOUSSINAEROPORTDETAIL

Détail des poussins réceptionnés par sexe et qualité.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(50 BYTE)` | Non | FK → RECEPTIONPOUSSINAEROPORT |
| `IDQUALITEPOUSSIN` | `VARCHAR2(50 BYTE)` | Oui | FK → QUALITEPOUSSIN |
| `IDSEXE` | `VARCHAR2(50 BYTE)` | Oui | FK → SEXE |
| `QTE` | `NUMBER(10,2)` | Oui |  |

Clés : `SYS_C007612` (primaire) : `ID`.

Clés étrangères sortantes :

- [RECEPTIONPOUSSINAEROPORTDETAIL](tables.md#receptionpoussinaeroportdetail).`IDMERE` → [RECEPTIONPOUSSINAEROPORT](tables.md#receptionpoussinaeroport).`ID` (`FK_RECPOUSSDET_MERE`, ENABLED).
- [RECEPTIONPOUSSINAEROPORTDETAIL](tables.md#receptionpoussinaeroportdetail).`IDQUALITEPOUSSIN` → [QUALITEPOUSSIN](tables.md#qualitepoussin).`ID` (`FK_RECPOUSSDET_QUALITE`, ENABLED).
- [RECEPTIONPOUSSINAEROPORTDETAIL](tables.md#receptionpoussinaeroportdetail).`IDSEXE` → [SEXE](tables.md#sexe).`ID` (`FK_RECPOUSSDET_SEXE`, ENABLED).

Vues dépendantes directes (1) : [RECEPTIONPOUSSINAEDETAIL_LIB](vues.md#receptionpoussinaedetail-lib).

Références dans le code : [ferme/receptionaeroport/ReceptionPoussinAeroportDetail.java:15](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/receptionaeroport/ReceptionPoussinAeroportDetail.java#L15>).

<a id="recette-fille"></a>

## RECETTE_FILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → RECETTE_MERE |
| `IDINGREDIENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDUNITE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QTE` | `NUMBER(15,5)` | Oui |  |

Clés : `RECETTE_FILLE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [RECETTE_FILLE](tables.md#recette-fille).`IDMERE` → [RECETTE_MERE](tables.md#recette-mere).`ID` (`RECETTE_MERE_FILLE_FK`, ENABLED).

Vues dépendantes directes (1) : [RECETTE_FILLE_LIB](vues.md#recette-fille-lib).

Références dans le code : [produits/RecetteFille.java:65](<../../projet-standard - Copie/arbiochem-ejb/src/java/produits/RecetteFille.java#L65>).

<a id="recette-mere"></a>

## RECETTE_MERE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `NOMRECETTE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `VERSION` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `RECETTE_MERE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [RECETTE_FILLE](tables.md#recette-fille).`IDMERE` → [RECETTE_MERE](tables.md#recette-mere).`ID`.

Vues dépendantes directes (1) : [RECETTE_MERE_LIB](vues.md#recette-mere-lib).

Références dans le code : [produits/RecetteMere.java:57](<../../projet-standard - Copie/arbiochem-ejb/src/java/produits/RecetteMere.java#L57>), [produits/as-ingredients-arbiochem-fiche.jsp:98](<../../projet-standard - Copie/arbiochem-war/web/pages/produits/as-ingredients-arbiochem-fiche.jsp#L98>), [produits/recette-insert.jsp:16](<../../projet-standard - Copie/arbiochem-war/web/pages/produits/recette-insert.jsp#L16>).

<a id="reclamation"></a>

## RECLAMATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDVENTEFILLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `IDTYPE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `QTE` | `NUMBER(12,2)` | Oui |  |

Clés : `SYS_C007618` (primaire) : `ID`.

Vues dépendantes directes (1) : [RECLAMATIONLIB](vues.md#reclamationlib).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="referencefacture"></a>

## REFERENCEFACTURE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDFACTURE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REFERENCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `REFERENCEFACTURE_PK` (primaire) : `ID`.

Vues dépendantes directes (5) : [FACTUREFOURNISSEURCPL](vues.md#facturefournisseurcpl), [VENTE_CPL](vues.md#vente-cpl), [VENTE_CPL_CL](vues.md#vente-cpl-cl), [VENTE_CPL_SANSAVOIR](vues.md#vente-cpl-sansavoir), [VENTE_DIRECTE_CPL_PDF](vues.md#vente-directe-cpl-pdf).

Références dans le code : [facture/ReferenceFacture.java:18](<../../projet-standard - Copie/arbiochem-ejb/src/java/facture/ReferenceFacture.java#L18>), [facture/reference-facture-fiche.jsp:17](<../../projet-standard - Copie/arbiochem-war/web/pages/facture/reference-facture-fiche.jsp#L17>), [facture/reference-facture-saisie.jsp:17](<../../projet-standard - Copie/arbiochem-war/web/pages/facture/reference-facture-saisie.jsp#L17>).

<a id="region"></a>

## REGION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `REGION_PK` (primaire) : `ID`.

Vues dépendantes directes (3) : [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [PAIE_AVANCEMENT_LIBELLE4](vues.md#paie-avancement-libelle4).

Références dans le code : [paie/employe/EmployeComplet.java:662](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/EmployeComplet.java#L662>), [paie/employe/EmployeService.java:59](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/EmployeService.java#L59>), [paie/avancement/avancement-contrat.jsp:41](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-contrat.jsp#L41>), [paie/avancement/avancement-modif.jsp:43](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-modif.jsp#L43>), [paie/avancement/avancement-saisie.jsp:43](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-saisie.jsp#L43>).

<a id="reglementinterieur"></a>

## REGLEMENTINTERIEUR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `NUMEROREGLE` | `NUMBER(*,0)` | Oui |  |
| `DESCRIPTIONREGLE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `NIVEAU` | `NUMBER(*,0)` | Oui |  |

Clés : `REGLEMENTINTERIEUR_PK` (primaire) : `ID`.

Tables qui la référencent :

- [SANCTION](tables.md#sanction).`IDREGLEENFREINTE` → [REGLEMENTINTERIEUR](tables.md#reglementinterieur).`ID`.

Vues dépendantes directes (1) : [SANCTION_CPL](vues.md#sanction-cpl).

Références dans le code : [paie/employe/sanction/RegleInterieur.java:12](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/sanction/RegleInterieur.java#L12>), [paie/employe/sanction/sanction-liste.jsp:38](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/sanction/sanction-liste.jsp#L38>), [paie/employe/sanction/sanction-saisie.jsp:42](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/sanction/sanction-saisie.jsp#L42>).

<a id="relevefab"></a>

## RELEVEFAB

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDFAB` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDRELEVE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SYS_C007625` (primaire) : `ID`.

Vues dépendantes directes (4) : [FABNONRATTACHE](vues.md#fabnonrattache), [FABRICATIONRATTACHE](vues.md#fabricationrattache), [OFRATTACHE](vues.md#ofrattache), [RELEVERFABCPL](vues.md#releverfabcpl).

Références dans le code : [maintenance/configuration/ReleveFab.java:16](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/configuration/ReleveFab.java#L16>).

<a id="relever"></a>

## RELEVER

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDCAISSE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(2,0)` | Oui |  |
| `DATYDEBUT` | `DATE` | Oui |  |
| `DATYFIN` | `DATE` | Oui |  |

Clés : `SYS_C007627` (primaire) : `ID`.

Tables qui la référencent :

- [RELEVERDETAIL](tables.md#releverdetail).`IDMERE` → [RELEVER](tables.md#relever).`ID`.

Vues dépendantes directes (4) : [RELEVERDETAILCPL](vues.md#releverdetailcpl), [RELEVERDETAILNR](vues.md#releverdetailnr), [RELEVERDETAILR](vues.md#releverdetailr), [RELEVERLIB](vues.md#releverlib).

Références dans le code : [rapprochement/Relever.java:68](<../../projet-standard - Copie/arbiochem-ejb/src/java/rapprochement/Relever.java#L68>), [caisse/import-relever.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/import-relever.jsp#L21>), [rapprochement/import-relever.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/rapprochement/import-relever.jsp#L23>), [rapprochement/saisie-relever.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/rapprochement/saisie-relever.jsp#L19>).

<a id="releverdetail"></a>

## RELEVERDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(50 BYTE)` | Oui | FK → RELEVER |
| `DATY` | `DATE` | Oui |  |
| `DATYVALEUR` | `DATE` | Oui |  |
| `DESIGNATION` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DEBIT` | `NUMBER(10,2)` | Oui |  |
| `CREDIT` | `NUMBER(10,2)` | Oui |  |
| `SOLDE` | `NUMBER(15,2)` | Oui |  |

Clés : `SYS_C007629` (primaire) : `ID`.

Clés étrangères sortantes :

- [RELEVERDETAIL](tables.md#releverdetail).`IDMERE` → [RELEVER](tables.md#relever).`ID` (`FK_RELEVERDETAIL_RELEVER`, ENABLED).

Tables qui la référencent :

- [RAPPROCHEMENT](tables.md#rapprochement).`IDRELEVERDETAIL` → [RELEVERDETAIL](tables.md#releverdetail).`ID`.

Vues dépendantes directes (4) : [RELEVERDETAILCPL](vues.md#releverdetailcpl), [RELEVERDETAILNR](vues.md#releverdetailnr), [RELEVERDETAILORDER](vues.md#releverdetailorder), [RELEVERDETAILR](vues.md#releverdetailr).

Références dans le code : [rapprochement/ReleverDetail.java:93](<../../projet-standard - Copie/arbiochem-ejb/src/java/rapprochement/ReleverDetail.java#L93>), [rapprochement/saisie-relever.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/rapprochement/saisie-relever.jsp#L21>).

<a id="remboursement"></a>

## REMBOURSEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non |  |
| `IDAVANCE` | `VARCHAR2(100 BYTE)` | Non |  |
| `MOIS` | `NUMBER(*,0)` | Oui |  |
| `ANNEE` | `NUMBER(*,0)` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `DATYREMBOURSEMENT` | `DATE` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Vues dépendantes directes (1) : [REMBOURSEMENTLIB](vues.md#remboursementlib).

Références dans le code : [paie/avance/Avance.java:226](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/avance/Avance.java#L226>), [paie/avance/Remboursement.java:40](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/avance/Remboursement.java#L40>), [paie/avance/remboursement-modif.jsp:39](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avance/remboursement-modif.jsp#L39>), [paie/avance/remboursement-saisie-2.jsp:37](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avance/remboursement-saisie-2.jsp#L37>), [paie/avance/remboursement-saisie.jsp:67](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avance/remboursement-saisie.jsp#L67>) ; 1 autres fichiers dans `usages-code.json`.

<a id="remise"></a>

## REMISE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `NOM` | `VARCHAR2(155 BYTE)` | Oui |  |
| `DATEDEBUT` | `DATE` | Oui |  |
| `DATEFIN` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SYS_C007632` (primaire) : `ID`.

Tables qui la référencent :

- [REMISEFILLE](tables.md#remisefille).`IDREMISE` → [REMISE](tables.md#remise).`ID`.

Vues dépendantes directes (7) : [REMISEFILLEMERE](vues.md#remisefillemere), [REMISEFILLEMERELIB](vues.md#remisefillemerelib), [REMISEFILLEMEREVISE](vues.md#remisefillemerevise), [REMISELIB](vues.md#remiselib), [REMISELIB_A](vues.md#remiselib-a), [REMISELIB_C](vues.md#remiselib-c), [REMISELIB_V](vues.md#remiselib-v).

Références dans le code : [remise/Remise.java:66](<../../projet-standard - Copie/arbiochem-ejb/src/java/remise/Remise.java#L66>), [vente/remise/remise-fiche.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/remise/remise-fiche.jsp#L13>), [vente/remise/remise-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/remise/remise-liste.jsp#L7>), [vente/remise/remise-saisie.jsp:20](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/remise/remise-saisie.jsp#L20>).

<a id="remisefille"></a>

## REMISEFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMISE` | `NUMBER(30,2)` | Oui |  |
| `IDCATEGORIECLIENT` | `VARCHAR2(255 BYTE)` | Oui | FK → TYPECLIENT |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `CATEGORIEPRODUIT` | `VARCHAR2(255 BYTE)` | Oui | FK → CATEGORIEINGREDIENT |
| `IDPOINT` | `VARCHAR2(255 BYTE)` | Oui | FK → POINT |
| `IDREMISE` | `VARCHAR2(255 BYTE)` | Oui | FK → REMISE |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Clés étrangères sortantes :

- [REMISEFILLE](tables.md#remisefille).`CATEGORIEPRODUIT` → [CATEGORIEINGREDIENT](tables.md#categorieingredient).`ID` (`REMISEFILLE_FK`, ENABLED).
- [REMISEFILLE](tables.md#remisefille).`IDPOINT` → [POINT](tables.md#point).`ID` (`SYS_C007971`, ENABLED).
- [REMISEFILLE](tables.md#remisefille).`IDCATEGORIECLIENT` → [TYPECLIENT](tables.md#typeclient).`ID` (`SYS_C007993`, ENABLED).
- [REMISEFILLE](tables.md#remisefille).`IDREMISE` → [REMISE](tables.md#remise).`ID` (`SYS_C008033`, ENABLED).
- [REMISEFILLE](tables.md#remisefille).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`SYS_C008266`, ENABLED).

Vues dépendantes directes (4) : [REMISEFILLELIB](vues.md#remisefillelib), [REMISEFILLEMERE](vues.md#remisefillemere), [REMISEFILLEMERELIB](vues.md#remisefillemerelib), [REMISEFILLEMEREVISE](vues.md#remisefillemerevise).

Références dans le code : [remise/RemiseFille.java:122](<../../projet-standard - Copie/arbiochem-ejb/src/java/remise/RemiseFille.java#L122>), [vente/remise/remise-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/remise/remise-saisie.jsp#L22>).

<a id="repartirionpg"></a>

## REPARTIRIONPG

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDFACTUREFILLE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDPERTE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |

Clés : `REPARTIRIONPG_PK` (primaire) : `ID`.

Vues dépendantes directes (2) : [FFAVECPERTE_FF](vues.md#ffavecperte-ff), [REPARTIRIONPGGROUPEE](vues.md#repartirionpggroupee).

Références dans le code : [faturefournisseur/RepartirionPG.java:13](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/RepartirionPG.java#L13>).

<a id="reportcaisse"></a>

## REPORTCAISSE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDCAISSE` | `VARCHAR2(255 BYTE)` | Non | FK → CAISSE |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `MONTANTTHEORIQUE` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Non |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `HEURE` | `VARCHAR2(10 BYTE)` | Oui |  |

Clés : `REPORTCAISSE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [REPORTCAISSE](tables.md#reportcaisse).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` (`REPORTCAISSE_CAISSE_FK`, ENABLED).

Vues dépendantes directes (4) : [REPORTCAISSEAVECHEURE](vues.md#reportcaisseavecheure), [REPORTCAISSELIB](vues.md#reportcaisselib), [REPORTCAISSE_DEVISE](vues.md#reportcaisse-devise), [V_ETATCAISSE_CLOTURE](vues.md#v-etatcaisse-cloture).

Références dans le code : [caisse/ReportCaisse.java:43](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/ReportCaisse.java#L43>), [caisse/EtatCaisse.java:297](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/EtatCaisse.java#L297>).

<a id="requete-a-envoyer"></a>

## REQUETE_A_ENVOYER

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(200 BYTE)` | Non | PK |
| `ACTION` | `VARCHAR2(200 BYTE)` | Oui |  |
| `TABLECONCERNE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `REQUETE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `HEURE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `SERVEUR` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `SYS_C007637` (primaire) : `ID`.

Vues dépendantes directes (2) : [REQUETE_A_ENVOYER_SERVEUR](vues.md#requete-a-envoyer-serveur), [REQUETE_EXECUTE_SERVEUR](vues.md#requete-execute-serveur).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="requete-a-envoyer-groupe"></a>

## REQUETE_A_ENVOYER_GROUPE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(4000 BYTE)` | Non | PK |
| `ACTION` | `CLOB` | Oui |  |
| `TABLECONCERNE` | `CLOB` | Oui |  |
| `REQUETE` | `CLOB` | Oui |  |
| `DATYG` | `CLOB` | Oui |  |
| `HEURE` | `CLOB` | Oui |  |
| `SERVEUR` | `CLOB` | Oui |  |
| `ETAT` | `NUMBER(10,0)` | Oui |  |
| `IDREQUETEAENVOYER` | `CLOB` | Oui |  |

Clés : `SYS_C007639` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="requete-execute"></a>

## REQUETE_EXECUTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(200 BYTE)` | Non | PK |
| `IDREQUETE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `SERVEUR` | `VARCHAR2(200 BYTE)` | Oui |  |
| `HEURE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `SYS_C007640` (primaire) : `ID`.

Vues dépendantes directes (1) : [REQUETE_EXECUTE_SERVEUR](vues.md#requete-execute-serveur).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="reservation"></a>

## RESERVATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDCLIENT` | `VARCHAR2(255 BYTE)` | Oui | FK → CLIENT |
| `DATY` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `RESERVATION_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [RESERVATION](tables.md#reservation).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`RESERVATION_CLIENT_FK`, ENABLED).

Tables qui la référencent :

- [CHECKIN](tables.md#checkin).`RESERVATION` → [RESERVATION](tables.md#reservation).`ID`.
- [FACTURECLIENT](tables.md#factureclient).`IDRESERVATION` → [RESERVATION](tables.md#reservation).`ID`.
- [RESERVATIONDETAILS](tables.md#reservationdetails).`IDMERE` → [RESERVATION](tables.md#reservation).`ID`.

Vues dépendantes directes (4) : [RESERVATIONDETAILSAVECMERE](vues.md#reservationdetailsavecmere), [RESERVATIONDETSANSCI](vues.md#reservationdetsansci), [RESERVATIONSIMPLE](vues.md#reservationsimple), [RESERVATION_LIB](vues.md#reservation-lib).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="reservationdetails"></a>

## RESERVATIONDETAILS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(100 BYTE)` | Oui | FK → RESERVATION |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QTE` | `NUMBER(*,0)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `HEURE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `RESERVATIONDETAILS_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [RESERVATIONDETAILS](tables.md#reservationdetails).`IDMERE` → [RESERVATION](tables.md#reservation).`ID` (`RESERVATION_MEREFILLE_FK`, ENABLED).

Vues dépendantes directes (5) : [RESERVATIONDETAILSAVECMERE](vues.md#reservationdetailsavecmere), [RESERVATIONDETAILSMAXDATE](vues.md#reservationdetailsmaxdate), [RESERVATIONDETAILS_LIB](vues.md#reservationdetails-lib), [RESERVATIONDETSANSCI](vues.md#reservationdetsansci), [RESERVATIONSIMPLE](vues.md#reservationsimple).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="resreclamation"></a>

## RESRECLAMATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDRECLAMATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `IDTYPE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `QTE` | `NUMBER(12,2)` | Oui |  |

Clés : `SYS_C007644` (primaire) : `ID`.

Vues dépendantes directes (1) : [RESRECLAMATIONLIB](vues.md#resreclamationlib).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="ressourceparfabrication"></a>

## RESSOURCEPARFABRICATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDFABRICATION` | `VARCHAR2(255 BYTE)` | Oui | FK → FABRICATION |
| `IDPOSTE` | `VARCHAR2(100 BYTE)` | Oui | FK → POSTE |
| `IDRESSOURCE` | `VARCHAR2(50 BYTE)` | Oui | FK → PAIE_INFO_PERSONNEL |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDQUALIFICATION` | `VARCHAR2(100 BYTE)` | Oui | FK → QUALIFICATION_PAIE |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |

Clés : `RESSOURCEPARFABRICATION_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [RESSOURCEPARFABRICATION](tables.md#ressourceparfabrication).`IDQUALIFICATION` → [QUALIFICATION_PAIE](tables.md#qualification-paie).`ID` (`FK_QUALIFICATION_RES`, ENABLED).
- [RESSOURCEPARFABRICATION](tables.md#ressourceparfabrication).`IDFABRICATION` → [FABRICATION](tables.md#fabrication).`ID` (`RESPARFAB_FAB_FK`, ENABLED).
- [RESSOURCEPARFABRICATION](tables.md#ressourceparfabrication).`IDPOSTE` → [POSTE](tables.md#poste).`ID` (`RESPARFAB_POSTE_FK`, ENABLED).
- [RESSOURCEPARFABRICATION](tables.md#ressourceparfabrication).`IDRESSOURCE` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` (`RESPARFAB_RESSOURCE_FK`, ENABLED).

Vues dépendantes directes (4) : [HS_FAB_SEMAINE_PARTRANCHE](vues.md#hs-fab-semaine-partranche), [RESSOURCEPARFABRICATIONCOMPLET](vues.md#ressourceparfabricationcomplet), [RESSOURCEPARFAB_CPL_RECTIF](vues.md#ressourceparfab-cpl-rectif), [VW_HS_CUMUL_WEEK](vues.md#vw-hs-cumul-week).

Références dans le code : [fabrication/HeureSupFabrication.java:357](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/HeureSupFabrication.java#L357>), [fabrication/RessourceParFabrication.java:187](<../../projet-standard - Copie/arbiochem-ejb/src/java/fabrication/RessourceParFabrication.java#L187>).

<a id="resultatmaintenance"></a>

## RESULTATMAINTENANCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDORDRETRAVAUX` | `VARCHAR2(255 BYTE)` | Oui | FK → ORDRETRAVAUX |
| `IDPERSONNEL` | `NUMBER` | Oui | FK → UTILISATEUR |
| `ETATMACHINE` | `VARCHAR2(255 BYTE)` | Oui | FK → ETATMACHINE |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PROCHAINEETAPE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PROCHAINEDATY` | `DATE` | Oui |  |

Clés : `RESULTATMAINT_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [RESULTATMAINTENANCE](tables.md#resultatmaintenance).`ETATMACHINE` → [ETATMACHINE](tables.md#etatmachine).`ID` (`RESULTATMAINT_ETAT_FK`, ENABLED).
- [RESULTATMAINTENANCE](tables.md#resultatmaintenance).`IDORDRETRAVAUX` → [ORDRETRAVAUX](tables.md#ordretravaux).`ID` (`RESULTATMAINT_ORDRE_FK`, ENABLED).
- [RESULTATMAINTENANCE](tables.md#resultatmaintenance).`IDPERSONNEL` → [UTILISATEUR](tables.md#utilisateur).`REFUSER` (`RESULTATMAINT_USER_FK`, ENABLED).

Vues dépendantes directes (1) : [RESULTATMAINTENANCELIB](vues.md#resultatmaintenancelib).

Références dans le code : [maintenance/travaux/ResultatMaintenance.java:87](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/travaux/ResultatMaintenance.java#L87>).

<a id="retrait-frais-medicaux"></a>

## RETRAIT_FRAIS_MEDICAUX

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDPERSONNEL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCRIPTION` | `VARCHAR2(1000 BYTE)` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `RETRAIT_FRAIS_MEDICAUX_PK` (primaire) : `ID`.

Vues dépendantes directes (4) : [RETRAIT_FRAIS_MEDICAUX_ANALYSE](vues.md#retrait-frais-medicaux-analyse), [RETRAIT_FRAIS_MEDICAUX_LIB](vues.md#retrait-frais-medicaux-lib), [RETRAIT_FRAIS_MEDICAUX_RESTE](vues.md#retrait-frais-medicaux-reste), [RETRAIT_FRAIS_MEDIC_GRPPERS](vues.md#retrait-frais-medic-grppers).

Références dans le code : [paie/frais/RetraitFraisMedicaux.java:88](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/frais/RetraitFraisMedicaux.java#L88>).

<a id="ristourne"></a>

## RISTOURNE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(200 BYTE)` | Oui |  |
| `IDCLIENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `DATEDEBUTRISTOURNE` | `DATE` | Oui |  |
| `DATEFINRISTOURNE` | `DATE` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `TAUX` | `NUMBER(5,2)` | Oui |  |
| `MOIS` | `NUMBER` | Oui |  |
| `ANNEE` | `NUMBER` | Oui |  |
| `ESTLIAISONPAIEMENT` | `NUMBER(*,0)` | Oui |  |
| `IDVENTE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `RISTOURNE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [RISTOURNEDETAILS](tables.md#ristournedetails).`IDRISTOURNE` → [RISTOURNE](tables.md#ristourne).`ID`.
- [RISTOURNEFACTURE](tables.md#ristournefacture).`IDRISTOURNE` → [RISTOURNE](tables.md#ristourne).`ID`.

Vues dépendantes directes (2) : [RISTOURNELIB](vues.md#ristournelib), [VENTE_EDITEES](vues.md#vente-editees).

Références dans le code : [ristourne/Ristourne.java:40](<../../projet-standard - Copie/arbiochem-ejb/src/java/ristourne/Ristourne.java#L40>).

<a id="ristournedetails"></a>

## RISTOURNEDETAILS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDRISTOURNE` | `VARCHAR2(255 BYTE)` | Oui | FK → RISTOURNE |
| `IDPRODUIT` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `TAUX1` | `NUMBER(5,2)` | Oui |  |
| `TAUX2` | `NUMBER(5,2)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QTE` | `NUMBER` | Oui |  |
| `PU` | `NUMBER(30,5)` | Oui |  |

Clés : `RISTOURNEDETAILS_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [RISTOURNEDETAILS](tables.md#ristournedetails).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`RISTOURNEDETAILS_INGRE_FK`, ENABLED).
- [RISTOURNEDETAILS](tables.md#ristournedetails).`IDRISTOURNE` → [RISTOURNE](tables.md#ristourne).`ID` (`RISTOURNE_MEREFILLE_FK`, ENABLED).

Vues dépendantes directes (1) : [RISTOURNEDETAILS_LIB](vues.md#ristournedetails-lib).

Références dans le code : [ristourne/RistourneDetails.java:33](<../../projet-standard - Copie/arbiochem-ejb/src/java/ristourne/RistourneDetails.java#L33>).

<a id="ristournefacture"></a>

## RISTOURNEFACTURE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDFACTURE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDRISTOURNE` | `VARCHAR2(255 BYTE)` | Oui | FK → RISTOURNE |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `RISTOURNEFACTURE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [RISTOURNEFACTURE](tables.md#ristournefacture).`IDRISTOURNE` → [RISTOURNE](tables.md#ristourne).`ID` (`RISTOURNEFACTURE_RISTOURNE_FK`, ENABLED).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="roles"></a>

## ROLES

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `IDROLE` | `VARCHAR2(20 BYTE)` | Non | PK |
| `DESCROLE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `RANG` | `NUMBER(*,0)` | Oui |  |

Clés : `PK_ROLES` (primaire) : `IDROLE`.

Tables qui la référencent :

- [ETATHIERARCHIE](tables.md#etathierarchie).`IDROLE` → [ROLES](tables.md#roles).`IDROLE`.
- [VALIDATION_ROLE](tables.md#validation-role).`ROLE` → [ROLES](tables.md#roles).`IDROLE`.

Vues dépendantes directes (11) : [DEMANDE_LIBCOMPLET](vues.md#demande-libcomplet), [DEMANDE_LIBCOMPLET2](vues.md#demande-libcomplet2), [DEMANDE_LIBCOMPLET3](vues.md#demande-libcomplet3), [EMPLOYE_COMPLET2](vues.md#employe-complet2), [EMPLOYE_COMPLET_NOU2](vues.md#employe-complet-nou2), [UTILISATEURROLE](vues.md#utilisateurrole), [UTILISATEURVALIDE](vues.md#utilisateurvalide), [UTILISATEURVUE](vues.md#utilisateurvue), [UTILISATEUR_ACTIONROLE](vues.md#utilisateur-actionrole), [VALIDATION_ROLE_LIB_CPL](vues.md#validation-role-lib-cpl), [V_UTILISATEURLIB](vues.md#v-utilisateurlib).

Références dans le code : [utilisateur/role-fiche.jsp:15](<../../projet-standard - Copie/arbiochem-war/web/pages/utilisateur/role-fiche.jsp#L15>), [utilisateur/role-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/utilisateur/role-liste.jsp#L7>).

<a id="rubriquemanuel"></a>

## RUBRIQUEMANUEL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `RUBRIQUEMANUEL_PK` (primaire) : `ID`.

Références dans le code : [paie/edition/EditionCalcul.java:94](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/EditionCalcul.java#L94>).

<a id="sanction"></a>

## SANCTION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDPERSONNE` | `VARCHAR2(255 BYTE)` | Oui | FK → PAIE_INFO_PERSONNEL |
| `TYPEFAUTE` | `VARCHAR2(100 BYTE)` | Oui | FK → TYPEFAUTE |
| `DESCRIPTIONFAUTE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `IDREGLEENFREINTE` | `VARCHAR2(100 BYTE)` | Oui | FK → REGLEMENTINTERIEUR |
| `TYPESANCTION` | `VARCHAR2(100 BYTE)` | Oui | FK → TYPESANCTION |
| `NIVEAUSANCTION` | `NUMBER(*,0)` | Oui |  |
| `DATEDEBUT` | `DATE` | Oui |  |
| `DUREE` | `NUMBER(*,0)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `SANCTION_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [SANCTION](tables.md#sanction).`IDPERSONNE` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` (`SANCTION_PAIEINFO_FK`, ENABLED).
- [SANCTION](tables.md#sanction).`IDREGLEENFREINTE` → [REGLEMENTINTERIEUR](tables.md#reglementinterieur).`ID` (`SANCTION_REGLE_FK`, ENABLED).
- [SANCTION](tables.md#sanction).`TYPEFAUTE` → [TYPEFAUTE](tables.md#typefaute).`ID` (`SANCTION_TYPEFAUTE_FK`, ENABLED).
- [SANCTION](tables.md#sanction).`TYPESANCTION` → [TYPESANCTION](tables.md#typesanction).`ID` (`SANCTION_TYPE_FK`, ENABLED).

Vues dépendantes directes (1) : [SANCTION_CPL](vues.md#sanction-cpl).

Références dans le code : [paie/employe/sanction/Sanction.java:17](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/sanction/Sanction.java#L17>), [paie/employe/sanction/sanction-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/sanction/sanction-saisie.jsp#L13>).

<a id="scinderprevision"></a>

## SCINDERPREVISION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(20 BYTE)` | Non | PK |
| `IDPREVISION` | `VARCHAR2(20 BYTE)` | Non | FK → PREVISION |
| `NOMBRE` | `NUMBER(10,0)` | Non |  |

Clés : `PK_SCINDERPREVISION` (primaire) : `ID`.

Clés étrangères sortantes :

- [SCINDERPREVISION](tables.md#scinderprevision).`IDPREVISION` → [PREVISION](tables.md#prevision).`ID` (`FK_SCINDERPREVISION_PREV`, ENABLED).

Références dans le code : [prevision/ScinderPrevision.java:21](<../../projet-standard - Copie/arbiochem-ejb/src/java/prevision/ScinderPrevision.java#L21>), [essai/prevision/prevision-scinder.jsp:18](<../../projet-standard - Copie/arbiochem-war/web/pages/essai/prevision/prevision-scinder.jsp#L18>), [prevision/prevision-scinder.jsp:18](<../../projet-standard - Copie/arbiochem-war/web/pages/prevision/prevision-scinder.jsp#L18>).

<a id="section"></a>

## SECTION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDSERVICE` | `VARCHAR2(255 BYTE)` | Oui | FK → DEPARTEMENTDIVERS |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007666` (primaire) : `ID`.

Clés étrangères sortantes :

- [SECTION](tables.md#section).`IDSERVICE` → [DEPARTEMENTDIVERS](tables.md#departementdivers).`ID` (`FK_SECTION_SERVICE`, ENABLED).

Vues dépendantes directes (3) : [DEPENSEDIVERSLIB](vues.md#depensediverslib), [SECTIONLIB](vues.md#sectionlib), [SECTION_LIB](vues.md#section-lib).

Références dans le code : [paie/annexe/Section.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/annexe/Section.java#L10>).

<a id="semestre"></a>

## SEMESTRE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SEMESTRE_PK` (primaire) : `ID`.

Vues dépendantes directes (2) : [ACTION_FORMATION_LIB](vues.md#action-formation-lib), [V_RECAP_GLOBAL_FORMATION](vues.md#v-recap-global-formation).

Références dans le code : [paie/formation/action/actionformation-liste.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/action/actionformation-liste.jsp#L25>), [paie/formation/action/actionformation-saisie-back.jsp:32](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/action/actionformation-saisie-back.jsp#L32>), [paie/formation/action/actionformation-saisie.jsp:43](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/action/actionformation-saisie.jsp#L43>), [paie/formation/recap-global-formation.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/recap-global-formation.jsp#L27>).

<a id="server-broadcast"></a>

## SERVER_BROADCAST

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `NOM` | `VARCHAR2(250 BYTE)` | Oui |  |
| `ADRESSE_IP` | `VARCHAR2(250 BYTE)` | Oui |  |
| `UTILISATEUR` | `VARCHAR2(250 BYTE)` | Oui |  |
| `MDP` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DRIVER` | `VARCHAR2(250 BYTE)` | Oui |  |
| `SERVICE_NAME` | `VARCHAR2(250 BYTE)` | Oui |  |
| `PORT` | `VARCHAR2(50 BYTE)` | Non |  |

Clés : `SYS_C007670` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="service"></a>

## SERVICE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CODE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007671` (primaire) : `ID`.

Vues dépendantes directes (3) : [FACTUREFOURNISSEURCPL](vues.md#facturefournisseurcpl), [PREVISION_CPL](vues.md#prevision-cpl), [SECTIONLIB](vues.md#sectionlib).

Références dans le code : [prevision/Service.java:70](<../../projet-standard - Copie/arbiochem-ejb/src/java/prevision/Service.java#L70>), [paie/avancement/avancement-modif.jsp:66](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-modif.jsp#L66>).

<a id="session-formation"></a>

## SESSION_FORMATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDACTIONFORMATION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATEDEBUT` | `DATE` | Oui |  |
| `DATEFIN` | `DATE` | Oui |  |
| `NBHEUREPREVUE` | `NUMBER(10,2)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `REMARQUE` | `VARCHAR2(1000 BYTE)` | Oui |  |

Clés : `SYS_C007673` (primaire) : `ID`.

Tables qui la référencent :

- [SUIVI_PRESENCE_MERE](tables.md#suivi-presence-mere).`IDSESSIONFORMATION` → [SESSION_FORMATION](tables.md#session-formation).`ID`.

Vues dépendantes directes (3) : [SESSION_FORMATION_LIB](vues.md#session-formation-lib), [SUIVI_PRESENCE_MERE_LIB](vues.md#suivi-presence-mere-lib), [V_RECAP_GLOBAL_FORMATION](vues.md#v-recap-global-formation).

Références dans le code : [paie/formation/session/SessionFormation.java:68](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formation/session/SessionFormation.java#L68>), [paie/formation/session/sessionformation-saisie.jsp:15](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/session/sessionformation-saisie.jsp#L15>), [paie/formation/suivi/suivipresence-saisie.jsp:59](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/suivi/suivipresence-saisie.jsp#L59>).

<a id="seuil"></a>

## SEUIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui | FK → PRODUIT |
| `QUANTITE` | `NUMBER` | Oui |  |

Clés : `SEUIL_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [SEUIL](tables.md#seuil).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID` (`SEUIL_PRODUIT_FK`, ENABLED).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="seuilperteachat"></a>

## SEUILPERTEACHAT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDINGREDIENT` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `SEUILPERTE` | `NUMBER(5,2)` | Oui |  |

Clés : `SEUILPERTEACHAT_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [SEUILPERTEACHAT](tables.md#seuilperteachat).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`SEUILPERTEACHAT_INGREDIENT_FK`, ENABLED).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="sexe"></a>

## SEXE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SEXE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [BATIMENTDETAIL](tables.md#batimentdetail).`IDSEXE` → [SEXE](tables.md#sexe).`ID`.
- [PESEEPOUSSIN](tables.md#peseepoussin).`IDSEXE` → [SEXE](tables.md#sexe).`ID`.
- [PROGRAMMEZOOTECHNIQUEDETAILS](tables.md#programmezootechniquedetails).`IDSEXE` → [SEXE](tables.md#sexe).`ID`.
- [RECEPTIONPOUSSINAEROPORTDETAIL](tables.md#receptionpoussinaeroportdetail).`IDSEXE` → [SEXE](tables.md#sexe).`ID`.
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDSEXE` → [SEXE](tables.md#sexe).`ID`.
- [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDSEXE` → [SEXE](tables.md#sexe).`ID`.

Vues dépendantes directes (16) : [BATIMENTDETAIL_LIB](vues.md#batimentdetail-lib), [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [LOG_PERSONNEL_AVECCONGE](vues.md#log-personnel-avecconge), [LOG_PERSONNEL_FIN](vues.md#log-personnel-fin), [LOG_PERSONNEL_FIN_CONGE](vues.md#log-personnel-fin-conge), [LOG_PERSONNEL_GRAPHE](vues.md#log-personnel-graphe), [PESEEPOUSSIN_LIB](vues.md#peseepoussin-lib), [PROGRAMMEZOOTECHNIQUEDT_LIB](vues.md#programmezootechniquedt-lib), [RECEPTIONPOUSSINAEDETAIL_LIB](vues.md#receptionpoussinaedetail-lib), [TRANSFERTPOULETDETAIL_LIB](vues.md#transfertpouletdetail-lib), [TRIAGEBATPARQUETDETAIL_LIB](vues.md#triagebatparquetdetail-lib), [V1_OSTIE_AFFICHE_T1](vues.md#v1-ostie-affiche-t1), [V1_OSTIE_AFFICHE_T2](vues.md#v1-ostie-affiche-t2), [V1_OSTIE_AFFICHE_T3](vues.md#v1-ostie-affiche-t3), [V1_OSTIE_AFFICHE_T4](vues.md#v1-ostie-affiche-t4).

Références dans le code : [paie/DeroulanteEmbaucheData.java:40](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/DeroulanteEmbaucheData.java#L40>), [ferme/configuration/batiment-saisie.jsp:49](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/batiment-saisie.jsp#L49>), [ferme/pesee/peseepoussin-saisie.jsp:67](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/pesee/peseepoussin-saisie.jsp#L67>), [ferme/programme/programmezoo-saisie.jsp:68](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/programme/programmezoo-saisie.jsp#L68>), [ferme/receptionaeroport/receptionaeroport-saisie.jsp:46](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/receptionaeroport/receptionaeroport-saisie.jsp#L46>) ; 3 autres fichiers dans `usages-code.json`.

<a id="sig-dr"></a>

## SIG_DR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(150 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DR_ABREVIATION` | `VARCHAR2(50 BYTE)` | Oui |  |
| `NUMERO_FIXE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `NUMERO_MOBILE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DR_SIGLE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SIG_DR_PKEY` (primaire) : `ID`.

Vues dépendantes directes (1) : [LOG_SERVICE_LIBELLE](vues.md#log-service-libelle).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="sig-fokontany"></a>

## SIG_FOKONTANY

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Non |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `CODE_COMMUNE` | `VARCHAR2(100 BYTE)` | Non |  |
| `ID_FIV` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SIG_FOKONTANY_PKEY` (primaire) : `ID`.

Vues dépendantes directes (2) : [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="sig-personnes"></a>

## SIG_PERSONNES

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `PERS_NOM` | `VARCHAR2(100 BYTE)` | Oui |  |
| `PERS_PRENOM` | `VARCHAR2(50 BYTE)` | Oui |  |
| `PERS_SEXE` | `CHAR(1 BYTE)` | Oui |  |
| `PERS_NUMERO_CIN` | `VARCHAR2(17 BYTE)` | Oui |  |
| `PERS_DATE_CIN` | `DATE` | Oui |  |
| `PERS_DATE_DUPL_CIN` | `DATE` | Oui |  |
| `PERS_LIEU_CIN` | `VARCHAR2(50 BYTE)` | Oui |  |
| `PERS_ACTE_NAIS` | `VARCHAR2(100 BYTE)` | Oui |  |
| `PERS_DATE_NAIS` | `DATE` | Oui |  |
| `PERS_NATIONALITE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `PERS_NOM_MERE` | `VARCHAR2(150 BYTE)` | Oui |  |
| `PERS_NOM_PERE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `PERS_DATE_DECES` | `DATE` | Oui |  |
| `PERS_DATE_RETRAITE` | `DATE` | Oui |  |
| `CODE_FKT_NAIS` | `VARCHAR2(50 BYTE)` | Oui |  |
| `PERS_CODE_FKT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `PERS_ADRESSE_LOT` | `VARCHAR2(200 BYTE)` | Oui |  |
| `ID_LOG_PERSONNEL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `BOITE_POSTAL` | `VARCHAR2(50 BYTE)` | Oui |  |
| `PERS_TELEPHONE` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `SIG_PERSONNES_PKEY` (primaire) : `ID`.

Références dans le code : [paie/log/SigPersonnes.java:72](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/log/SigPersonnes.java#L72>).

<a id="situation"></a>

## SITUATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SITUATION_PK` (primaire) : `ID`.

Tables qui la référencent :

- [DEMANDETRAVAUX](tables.md#demandetravaux).`IDSITUATION` → [SITUATION](tables.md#situation).`ID`.
- [PLANNING](tables.md#planning).`IDSITUATION` → [SITUATION](tables.md#situation).`ID`.

Vues dépendantes directes (2) : [DEMANDETRAVAUX_CPL](vues.md#demandetravaux-cpl), [PLANNING_CPL](vues.md#planning-cpl).

Références dans le code : [maintenance/configuration/Situation.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/configuration/Situation.java#L9>).

<a id="situation-matrimoniale"></a>

## SITUATION_MATRIMONIALE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(250 BYTE)` | Non |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `SITUATION_MATRIMONIALE_PK` (primaire) : `ID`.

Vues dépendantes directes (2) : [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3).

Références dans le code : [paie/DeroulanteEmbaucheData.java:43](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/DeroulanteEmbaucheData.java#L43>), [paie/employe/infopersonnel-saisie.jsp:36](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/infopersonnel-saisie.jsp#L36>).

<a id="societe"></a>

## SOCIETE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007691` (primaire) : `ID`.

Tables qui la référencent :

- [BUSINESS_UNITE](tables.md#business-unite).`IDSOCIETE` → [SOCIETE](tables.md#societe).`ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="solde-frm-2023"></a>

## SOLDE_FRM_2023

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `RETRAIT_FRAIS_MEDICAUXSOLDE_PK` (primaire) : `ID`.

Vues dépendantes directes (1) : [PAIE_EDITION_GRP_PERSONNE2](vues.md#paie-edition-grp-personne2).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="souche"></a>

## SOUCHE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007694` (primaire) : `ID`.

Tables qui la référencent :

- [LOT](tables.md#lot).`IDSOUCHE` → [SOUCHE](tables.md#souche).`ID`.
- [PROGRAMMEZOOTECHNIQUE](tables.md#programmezootechnique).`IDSOUCHE` → [SOUCHE](tables.md#souche).`ID`.

Vues dépendantes directes (6) : [DISTRIBUTIONALIMENT_LIB](vues.md#distributionaliment-lib), [LOT_LIB](vues.md#lot-lib), [PROGRAMMEZOOTECHNIQUE_LIB](vues.md#programmezootechnique-lib), [SUIVIJOURNALIER_LIB](vues.md#suivijournalier-lib), [TRANSFERTPOULET_LIB](vues.md#transfertpoulet-lib), [TRIAGEBATIMENTPARQUET_LIB](vues.md#triagebatimentparquet-lib).

Références dans le code : [ferme/configuration/Souche.java:12](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/configuration/Souche.java#L12>), [ferme/configuration/souche-saisie.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/souche-saisie.jsp#L19>), [ferme/lot/lot-saisie.jsp:39](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/lot/lot-saisie.jsp#L39>), [ferme/programme/programmezoo-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/programme/programmezoo-saisie.jsp#L33>).

<a id="source"></a>

## SOURCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SOURCE_PK` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="souscategorie"></a>

## SOUSCATEGORIE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(44 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `SYS_C007697` (primaire) : `ID`.

Tables qui la référencent :

- [PRODUIT](tables.md#produit).`IDSOUSCATEGORIE` → [SOUSCATEGORIE](tables.md#souscategorie).`ID`.

Références dans le code : [annexe/SousCategorie.java:18](<../../projet-standard - Copie/arbiochem-ejb/src/java/annexe/SousCategorie.java#L18>), [annexe/sous-categorie/sous-categorie-fiche.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/sous-categorie/sous-categorie-fiche.jsp#L24>), [annexe/sous-categorie/sous-categorie-liste.jsp:15](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/sous-categorie/sous-categorie-liste.jsp#L15>).

<a id="sousecrituredeclarer"></a>

## SOUSECRITUREDECLARER

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDSOUSECRITURE` | `VARCHAR2(255 BYTE)` | Non |  |
| `MOISDECLARATION` | `NUMBER(2,0)` | Oui |  |

Clés : `SYS_C007699` (primaire) : `ID` ; `SYS_C007700` (unique) : `IDSOUSECRITURE`.

Vues dépendantes directes (6) : [COMPTASOUSECRITURECND](vues.md#comptasousecriturecnd), [COMPTASOUSECRITUREDECLARER](vues.md#comptasousecrituredeclarer), [COMPTASOUSECRITUREDND](vues.md#comptasousecriturednd), [COMPTASOUSECRITUREND](vues.md#comptasousecriturend), [COMPTASOUSECRITURETVA](vues.md#comptasousecrituretva), [ECRITURE_IMPOT](vues.md#ecriture-impot).

Références dans le code : [declaration/SousEcritureDeclarer.java:36](<../../projet-standard - Copie/arbiochem-ejb/src/java/declaration/SousEcritureDeclarer.java#L36>).

<a id="sous-famille-pro"></a>

## SOUS_FAMILLE_PRO

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDFAMILLE` | `VARCHAR2(50 BYTE)` | Oui | FK → FAMILLE_PROFESSIONNELLE |

Clés : `SYS_C007702` (primaire) : `ID`.

Clés étrangères sortantes :

- [SOUS_FAMILLE_PRO](tables.md#sous-famille-pro).`IDFAMILLE` → [FAMILLE_PROFESSIONNELLE](tables.md#famille-professionnelle).`ID` (`SYS_C008257`, ENABLED).

Vues dépendantes directes (4) : [CODE_ROME_LIB](vues.md#code-rome-lib), [METIERLIB](vues.md#metierlib), [SOUS_FAMILLE_PRO_LIB](vues.md#sous-famille-pro-lib), [V_HIERARCHIE_PROFESSIONNELLE](vues.md#v-hierarchie-professionnelle).

Références dans le code : [paie/competence/SousFamillePro.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/competence/SousFamillePro.java#L10>), [paie/competence/sousfamillepro-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/competence/sousfamillepro-saisie.jsp#L13>), [paie/competence/coderome-saisie.jsp:20](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/competence/coderome-saisie.jsp#L20>).

<a id="stock-engage"></a>

## STOCK_ENGAGE

Document principal de réservation de stock.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDVENTE` | `VARCHAR2(255 BYTE)` | Oui | FK → VENTE |
| `IDTRANSFERT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDTYPEMVSTOCK` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `IDPOINT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDOBJET` | `VARCHAR2(100 BYTE)` | Oui |  |
| `FABPRECEDENT` | `VARCHAR2(150 BYTE)` | Oui |  |

Clés : `STOCK_ENGAGE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [STOCK_ENGAGE](tables.md#stock-engage).`IDVENTE` → [VENTE](tables.md#vente).`ID` (`STOCK_ENGAGE_VENTE_FK`, ENABLED).

Tables qui la référencent :

- [STOCK_ENGAGE_FILLE](tables.md#stock-engage-fille).`IDMVTSTOCK` → [STOCK_ENGAGE](tables.md#stock-engage).`ID`.

Vues dépendantes directes (3) : [MVTSTOCK_ENG](vues.md#mvtstock-eng), [STOCK_ENGAGE_FILLE_GP_MAG](vues.md#stock-engage-fille-gp-mag), [V_ETATSTOCK_ING_ENG](vues.md#v-etatstock-ing-eng).

Références dans le code : [avoir/AvoirFC.java:541](<../../projet-standard - Copie/arbiochem-ejb/src/java/avoir/AvoirFC.java#L541>), [stock/MvtStock.java:556](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/MvtStock.java#L556>), [vente/Vente.java:969](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/Vente.java#L969>), [stock/EtatStockAvecEngagement.java:120](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStockAvecEngagement.java#L120>).

<a id="stock-engage-fille"></a>

## STOCK_ENGAGE_FILLE

Lignes des réservations de stock.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDMVTSTOCK` | `VARCHAR2(255 BYTE)` | Oui | FK → STOCK_ENGAGE |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDVENTEDETAIL` | `VARCHAR2(255 BYTE)` | Oui | FK → VENTE_DETAILS |
| `IDTRANSFERTDETAIL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MVTSRC` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ENTREE` | `NUMBER(30,5)` | Oui |  |
| `SORTIE` | `NUMBER(30,5)` | Oui |  |
| `PU` | `NUMBER(30,5)` | Oui |  |
| `RESTE` | `NUMBER(30,5)` | Oui |  |

Clés : `STOCK_ENGAGE_FILLE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [STOCK_ENGAGE_FILLE](tables.md#stock-engage-fille).`IDMVTSTOCK` → [STOCK_ENGAGE](tables.md#stock-engage).`ID` (`STOCK_ENGAGEMERE_FILLE_FK`, ENABLED).
- [STOCK_ENGAGE_FILLE](tables.md#stock-engage-fille).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID` (`STOCK_ENGAGE_F_VENTEDETAIL_FK`, ENABLED).

Vues dépendantes directes (5) : [MVTSTOCKFILLEMONTANT_ENG](vues.md#mvtstockfillemontant-eng), [MVTSTOCKFILLE_ENG](vues.md#mvtstockfille-eng), [STOCK_ENGAGE_FILLE_GP](vues.md#stock-engage-fille-gp), [STOCK_ENGAGE_FILLE_GP_MAG](vues.md#stock-engage-fille-gp-mag), [V_ETATSTOCK_ING_ENG](vues.md#v-etatstock-ing-eng).

Références dans le code : [avoir/AvoirFC.java:555](<../../projet-standard - Copie/arbiochem-ejb/src/java/avoir/AvoirFC.java#L555>), [stock/MvtStock.java:575](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/MvtStock.java#L575>), [vente/Vente.java:984](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/Vente.java#L984>), [stock/EtatStockAvecEngagement.java:119](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStockAvecEngagement.java#L119>).

<a id="suivichambrefroide"></a>

## SUIVICHAMBREFROIDE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDSALLESTOCKAGEOEUF` | `VARCHAR2(255 BYTE)` | Oui | FK → MAGASIN2 |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SYS_C007707` (primaire) : `ID`.

Clés étrangères sortantes :

- [SUIVICHAMBREFROIDE](tables.md#suivichambrefroide).`IDSALLESTOCKAGEOEUF` → [MAGASIN2](tables.md#magasin2).`ID` (`FK_SUIVICF_SALSTOCKOEUF`, ENABLED).

Tables qui la référencent :

- [SUIVICHAMBREFROIDEDETAIL](tables.md#suivichambrefroidedetail).`IDMERE` → [SUIVICHAMBREFROIDE](tables.md#suivichambrefroide).`ID`.

Vues dépendantes directes (1) : [SUIVICHAMBREFROIDE_LIB](vues.md#suivichambrefroide-lib).

Références dans le code : [ferme/couvoir/SuiviChambreFroide.java:39](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/couvoir/SuiviChambreFroide.java#L39>), [ferme/couvoir/suivichambrefroide-saisie.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/suivichambrefroide-saisie.jsp#L24>).

<a id="suivichambrefroidedetail"></a>

## SUIVICHAMBREFROIDEDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → SUIVICHAMBREFROIDE |
| `IDRESPONSABLE` | `VARCHAR2(255 BYTE)` | Oui | FK → LOG_PERSONNEL |
| `HEURE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `TEMPERATURE` | `NUMBER(32,0)` | Oui |  |
| `HUMIDITE` | `NUMBER(32,0)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007708` (primaire) : `ID`.

Clés étrangères sortantes :

- [SUIVICHAMBREFROIDEDETAIL](tables.md#suivichambrefroidedetail).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`FK_SUIVICFDETAIL_LOGPERSO`, ENABLED).
- [SUIVICHAMBREFROIDEDETAIL](tables.md#suivichambrefroidedetail).`IDMERE` → [SUIVICHAMBREFROIDE](tables.md#suivichambrefroide).`ID` (`FK_SUIVICFDETAIL_MERE`, ENABLED).

Vues dépendantes directes (1) : [SUIVICHAMBREFROIDEDETAIL_LIB](vues.md#suivichambrefroidedetail-lib).

Références dans le code : [ferme/couvoir/SuiviChambreFroideDetail.java:83](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/couvoir/SuiviChambreFroideDetail.java#L83>), [ferme/couvoir/suivichambrefroide-saisie.jsp:26](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/suivichambrefroide-saisie.jsp#L26>).

<a id="suivijournalier"></a>

## SUIVIJOURNALIER

Suivi quotidien d’un lot dans une ferme.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDFERME` | `VARCHAR2(100 BYTE)` | Oui | FK → MAGASIN2 |
| `IDLOT` | `VARCHAR2(100 BYTE)` | Oui | FK → LOT |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SUIVIJOURN_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [SUIVIJOURNALIER](tables.md#suivijournalier).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID` (`SUIVIJOURN_FERME_FK`, ENABLED).
- [SUIVIJOURNALIER](tables.md#suivijournalier).`IDLOT` → [LOT](tables.md#lot).`ID` (`SUIVIJOURN_LOT_FK`, ENABLED).

Tables qui la référencent :

- [SUIVIJOURNALIERDETAIL](tables.md#suivijournalierdetail).`IDMERE` → [SUIVIJOURNALIER](tables.md#suivijournalier).`ID`.

Vues dépendantes directes (1) : [SUIVIJOURNALIER_LIB](vues.md#suivijournalier-lib).

Références dans le code : [ferme/suiviJournalier/SuiviJournalier.java:48](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/suiviJournalier/SuiviJournalier.java#L48>), [ferme/suiviJournalier/suivijournalier-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/suiviJournalier/suivijournalier-saisie.jsp#L23>).

<a id="suivijournalierdetail"></a>

## SUIVIJOURNALIERDETAIL

Suivi par bâtiment et parquet : entrées, tri, mortalité, culls, aliment, eau et températures.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(100 BYTE)` | Oui | FK → SUIVIJOURNALIER |
| `IDBATIMENT` | `VARCHAR2(100 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUET` | `VARCHAR2(100 BYTE)` | Oui | FK → PARQUET |
| `AGEJOUR` | `NUMBER(30,2)` | Oui |  |
| `ENTREE` | `NUMBER(30,2)` | Oui |  |
| `TRI` | `NUMBER(30,2)` | Oui |  |
| `MORTALITE` | `NUMBER(30,2)` | Oui |  |
| `CULLS` | `NUMBER(30,2)` | Oui |  |
| `CONSIGNESURALIMENT` | `NUMBER(30,2)` | Oui |  |
| `EAU` | `NUMBER(30,2)` | Oui |  |
| `TEMPERATUREMIN` | `NUMBER(30,2)` | Oui |  |
| `TEMPERATUREMAX` | `NUMBER(30,2)` | Oui |  |

Clés : `SUIVIJOURNDET_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [SUIVIJOURNALIERDETAIL](tables.md#suivijournalierdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` (`SUIVIJOURNDET_BAT_FK`, ENABLED).
- [SUIVIJOURNALIERDETAIL](tables.md#suivijournalierdetail).`IDMERE` → [SUIVIJOURNALIER](tables.md#suivijournalier).`ID` (`SUIVIJOURNDET_MERE_FK`, ENABLED).
- [SUIVIJOURNALIERDETAIL](tables.md#suivijournalierdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` (`SUIVIJOURNDET_PARQ_FK`, ENABLED).

Vues dépendantes directes (1) : [SUIVIJOURNALIERDETAIL_LIB](vues.md#suivijournalierdetail-lib).

Références dans le code : [ferme/suiviJournalier/SuiviJournalierDetail.java:137](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/suiviJournalier/SuiviJournalierDetail.java#L137>), [ferme/suiviJournalier/suivijournalier-saisie.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/suiviJournalier/suivijournalier-saisie.jsp#L25>).

<a id="suivi-presence-fille"></a>

## SUIVI_PRESENCE_FILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDSUIVIPRESENCEMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → SUIVI_PRESENCE_MERE |
| `IDPARTICIPATIONFORMATION` | `VARCHAR2(255 BYTE)` | Oui | FK → PARTICIPATION_FORMATION |
| `IDPERSONNEL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDACTIONFORMATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATESEANCE` | `DATE` | Oui |  |
| `PRESENCE` | `VARCHAR2(10 BYTE)` | Oui |  |
| `NBHEUREEFFECTUE` | `NUMBER(10,2)` | Oui |  |

Clés : `SYS_C007711` (primaire) : `ID`.

Clés étrangères sortantes :

- [SUIVI_PRESENCE_FILLE](tables.md#suivi-presence-fille).`IDSUIVIPRESENCEMERE` → [SUIVI_PRESENCE_MERE](tables.md#suivi-presence-mere).`ID` (`FK_SUIVI_FILLE_MERE`, ENABLED).
- [SUIVI_PRESENCE_FILLE](tables.md#suivi-presence-fille).`IDPARTICIPATIONFORMATION` → [PARTICIPATION_FORMATION](tables.md#participation-formation).`ID` (`FK_SUIVI_FILLE_PARTICIPATION`, ENABLED).

Vues dépendantes directes (1) : [SUIVI_PRESENCE_FILLE_LIB](vues.md#suivi-presence-fille-lib).

Références dans le code : [paie/formation/suivi/SuiviPresenceFille.java:94](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formation/suivi/SuiviPresenceFille.java#L94>), [paie/formation/suivi/SuiviPresenceMereLib.java:6](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formation/suivi/SuiviPresenceMereLib.java#L6>).

<a id="suivi-presence-mere"></a>

## SUIVI_PRESENCE_MERE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDSESSIONFORMATION` | `VARCHAR2(255 BYTE)` | Oui | FK → SESSION_FORMATION |
| `DATY` | `DATE` | Oui |  |

Clés : `SYS_C007712` (primaire) : `ID`.

Clés étrangères sortantes :

- [SUIVI_PRESENCE_MERE](tables.md#suivi-presence-mere).`IDSESSIONFORMATION` → [SESSION_FORMATION](tables.md#session-formation).`ID` (`FK_SUIVI_MERE_SESSION`, ENABLED).

Tables qui la référencent :

- [SUIVI_PRESENCE_FILLE](tables.md#suivi-presence-fille).`IDSUIVIPRESENCEMERE` → [SUIVI_PRESENCE_MERE](tables.md#suivi-presence-mere).`ID`.

Vues dépendantes directes (1) : [SUIVI_PRESENCE_MERE_LIB](vues.md#suivi-presence-mere-lib).

Références dans le code : [paie/formation/suivi/SuiviPresenceMere.java:40](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formation/suivi/SuiviPresenceMere.java#L40>), [paie/formation/suivi/suivipresence-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/suivi/suivipresence-saisie.jsp#L22>).

<a id="tarif-ingredients"></a>

## TARIF_INGREDIENTS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDTYPECLIENT` | `VARCHAR2(100 BYTE)` | Oui | FK → TYPECLIENT |
| `IDINGREDIENT` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENTS |
| `DATY` | `DATE` | Oui |  |
| `PRIXUNITAIRE` | `NUMBER(10,2)` | Oui |  |
| `UNITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SYS_C007713` (primaire) : `ID`.

Clés étrangères sortantes :

- [TARIF_INGREDIENTS](tables.md#tarif-ingredients).`IDTYPECLIENT` → [TYPECLIENT](tables.md#typeclient).`ID` (`SYS_C007994`, ENABLED).
- [TARIF_INGREDIENTS](tables.md#tarif-ingredients).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` (`SYS_C008267`, ENABLED).

Vues dépendantes directes (6) : [TARIF_INGREDIENTS_LIB](vues.md#tarif-ingredients-lib), [TARIF_INGREDIENTS_MAX](vues.md#tarif-ingredients-max), [TARIF_INGREDIENTS_MAX_DATE_MN](vues.md#tarif-ingredients-max-date-mn), [TARIF_INGREDIENTS_MAX_DATE_MNN](vues.md#tarif-ingredients-max-date-mnn), [TARIF_INGREDIENTS_MAX_MN](vues.md#tarif-ingredients-max-mn), [TARIF_INGREDIENTS_MAX_MNN](vues.md#tarif-ingredients-max-mnn).

Références dans le code : [produits/TarifIngredients.java:19](<../../projet-standard - Copie/arbiochem-ejb/src/java/produits/TarifIngredients.java#L19>), [vente/tarifIngredients/tarifIngredients-saisie.jsp:14](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/tarifIngredients/tarifIngredients-saisie.jsp#L14>).

<a id="tauxdechange"></a>

## TAUXDECHANGE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDDEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `TAUX` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |

Clés : `TAUXDECHANGE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [TAUXDECHANGE](tables.md#tauxdechange).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`TAUXDECHANGE_DEVISE_FK`, ENABLED).

Vues dépendantes directes (3) : [TAUXDECHANGE_MAXDATY](vues.md#tauxdechange-maxdaty), [V_ETATCAISSE](vues.md#v-etatcaisse), [V_ETATCAISSE_CLOTURE](vues.md#v-etatcaisse-cloture).

Références dans le code : [change/TauxDeChange.java:18](<../../projet-standard - Copie/arbiochem-ejb/src/java/change/TauxDeChange.java#L18>), [caisse/EtatCaisse.java:226](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/EtatCaisse.java#L226>).

<a id="tempsouverture"></a>

## TEMPSOUVERTURE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDMACHINE` | `VARCHAR2(50 BYTE)` | Oui | FK → AS_INGREDIENT_MAINTENANCE |
| `TEMPS` | `NUMBER` | Oui |  |
| `CAPACITE` | `NUMBER` | Oui |  |
| `IDUNITE` | `VARCHAR2(25 BYTE)` | Oui | FK → AS_UNITE |

Clés : `SYS_C007715` (primaire) : `ID`.

Clés étrangères sortantes :

- [TEMPSOUVERTURE](tables.md#tempsouverture).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` (`FK_TEMPSOUVERTURE_MACHINE`, ENABLED).
- [TEMPSOUVERTURE](tables.md#tempsouverture).`IDUNITE` → [AS_UNITE](tables.md#as-unite).`ID` (`FK_TEMPSOUVERTURE_UNITE`, ENABLED).

Vues dépendantes directes (1) : [TEMPSOUVERTURELIB](vues.md#tempsouverturelib).

Références dans le code : [maintenance/tempOuverture/TempsOuverture.java:56](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/tempOuverture/TempsOuverture.java#L56>), [tempsOuverture/tempsOuverture-saisie.jsp:15](<../../projet-standard - Copie/arbiochem-war/web/pages/tempsOuverture/tempsOuverture-saisie.jsp#L15>).

<a id="traite"></a>

## TRAITE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `TIERS` | `VARCHAR2(100 BYTE)` | Oui |  |
| `BANQUE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATEECHEANCE` | `DATE` | Oui |  |
| `REFERENCE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `IDTYPEPIECE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `IDFINALEDESTINATION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `NUMCHEQUE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `NUMPIECE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `TRAITE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDTRAITE` → [TRAITE](tables.md#traite).`ID`.

Vues dépendantes directes (7) : [MVTINTRACAISSETRAITE](vues.md#mvtintracaissetraite), [MVTINTRACAISSETRAITENONVERSEE](vues.md#mvtintracaissetraitenonversee), [MVTINTRACAISSETRAITEVCAISSE](vues.md#mvtintracaissetraitevcaisse), [TRAITEMTTFC](vues.md#traitemttfc), [TRAITE_FC](vues.md#traite-fc), [TRAITE_JC](vues.md#traite-jc), [TRAITE_LIB](vues.md#traite-lib).

Références dans le code : [facture/tr/Traite.java:194](<../../projet-standard - Copie/arbiochem-ejb/src/java/facture/tr/Traite.java#L194>), [facture/traite-saisie.jsp:18](<../../projet-standard - Copie/arbiochem-war/web/pages/facture/traite-saisie.jsp#L18>).

<a id="traitement-paie"></a>

## TRAITEMENT_PAIE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPERSONNEL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `NETAPAYER` | `NUMBER(30,2)` | Oui |  |
| `MODEPAIEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `NUMEROCOMPTE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDEDITION` | `VARCHAR2(50 BYTE)` | Oui | FK → PAIE_EDITIONMOISANNEE |

Clés : `TRAITEMENT_PAIE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [TRAITEMENT_PAIE](tables.md#traitement-paie).`IDEDITION` → [PAIE_EDITIONMOISANNEE](tables.md#paie-editionmoisannee).`ID` (`TRAITEPAIE_EDITION_FK`, ENABLED).

Références dans le code : [paie/edition/TraitementPaie.java:21](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/edition/TraitementPaie.java#L21>).

<a id="tranche"></a>

## TRANCHE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `HEUREDEBUT` | `VARCHAR2(10 BYTE)` | Oui |  |
| `HEUREFIN` | `VARCHAR2(10 BYTE)` | Oui |  |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007720` (primaire) : `ID`.

Références dans le code : [maintenance/tranche/Tranche.java:39](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/tranche/Tranche.java#L39>), [compteur/releve-electricite-liste.jsp:44](<../../projet-standard - Copie/arbiochem-war/web/pages/compteur/releve-electricite-liste.jsp#L44>), [compteur/releve-liste.jsp:53](<../../projet-standard - Copie/arbiochem-war/web/pages/compteur/releve-liste.jsp#L53>), [maintenance/tranche/tranche-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/tranche/tranche-fiche.jsp#L11>), [maintenance/tranche/tranche-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/tranche/tranche-liste.jsp#L7>).

<a id="transfertpoulet"></a>

## TRANSFERTPOULET

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDLOT` | `VARCHAR2(50 BYTE)` | Non | FK → LOT |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SYS_C007722` (primaire) : `ID`.

Clés étrangères sortantes :

- [TRANSFERTPOULET](tables.md#transfertpoulet).`IDLOT` → [LOT](tables.md#lot).`ID` (`FK_TRANSFPOULET_LOT`, ENABLED).

Tables qui la référencent :

- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDMERE` → [TRANSFERTPOULET](tables.md#transfertpoulet).`ID`.

Vues dépendantes directes (1) : [TRANSFERTPOULET_LIB](vues.md#transfertpoulet-lib).

Références dans le code : [ferme/transfertpoulet/TransfertPoulet.java:17](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/transfertpoulet/TransfertPoulet.java#L17>).

<a id="transfertpouletdetail"></a>

## TRANSFERTPOULETDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(50 BYTE)` | Oui | FK → TRANSFERTPOULET |
| `IDSEXE` | `VARCHAR2(50 BYTE)` | Oui | FK → SEXE |
| `IDFERMEDEPART` | `VARCHAR2(50 BYTE)` | Oui | FK → MAGASIN2 |
| `IDBATIMENTDEPART` | `VARCHAR2(50 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUETDEPART` | `VARCHAR2(50 BYTE)` | Oui | FK → PARQUET |
| `QTE` | `NUMBER(10,2)` | Oui |  |
| `IDFERMEARRIVE` | `VARCHAR2(50 BYTE)` | Oui | FK → MAGASIN2 |
| `IDBATIMENTARRIVE` | `VARCHAR2(50 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUETARRIVE` | `VARCHAR2(50 BYTE)` | Oui | FK → PARQUET |
| `IDCONTROLEUR` | `VARCHAR2(50 BYTE)` | Oui | FK → LOG_PERSONNEL |
| `IDCHAUFFEUR` | `VARCHAR2(50 BYTE)` | Oui | FK → LOG_PERSONNEL |
| `IDVEHICULE` | `VARCHAR2(50 BYTE)` | Oui | FK → VEHICULE |

Clés : `SYS_C007723` (primaire) : `ID`.

Clés étrangères sortantes :

- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDBATIMENTARRIVE` → [BATIMENT](tables.md#batiment).`ID` (`FK_TRANSFPOULDET_BATARR`, ENABLED).
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDBATIMENTDEPART` → [BATIMENT](tables.md#batiment).`ID` (`FK_TRANSFPOULDET_BATDEP`, ENABLED).
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDCHAUFFEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`FK_TRANSFPOULDET_CHAUFFEUR`, ENABLED).
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDCONTROLEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`FK_TRANSFPOULDET_CONTROLEUR`, ENABLED).
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDFERMEARRIVE` → [MAGASIN2](tables.md#magasin2).`ID` (`FK_TRANSFPOULDET_FERMEARR`, ENABLED).
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDFERMEDEPART` → [MAGASIN2](tables.md#magasin2).`ID` (`FK_TRANSFPOULDET_FERMEDEP`, ENABLED).
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDMERE` → [TRANSFERTPOULET](tables.md#transfertpoulet).`ID` (`FK_TRANSFPOULDET_MERE`, ENABLED).
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDPARQUETARRIVE` → [PARQUET](tables.md#parquet).`ID` (`FK_TRANSFPOULDET_PARQARR`, ENABLED).
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDPARQUETDEPART` → [PARQUET](tables.md#parquet).`ID` (`FK_TRANSFPOULDET_PARQDEP`, ENABLED).
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDSEXE` → [SEXE](tables.md#sexe).`ID` (`FK_TRANSFPOULDET_SEXE`, ENABLED).
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDVEHICULE` → [VEHICULE](tables.md#vehicule).`ID` (`FK_TRANSFPOULDET_VEHICULE`, ENABLED).

Vues dépendantes directes (1) : [TRANSFERTPOULETDETAIL_LIB](vues.md#transfertpouletdetail-lib).

Références dans le code : [ferme/transfertpoulet/TransfertPouletDetail.java:16](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/transfertpoulet/TransfertPouletDetail.java#L16>).

<a id="transfertstock"></a>

## TRANSFERTSTOCK

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(300 BYTE)` | Oui |  |
| `IDMAGASINDEPART` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASINARRIVE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDOF` | `VARCHAR2(255 BYTE)` | Oui | FK → OFAB |
| `ISVENTE` | `NUMBER(10,0)` | Oui |  |
| `IDDEMANDETRANSFERT` | `VARCHAR2(255 BYTE)` | Oui | FK → DEMANDETRANSFERT |

Clés : `TRANSFERTSTOCK_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [TRANSFERTSTOCK](tables.md#transfertstock).`IDDEMANDETRANSFERT` → [DEMANDETRANSFERT](tables.md#demandetransfert).`ID` (`FK_TRANSFERTSTOCK_DEMANDE`, ENABLED).
- [TRANSFERTSTOCK](tables.md#transfertstock).`IDOF` → [OFAB](tables.md#ofab).`ID` (`TRANSFERTSTOCK_OF_FK`, ENABLED).

Tables qui la référencent :

- [TRANSFERTSTOCKDETAILS](tables.md#transfertstockdetails).`IDTRANSFERTSTOCK` → [TRANSFERTSTOCK](tables.md#transfertstock).`ID`.

Vues dépendantes directes (2) : [TRANSFERTSTOCKCPL](vues.md#transfertstockcpl), [TRANSFERTSTOCKDETAILSCPL](vues.md#transfertstockdetailscpl).

Références dans le code : [stock/TransfertStock.java:45](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/TransfertStock.java#L45>), [stock/transfertstock/transfertstock-modif.jsp:26](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/transfertstock/transfertstock-modif.jsp#L26>), [stock/transfertstock/transfertstock-saisie.jsp:87](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/transfertstock/transfertstock-saisie.jsp#L87>).

<a id="transfertstockdetails"></a>

## TRANSFERTSTOCKDETAILS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDTRANSFERTSTOCK` | `VARCHAR2(255 BYTE)` | Oui | FK → TRANSFERTSTOCK |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDSOURCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `PU` | `NUMBER(30,5)` | Oui |  |
| `QUANTITE` | `NUMBER(30,5)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `IDFOURNISSEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → FOURNISSEUR |
| `ESTAPPRODV` | `NUMBER(*,0)` | Oui |  |
| `QUANTITESOURCE` | `NUMBER(30,5)` | Oui |  |
| `PUSOURCE` | `NUMBER(30,5)` | Oui |  |

Clés : `TRANSFERTSTOCKDETAILS_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [TRANSFERTSTOCKDETAILS](tables.md#transfertstockdetails).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` (`FK_TSD_FOURNISSEUR`, ENABLED).
- [TRANSFERTSTOCKDETAILS](tables.md#transfertstockdetails).`IDTRANSFERTSTOCK` → [TRANSFERTSTOCK](tables.md#transfertstock).`ID` (`TRANSFERTSTOCK_MEREFILLE_FK`, ENABLED).

Vues dépendantes directes (3) : [TRANSFERTSTOCKDETAILSCPL](vues.md#transfertstockdetailscpl), [TRANSTOCKDETAILSGROUPEMERE](vues.md#transtockdetailsgroupemere), [V_ETATSTOCK_ENTREE](vues.md#v-etatstock-entree).

Références dans le code : [stock/TransfertStockDetails.java:32](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/TransfertStockDetails.java#L32>), [stock/transfertstock/transfertstock-modif.jsp:28](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/transfertstock/transfertstock-modif.jsp#L28>), [stock/transfertstock/transfertstock-saisie.jsp:89](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/transfertstock/transfertstock-saisie.jsp#L89>), [stock/EtatStockParEntreeFournisseur.java:185](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStockParEntreeFournisseur.java#L185>), [stock/EtatStockParEntreeStandard.java:204](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/EtatStockParEntreeStandard.java#L204>).

<a id="travaux"></a>

## TRAVAUX

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `LANCEPAR` | `VARCHAR2(255 BYTE)` | Oui |  |
| `CIBLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `BESOIN` | `DATE` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(38,0)` | Non |  |
| `IDBC` | `VARCHAR2(500 BYTE)` | Oui | FK → BONDECOMMANDE_CLIENT |
| `IDOFFILLE` | `VARCHAR2(255 BYTE)` | Oui | FK → ORDRETRAVAUXFILLE |
| `IDOF` | `VARCHAR2(255 BYTE)` | Oui |  |
| `FABRICATIONPREC` | `VARCHAR2(100 BYTE)` | Oui |  |
| `FABRICATIONSUIV` | `VARCHAR2(50 BYTE)` | Oui |  |
| `EQUIPE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DUREEESTIMATIF` | `NUMBER(10,2)` | Oui |  |

Clés : `SYS_C007728` (primaire) : `ID`.

Clés étrangères sortantes :

- [TRAVAUX](tables.md#travaux).`IDOFFILLE` → [ORDRETRAVAUXFILLE](tables.md#ordretravauxfille).`ID` (`FAB_OTFILE_FK`, ENABLED).
- [TRAVAUX](tables.md#travaux).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID` (`FK_TRAVAUX_BDC`, ENABLED).

Tables qui la référencent :

- [TRAVAUXFILLE](tables.md#travauxfille).`IDMERE` → [TRAVAUX](tables.md#travaux).`ID`.

Vues dépendantes directes (10) : [COUTSMAINTENANCE](vues.md#coutsmaintenance), [FACTUREFOURNISSEURCPL_TRAVAUX](vues.md#facturefournisseurcpl-travaux), [PLANNING_CPL](vues.md#planning-cpl), [PLANNING_DUREENONPROGRAMME](vues.md#planning-dureenonprogramme), [TEMPSMOYENPANNES](vues.md#tempsmoyenpannes), [TRAVAUXCPL](vues.md#travauxcpl), [TRAVAUXMEREFILLE](vues.md#travauxmerefille), [TRAVAUX_RECAP](vues.md#travaux-recap), [TYPEMAINTENANCETRAVAUX](vues.md#typemaintenancetravaux), [V_DUREE_TRAVAUX_MACHINE](vues.md#v-duree-travaux-machine).

Références dans le code : [maintenance/travaux/Travaux.java:30](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/travaux/Travaux.java#L30>), [maintenance/travaux/MoTravaux-saisie-multiple.jsp:14](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/travaux/MoTravaux-saisie-multiple.jsp#L14>), [maintenance/travaux/process/processmaintenance-saisie.jsp:15](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/travaux/process/processmaintenance-saisie.jsp#L15>).

<a id="travauxfille"></a>

## TRAVAUXFILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDINGREDIENTS` | `VARCHAR2(255 BYTE)` | Oui |  |
| `LIBELLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → TRAVAUX |
| `DATYBESOIN` | `DATE` | Oui |  |
| `QTE` | `NUMBER(20,2)` | Oui |  |
| `IDUNITE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `PU` | `NUMBER(20,2)` | Oui |  |
| `IDBCFILLE` | `VARCHAR2(1000 BYTE)` | Oui | FK → BONDECOMMANDE_CLIENT_FILLE |
| `OPERATEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → PERSONNEL |
| `NIVEAU` | `NUMBER` | Oui |  |
| `IDMACHINE` | `VARCHAR2(255 BYTE)` | Oui | FK → MACHINE |

Clés : `SYS_C007730` (primaire) : `ID`.

Clés étrangères sortantes :

- [TRAVAUXFILLE](tables.md#travauxfille).`IDBCFILLE` → [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`ID` (`FK_TRAFILLE_BDCFILLE`, ENABLED).
- [TRAVAUXFILLE](tables.md#travauxfille).`OPERATEUR` → [PERSONNEL](tables.md#personnel).`ID` (`FK_TRAFILLE_OPERATEUR`, ENABLED).
- [TRAVAUXFILLE](tables.md#travauxfille).`IDMERE` → [TRAVAUX](tables.md#travaux).`ID` (`SYS_C007984`, ENABLED).
- [TRAVAUXFILLE](tables.md#travauxfille).`IDMACHINE` → [MACHINE](tables.md#machine).`ID` (`TRAFILLE_MACHINE_FK`, ENABLED).

Vues dépendantes directes (2) : [PLANNING_CPL](vues.md#planning-cpl), [TRAVAUXFILLECPL](vues.md#travauxfillecpl).

Références dans le code : [maintenance/travaux/TravauxFille.java:17](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/travaux/TravauxFille.java#L17>).

<a id="triagebatimentparquet"></a>

## TRIAGEBATIMENTPARQUET

Document principal d’affectation ou triage des poussins par bâtiment et parquet.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDLOT` | `VARCHAR2(100 BYTE)` | Oui | FK → LOT |
| `DISPOMALE` | `NUMBER` | Oui |  |
| `DISPOFEMELLE` | `NUMBER` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `TRIAGEBATPARQ_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [TRIAGEBATIMENTPARQUET](tables.md#triagebatimentparquet).`IDLOT` → [LOT](tables.md#lot).`ID` (`TRIAGEBATPARQ_LOT_FK`, ENABLED).

Tables qui la référencent :

- [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDMERE` → [TRIAGEBATIMENTPARQUET](tables.md#triagebatimentparquet).`ID`.

Vues dépendantes directes (3) : [TRIAGEBATIMENTPARQUET_LIB](vues.md#triagebatimentparquet-lib), [TRIAGEBATPARQUETDETAIL_LIB](vues.md#triagebatparquetdetail-lib), [V_QTE_DISPO_LOT_SEXE_QUALITE](vues.md#v-qte-dispo-lot-sexe-qualite).

Références dans le code : [ferme/triageBatiment/TriageBatimentParquet.java:70](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/triageBatiment/TriageBatimentParquet.java#L70>), [ferme/triagebatiment/triagebatimentparquet-saisie.jsp:26](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/triagebatiment/triagebatimentparquet-saisie.jsp#L26>).

<a id="triagebatimentparquetdetail"></a>

## TRIAGEBATIMENTPARQUETDETAIL

Lignes d’affectation par bâtiment, parquet, sexe, qualité et quantité.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(100 BYTE)` | Oui | FK → TRIAGEBATIMENTPARQUET |
| `IDBATIMENT` | `VARCHAR2(100 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUET` | `VARCHAR2(100 BYTE)` | Oui | FK → PARQUET |
| `IDSEXE` | `VARCHAR2(100 BYTE)` | Oui | FK → SEXE |
| `IDQUALITE` | `VARCHAR2(100 BYTE)` | Oui | FK → QUALITEPOUSSIN |
| `QTE` | `NUMBER` | Oui |  |

Clés : `TRIAGEBATPARQDET_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` (`TRIAGEBATPARQDET_BAT_FK`, ENABLED).
- [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDMERE` → [TRIAGEBATIMENTPARQUET](tables.md#triagebatimentparquet).`ID` (`TRIAGEBATPARQDET_MERE_FK`, ENABLED).
- [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` (`TRIAGEBATPARQDET_PARQ_FK`, ENABLED).
- [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDQUALITE` → [QUALITEPOUSSIN](tables.md#qualitepoussin).`ID` (`TRIAGEBATPARQDET_QUAL_FK`, ENABLED).
- [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDSEXE` → [SEXE](tables.md#sexe).`ID` (`TRIAGEBATPARQDET_SEXE_FK`, ENABLED).

Vues dépendantes directes (3) : [TRIAGEBATIMENTPARQUET_LIB](vues.md#triagebatimentparquet-lib), [TRIAGEBATPARQUETDETAIL_LIB](vues.md#triagebatparquetdetail-lib), [V_QTE_DISPO_LOT_SEXE_QUALITE](vues.md#v-qte-dispo-lot-sexe-qualite).

Références dans le code : [ferme/triageBatiment/TriageBatimentParquetDetail.java:83](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/triageBatiment/TriageBatimentParquetDetail.java#L83>), [ferme/triagebatiment/triagebatimentparquet-saisie.jsp:28](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/triagebatiment/triagebatimentparquet-saisie.jsp#L28>).

<a id="triageoeuf"></a>

## TRIAGEOEUF

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `HEUREDEPART` | `VARCHAR2(20 BYTE)` | Oui |  |
| `IDOPERATEUR` | `VARCHAR2(100 BYTE)` | Oui | FK → LOG_PERSONNEL |
| `IDNUMEROCOLLECTE` | `VARCHAR2(100 BYTE)` | Oui | FK → NUMEROCOLLECTE |
| `IDBATIMENT` | `VARCHAR2(100 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUET` | `VARCHAR2(100 BYTE)` | Oui | FK → PARQUET |
| `OEUFTOTAL` | `NUMBER(30,2)` | Oui |  |
| `POIDSMOYENOEUFS` | `NUMBER(30,2)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `TRIAGEOEUF_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [TRIAGEOEUF](tables.md#triageoeuf).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` (`TRIAGEOEUF_BAT_FK`, ENABLED).
- [TRIAGEOEUF](tables.md#triageoeuf).`IDNUMEROCOLLECTE` → [NUMEROCOLLECTE](tables.md#numerocollecte).`ID` (`TRIAGEOEUF_NUMCOL_FK`, ENABLED).
- [TRIAGEOEUF](tables.md#triageoeuf).`IDOPERATEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`TRIAGEOEUF_OPER_FK`, ENABLED).
- [TRIAGEOEUF](tables.md#triageoeuf).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` (`TRIAGEOEUF_PARQ_FK`, ENABLED).

Tables qui la référencent :

- [TRIAGEOEUFDETAIL](tables.md#triageoeufdetail).`IDMERE` → [TRIAGEOEUF](tables.md#triageoeuf).`ID`.

Vues dépendantes directes (1) : [TRIAGEOEUF_LIB](vues.md#triageoeuf-lib).

Références dans le code : [ferme/production/TriageOeuf.java:93](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/production/TriageOeuf.java#L93>), [ferme/production/triageoeuf-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/triageoeuf-saisie.jsp#L23>).

<a id="triageoeufdetail"></a>

## TRIAGEOEUFDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(100 BYTE)` | Oui | FK → TRIAGEOEUF |
| `IDTYPECOLLECTE` | `VARCHAR2(100 BYTE)` | Oui | FK → TYPECOLLECTE |
| `IDQUALITETRIAGEOEUF` | `VARCHAR2(100 BYTE)` | Oui | FK → QUALITETRIAGEOEUF |
| `QTE` | `NUMBER(30,2)` | Oui |  |
| `IDDESTINATION` | `VARCHAR2(100 BYTE)` | Oui | FK → MAGASIN2 |

Clés : `TRIAGEOEUFDET_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [TRIAGEOEUFDETAIL](tables.md#triageoeufdetail).`IDDESTINATION` → [MAGASIN2](tables.md#magasin2).`ID` (`TRIAGEOEUFDET_DEST_FK`, ENABLED).
- [TRIAGEOEUFDETAIL](tables.md#triageoeufdetail).`IDMERE` → [TRIAGEOEUF](tables.md#triageoeuf).`ID` (`TRIAGEOEUFDET_MERE_FK`, ENABLED).
- [TRIAGEOEUFDETAIL](tables.md#triageoeufdetail).`IDQUALITETRIAGEOEUF` → [QUALITETRIAGEOEUF](tables.md#qualitetriageoeuf).`ID` (`TRIAGEOEUFDET_QUAL_FK`, ENABLED).
- [TRIAGEOEUFDETAIL](tables.md#triageoeufdetail).`IDTYPECOLLECTE` → [TYPECOLLECTE](tables.md#typecollecte).`ID` (`TRIAGEOEUFDET_TYPECOL_FK`, ENABLED).

Vues dépendantes directes (2) : [TRIAGEOEUFDETAIL_LIB](vues.md#triageoeufdetail-lib), [V_TRIAGEOEUFDETAIL_AGG](vues.md#v-triageoeufdetail-agg).

Références dans le code : [ferme/production/TriageOeufDetail.java:74](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/production/TriageOeufDetail.java#L74>), [ferme/production/triageoeuf-saisie.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/triageoeuf-saisie.jsp#L25>).

<a id="triagequalitepoussin"></a>

## TRIAGEQUALITEPOUSSIN

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDLOT` | `VARCHAR2(255 BYTE)` | Oui | FK → LOT |
| `DATY` | `DATE` | Oui |  |
| `QTEPOUSSINACONTROLER` | `NUMBER(32,0)` | Oui |  |
| `IDECLOSOIR` | `VARCHAR2(255 BYTE)` | Oui | FK → ECLOSOIR |
| `IDINCUBATEUR` | `VARCHAR2(255 BYTE)` | Oui | FK → INCUBATEUR |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SYS_C007735` (primaire) : `ID`.

Clés étrangères sortantes :

- [TRIAGEQUALITEPOUSSIN](tables.md#triagequalitepoussin).`IDECLOSOIR` → [ECLOSOIR](tables.md#eclosoir).`ID` (`FK_TRIAGEPOUS_ECLOSOIR`, ENABLED).
- [TRIAGEQUALITEPOUSSIN](tables.md#triagequalitepoussin).`IDINCUBATEUR` → [INCUBATEUR](tables.md#incubateur).`ID` (`FK_TRIAGEPOUS_INCUBATEUR`, ENABLED).
- [TRIAGEQUALITEPOUSSIN](tables.md#triagequalitepoussin).`IDLOT` → [LOT](tables.md#lot).`ID` (`FK_TRIAGEPOUS_LOT`, ENABLED).

Tables qui la référencent :

- [TRIAGEQUALITEPOUSSINDETAIL](tables.md#triagequalitepoussindetail).`IDMERE` → [TRIAGEQUALITEPOUSSIN](tables.md#triagequalitepoussin).`ID`.

Vues dépendantes directes (1) : [TRIAGEQUALITEPOUSSIN_LIB](vues.md#triagequalitepoussin-lib).

Références dans le code : [ferme/couvoir/TriageQualitePoussin.java:66](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/couvoir/TriageQualitePoussin.java#L66>), [ferme/couvoir/triagequalitepoussin-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/triagequalitepoussin-saisie.jsp#L23>).

<a id="triagequalitepoussindetail"></a>

## TRIAGEQUALITEPOUSSINDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(255 BYTE)` | Oui | FK → TRIAGEQUALITEPOUSSIN |
| `IDBATIMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUET` | `VARCHAR2(255 BYTE)` | Oui | FK → PARQUET |
| `IDQUALITE` | `VARCHAR2(255 BYTE)` | Oui | FK → QUALITEPOUSSIN |
| `QTE` | `NUMBER(32,0)` | Oui |  |

Clés : `SYS_C007736` (primaire) : `ID`.

Clés étrangères sortantes :

- [TRIAGEQUALITEPOUSSINDETAIL](tables.md#triagequalitepoussindetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` (`FK_TRIAGEDETAIL_BATIMENT`, ENABLED).
- [TRIAGEQUALITEPOUSSINDETAIL](tables.md#triagequalitepoussindetail).`IDMERE` → [TRIAGEQUALITEPOUSSIN](tables.md#triagequalitepoussin).`ID` (`FK_TRIAGEDETAIL_MERE`, ENABLED).
- [TRIAGEQUALITEPOUSSINDETAIL](tables.md#triagequalitepoussindetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` (`FK_TRIAGEDETAIL_PARQUET`, ENABLED).
- [TRIAGEQUALITEPOUSSINDETAIL](tables.md#triagequalitepoussindetail).`IDQUALITE` → [QUALITEPOUSSIN](tables.md#qualitepoussin).`ID` (`FK_TRIAGEDETAIL_QUALITE`, ENABLED).

Vues dépendantes directes (1) : [TRIAGEQUALITEPOUSSINDETAIL_LIB](vues.md#triagequalitepoussindetail-lib).

Références dans le code : [ferme/couvoir/TriageQualitePoussinDetail.java:74](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/couvoir/TriageQualitePoussinDetail.java#L74>), [ferme/couvoir/triagequalitepoussin-saisie.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/couvoir/triagequalitepoussin-saisie.jsp#L25>).

<a id="trs-banques-agences"></a>

## TRS_BANQUES_AGENCES

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(50 BYTE)` | Non |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `TRS_BANQUES_AGENCES_PKEY` (primaire) : `ID`.

Vues dépendantes directes (6) : [EMPLOYE_COMPLET](vues.md#employe-complet), [EMPLOYE_COMPLET2](vues.md#employe-complet2), [EMPLOYE_COMPLET_LIBELLE2](vues.md#employe-complet-libelle2), [EMPLOYE_COMPLET_LIBELLE3](vues.md#employe-complet-libelle3), [EMPLOYE_COMPLET_NOU2](vues.md#employe-complet-nou2), [EMPLOYE_COMPLET_PDF](vues.md#employe-complet-pdf).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="typeabsence"></a>

## TYPEABSENCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `TYPEABSENCE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [DEMANDE](tables.md#demande).`IDTYPEABSENCE` → [TYPEABSENCE](tables.md#typeabsence).`ID`.

Vues dépendantes directes (3) : [DEMANDE_LIBCOMPLET](vues.md#demande-libcomplet), [DEMANDE_LIBCOMPLET2](vues.md#demande-libcomplet2), [DEMANDE_LIBCOMPLET3](vues.md#demande-libcomplet3).

Références dans le code : [paie/demande/DemandeJustifications.java:381](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/demande/DemandeJustifications.java#L381>), [paie/demande/conge-collectif-liste.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/demande/conge-collectif-liste.jsp#L22>), [paie/demande/conge-collectif-saisie.jsp:126](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/demande/conge-collectif-saisie.jsp#L126>), [paie/demande/demande-absence-liste.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/demande/demande-absence-liste.jsp#L22>), [paie/demande/demande-absence-refu.jsp:132](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/demande/demande-absence-refu.jsp#L132>) ; 2 autres fichiers dans `usages-code.json`.

<a id="typeachat"></a>

## TYPEACHAT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Non |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Non |  |
| `ACTIF` | `NUMBER` | Oui |  |

Clés : `TYPEACHAT_PK` (primaire) : `ID`.

Vues dépendantes directes (1) : [FACTUREFOURNISSEURCPL](vues.md#facturefournisseurcpl).

Références dans le code : [faturefournisseur/TypeAchat.java:17](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/TypeAchat.java#L17>).

<a id="typeavance"></a>

## TYPEAVANCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Non |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Non |  |

Clés : `TYPEAVANCE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [AVANCE](tables.md#avance).`IDTYPEAVANCE` → [TYPEAVANCE](tables.md#typeavance).`ID`.

Vues dépendantes directes (3) : [AVANCE_LIB](vues.md#avance-lib), [AVANCE_LIB2](vues.md#avance-lib2), [REMBOURSEMENTLIB](vues.md#remboursementlib).

Références dans le code : [paie/avance/avance-modif.jsp:34](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avance/avance-modif.jsp#L34>), [paie/avance/avance-saisie.jsp:26](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avance/avance-saisie.jsp#L26>), [paie/avance/avancesaisie-multiple.jsp:59](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avance/avancesaisie-multiple.jsp#L59>).

<a id="typeavoir"></a>

## TYPEAVOIR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SYS_C007757` (primaire) : `ID`.

Tables qui la référencent :

- [AVOIRFC](tables.md#avoirfc).`IDTYPEAVOIR` → [TYPEAVOIR](tables.md#typeavoir).`ID`.

Vues dépendantes directes (2) : [AVOIRFCLIB](vues.md#avoirfclib), [AVOIRFCLIB_PDF](vues.md#avoirfclib-pdf).

Références dans le code : [avoir/avoirFC-arbiochem-liste.jsp:57](<../../projet-standard - Copie/arbiochem-war/web/pages/avoir/avoirFC-arbiochem-liste.jsp#L57>), [avoir/avoirFC-arbiochem-saisie.jsp:48](<../../projet-standard - Copie/arbiochem-war/web/pages/avoir/avoirFC-arbiochem-saisie.jsp#L48>), [avoir/avoirFC-liste.jsp:57](<../../projet-standard - Copie/arbiochem-war/web/pages/avoir/avoirFC-liste.jsp#L57>), [avoir/avoirFC-saisie.jsp:48](<../../projet-standard - Copie/arbiochem-war/web/pages/avoir/avoirFC-saisie.jsp#L48>).

<a id="typebanque"></a>

## TYPEBANQUE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007758` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="typecaisse"></a>

## TYPECAISSE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `TYPECAISSE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [CAISSE](tables.md#caisse).`IDTYPECAISSE` → [TYPECAISSE](tables.md#typecaisse).`ID`.

Vues dépendantes directes (4) : [CAISSECPL](vues.md#caissecpl), [CAISSE_POMPISTE](vues.md#caisse-pompiste), [V_ETATCAISSE](vues.md#v-etatcaisse), [V_ETATCAISSE_CLOTURE](vues.md#v-etatcaisse-cloture).

Références dans le code : [caisse/TypeCaisse.java:19](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/TypeCaisse.java#L19>), [caisse/caisse-liste.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/caisse-liste.jsp#L25>), [caisse/caisse-modif.jsp:32](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/caisse-modif.jsp#L32>), [caisse/caisse-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/caisse-saisie.jsp#L33>), [caisse/etatcaisse/etatcaisse-liste.jsp:28](<../../projet-standard - Copie/arbiochem-war/web/pages/caisse/etatcaisse/etatcaisse-liste.jsp#L28>) ; 1 autres fichiers dans `usages-code.json`.

<a id="typecarburant"></a>

## TYPECARBURANT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007760` (primaire) : `ID`.

Vues dépendantes directes (2) : [AUTOLIB](vues.md#autolib), [INFOSAUTOLIB](vues.md#infosautolib).

Références dans le code : [maintenance/ressources/auto/auto-saisie.jsp:30](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/auto/auto-saisie.jsp#L30>).

<a id="typecategorieingredient"></a>

## TYPECATEGORIEINGREDIENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SYS_C007762` (primaire) : `ID`.

Vues dépendantes directes (1) : [CATEGORIEINGREDIENTLIB](vues.md#categorieingredientlib).

Références dans le code : [categorieingredient/categorie-ingredient-saisie.jsp:29](<../../projet-standard - Copie/arbiochem-war/web/pages/categorieingredient/categorie-ingredient-saisie.jsp#L29>).

<a id="typecharge"></a>

## TYPECHARGE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `TYPECHARGE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [CHARGE](tables.md#charge).`TYPE` → [TYPECHARGE](tables.md#typecharge).`ID`.

Vues dépendantes directes (2) : [CHARGE_CPL](vues.md#charge-cpl), [CHARGE_LIB](vues.md#charge-lib).

Références dans le code : [fabrication/charge/charge-modif.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/fabrication/charge/charge-modif.jsp#L23>), [fabrication/charge/charge-saisie-multiple.jsp:43](<../../projet-standard - Copie/arbiochem-war/web/pages/fabrication/charge/charge-saisie-multiple.jsp#L43>), [fabrication/charge/charge-saisie-old.jsp:20](<../../projet-standard - Copie/arbiochem-war/web/pages/fabrication/charge/charge-saisie-old.jsp#L20>).

<a id="typeclient"></a>

## TYPECLIENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007766` (primaire) : `ID`.

Tables qui la référencent :

- [CLIENT](tables.md#client).`IDTYPECLIENT` → [TYPECLIENT](tables.md#typeclient).`ID`.
- [REMISEFILLE](tables.md#remisefille).`IDCATEGORIECLIENT` → [TYPECLIENT](tables.md#typeclient).`ID`.
- [TARIF_INGREDIENTS](tables.md#tarif-ingredients).`IDTYPECLIENT` → [TYPECLIENT](tables.md#typeclient).`ID`.

Vues dépendantes directes (7) : [AS_INGREDIENT_VENTE_LIB](vues.md#as-ingredient-vente-lib), [CLIENTLIB](vues.md#clientlib), [REMISEFILLELIB](vues.md#remisefillelib), [REMISEFILLEMERELIB](vues.md#remisefillemerelib), [TARIF_INGREDIENTS_LIB](vues.md#tarif-ingredients-lib), [TARIF_INGREDIENTS_MAX_LIB](vues.md#tarif-ingredients-max-lib), [VENTEDETMERECATINGRCATCLIENT](vues.md#ventedetmerecatingrcatclient).

Références dans le code : [vente/remise/remise-saisie.jsp:37](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/remise/remise-saisie.jsp#L37>), [vente/tarifIngredients/tarifIngredients-saisie.jsp:28](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/tarifIngredients/tarifIngredients-saisie.jsp#L28>).

<a id="typecollecte"></a>

## TYPECOLLECTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `TYPECOLLECTE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [TRIAGEOEUFDETAIL](tables.md#triageoeufdetail).`IDTYPECOLLECTE` → [TYPECOLLECTE](tables.md#typecollecte).`ID`.

Vues dépendantes directes (1) : [TRIAGEOEUFDETAIL_LIB](vues.md#triageoeufdetail-lib).

Références dans le code : [ferme/production/triageoeuf-saisie.jsp:58](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/triageoeuf-saisie.jsp#L58>).

<a id="typedemande"></a>

## TYPEDEMANDE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `TYPEDEMANDE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [DEMANDE](tables.md#demande).`IDTYPEDEMANDE` → [TYPEDEMANDE](tables.md#typedemande).`ID`.
- [ETATDEMANDE](tables.md#etatdemande).`IDTYPEDEMANDE` → [TYPEDEMANDE](tables.md#typedemande).`ID`.

Vues dépendantes directes (4) : [DEMANDE_LIBCOMPLET](vues.md#demande-libcomplet), [DEMANDE_LIBCOMPLET2](vues.md#demande-libcomplet2), [DEMANDE_LIBCOMPLET3](vues.md#demande-libcomplet3), [ETATDEMANDE_LIBCPL](vues.md#etatdemande-libcpl).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="typedepart"></a>

## TYPEDEPART

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007776` (primaire) : `ID`.

Tables qui la référencent :

- [PLANPAIEMENTACHAT](tables.md#planpaiementachat).`IDTYPEDEPART` → [TYPEDEPART](tables.md#typedepart).`ID`.

Vues dépendantes directes (1) : [PLANPAIEMENTACHATLIB](vues.md#planpaiementachatlib).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="typedocumentchecklist"></a>

## TYPEDOCUMENTCHECKLIST

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(4000 BYTE)` | Oui |  |

Clés : `SYS_C007778` (primaire) : `ID`.

Tables qui la référencent :

- [CHECKLIST_FILLE](tables.md#checklist-fille).`IDTYPEDOCUMENT` → [TYPEDOCUMENTCHECKLIST](tables.md#typedocumentchecklist).`ID`.

Références dans le code : [paie/onBoarding/TypeDocumentCheckList.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/onBoarding/TypeDocumentCheckList.java#L9>).

<a id="typefacturefournisseur"></a>

## TYPEFACTUREFOURNISSEUR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007782` (primaire) : `ID`.

Vues dépendantes directes (1) : [FACTUREFOURNISSEURCPL](vues.md#facturefournisseurcpl).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="typefaute"></a>

## TYPEFAUTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `TYPEFAUTE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [SANCTION](tables.md#sanction).`TYPEFAUTE` → [TYPEFAUTE](tables.md#typefaute).`ID`.

Vues dépendantes directes (1) : [SANCTION_CPL](vues.md#sanction-cpl).

Références dans le code : [paie/sanction/configuration/TypeFaute.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/sanction/configuration/TypeFaute.java#L10>), [paie/employe/sanction/sanction-saisie.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/sanction/sanction-saisie.jsp#L27>), [paie/sanction/configuration/typefaute-saisie.jsp:8](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/sanction/configuration/typefaute-saisie.jsp#L8>).

<a id="typefournisseur"></a>

## TYPEFOURNISSEUR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `TYPEFOURNISSEUR_PK` (primaire) : `ID`.

Tables qui la référencent :

- [FOURNISSEUR](tables.md#fournisseur).`IDTYPEFOURNISSEUR` → [TYPEFOURNISSEUR](tables.md#typefournisseur).`ID`.

Vues dépendantes directes (1) : [V_FOURNISSEUR_LIB](vues.md#v-fournisseur-lib).

Références dans le code : [faturefournisseur/TypeFournisseur.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/faturefournisseur/TypeFournisseur.java#L9>), [fournisseur/fournisseur-arbiochem-saisie.jsp:29](<../../projet-standard - Copie/arbiochem-war/web/pages/fournisseur/fournisseur-arbiochem-saisie.jsp#L29>), [fournisseur/fournisseur-saisie.jsp:29](<../../projet-standard - Copie/arbiochem-war/web/pages/fournisseur/fournisseur-saisie.jsp#L29>).

<a id="typegainperte"></a>

## TYPEGAINPERTE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |
| `ESTDOUBLEECRITURE` | `NUMBER(1,0)` | Oui |  |

Clés : `TYPEGAINPERTE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [PERTEGAINIMPREVUE](tables.md#pertegainimprevue).`IDTYPEGAINPERTE` → [TYPEGAINPERTE](tables.md#typegainperte).`ID`.

Vues dépendantes directes (1) : [PERTEGAINIMPREVUELIB](vues.md#pertegainimprevuelib).

Références dans le code : [pertegain/TypePerteGain.java:20](<../../projet-standard - Copie/arbiochem-ejb/src/java/pertegain/TypePerteGain.java#L20>), [pertegain/pertegainimprevue-modif.jsp:38](<../../projet-standard - Copie/arbiochem-war/web/pages/pertegain/pertegainimprevue-modif.jsp#L38>), [pertegain/pertegainimprevue-saisie.jsp:44](<../../projet-standard - Copie/arbiochem-war/web/pages/pertegain/pertegainimprevue-saisie.jsp#L44>).

<a id="typemagasin"></a>

## TYPEMAGASIN

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `TYPEMAGASIN_PK` (primaire) : `ID`.

Tables qui la référencent :

- [MAGASIN2](tables.md#magasin2).`IDTYPEMAGASIN` → [TYPEMAGASIN](tables.md#typemagasin).`ID`.

Vues dépendantes directes (3) : [MAGASINLIB](vues.md#magasinlib), [MAGASINLIBCOMPTA](vues.md#magasinlibcompta), [TYPEMAGASIN_SANSRESERVOIR](vues.md#typemagasin-sansreservoir).

Références dans le code : [magasin/TypeMagasin.java:14](<../../projet-standard - Copie/arbiochem-ejb/src/java/magasin/TypeMagasin.java#L14>), [magasin/magasin-liste.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/magasin/magasin-liste.jsp#L27>), [magasin/typemagasin-fiche.jsp:16](<../../projet-standard - Copie/arbiochem-war/web/pages/magasin/typemagasin-fiche.jsp#L16>), [magasin/typemagasin-liste.jsp:6](<../../projet-standard - Copie/arbiochem-war/web/pages/magasin/typemagasin-liste.jsp#L6>).

<a id="typemaintenance"></a>

## TYPEMAINTENANCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `TYPEMAINTENANCE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [CONSOMMABLEMACHINE](tables.md#consommablemachine).`IDTYPEMAINTENANCE` → [TYPEMAINTENANCE](tables.md#typemaintenance).`ID`.
- [CONSOMMATION](tables.md#consommation).`IDTYPEMAINTENANCE` → [TYPEMAINTENANCE](tables.md#typemaintenance).`ID`.
- [PLANNING](tables.md#planning).`IDTYPEMAINTENANCE` → [TYPEMAINTENANCE](tables.md#typemaintenance).`ID`.

Vues dépendantes directes (4) : [CONSOMMABLEMACHINELIB](vues.md#consommablemachinelib), [CONSOMMATIONLIB](vues.md#consommationlib), [DEMANDETRAVAUX_CPL](vues.md#demandetravaux-cpl), [PLANNING_CPL](vues.md#planning-cpl).

Références dans le code : [maintenance/configuration/TypeMaintenance.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/configuration/TypeMaintenance.java#L9>), [maintenance/ressources/consommable-machine-liste.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/consommable-machine-liste.jsp#L21>), [maintenance/ressources/consommable-machine-saisie.jsp:22](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/consommable-machine-saisie.jsp#L22>).

<a id="typemvtstock"></a>

## TYPEMVTSTOCK

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `TYPEMVTSTOCK_PK` (primaire) : `ID`.

Tables qui la référencent :

- [MVTSTOCK](tables.md#mvtstock).`IDTYPEMVSTOCK` → [TYPEMVTSTOCK](tables.md#typemvtstock).`ID`.

Vues dépendantes directes (1) : [MVTSTOCKLIB](vues.md#mvtstocklib).

Références dans le code : [stock/TypeMvtStock.java:17](<../../projet-standard - Copie/arbiochem-ejb/src/java/stock/TypeMvtStock.java#L17>), [stock/typemvtstock-fiche.jsp:16](<../../projet-standard - Copie/arbiochem-war/web/pages/stock/typemvtstock-fiche.jsp#L16>).

<a id="typepaiement"></a>

## TYPEPAIEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(2000 BYTE)` | Oui |  |

Clés : `SYS_C007792` (primaire) : `ID`.

Tables qui la référencent :

- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDTYPEPAIEMENT` → [TYPEPAIEMENT](tables.md#typepaiement).`ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="typepanne"></a>

## TYPEPANNE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `TYPEPANNE_PK` (primaire) : `ID`.

Références dans le code : [maintenance/configuration/TypePanne.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/configuration/TypePanne.java#L9>).

<a id="typepesee"></a>

## TYPEPESEE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `TYPEPESEE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [PESEEPOUSSIN](tables.md#peseepoussin).`IDTYPEPESEE` → [TYPEPESEE](tables.md#typepesee).`ID`.

Vues dépendantes directes (1) : [PESEEPOUSSIN_LIB](vues.md#peseepoussin-lib).

Références dans le code : [ferme/pesee/peseepoussin-saisie.jsp:64](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/pesee/peseepoussin-saisie.jsp#L64>).

<a id="typereclamation"></a>

## TYPERECLAMATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007800` (primaire) : `ID`.

Vues dépendantes directes (1) : [RECLAMATIONLIB](vues.md#reclamationlib).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="typeresreclamation"></a>

## TYPERESRECLAMATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007802` (primaire) : `ID`.

Vues dépendantes directes (1) : [RESRECLAMATIONLIB](vues.md#resreclamationlib).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="typesanction"></a>

## TYPESANCTION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `TYPESANCTION_PK` (primaire) : `ID`.

Tables qui la référencent :

- [SANCTION](tables.md#sanction).`TYPESANCTION` → [TYPESANCTION](tables.md#typesanction).`ID`.

Vues dépendantes directes (1) : [SANCTION_CPL](vues.md#sanction-cpl).

Références dans le code : [typesanction/TypeSanction.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/typesanction/TypeSanction.java#L9>), [paie/employe/sanction/sanction-saisie.jsp:30](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/sanction/sanction-saisie.jsp#L30>), [typesanction/typesanction-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/typesanction/typesanction-fiche.jsp#L11>), [typesanction/typesanction-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/typesanction/typesanction-liste.jsp#L7>), [typesanction/typesanction-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/typesanction/typesanction-saisie.jsp#L13>).

<a id="typesomme"></a>

## TYPESOMME

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007804` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="typestock"></a>

## TYPESTOCK

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007805` (primaire) : `ID`.

Tables qui la référencent :

- [AS_INGREDIENTS](tables.md#as-ingredients).`TYPESTOCK` → [TYPESTOCK](tables.md#typestock).`ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="typetva"></a>

## TYPETVA

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(20 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Non |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007808` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="typevaccination"></a>

## TYPEVACCINATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(256 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(256 BYTE)` | Oui |  |

Clés : `SYS_C007809` (primaire) : `ID`.

Tables qui la référencent :

- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDTYPEVACCINATION` → [TYPEVACCINATION](tables.md#typevaccination).`ID`.

Vues dépendantes directes (1) : [VACCINATIONPOUSSINDETAIL_LIB](vues.md#vaccinationpoussindetail-lib).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="type-absence"></a>

## TYPE_ABSENCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `NBJOUR` | `NUMBER` | Oui |  |
| `FREQUENCE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `TYPE_ABSENCE_PK` (primaire) : `ID`.

Vues dépendantes directes (1) : [TYPEABSENCE_CPL](vues.md#typeabsence-cpl).

Références dans le code : [paie/absence/TypeAbsence.java:13](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/absence/TypeAbsence.java#L13>), [paie/absence/typeabsence-saisie.jsp:15](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/absence/typeabsence-saisie.jsp#L15>).

<a id="type-accident"></a>

## TYPE_ACCIDENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(250 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(250 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `SYS_C007745` (primaire) : `ID`.

Tables qui la référencent :

- [ACCIDENT](tables.md#accident).`ID_TYPE_ACCIDENT` → [TYPE_ACCIDENT](tables.md#type-accident).`ID`.

Vues dépendantes directes (2) : [V_ACCIDENT_LIB](vues.md#v-accident-lib), [V_ACCIDENT_PDF](vues.md#v-accident-pdf).

Références dans le code : [paie/sanction/configuration/TypeAccident.java:10](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/sanction/configuration/TypeAccident.java#L10>), [paie/accident/accident-liste.jsp:21](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/accident/accident-liste.jsp#L21>), [paie/accident/accident-saisie.jsp:26](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/accident/accident-saisie.jsp#L26>), [paie/sanction/configuration/typeaccident-saisie.jsp:8](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/sanction/configuration/typeaccident-saisie.jsp#L8>).

<a id="type-avancement"></a>

## TYPE_AVANCEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `PK_TYPE_AVANCEMENT` (primaire) : `ID`.

Vues dépendantes directes (1) : [PAIE_AVANCEMENT_LIBELLE4](vues.md#paie-avancement-libelle4).

Références dans le code : [paie/avancement/avancement-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-saisie.jsp#L33>).

<a id="type-centre"></a>

## TYPE_CENTRE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `TYPECENTRE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [CENTRE](tables.md#centre).`TYPE` → [TYPE_CENTRE](tables.md#type-centre).`ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="type-competences-fp"></a>

## TYPE_COMPETENCES_FP

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007768` (primaire) : `ID`.

Tables qui la référencent :

- [EVALUATION_DETAIL](tables.md#evaluation-detail).`IDTYPECOMPETENCEFP` → [TYPE_COMPETENCES_FP](tables.md#type-competences-fp).`ID`.

Vues dépendantes directes (3) : [EVALUATION_DETAIL_LIB](vues.md#evaluation-detail-lib), [FICHE_POSTE_COMPETENCES_LIB](vues.md#fiche-poste-competences-lib), [V_MATCHING_CV_FP](vues.md#v-matching-cv-fp).

Références dans le code : [poste/TypeCompetencesFP.java:13](<../../projet-standard - Copie/arbiochem-ejb/src/java/poste/TypeCompetencesFP.java#L13>), [poste/fpcompetences-saisie.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/poste/fpcompetences-saisie.jsp#L23>), [paie/cv/competencecv-saisie.jsp:46](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/cv/competencecv-saisie.jsp#L46>), [paie/evaluation/evaluationannuelle-saisie.jsp:74](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/evaluation/evaluationannuelle-saisie.jsp#L74>).

<a id="type-contrat"></a>

## TYPE_CONTRAT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(500 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `TYPE_CONTRAT_PK` (primaire) : `ID`.

Tables qui la référencent :

- [FICHE_POSTE](tables.md#fiche-poste).`IDTYPECONTRAT` → [TYPE_CONTRAT](tables.md#type-contrat).`ID`.
- [OFFRE_EMPLOI](tables.md#offre-emploi).`IDTYPECONTRAT` → [TYPE_CONTRAT](tables.md#type-contrat).`ID`.

Vues dépendantes directes (3) : [FICHE_POSTE_LIB](vues.md#fiche-poste-lib), [OFFRE_EMPLOILIB](vues.md#offre-emploilib), [VUE_CONTRAT_LIB](vues.md#vue-contrat-lib).

Références dans le code : [paie/DeroulanteEmbaucheData.java:59](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/DeroulanteEmbaucheData.java#L59>), [paie/avancement/avancement-contrat.jsp:49](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-contrat.jsp#L49>), [paie/avancement/avancement-saisie.jsp:53](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/avancement/avancement-saisie.jsp#L53>), [paie/contrat/contrat-liste.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/contrat/contrat-liste.jsp#L24>), [paie/contrat/contrat-modif.jsp:104](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/contrat/contrat-modif.jsp#L104>) ; 4 autres fichiers dans `usages-code.json`.

<a id="type-cout-formation"></a>

## TYPE_COUT_FORMATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `SYS_C007771` (primaire) : `ID`.

Tables qui la référencent :

- [ACTION_FORMATION_DETAIL](tables.md#action-formation-detail).`IDTYPECOUT` → [TYPE_COUT_FORMATION](tables.md#type-cout-formation).`ID`.

Vues dépendantes directes (2) : [ACTION_FORMATION_DETAIL_LIB](vues.md#action-formation-detail-lib), [V_RECAP_GLOBAL_FORMATION](vues.md#v-recap-global-formation).

Références dans le code : [paie/formation/action/TypeCoutFormation.java:7](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formation/action/TypeCoutFormation.java#L7>), [paie/formation/action/actionformation-saisie.jsp:89](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/action/actionformation-saisie.jsp#L89>), [paie/formation/recap-global-formation.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/recap-global-formation.jsp#L33>).

<a id="type-depart"></a>

## TYPE_DEPART

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(50 BYTE)` | Oui |  |

Clés : `TYPE_DEPART_PKEY` (primaire) : `ID`.

Vues dépendantes directes (4) : [LOG_PERS_NON_VALIDE_LIB](vues.md#log-pers-non-valide-lib), [LOG_PERS_NON_VALIDE_LIB_4](vues.md#log-pers-non-valide-lib-4), [LOG_PERS_NON_VALIDE_LIB_5](vues.md#log-pers-non-valide-lib-5), [LOG_PERS_NON_VALIDE_LIB_5_TEST](vues.md#log-pers-non-valide-lib-5-test).

Références dans le code : [paie/employe/personnelnonvalide-liste.jsp:28](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/personnelnonvalide-liste.jsp#L28>), [paie/employe/personnelnonvalide-saisie.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/employe/personnelnonvalide-saisie.jsp#L27>).

<a id="type-encaissement"></a>

## TYPE_ENCAISSEMENT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `TYPE_ENCAISSEMENT_PK` (primaire) : `ID`.

Tables qui la référencent :

- [ENCAISSEMENT](tables.md#encaissement).`IDTYPEENCAISSEMENT` → [TYPE_ENCAISSEMENT](tables.md#type-encaissement).`ID`.

Vues dépendantes directes (1) : [ENCAISSEMENTCPL](vues.md#encaissementcpl).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="type-facture"></a>

## TYPE_FACTURE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `SYS_C007781` (primaire) : `ID`.

Tables qui la référencent :

- [FACTUREDECLARATION](tables.md#facturedeclaration).`IDTYPEFACTURE` → [TYPE_FACTURE](tables.md#type-facture).`ID`.
- [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDTYPEFACTURE` → [TYPE_FACTURE](tables.md#type-facture).`ID`.

Vues dépendantes directes (3) : [FACTUREDECLARATIONCPL](vues.md#facturedeclarationcpl), [FACTUREFOURNISSEURCPL](vues.md#facturefournisseurcpl), [FACTUREFOURNISSEURCPL_TRAVAUX](vues.md#facturefournisseurcpl-travaux).

Références dans le code : [compta/depense/facture-depense.jsp:59](<../../projet-standard - Copie/arbiochem-war/web/pages/compta/depense/facture-depense.jsp#L59>), [facturefournisseur/facturefournisseur-arbiochem-saisie.jsp:53](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/facturefournisseur-arbiochem-saisie.jsp#L53>), [facturefournisseur/facturefournisseur-saisie.jsp:53](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/facturefournisseur-saisie.jsp#L53>), [facturefournisseur/fraisaccessoire-arbiochem-saisie.jsp:68](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/fraisaccessoire-arbiochem-saisie.jsp#L68>), [facturefournisseur/fraisaccessoire-saisie.jsp:68](<../../projet-standard - Copie/arbiochem-war/web/pages/facturefournisseur/fraisaccessoire-saisie.jsp#L68>) ; 2 autres fichiers dans `usages-code.json`.

<a id="type-formation"></a>

## TYPE_FORMATION

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `SYS_C007784` (primaire) : `ID`.

Vues dépendantes directes (2) : [ACTION_FORMATION_LIB](vues.md#action-formation-lib), [V_RECAP_GLOBAL_FORMATION](vues.md#v-recap-global-formation).

Références dans le code : [paie/formation/TypeFormation.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/formation/TypeFormation.java#L9>), [paie/formation/action/actionformation-saisie-back.jsp:35](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/action/actionformation-saisie-back.jsp#L35>), [paie/formation/action/actionformation-saisie.jsp:46](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/action/actionformation-saisie.jsp#L46>), [paie/formation/configuration/typeformation-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/configuration/typeformation-fiche.jsp#L11>), [paie/formation/configuration/typeformation-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/paie/formation/configuration/typeformation-saisie.jsp#L13>) ; 1 autres fichiers dans `usages-code.json`.

<a id="type-piece"></a>

## TYPE_PIECE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(100 BYTE)` | Oui |  |

Clés : `TYPE_PIECE_PK` (primaire) : `ID`.

Vues dépendantes directes (1) : [TRAITE_LIB](vues.md#traite-lib).

Références dans le code : [facture/traite-modif.jsp:19](<../../projet-standard - Copie/arbiochem-war/web/pages/facture/traite-modif.jsp#L19>), [facture/traite-saisie.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/facture/traite-saisie.jsp#L27>).

<a id="type-produit"></a>

## TYPE_PRODUIT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDLIGNE` | `VARCHAR2(50 BYTE)` | Oui | FK → LIGNE |
| `ACTIF` | `NUMBER` | Oui |  |

Clés : `TYPE_PRODUIT_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [TYPE_PRODUIT](tables.md#type-produit).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID` (`SYS_C007928`, ENABLED).

Tables qui la référencent :

- [AS_INGREDIENTS](tables.md#as-ingredients).`TYPEPRODUIT` → [TYPE_PRODUIT](tables.md#type-produit).`ID`.
- [CATEGORIE](tables.md#categorie).`IDTYPEPRODUIT` → [TYPE_PRODUIT](tables.md#type-produit).`ID`.
- [ETATSTOCK](tables.md#etatstock).`IDTYPEPRODUIT` → [TYPE_PRODUIT](tables.md#type-produit).`ID`.
- [PRODUIT](tables.md#produit).`IDTYPEPRODUIT` → [TYPE_PRODUIT](tables.md#type-produit).`ID`.

Vues dépendantes directes (16) : [AS_INGREDIENTS_LIB](vues.md#as-ingredients-lib), [AS_INGREDIENTS_LIB_PIECE](vues.md#as-ingredients-lib-piece), [CATEGORIELIB](vues.md#categorielib), [ETATSTOCKLIB](vues.md#etatstocklib), [ETAT_VENTE_DETAILS_POIDS](vues.md#etat-vente-details-poids), [FABRICATIONFILLEPETRI](vues.md#fabricationfillepetri), [OFNONRATTACHE](vues.md#ofnonrattache), [OFNONRATTACHEREEL](vues.md#ofnonrattachereel), [TYPE_PRODUIT_ACTIF](vues.md#type-produit-actif), [TYPE_PRODUIT_LIB](vues.md#type-produit-lib), [VENTEDETCALCREMGLOVISE](vues.md#ventedetcalcremglovise), [VENTE_DETAILS_CPL_2](vues.md#vente-details-cpl-2), [V_ETATSTOCK](vues.md#v-etatstock), [V_ETATSTOCK_ING_GP_PDF](vues.md#v-etatstock-ing-gp-pdf), [V_ETATSTOCK_PROD_FINI2](vues.md#v-etatstock-prod-fini2), [V_TYPE_PRODUIT](vues.md#v-type-produit).

Références dans le code : [annexe/TypeProduit.java:26](<../../projet-standard - Copie/arbiochem-ejb/src/java/annexe/TypeProduit.java#L26>), [annexe/type-produit/type-produit-fiche.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/type-produit/type-produit-fiche.jsp#L23>), [annexe/type-produit/type-produit-liste.jsp:17](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/type-produit/type-produit-liste.jsp#L17>), [annexe/type-produit/type-produit-saisie.jsp:28](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/type-produit/type-produit-saisie.jsp#L28>), [ligne/inc/typeproduit.jsp:28](<../../projet-standard - Copie/arbiochem-war/web/pages/ligne/inc/typeproduit.jsp#L28>) ; 2 autres fichiers dans `usages-code.json`.

<a id="unite"></a>

## UNITE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `UNITE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [ETATSTOCK](tables.md#etatstock).`IDUNITE` → [UNITE](tables.md#unite).`ID`.
- [PRODUIT](tables.md#produit).`IDUNITE` → [UNITE](tables.md#unite).`ID`.

Vues dépendantes directes (6) : [AS_BONDELIVRAISON_FILLE_LIB](vues.md#as-bondelivraison-fille-lib), [EQUIVALENCE_LIB](vues.md#equivalence-lib), [ETATSTOCKLIB](vues.md#etatstocklib), [VENTE_DETAILS_TICKET](vues.md#vente-details-ticket), [V_ETATSTOCK](vues.md#v-etatstock), [V_ETATSTOCK_ENTREE_DMDACHAT](vues.md#v-etatstock-entree-dmdachat).

Références dans le code : [annexe/Unite.java:17](<../../projet-standard - Copie/arbiochem-ejb/src/java/annexe/Unite.java#L17>), [annexe/unite/unite-fiche.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/unite/unite-fiche.jsp#L23>), [annexe/unite/unite-liste.jsp:14](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/unite/unite-liste.jsp#L14>), [annexe/unite/unite-saisie.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/annexe/unite/unite-saisie.jsp#L24>), [vente/bondecommande/bondecommande-modif.jsp:65](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/bondecommande/bondecommande-modif.jsp#L65>).

<a id="uniteconso"></a>

## UNITECONSO

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007811` (primaire) : `ID`.

Vues dépendantes directes (2) : [AUTOLIB](vues.md#autolib), [INFOSAUTOLIB](vues.md#infosautolib).

Références dans le code : [maintenance/ressources/auto/auto-saisie.jsp:33](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/auto/auto-saisie.jsp#L33>).

<a id="unitemaintenance"></a>

## UNITEMAINTENANCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `ECHELLE` | `NUMBER(10,0)` | Oui |  |
| `OUVRABLE` | `NUMBER` | Oui |  |

Clés : `SYS_C007814` (primaire) : `ID`.

Tables qui la référencent :

- [CONSOMMABLEMACHINE](tables.md#consommablemachine).`FREQUENCE` → [UNITEMAINTENANCE](tables.md#unitemaintenance).`ID`.

Vues dépendantes directes (2) : [CONSOMMABLEMACHINELIB](vues.md#consommablemachinelib), [PLANNING_CPL](vues.md#planning-cpl).

Références dans le code : [maintenance/configuration/UniteMaintenance.java:13](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/configuration/UniteMaintenance.java#L13>), [maintenance/planning/planning-liste.jsp:31](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/planning/planning-liste.jsp#L31>), [maintenance/planning/planning-saisie.jsp:30](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/planning/planning-saisie.jsp#L30>), [maintenance/ressources/consommable-machine-liste.jsp:24](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/consommable-machine-liste.jsp#L24>), [maintenance/ressources/consommable-machine-saisie.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/maintenance/ressources/consommable-machine-saisie.jsp#L25>).

<a id="unite-frequence"></a>

## UNITE_FREQUENCE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ECHELLE` | `NUMBER` | Oui |  |

Clés : `SYS_C007812` (primaire) : `ID`.

Références dans le code : [maintenance/configuration/UniteFrequence.java:9](<../../projet-standard - Copie/arbiochem-ejb/src/java/maintenance/configuration/UniteFrequence.java#L9>).

<a id="userhomepage"></a>

## USERHOMEPAGE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `CODESERVICE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CODEDIR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDROLE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `URLPAGE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `USERHOMEPAGE_PK` (primaire) : `ID`.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="usermenu"></a>

## USERMENU

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `REFUSER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDMENU` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDROLE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CODESERVICE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CODEDIR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `INTERDIT` | `NUMBER(*,0)` | Oui |  |

Clés : `USERMENU_PK` (primaire) : `ID`.

Références dans le code : [user/UserEJBBean.java:3317](<../../projet-standard - Copie/arbiochem-ejb/src/java/user/UserEJBBean.java#L3317>).

<a id="usermenu1707"></a>

## USERMENU1707

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Oui |  |
| `REFUSER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDMENU` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDROLE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CODESERVICE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `CODEDIR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `INTERDIT` | `NUMBER(*,0)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="utilisateur"></a>

## UTILISATEUR

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `REFUSER` | `NUMBER` | Non | PK |
| `LOGINUSER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `PWDUSER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `NOMUSER` | `VARCHAR2(250 BYTE)` | Oui |  |
| `ADRUSER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `TELUSER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDROLE` | `VARCHAR2(20 BYTE)` | Oui |  |

Clés : `PK_UTILISATEUR` (primaire) : `REFUSER`.

Tables qui la référencent :

- [DEMANDETRAVAUX](tables.md#demandetravaux).`DEMANDEUR` → [UTILISATEUR](tables.md#utilisateur).`REFUSER`.
- [LOG_PERSONNEL](tables.md#log-personnel).`REFUSER` → [UTILISATEUR](tables.md#utilisateur).`REFUSER`.
- [NOTIFICATION2](tables.md#notification2).`RECEIVER` → [UTILISATEUR](tables.md#utilisateur).`REFUSER`.
- [OFAB](tables.md#ofab).`LANCEUR` → [UTILISATEUR](tables.md#utilisateur).`REFUSER`.
- [PRELEVEMENT](tables.md#prelevement).`IDPOMPISTE` → [UTILISATEUR](tables.md#utilisateur).`REFUSER`.
- [RESULTATMAINTENANCE](tables.md#resultatmaintenance).`IDPERSONNEL` → [UTILISATEUR](tables.md#utilisateur).`REFUSER`.

Vues dépendantes directes (24) : [COMPTA_ECRITURE_FICHE](vues.md#compta-ecriture-fiche), [DEMANDETRAVAUX_CPL](vues.md#demandetravaux-cpl), [DEMANDE_LIBCOMPLET](vues.md#demande-libcomplet), [DEMANDE_LIBCOMPLET2](vues.md#demande-libcomplet2), [DEMANDE_LIBCOMPLET3](vues.md#demande-libcomplet3), [EMPLOYE_COMPLET2](vues.md#employe-complet2), [EMPLOYE_COMPLET_NOU2](vues.md#employe-complet-nou2), [HISTORIQUEAVECUSER](vues.md#historiqueavecuser), [NOTIFICATIONLIBCPLT](vues.md#notificationlibcplt), [OFABLIB](vues.md#ofablib), [PAIE_EDITIONMOISANNEE_LIB](vues.md#paie-editionmoisannee-lib), [PAIE_EDITIONMOISANNEE_LIB_2](vues.md#paie-editionmoisannee-lib-2), [PAIE_EDITIONMOISANNEE_LIB_3](vues.md#paie-editionmoisannee-lib-3), [POMPISTELIB](vues.md#pompistelib), [PRELEVEMENTLIB](vues.md#prelevementlib), [RESULTATMAINTENANCELIB](vues.md#resultatmaintenancelib), [UTILISATEURCPL](vues.md#utilisateurcpl), [UTILISATEURROLE](vues.md#utilisateurrole), [UTILISATEURVALIDE](vues.md#utilisateurvalide), [UTILISATEURVUE](vues.md#utilisateurvue), [UTILISATEURVUEFICHE_ID](vues.md#utilisateurvuefiche-id), [UTILISATEUR_ACTIONROLE](vues.md#utilisateur-actionrole), [VALIDATION_ROLE_LIB_CPL](vues.md#validation-role-lib-cpl), [V_UTILISATEURLIB](vues.md#v-utilisateurlib).

Références dans le code : [utilisateurstation/UtilisateurStation.java:40](<../../projet-standard - Copie/arbiochem-ejb/src/java/utilisateurstation/UtilisateurStation.java#L40>), [role/actionrole-saisie.jsp:41](<../../projet-standard - Copie/arbiochem-war/web/pages/role/actionrole-saisie.jsp#L41>), [utilisateur/utilisateur-personnel-saisie.jsp:14](<../../projet-standard - Copie/arbiochem-war/web/pages/utilisateur/utilisateur-personnel-saisie.jsp#L14>).

<a id="utilisateur-personnel"></a>

## UTILISATEUR_PERSONNEL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDUTILISATEUR` | `VARCHAR2(50 BYTE)` | Oui |  |
| `IDPERSONNEL` | `VARCHAR2(50 BYTE)` | Oui | FK → LOG_PERSONNEL |

Clés : `SYS_C007820` (primaire) : `ID` ; `UQ_UP_PERSONNEL` (unique) : `IDPERSONNEL` ; `UQ_UP_UTILISATEUR` (unique) : `IDUTILISATEUR`.

Clés étrangères sortantes :

- [UTILISATEUR_PERSONNEL](tables.md#utilisateur-personnel).`IDPERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` (`FK_UP_PERSONNEL`, ENABLED).

Vues dépendantes directes (2) : [LOG_PERSONNEL_V2_USER](vues.md#log-personnel-v2-user), [V_UTILISATEURLIB](vues.md#v-utilisateurlib).

Références dans le code : [paie/employe/UtilisateurPersonnel.java:8](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/employe/UtilisateurPersonnel.java#L8>).

<a id="vaccinationpoussin"></a>

## VACCINATIONPOUSSIN

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `DATY` | `DATE` | Oui |  |
| `IDLOT` | `VARCHAR2(50 BYTE)` | Non | FK → LOT |
| `REMARQUE` | `VARCHAR2(4000 BYTE)` | Oui |  |
| `ETAT` | `NUMBER` | Oui |  |

Clés : `SYS_C007824` (primaire) : `ID`.

Clés étrangères sortantes :

- [VACCINATIONPOUSSIN](tables.md#vaccinationpoussin).`IDLOT` → [LOT](tables.md#lot).`ID` (`FK_VACCPOUSS_LOT`, ENABLED).

Tables qui la référencent :

- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDMERE` → [VACCINATIONPOUSSIN](tables.md#vaccinationpoussin).`ID`.

Vues dépendantes directes (1) : [VACCINATIONPOUSSIN_LIB](vues.md#vaccinationpoussin-lib).

Références dans le code : [ferme/vaccination/VaccinationPoussin.java:18](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/vaccination/VaccinationPoussin.java#L18>).

<a id="vaccinationpoussindetail"></a>

## VACCINATIONPOUSSINDETAIL

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `IDMERE` | `VARCHAR2(50 BYTE)` | Non | FK → VACCINATIONPOUSSIN |
| `IDBATIMENT` | `VARCHAR2(50 BYTE)` | Oui | FK → BATIMENT |
| `IDPARQUET` | `VARCHAR2(50 BYTE)` | Oui | FK → PARQUET |
| `IDTYPEVACCINATION` | `VARCHAR2(50 BYTE)` | Oui | FK → TYPEVACCINATION |
| `IDMALADIEPOUSSIN` | `VARCHAR2(50 BYTE)` | Oui | FK → MALADIEPOUSSIN |
| `IDVACCIN` | `VARCHAR2(50 BYTE)` | Oui | FK → VACCINPOUSSIN |
| `IDMODEADMINISTRATION` | `VARCHAR2(50 BYTE)` | Oui | FK → MODEADMINISTRATIONVACCIN |
| `QTEDOSE` | `NUMBER(10,2)` | Oui |  |
| `HEUREDEBUT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `HEUREFIN` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATEEXPIRATION` | `DATE` | Oui |  |

Clés : `SYS_C007826` (primaire) : `ID`.

Clés étrangères sortantes :

- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` (`FK_VACCPOUSSDET_BATIMENT`, ENABLED).
- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDMALADIEPOUSSIN` → [MALADIEPOUSSIN](tables.md#maladiepoussin).`ID` (`FK_VACCPOUSSDET_MALADIE`, ENABLED).
- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDMERE` → [VACCINATIONPOUSSIN](tables.md#vaccinationpoussin).`ID` (`FK_VACCPOUSSDET_MERE`, ENABLED).
- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDMODEADMINISTRATION` → [MODEADMINISTRATIONVACCIN](tables.md#modeadministrationvaccin).`ID` (`FK_VACCPOUSSDET_MODEADMIN`, ENABLED).
- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` (`FK_VACCPOUSSDET_PARQUET`, ENABLED).
- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDTYPEVACCINATION` → [TYPEVACCINATION](tables.md#typevaccination).`ID` (`FK_VACCPOUSSDET_TYPEVACC`, ENABLED).
- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDVACCIN` → [VACCINPOUSSIN](tables.md#vaccinpoussin).`ID` (`FK_VACCPOUSSDET_VACCIN`, ENABLED).

Vues dépendantes directes (1) : [VACCINATIONPOUSSINDETAIL_LIB](vues.md#vaccinationpoussindetail-lib).

Références dans le code : [ferme/vaccination/VaccinationPoussinDetail.java:20](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/vaccination/VaccinationPoussinDetail.java#L20>).

<a id="vaccinpoussin"></a>

## VACCINPOUSSIN

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(256 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(256 BYTE)` | Oui |  |

Clés : `SYS_C007827` (primaire) : `ID`.

Tables qui la référencent :

- [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDVACCIN` → [VACCINPOUSSIN](tables.md#vaccinpoussin).`ID`.

Vues dépendantes directes (1) : [VACCINATIONPOUSSINDETAIL_LIB](vues.md#vaccinationpoussindetail-lib).

Références dans le code : [ferme/vaccination/vaccinationpoussin-saisie.jsp:49](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/vaccination/vaccinationpoussin-saisie.jsp#L49>).

<a id="validation-role"></a>

## VALIDATION_ROLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `REFOBJECT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MAPPING` | `VARCHAR2(255 BYTE)` | Oui |  |
| `NIVEAU` | `NUMBER(*,0)` | Oui |  |
| `ROLE` | `VARCHAR2(255 BYTE)` | Oui | FK → ROLES |
| `PERSONNE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `VALEURETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `SYS_C007829` (primaire) : `ID`.

Clés étrangères sortantes :

- [VALIDATION_ROLE](tables.md#validation-role).`ROLE` → [ROLES](tables.md#roles).`IDROLE` (`SYS_C008332`, ENABLED).

Vues dépendantes directes (1) : [VALIDATION_ROLE_LIB_CPL](vues.md#validation-role-lib-cpl).

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="vehicule"></a>

## VEHICULE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(100 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(200 BYTE)` | Oui |  |
| `DESCE` | `VARCHAR2(200 BYTE)` | Oui |  |

Clés : `VEHICULE_PK` (primaire) : `ID`.

Tables qui la référencent :

- [RECEPTIONOAC](tables.md#receptionoac).`IDVEHICULE` → [VEHICULE](tables.md#vehicule).`ID`.
- [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDVEHICULE` → [VEHICULE](tables.md#vehicule).`ID`.

Vues dépendantes directes (4) : [IMPORTOAC_LIB](vues.md#importoac-lib), [IMPORTRECEPTIONOAC](vues.md#importreceptionoac), [RECEPTIONOAC_LIB](vues.md#receptionoac-lib), [TRANSFERTPOULETDETAIL_LIB](vues.md#transfertpouletdetail-lib).

Références dans le code : [ferme/configuration/Vehicule.java:8](<../../projet-standard - Copie/arbiochem-ejb/src/java/ferme/configuration/Vehicule.java#L8>), [ferme/configuration/vehicule-fiche.jsp:11](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/vehicule-fiche.jsp#L11>), [ferme/configuration/vehicule-liste.jsp:7](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/vehicule-liste.jsp#L7>), [ferme/configuration/vehicule-saisie.jsp:13](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/configuration/vehicule-saisie.jsp#L13>), [ferme/production/importoac-saisie.jsp:54](<../../projet-standard - Copie/arbiochem-war/web/pages/ferme/production/importoac-saisie.jsp#L54>) ; 2 autres fichiers dans `usages-code.json`.

<a id="vente"></a>

## VENTE

Document principal de facture client.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Non |  |
| `DATY` | `DATE` | Non |  |
| `REMARQUE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDCLIENT` | `VARCHAR2(100 BYTE)` | Oui | FK → CLIENT |
| `ESTPREVU` | `NUMBER(1,0)` | Oui |  |
| `DATYPREVU` | `DATE` | Oui |  |
| `IDRESERVATION` | `VARCHAR2(100 BYTE)` | Oui |  |
| `ECHEANCEFACTURE` | `NUMBER(38,2)` | Oui |  |
| `FRAISLIVRAISON` | `NUMBER(30,2)` | Oui |  |
| `MODEPAIEMENT` | `VARCHAR2(50 BYTE)` | Oui |  |
| `MODELIVRAISON` | `NUMBER` | Oui |  |
| `REFERENCEFACT` | `VARCHAR2(100 BYTE)` | Oui |  |
| `NUMEROFACTURE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `DATELIVRAISON` | `DATE` | Oui |  |
| `LIEULIVRAISON` | `VARCHAR2(255 BYTE)` | Oui |  |
| `UPDATED_AT` | `TIMESTAMP(6)` | Oui |  |
| `IDMODEPAIEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ADECLARER` | `NUMBER(38,0)` | Oui |  |
| `IDECHEANCEPAIEMENT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `HEURESAISIE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MONTANTDONNE` | `NUMBER(38,5)` | Oui |  |
| `IDCOMMERCIAL` | `VARCHAR2(255 BYTE)` | Oui |  |
| `REMISE` | `NUMBER(30,2)` | Oui |  |
| `REMISEMONTANT` | `NUMBER(30,2)` | Oui |  |
| `IDRESPONSABLE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `DATEECHEANCE` | `DATE` | Oui |  |
| `IDREPRESENTANT` | `VARCHAR2(250 BYTE)` | Oui |  |

Clés : `VENTE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [VENTE](tables.md#vente).`IDCLIENT` → [CLIENT](tables.md#client).`ID` (`VENTE_CLIENT_FK`, ENABLED).

Tables qui la référencent :

- [AS_BONDELIVRAISON_CLIENT](tables.md#as-bondelivraison-client).`IDVENTE` → [VENTE](tables.md#vente).`ID`.
- [AVOIRFC](tables.md#avoirfc).`IDVENTE` → [VENTE](tables.md#vente).`ID`.
- [LIVRAISON](tables.md#livraison).`IDVENTE` → [VENTE](tables.md#vente).`ID`.
- [MVTSTOCK](tables.md#mvtstock).`IDVENTE` → [VENTE](tables.md#vente).`ID`.
- [STOCK_ENGAGE](tables.md#stock-engage).`IDVENTE` → [VENTE](tables.md#vente).`ID`.
- [VENTE_DETAILS](tables.md#vente-details).`IDVENTE` → [VENTE](tables.md#vente).`ID`.

Vues dépendantes directes (49) : [AS_BONDELIVRAISON_CLIENT_CPL](vues.md#as-bondelivraison-client-cpl), [AS_BONDELIVRAISON_CLIENT_CPL2](vues.md#as-bondelivraison-client-cpl2), [AVOIRFCLIB_PDF](vues.md#avoirfclib-pdf), [BALANCE_CLIENT](vues.md#balance-client), [BONDECOMMANDEFACTURER](vues.md#bondecommandefacturer), [COMPTA_SOUSECRITURE_LETTRE2](vues.md#compta-sousecriture-lettre2), [ETATRECAPITULATIFCOMMANDE](vues.md#etatrecapitulatifcommande), [ETAT_VENTE_DETAILS_POIDS](vues.md#etat-vente-details-poids), [INSERTION_VENTE](vues.md#insertion-vente), [INSERTION_VENTE_PERSONNEL](vues.md#insertion-vente-personnel), [MVTSTOCKLIB](vues.md#mvtstocklib), [PREVISIONGROUPE](vues.md#previsiongroupe), [PREVISION_CPL](vues.md#prevision-cpl), [UPDATEVENTE](vues.md#updatevente), [VENTEALIVRER](vues.md#ventealivrer), [VENTEAPAYER](vues.md#venteapayer), [VENTEDETCALC](vues.md#ventedetcalc), [VENTEDETCALCREMGLOVISE](vues.md#ventedetcalcremglovise), [VENTEDETMERECATINGRCATCLIENT](vues.md#ventedetmerecatingrcatclient), [VENTEMONTANTLEGER](vues.md#ventemontantleger), [VENTE_CPL](vues.md#vente-cpl), [VENTE_CPL_ANALYSE](vues.md#vente-cpl-analyse), [VENTE_CPL_ANALYSEF](vues.md#vente-cpl-analysef), [VENTE_CPL_AVEC_MONTANT](vues.md#vente-cpl-avec-montant), [VENTE_CPL_AVEC_MONTANT_EUR](vues.md#vente-cpl-avec-montant-eur), [VENTE_CPL_AVEC_MONTANT_MGA](vues.md#vente-cpl-avec-montant-mga), [VENTE_CPL_AVEC_MONTANT_SANSDEV](vues.md#vente-cpl-avec-montant-sansdev), [VENTE_CPL_AVEC_MONTANT_USD](vues.md#vente-cpl-avec-montant-usd), [VENTE_CPL_BC_VISEE](vues.md#vente-cpl-bc-visee), [VENTE_CPL_CL](vues.md#vente-cpl-cl), [VENTE_CPL_SANSAVOIR](vues.md#vente-cpl-sansavoir), [VENTE_CPL_VISEE](vues.md#vente-cpl-visee), [VENTE_DETAILS_ANALYSE](vues.md#vente-details-analyse), [VENTE_DETAILS_CPL_2](vues.md#vente-details-cpl-2), [VENTE_DETAILS_CPL_2_VISEE](vues.md#vente-details-cpl-2-visee), [VENTE_DETAILS_LIB](vues.md#vente-details-lib), [VENTE_DETAILS_POIDS_ING](vues.md#vente-details-poids-ing), [VENTE_DETAILS_VIDE](vues.md#vente-details-vide), [VENTE_DIRECTE_CPL_PDF](vues.md#vente-directe-cpl-pdf), [VENTE_ENCAISSE](vues.md#vente-encaisse), [VENTE_LIB](vues.md#vente-lib), [VENTE_LIB_BC](vues.md#vente-lib-bc), [VENTE_MERE_MONTANT](vues.md#vente-mere-montant), [VENTE_MF](vues.md#vente-mf), [VENTE_ORIGINE](vues.md#vente-origine), [VENTE_VALIDEE](vues.md#vente-validee), [V_LIAISONPAIEMENT_VENTE](vues.md#v-liaisonpaiement-vente), [V_NUMEROFACTURE_EN_COURS](vues.md#v-numerofacture-en-cours), [V_STATISTIQUE_CA](vues.md#v-statistique-ca).

Références dans le code : [vente/InsertionVente.java:34](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/InsertionVente.java#L34>), [vente/UpdateVente.java:13](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/UpdateVente.java#L13>), [vente/Vente.java:416](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/Vente.java#L416>), [rapprochement/apresReglerRelever.jsp:47](<../../projet-standard - Copie/arbiochem-war/web/pages/rapprochement/apresReglerRelever.jsp#L47>), [vente/vente-arbiochem-saisie.jsp:47](<../../projet-standard - Copie/arbiochem-war/web/pages/vente/vente-arbiochem-saisie.jsp#L47>) ; 1 autres fichiers dans `usages-code.json`.

<a id="ventelubrifiant"></a>

## VENTELUBRIFIANT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui | FK → PRODUIT |
| `QTE` | `NUMBER(30,2)` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `TAUXREMISE` | `NUMBER(30,2)` | Oui |  |
| `IDENCAISSEMENT` | `VARCHAR2(255 BYTE)` | Oui | FK → ENCAISSEMENT |
| `IDMAGASIN` | `VARCHAR2(255 BYTE)` | Oui | FK → MAGASIN2 |
| `DATY` | `DATE` | Oui |  |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |
| `IDMAGASINLIB` | `VARCHAR2(255 BYTE)` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `VENTELUBRIFIANT_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [VENTELUBRIFIANT](tables.md#ventelubrifiant).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID` (`VENTELUBRIFIANT_PRODUIT_FK`, ENABLED).
- [VENTELUBRIFIANT](tables.md#ventelubrifiant).`IDENCAISSEMENT` → [ENCAISSEMENT](tables.md#encaissement).`ID` (`VENTELUB_ENCAISSEMENT_FK`, ENABLED).
- [VENTELUBRIFIANT](tables.md#ventelubrifiant).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` (`VENTELUB_MAGASIN_FK`, ENABLED).

Vues dépendantes directes (2) : [VENTELUBRIFIANTLIB](vues.md#ventelubrifiantlib), [VENTELUBRIFIANT_VALIDEE](vues.md#ventelubrifiant-validee).

Références dans le code : [venteLubrifiant/VenteLubrifiant.java:46](<../../projet-standard - Copie/arbiochem-ejb/src/java/venteLubrifiant/VenteLubrifiant.java#L46>).

<a id="vente-details"></a>

## VENTE_DETAILS

Lignes de facture client : article, quantité, prix, remise, TVA et coût de revient.

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDVENTE` | `VARCHAR2(255 BYTE)` | Oui | FK → VENTE |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QTE` | `NUMBER(*,0)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(100 BYTE)` | Oui | FK → DEVISE |
| `TAUXDECHANGE` | `NUMBER(30,2)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(250 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDBCFILLE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `UNITE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `POIDS` | `NUMBER(30,5)` | Oui |  |
| `RISTOURNE` | `NUMBER` | Oui |  |
| `IDPREVISION` | `VARCHAR2(55 BYTE)` | Oui |  |
| `PU` | `NUMBER(30,5)` | Oui |  |
| `REMISE` | `NUMBER(30,5)` | Oui |  |
| `TVA` | `NUMBER(30,5)` | Oui |  |
| `PUACHAT` | `NUMBER(30,5)` | Oui |  |
| `PUVENTE` | `NUMBER(30,5)` | Oui |  |
| `PUREVIENT` | `NUMBER(20,5)` | Oui |  |
| `IDREMISE` | `VARCHAR2(50 BYTE)` | Oui |  |
| `REMISEMONTANT` | `NUMBER(30,2)` | Oui |  |
| `PHOTO` | `VARCHAR2(100 BYTE)` | Oui |  |
| `QTE_TMP` | `NUMBER(30,3)` | Oui |  |
| `REFERENCE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `REMISEARBIOCHEM` | `NUMBER(30,2)` | Oui |  |
| `RISTOURNEARBIOCHEM` | `NUMBER(30,2)` | Oui |  |

Clés : `VENTE_DETAILS_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [VENTE_DETAILS](tables.md#vente-details).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` (`VENTEDET_DEVISE_FK`, ENABLED).
- [VENTE_DETAILS](tables.md#vente-details).`IDVENTE` → [VENTE](tables.md#vente).`ID` (`VENTE_MEREFILLE_FK`, ENABLED).

Tables qui la référencent :

- [AS_BONDELIVRAISON_CLIENT_FILLE](tables.md#as-bondelivraison-client-fille).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID`.
- [AVOIRFCFILLE](tables.md#avoirfcfille).`IDVENTEDETAILS` → [VENTE_DETAILS](tables.md#vente-details).`ID`.
- [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID`.
- [MVTSTOCKFILLE](tables.md#mvtstockfille).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID`.
- [PREVISION](tables.md#prevision).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID`.
- [STOCK_ENGAGE_FILLE](tables.md#stock-engage-fille).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID`.

Vues dépendantes directes (31) : [ASBLCLIENTCPLASINGREDIENTS](vues.md#asblclientcplasingredients), [AS_BLCF_VENTE_RESTE](vues.md#as-blcf-vente-reste), [AS_BL_CLIENT_CPL_ASINGREDIENTS](vues.md#as-bl-client-cpl-asingredients), [AS_BONLIVRFILLE_CLIENT_CPL](vues.md#as-bonlivrfille-client-cpl), [AS_BONLIVRFILLE_CLIENT_CPL2](vues.md#as-bonlivrfille-client-cpl2), [BALANCE_CLIENT](vues.md#balance-client), [BONDECOMMANDEFACTURER](vues.md#bondecommandefacturer), [MOUVEMENTCAISSECPL](vues.md#mouvementcaissecpl), [MVTCAISSECPLORIGINE](vues.md#mvtcaissecplorigine), [PREVISION_COMPLET_CPL](vues.md#prevision-complet-cpl), [PREVISION_CPL](vues.md#prevision-cpl), [RECLAMATIONLIB](vues.md#reclamationlib), [UPDATEVENTEDETAILS](vues.md#updateventedetails), [VENTEDETAILS_GRP](vues.md#ventedetails-grp), [VENTEDETCALC](vues.md#ventedetcalc), [VENTEDETMERECATINGRCATCLIENT](vues.md#ventedetmerecatingrcatclient), [VENTEMONTANTLEGER](vues.md#ventemontantleger), [VENTE_DETAILS_CPL](vues.md#vente-details-cpl), [VENTE_DETAILS_CPL_2](vues.md#vente-details-cpl-2), [VENTE_DETAILS_LIB](vues.md#vente-details-lib), [VENTE_DETAILS_PAYE](vues.md#vente-details-paye), [VENTE_DETAILS_POIDS_ING](vues.md#vente-details-poids-ing), [VENTE_DETAILS_RESTE](vues.md#vente-details-reste), [VENTE_DETAILS_SAISIE](vues.md#vente-details-saisie), [VENTE_DETAILS_SAISIE_DIRECTE](vues.md#vente-details-saisie-directe), [VENTE_DETAILS_TICKET](vues.md#vente-details-ticket), [VENTE_DETAILS_VIDE](vues.md#vente-details-vide), [VENTE_GRP_SANSDEVISE](vues.md#vente-grp-sansdevise), [VENTE_MF](vues.md#vente-mf), [VENTE_VALIDEE](vues.md#vente-validee), [V_STATISTIQUE_CA](vues.md#v-statistique-ca).

Références dans le code : [vente/UpdateVenteDetails.java:23](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/UpdateVenteDetails.java#L23>), [vente/VenteDetails.java:351](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/VenteDetails.java#L351>), [vente/VenteDetailsArbiochem.java:26](<../../projet-standard - Copie/arbiochem-ejb/src/java/vente/VenteDetailsArbiochem.java#L26>).

<a id="vente-detailstaloha"></a>

## VENTE_DETAILSTALOHA

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDVENTE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDPRODUIT` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |
| `QTE` | `NUMBER(*,0)` | Oui |  |
| `PU` | `NUMBER(30,2)` | Oui |  |
| `REMISE` | `NUMBER(30,2)` | Oui |  |
| `TVA` | `NUMBER(30,2)` | Oui |  |
| `PUACHAT` | `NUMBER(30,2)` | Oui |  |
| `PUVENTE` | `NUMBER(30,2)` | Oui |  |
| `IDDEVISE` | `VARCHAR2(100 BYTE)` | Oui |  |
| `TAUXDECHANGE` | `NUMBER(30,2)` | Oui |  |
| `DESIGNATION` | `VARCHAR2(250 BYTE)` | Oui |  |
| `COMPTE` | `VARCHAR2(255 BYTE)` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

<a id="versementcheque"></a>

## VERSEMENTCHEQUE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDCAISSE` | `VARCHAR2(255 BYTE)` | Oui | FK → CAISSE |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |

Clés : `VERSEMENTCHEQUE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [VERSEMENTCHEQUE](tables.md#versementcheque).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` (`VERSEMENTCHEQUE_CAISSE_FK`, ENABLED).

Tables qui la référencent :

- [VERSEMENTCHEQUEDETAILS](tables.md#versementchequedetails).`IDVERSEMENTCHEQUE` → [VERSEMENTCHEQUE](tables.md#versementcheque).`ID`.

Vues dépendantes directes (1) : [VERSEMENTCHEQUEDETAILSCPL](vues.md#versementchequedetailscpl).

Références dans le code : [cheque/VersementCheque.java:24](<../../projet-standard - Copie/arbiochem-ejb/src/java/cheque/VersementCheque.java#L24>), [cheque/versement/versementcheque-liste.jsp:6](<../../projet-standard - Copie/arbiochem-war/web/pages/cheque/versement/versementcheque-liste.jsp#L6>), [cheque/versement/versementcheque-modif.jsp:23](<../../projet-standard - Copie/arbiochem-war/web/pages/cheque/versement/versementcheque-modif.jsp#L23>), [cheque/versement/versementcheque-saisie.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/cheque/versement/versementcheque-saisie.jsp#L25>).

<a id="versementchequedetails"></a>

## VERSEMENTCHEQUEDETAILS

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `IDVERSEMENTCHEQUE` | `VARCHAR2(255 BYTE)` | Oui | FK → VERSEMENTCHEQUE |
| `IDCHEQUE` | `VARCHAR2(255 BYTE)` | Oui | FK → CHEQUE |
| `REMARQUE` | `VARCHAR2(500 BYTE)` | Oui |  |

Clés : `VERSEMENTCHEQUEDETAILS_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [VERSEMENTCHEQUEDETAILS](tables.md#versementchequedetails).`IDCHEQUE` → [CHEQUE](tables.md#cheque).`ID` (`VERSCHEQUEDETAILS_CHEQUE_FK`, ENABLED).
- [VERSEMENTCHEQUEDETAILS](tables.md#versementchequedetails).`IDVERSEMENTCHEQUE` → [VERSEMENTCHEQUE](tables.md#versementcheque).`ID` (`VERSEMENTCHEQUEDETAILS_MERE_FK`, ENABLED).

Vues dépendantes directes (1) : [VERSEMENTCHEQUEDETAILSCPL](vues.md#versementchequedetailscpl).

Références dans le code : [cheque/VersementChequeDetails.java:21](<../../projet-standard - Copie/arbiochem-ejb/src/java/cheque/VersementChequeDetails.java#L21>), [cheque/versement/versementcheque-modif.jsp:25](<../../projet-standard - Copie/arbiochem-war/web/pages/cheque/versement/versementcheque-modif.jsp#L25>), [cheque/versement/versementcheque-saisie.jsp:27](<../../projet-standard - Copie/arbiochem-war/web/pages/cheque/versement/versementcheque-saisie.jsp#L27>).

<a id="ville"></a>

## VILLE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Non | PK |
| `VAL` | `VARCHAR2(100 BYTE)` | Non |  |
| `DESCE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `SYS_C007839` (primaire) : `ID`.

Références dans le code : [paie/annexe/Ville.java:46](<../../projet-standard - Copie/arbiochem-ejb/src/java/paie/annexe/Ville.java#L46>).

<a id="virementintracaisse"></a>

## VIREMENTINTRACAISSE

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(255 BYTE)` | Non | PK |
| `DESIGNATION` | `VARCHAR2(255 BYTE)` | Oui |  |
| `IDCAISSEDEPART` | `VARCHAR2(255 BYTE)` | Oui | FK → CAISSE |
| `IDCAISSEARRIVE` | `VARCHAR2(255 BYTE)` | Oui | FK → CAISSE |
| `MONTANT` | `NUMBER(30,2)` | Oui |  |
| `DATY` | `DATE` | Oui |  |
| `ETAT` | `NUMBER(*,0)` | Oui |  |
| `IDORIGINE` | `VARCHAR2(255 BYTE)` | Oui |  |

Clés : `VIREMENTINTRACAISSE_PK` (primaire) : `ID`.

Clés étrangères sortantes :

- [VIREMENTINTRACAISSE](tables.md#virementintracaisse).`IDCAISSEARRIVE` → [CAISSE](tables.md#caisse).`ID` (`VIREMENTINTRACAISSE_ARRIVE_FK`, ENABLED).
- [VIREMENTINTRACAISSE](tables.md#virementintracaisse).`IDCAISSEDEPART` → [CAISSE](tables.md#caisse).`ID` (`VIREMENTINTRACAISSE_DEPART_FK`, ENABLED).

Vues dépendantes directes (1) : [VIREMENTINTRACAISSECPL](vues.md#virementintracaissecpl).

Références dans le code : [caisse/VirementIntraCaisse.java:28](<../../projet-standard - Copie/arbiochem-ejb/src/java/caisse/VirementIntraCaisse.java#L28>).

<a id="visaobject"></a>

## VISAOBJECT

| Colonne | Type | NULL autorisé | Clés |
|---|---|---|---|
| `ID` | `VARCHAR2(50 BYTE)` | Oui |  |
| `REMARQUE` | `VARCHAR2(250 BYTE)` | Oui |  |
| `IDUSER` | `VARCHAR2(50 BYTE)` | Oui |  |
| `OBJET` | `VARCHAR2(500 BYTE)` | Oui |  |
| `REFOBJET` | `VARCHAR2(50 BYTE)` | Oui |  |
| `DATY` | `DATE` | Oui |  |

Aucune contrainte de clé primaire ou unique relevée dans le dictionnaire.

Références dans le code : Aucune référence littérale reconnue par cette extraction statique.

