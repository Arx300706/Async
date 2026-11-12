# Les 518 clés étrangères déclarées

Source : `USER_CONSTRAINTS` et `USER_CONS_COLUMNS`. Les colonnes des clés composées sont conservées dans leur ordre. Les jointures du code qui ne sont pas des contraintes Oracle ne figurent pas dans ce tableau.

| Contrainte | Relation enfant → parent | Statut | Validation | Suppression du parent |
|---|---|---|---|---|
| `FK_ACCIDENT_GRAVITE` | [ACCIDENT](tables.md#accident).`ID_GRAVITE` → [GRAVITE_ACCIDENT](tables.md#gravite-accident).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ACCIDENT_LIEU` | [ACCIDENT](tables.md#accident).`ID_LIEU` → [LIEU_ACCIDENT_TRAVAIL](tables.md#lieu-accident-travail).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ACCIDENT_MACHINE` | [ACCIDENT](tables.md#accident).`ID_MACHINE` → [MACHINE](tables.md#machine).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ACCIDENT_PERSONNEL` | [ACCIDENT](tables.md#accident).`ID_PERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ACCIDENT_TYPE` | [ACCIDENT](tables.md#accident).`ID_TYPE_ACCIDENT` → [TYPE_ACCIDENT](tables.md#type-accident).`ID` | ENABLED | VALIDATED | NO ACTION |
| `ACTE_CLIENT_FK` | [ACTE](tables.md#acte).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | VALIDATED | NO ACTION |
| `ACTE_PRODUIT_FK` | [ACTE](tables.md#acte).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_AFD_TYPECOUT` | [ACTION_FORMATION_DETAIL](tables.md#action-formation-detail).`IDTYPECOUT` → [TYPE_COUT_FORMATION](tables.md#type-cout-formation).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007842` | [AI_TURN](tables.md#ai-turn).`SESSIONID` → [AI_SESSION](tables.md#ai-session).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008287` | [ALIMENTPOUSSIN](tables.md#alimentpoussin).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `BC_DEVISE_FK` | [AS_BONDECOMMANDE](tables.md#as-bondecommande).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `AS_BCFILLE_UNITE_FK` | [AS_BONDECOMMANDE_FILLE](tables.md#as-bondecommande-fille).`UNITE` → [AS_UNITE](tables.md#as-unite).`ID` | ENABLED | VALIDATED | NO ACTION |
| `BCFILLE_DEVISE_FK` | [AS_BONDECOMMANDE_FILLE](tables.md#as-bondecommande-fille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `BCF_PRODUIT` | [AS_BONDECOMMANDE_FILLE](tables.md#as-bondecommande-fille).`PRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `BC_MERE_FILLE` | [AS_BONDECOMMANDE_FILLE](tables.md#as-bondecommande-fille).`IDBC` → [AS_BONDECOMMANDE](tables.md#as-bondecommande).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SYS_C008253` | [AS_BONDELIVRAISON](tables.md#as-bondelivraison).`IDFACTUREFOURNISSEUR` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008356` | [AS_BONDELIVRAISON](tables.md#as-bondelivraison).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `BLC_CLIENT_FK` | [AS_BONDELIVRAISON_CLIENT](tables.md#as-bondelivraison-client).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SYS_C008064` | [AS_BONDELIVRAISON_CLIENT](tables.md#as-bondelivraison-client).`IDVENTE` → [VENTE](tables.md#vente).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008070` | [AS_BONDELIVRAISON_CLIENT_FILLE](tables.md#as-bondelivraison-client-fille).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008265` | [AS_BONDELIVRAISON_CLIENT_FILLE](tables.md#as-bondelivraison-client-fille).`NUMBL` → [AS_BONDELIVRAISON_CLIENT](tables.md#as-bondelivraison-client).`ID` | ENABLED | VALIDATED | NO ACTION |
| `BLF_PRODUIT_FK` | [AS_BONDELIVRAISON_FILLE](tables.md#as-bondelivraison-fille).`PRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `BLF_UNITE_FK` | [AS_BONDELIVRAISON_FILLE](tables.md#as-bondelivraison-fille).`UNITE` → [AS_UNITE](tables.md#as-unite).`ID` | ENABLED | VALIDATED | NO ACTION |
| `NONFILLE_FK` | [AS_BONDELIVRAISON_FILLE](tables.md#as-bondelivraison-fille).`NUMBL` → [AS_BONDELIVRAISON](tables.md#as-bondelivraison).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SYS_C008254` | [AS_BONDELIVRAISON_FILLE](tables.md#as-bondelivraison-fille).`IDFACTUREFOURNISSEUR` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_AS_INGREDIENTS_TYPESTOCK` | [AS_INGREDIENTS](tables.md#as-ingredients).`TYPESTOCK` → [TYPESTOCK](tables.md#typestock).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_QUALIFICATION` | [AS_INGREDIENTS](tables.md#as-ingredients).`REFQUALIFICATION` → [QUALIFICATION_PAIE](tables.md#qualification-paie).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TYPEPRODUIT` | [AS_INGREDIENTS](tables.md#as-ingredients).`TYPEPRODUIT` → [TYPE_PRODUIT](tables.md#type-produit).`ID` | ENABLED | VALIDATED | NO ACTION |
| `INGREDIENT_POSTE_FK` | [AS_INGREDIENTS](tables.md#as-ingredients).`REFPOST` → [POSTE](tables.md#poste).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008177` | [AS_INGREDIENTS](tables.md#as-ingredients).`CATEGORIEINGREDIENT` → [CATEGORIEINGREDIENT](tables.md#categorieingredient).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008310` | [AS_INGREDIENTS](tables.md#as-ingredients).`UNITE` → [AS_UNITE](tables.md#as-unite).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007913` | [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ETATOBJET` → [ETATOBJETMAINTENANCE](tables.md#etatobjetmaintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008024` | [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`QUALITEOBJET` → [QUALITESOBJETMAINTENANCE](tables.md#qualitesobjetmaintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008294` | [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008290` | [AS_RECETTE](tables.md#as-recette).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008292` | [AS_RECETTEFABRICATION](tables.md#as-recettefabrication).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008291` | [AS_RECETTEOFFFABTABLE](tables.md#as-recetteofffabtable).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ATTRELEMENT_ING` | [ATTRIBUTIONELEMENT](tables.md#attributionelement).`IDINGREDIENTMAINTENANCE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ATTRELEMENT_PERS` | [ATTRIBUTIONELEMENT](tables.md#attributionelement).`IDPERSONNEL` → [PERSONNEL](tables.md#personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ATTRIBUTIONELEMENT_ETAT` | [ATTRIBUTIONELEMENT](tables.md#attributionelement).`ETATELEMENT` → [QUALITESOBJETMAINTENANCE](tables.md#qualitesobjetmaintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `AVANCE_TYPE_FK` | [AVANCE](tables.md#avance).`IDTYPEAVANCE` → [TYPEAVANCE](tables.md#typeavance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_AVOIRACHAT_FACTURE` | [AVOIRACHAT](tables.md#avoirachat).`IDFACTURE` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_AVOIRACHAT_FOURNISSEUR` | [AVOIRACHAT](tables.md#avoirachat).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_AVOIRACHAT_MAGASIN` | [AVOIRACHAT](tables.md#avoirachat).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_AVOIRFILLE_DEV` | [AVOIRACHATFILLE](tables.md#avoirachatfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_AVOIRFILLE_FACDET` | [AVOIRACHATFILLE](tables.md#avoirachatfille).`IDFACTUREDETAILS` → [FACTUREFOURNISSEURFILLE](tables.md#facturefournisseurfille).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_AVOIRFILLE_MERE` | [AVOIRACHATFILLE](tables.md#avoirachatfille).`IDMERE` → [AVOIRACHAT](tables.md#avoirachat).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_AVOIRFILLE_PROD` | [AVOIRACHATFILLE](tables.md#avoirachatfille).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `AVOIRFC_CLIENT_FK` | [AVOIRFC](tables.md#avoirfc).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `AVOIRFC_MAGASIN_FK` | [AVOIRFC](tables.md#avoirfc).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `AVOIRFC_VENTE_FK` | [AVOIRFC](tables.md#avoirfc).`IDVENTE` → [VENTE](tables.md#vente).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FK_AVOIRFC_TYPEAVOIR` | [AVOIRFC](tables.md#avoirfc).`IDTYPEAVOIR` → [TYPEAVOIR](tables.md#typeavoir).`ID` | ENABLED | VALIDATED | NO ACTION |
| `AVFCFILLE_DEVISE_FK` | [AVOIRFCFILLE](tables.md#avoirfcfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `AVFCFILLE_VENTEDETAIL_FK` | [AVOIRFCFILLE](tables.md#avoirfcfille).`IDVENTEDETAILS` → [VENTE_DETAILS](tables.md#vente-details).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `AVOIRFC_MEREFILLE_FK` | [AVOIRFCFILLE](tables.md#avoirfcfille).`IDAVOIRFC` → [AVOIRFC](tables.md#avoirfc).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FK_BANQUE_AGENCE` | [BANQUE_AGENCE](tables.md#banque-agence).`IDBANQUE` → [BANQUE](tables.md#banque).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_BATIMENT_MAGASIN` | [BATIMENT](tables.md#batiment).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_BATDET_BATIMENT` | [BATIMENTDETAIL](tables.md#batimentdetail).`IDMERE` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_BATDET_LOT` | [BATIMENTDETAIL](tables.md#batimentdetail).`IDLOT` → [LOT](tables.md#lot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_BATDET_PARQUET` | [BATIMENTDETAIL](tables.md#batimentdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_BATDET_SEXE` | [BATIMENTDETAIL](tables.md#batimentdetail).`IDSEXE` → [SEXE](tables.md#sexe).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_BVS_BAT` | [BATIMENTVIDESANITAIRE](tables.md#batimentvidesanitaire).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_LOG_P_BAT` | [BATIMENTVIDESANITAIRE](tables.md#batimentvidesanitaire).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_BVSD_BVS` | [BATIMENTVIDESANITAIREDETAIL](tables.md#batimentvidesanitairedetail).`IDMERE` → [BATIMENTVIDESANITAIRE](tables.md#batimentvidesanitaire).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_LOG_PERSONNEL_BAT` | [BATIMENTVIDESANITAIREDETAIL](tables.md#batimentvidesanitairedetail).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `BILAN_PARENT_FK` | [BILANSECTION](tables.md#bilansection).`IDPARENT` → [BILANSECTION](tables.md#bilansection).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `BILAN_SECTION_FK` | [BILAN_SECTION_COMPTE](tables.md#bilan-section-compte).`IDBILANSECTION` → [BILANSECTION](tables.md#bilansection).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `BONCOMMANDE_FOURNISSEUR_FK` | [BONCOMMANDE](tables.md#boncommande).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `BONCOMMANDE_MODEPAIEMENT_FK` | [BONCOMMANDE](tables.md#boncommande).`IDMODEPAIEMENT` → [MODEPAIEMENT](tables.md#modepaiement).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `BCC_DEVISE_FK` | [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FK_CLIENT` | [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `BCCF_DEVISE_FK` | [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `BCLIENT_MERE_FILLE` | [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FK_BU_SOCIETE` | [BUSINESS_UNITE](tables.md#business-unite).`IDSOCIETE` → [SOCIETE](tables.md#societe).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CAISSE_CATEGORIE_FK` | [CAISSE](tables.md#caisse).`IDCATEGORIECAISSE` → [CATEGORIECAISSE](tables.md#categoriecaisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `CAISSE_DEVISE_FK` | [CAISSE](tables.md#caisse).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `CAISSE_POINT_FK` | [CAISSE](tables.md#caisse).`IDPOINT` → [POINT](tables.md#point).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `CAISSE_TYPE_FK` | [CAISSE](tables.md#caisse).`IDTYPECAISSE` → [TYPECAISSE](tables.md#typecaisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FK_IDMAGASIN` | [CAISSE](tables.md#caisse).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FK_CANDIDATURES_CANDIDAT` | [CANDIDATURES](tables.md#candidatures).`IDCANDIDAT` → [CANDIDAT](tables.md#candidat).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CANDIDATURES_OFFRE` | [CANDIDATURES](tables.md#candidatures).`IDOFFREEMPLOIE` → [OFFRE_EMPLOI](tables.md#offre-emploi).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CARTON_BC_FK` | [CARTON](tables.md#carton).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CATEGORIE_TYPEPRODUIT_FK` | [CATEGORIE](tables.md#categorie).`IDTYPEPRODUIT` → [TYPE_PRODUIT](tables.md#type-produit).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `CATEGORIE_FK` | [CATEGORIE_QUALIFICATION](tables.md#categorie-qualification).`IDCATEGORIE` → [CATEGORIE_PAIE](tables.md#categorie-paie).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CATEGQUALI_POSTE_FK` | [CATEGORIE_QUALIFICATION](tables.md#categorie-qualification).`IDPOSTE` → [POSTE](tables.md#poste).`ID` | ENABLED | VALIDATED | NO ACTION |
| `QUALIFICATION_FK` | [CATEGORIE_QUALIFICATION](tables.md#categorie-qualification).`IDQUALIFICATION` → [QUALIFICATION_PAIE](tables.md#qualification-paie).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008176` | [CA_JOUR](tables.md#ca-jour).`IDCATEGORIE` → [CATEGORIEINGREDIENT](tables.md#categorieingredient).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CENTRE_CATEGORIE` | [CENTRE](tables.md#centre).`DESCE` → [CATEGORIE_CENTRE](tables.md#categorie-centre).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `TYPE_CENTRE_FK` | [CENTRE](tables.md#centre).`TYPE` → [TYPE_CENTRE](tables.md#type-centre).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `CHARGE_FAB_FK` | [CHARGE](tables.md#charge).`IDFABRICATION` → [FABRICATION](tables.md#fabrication).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CHARGE_TYPE_FK` | [CHARGE](tables.md#charge).`TYPE` → [TYPECHARGE](tables.md#typecharge).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CHARGE_PERSONNEL` | [CHARGEPERSONNELTEMP](tables.md#chargepersonneltemp).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CHECKIN_AS_INGREDIENTS_ID_FK` | [CHECKIN](tables.md#checkin).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CHECKIN_CLIENT_ID_FK` | [CHECKIN](tables.md#checkin).`CLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CHECKIN_RESERVATION_ID_FK` | [CHECKIN](tables.md#checkin).`RESERVATION` → [RESERVATION](tables.md#reservation).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CHECKIN___FK_CLIENT` | [CHECKIN](tables.md#checkin).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CHKFILLE_MERE` | [CHECKLIST_FILLE](tables.md#checklist-fille).`IDCHECKLISTMERE` → [CHECKLIST_MERE](tables.md#checklist-mere).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CHKFILLE_RESPONSABLE` | [CHECKLIST_FILLE](tables.md#checklist-fille).`IDRESPONSABLE` → [LOG_DIRECTION](tables.md#log-direction).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CHKFILLE_TYPDOC` | [CHECKLIST_FILLE](tables.md#checklist-fille).`IDTYPEDOCUMENT` → [TYPEDOCUMENTCHECKLIST](tables.md#typedocumentchecklist).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CHKMERE_PERSONNEL` | [CHECKLIST_MERE](tables.md#checklist-mere).`IDPERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CHECKOUT_CHECKIN_ID_FK` | [CHECKOUT](tables.md#checkout).`RESERVATION` → [CHECKIN](tables.md#checkin).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CHEQUE_CAISSE_FK` | [CHEQUE](tables.md#cheque).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SYS_C008200` | [CHEQUE](tables.md#cheque).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008312` | [CHEQUE](tables.md#cheque).`IDPRECISIONDETAILENCAISSEMENT` → [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CLIENT_TYPECLIENT` | [CLIENT](tables.md#client).`IDTYPECLIENT` → [TYPECLIENT](tables.md#typeclient).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008203` | [CLOTURECAISSEFILLE](tables.md#cloturecaissefille).`IDCLOTURE` → [CLOTURECAISSE](tables.md#cloturecaisse).`ID` | ENABLED | VALIDATED | NO ACTION |
| `C_DEVISE_FK` | [COMMANDE](tables.md#commande).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `C_FK_CLIENT` | [COMMANDE](tables.md#commande).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CMD_D_FK` | [COMMANDEFILLE](tables.md#commandefille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `C_FILLE` | [COMMANDEFILLE](tables.md#commandefille).`IDC` → [COMMANDE](tables.md#commande).`ID` | ENABLED | VALIDATED | NO ACTION |
| `COMI_COMERCIAL_FK` | [COMMISSION](tables.md#commission).`IDCOMMERCIAL` → [COMMERCIAL](tables.md#commercial).`ID` | ENABLED | VALIDATED | NO ACTION |
| `COMI_MODEPAIEMENT_FK` | [COMMISSION](tables.md#commission).`IDMODEPAIEMENT` → [MODEPAIEMENT](tables.md#modepaiement).`ID` | ENABLED | VALIDATED | NO ACTION |
| `COM_DEVISE_FK` | [COMMISSION](tables.md#commission).`DEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `COM_IDDEVISE_FK` | [COMMISSION](tables.md#commission).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `COMFILLE_DEVISE_FK` | [COMMISSIONFILLE](tables.md#commissionfille).`DEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `COMFILLE_IDDEVISE_FK` | [COMMISSIONFILLE](tables.md#commissionfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `COMIS_MEREFILLE_FK` | [COMMISSIONFILLE](tables.md#commissionfille).`IDCOMMISSION` → [COMMISSION](tables.md#commission).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007908` | [COMPTA_SOUS_ECRITURE](tables.md#compta-sous-ecriture).`COMPTE` → [COMPTA_COMPTE](tables.md#compta-compte).`COMPTE` | ENABLED | VALIDATED | NO ACTION |
| `COMPTEUR_ORIGINE_FK` | [COMPTEUR](tables.md#compteur).`IDORIGINE` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `COMPTEURELECTRICITE_MERE_FK` | [COMPTEURELECTRICITE](tables.md#compteurelectricite).`IDMERE` → [COMPTEURELECTRICITEMERE](tables.md#compteurelectricitemere).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_COMPTEUR_INGREDIENTS_CE` | [COMPTEURELECTRICITE](tables.md#compteurelectricite).`IDCATEGORIE` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_COMPTEUR_MAGASIN_CE` | [COMPTEURELECTRICITE](tables.md#compteurelectricite).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007932` | [COMPTEURELECTRICITE](tables.md#compteurelectricite).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_COMPTEUR_INGREDIENTS` | [COMPTEURMAINTENANCE](tables.md#compteurmaintenance).`IDCATEGORIE` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_COMPTEUR_MAGASIN` | [COMPTEURMAINTENANCE](tables.md#compteurmaintenance).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007933` | [COMPTEURMAINTENANCE](tables.md#compteurmaintenance).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008007` | [CONSOMMABLEMACHINE](tables.md#consommablemachine).`IDTYPEMAINTENANCE` → [TYPEMAINTENANCE](tables.md#typemaintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008049` | [CONSOMMABLEMACHINE](tables.md#consommablemachine).`FREQUENCE` → [UNITEMAINTENANCE](tables.md#unitemaintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008282` | [CONSOMMABLEMACHINE](tables.md#consommablemachine).`IDCONSOMMABLE` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008302` | [CONSOMMABLEMACHINE](tables.md#consommablemachine).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008307` | [CONSOMMABLEMACHINE](tables.md#consommablemachine).`IDUNITE` → [AS_UNITE](tables.md#as-unite).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008006` | [CONSOMMATION](tables.md#consommation).`IDTYPEMAINTENANCE` → [TYPEMAINTENANCE](tables.md#typemaintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008301` | [CONSOMMATION](tables.md#consommation).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008281` | [CONSOMMATIONDETAILS](tables.md#consommationdetails).`IDINGREDIENTS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008306` | [CONSOMMATIONDETAILS](tables.md#consommationdetails).`IDUNITE` → [AS_UNITE](tables.md#as-unite).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008335` | [CONSOMMATIONDETAILS](tables.md#consommationdetails).`IDMERE` → [CONSOMMATION](tables.md#consommation).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CV_FICHE_POSTE` | [CV](tables.md#cv).`IDFICHEPOSTE` → [FICHE_POSTE](tables.md#fiche-poste).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CV_CERTIFICATION_CV` | [CV_CERTIFICATION](tables.md#cv-certification).`IDCV` → [CV](tables.md#cv).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CV_COMPETENCE_CV` | [CV_COMPETENCE](tables.md#cv-competence).`IDCV` → [CV](tables.md#cv).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CV_EXPERIENCE_CV` | [CV_EXPERIENCE](tables.md#cv-experience).`IDCV` → [CV](tables.md#cv).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CV_FORMATION_CV` | [CV_FORMATION](tables.md#cv-formation).`IDCV` → [CV](tables.md#cv).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CV_FORMATION_DIPLOME` | [CV_FORMATION](tables.md#cv-formation).`IDDIPLOME` → [DIPLOME](tables.md#diplome).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CV_LANGUE_CV` | [CV_LANGUE](tables.md#cv-langue).`IDCV` → [CV](tables.md#cv).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DEC_DECISION_TYPE_DESCE_FKEY` | [DEC_DECISION_TYPE](tables.md#dec-decision-type).`DESCE` → [DEC_DECISION_CATEGORIE](tables.md#dec-decision-categorie).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DEMANDE_PAIEINFOPERS_ID_FK` | [DEMANDE](tables.md#demande).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DEMANDE_TYPEABS_ID_FK` | [DEMANDE](tables.md#demande).`IDTYPEABSENCE` → [TYPEABSENCE](tables.md#typeabsence).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DEMANDE_TYPEDEMANDE_ID_FK` | [DEMANDE](tables.md#demande).`IDTYPEDEMANDE` → [TYPEDEMANDE](tables.md#typedemande).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DEMANDETRANSFERT_OF_FK` | [DEMANDETRANSFERT](tables.md#demandetransfert).`IDOF` → [OFAB](tables.md#ofab).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DEMTRANS_FAB_FK` | [DEMANDETRANSFERT](tables.md#demandetransfert).`IDFABRICATION` → [FABRICATION](tables.md#fabrication).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DEMANDETRANSFERT_MEREFILLE_FK` | [DEMANDETRANSFERTFILLE](tables.md#demandetransfertfille).`IDDEMANDETRANSFERT` → [DEMANDETRANSFERT](tables.md#demandetransfert).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DEMANDEUR_FK` | [DEMANDETRAVAUX](tables.md#demandetravaux).`DEMANDEUR` → [UTILISATEUR](tables.md#utilisateur).`REFUSER` | ENABLED | VALIDATED | NO ACTION |
| `DMDTRAVAUXENTITE_FK` | [DEMANDETRAVAUX](tables.md#demandetravaux).`IDENTITE` → [ENTITE](tables.md#entite).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DMDTRAVAUXSITUATION_FK` | [DEMANDETRAVAUX](tables.md#demandetravaux).`IDSITUATION` → [SITUATION](tables.md#situation).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DEPENSE_CAISSE_FK` | [DEPENSE](tables.md#depense).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `DEPENSE_OP_FK` | [DEPENSE](tables.md#depense).`IDOP` → [ORDONNERPAIEMENT](tables.md#ordonnerpaiement).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SYS_C008355` | [DEPENSEDIVERS](tables.md#depensedivers).`FOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008075` | [DEPENSEDIVERSFILLE](tables.md#depensediversfille).`IDMERE` → [DEPENSEDIVERS](tables.md#depensedivers).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DETAILBC_CAISSE_FK` | [DETAILSBONCAISSE](tables.md#detailsboncaisse).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `DETAILBC_CLIENT_FK` | [DETAILSBONCAISSE](tables.md#detailsboncaisse).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `DETAILBC_PRECDETENC_FK` | [DETAILSBONCAISSE](tables.md#detailsboncaisse).`IDPRECISIONDETAILENCAISSEMENT` → [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `DETFORMU_MERE_FKEY` | [DETFORMU](tables.md#detformu).`MERE` → [PAIE_RUBRIQUE](tables.md#paie-rubrique).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_DISTALIM_FERME` | [DISTRIBUTIONALIMENT](tables.md#distributionaliment).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_DISTALIM_LOT` | [DISTRIBUTIONALIMENT](tables.md#distributionaliment).`IDLOT` → [LOT](tables.md#lot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_DISTALIMDET_ALIMENT` | [DISTRIBUTIONALIMENTDETAIL](tables.md#distributionalimentdetail).`IDALIMENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_DISTALIMDET_BATIMENT` | [DISTRIBUTIONALIMENTDETAIL](tables.md#distributionalimentdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_DISTALIMDET_MERE` | [DISTRIBUTIONALIMENTDETAIL](tables.md#distributionalimentdetail).`IDMERE` → [DISTRIBUTIONALIMENT](tables.md#distributionaliment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_DISTALIMDET_PARQUET` | [DISTRIBUTIONALIMENTDETAIL](tables.md#distributionalimentdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DMDACHAT_FRNS_FK` | [DMDACHAT](tables.md#dmdachat).`FOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DMDACHATFILLE_PROD_FK` | [DMDACHATFILLE](tables.md#dmdachatfille).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `DMDACHAT_MEREFILLE_FK` | [DMDACHATFILLE](tables.md#dmdachatfille).`IDMERE` → [DMDACHAT](tables.md#dmdachat).`ID` | ENABLED | VALIDATED | NO ACTION |
| `ECLOSION_BAT_FK` | [ECLOSION](tables.md#eclosion).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `ECLOSION_ECLOSOIR_FK` | [ECLOSION](tables.md#eclosion).`IDECLOSOIR` → [ECLOSOIR](tables.md#eclosoir).`ID` | ENABLED | VALIDATED | NO ACTION |
| `ECLOSION_INCUB_FK` | [ECLOSION](tables.md#eclosion).`IDINCUBATEUR` → [INCUBATEUR](tables.md#incubateur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `ECLOSION_LOT_FK` | [ECLOSION](tables.md#eclosion).`IDLOT` → [LOT](tables.md#lot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `ECLOSION_PARQ_FK` | [ECLOSION](tables.md#eclosion).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `ECLOSIONDET_MERE_FK` | [ECLOSIONDETAIL](tables.md#eclosiondetail).`IDMERE` → [ECLOSION](tables.md#eclosion).`ID` | ENABLED | VALIDATED | NO ACTION |
| `ECLOSIONDET_QUAL_FK` | [ECLOSIONDETAIL](tables.md#eclosiondetail).`IDQUALITEECLOSION` → [QUALITEECLOSION](tables.md#qualiteeclosion).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ELEMENT_INSPECTION` | [ELEMENTINSPECTIONMACHINE](tables.md#elementinspectionmachine).`IDELEMENTINSPECTION` → [ELEMENTINSPECTION](tables.md#elementinspection).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008300` | [ELEMENTINSPECTIONMACHINE](tables.md#elementinspectionmachine).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008161` | [EMPLOI](tables.md#emploi).`IDMETIER` → [METIER](tables.md#metier).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CHECKLIST_SESSION` | [EMPLOYEE_ONBOARDING_CHECKLIST](tables.md#employee-onboarding-checklist).`IDSESSIONONBOARDING` → [EMPLOYEE_ONBOARDING_SESSIONS](tables.md#employee-onboarding-sessions).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_SESSION_ONBOARDING` | [EMPLOYEE_ONBOARDING_SESSIONS](tables.md#employee-onboarding-sessions).`IDONBOARDING` → [ONBOARDING_MERE](tables.md#onboarding-mere).`ID` | ENABLED | VALIDATED | NO ACTION |
| `ENCAISSEMENT_CAISSE_FK` | [ENCAISSEMENT](tables.md#encaissement).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `ENCAISSEMENT_CLIENT_FK` | [ENCAISSEMENT](tables.md#encaissement).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `ENCAISSEMENT_DEVISE_FK` | [ENCAISSEMENT](tables.md#encaissement).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `ENCAISSEMENT_TYPE_FK` | [ENCAISSEMENT](tables.md#encaissement).`IDTYPEENCAISSEMENT` → [TYPE_ENCAISSEMENT](tables.md#type-encaissement).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `ENCAISSEMENT_MEREFILLE_FK` | [ENCAISSEMENT_DETAILS](tables.md#encaissement-details).`IDENCAISSEMENT` → [ENCAISSEMENT](tables.md#encaissement).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `ENCAISSE_DEVISE_FK` | [ENCAISSEMENT_DETAILS](tables.md#encaissement-details).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `ENFPERS_LOG_FK` | [ENFANTPERSONNEL](tables.md#enfantpersonnel).`IDPERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ENT_EVAL` | [ENTRETIENRH](tables.md#entretienrh).`IDEVALUATEUR` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ENT_FONCT` | [ENTRETIENRH](tables.md#entretienrh).`IDFONCTION` → [PAIE_FONCTION](tables.md#paie-fonction).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ENT_PERS` | [ENTRETIENRH](tables.md#entretienrh).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_DET_CAT` | [ENTRETIENRH_DETAIL](tables.md#entretienrh-detail).`IDCATEGORIEEVALUATION` → [CATEGORIEEVALENTRETIENT](tables.md#categorieevalentretient).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_DET_ENT` | [ENTRETIENRH_DETAIL](tables.md#entretienrh-detail).`IDENTRETIENTRH` → [ENTRETIENRH](tables.md#entretienrh).`ID` | ENABLED | VALIDATED | NO ACTION |
| `EQUIVALENCECARTON_CARTON_FK` | [EQUIVALENCECARTON](tables.md#equivalencecarton).`IDCARTON` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `EQUIVALENCECARTON_PETRIS_FK` | [EQUIVALENCECARTON](tables.md#equivalencecarton).`IDPETRIS` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `ETATDEMANDE_TYPEDEMANDE_ID_FK` | [ETATDEMANDE](tables.md#etatdemande).`IDTYPEDEMANDE` → [TYPEDEMANDE](tables.md#typedemande).`ID` | ENABLED | VALIDATED | NO ACTION |
| `ETATDEMA_ETATHIER_ID_FK` | [ETATDEMANDE](tables.md#etatdemande).`IDETATHIERARCHIE` → [ETATHIERARCHIE](tables.md#etathierarchie).`ID` | ENABLED | VALIDATED | NO ACTION |
| `ETATHIERAR_ROLE_ID_FK` | [ETATHIERARCHIE](tables.md#etathierarchie).`IDROLE` → [ROLES](tables.md#roles).`IDROLE` | ENABLED | VALIDATED | NO ACTION |
| `ETATSTOCK_MAGASIN_FK` | [ETATSTOCK](tables.md#etatstock).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `ETATSTOCK_POINT_FK` | [ETATSTOCK](tables.md#etatstock).`IDPOINT` → [POINT](tables.md#point).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `ETATSTOCK_PRODUIT_FK` | [ETATSTOCK](tables.md#etatstock).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `ETATSTOCK_TYPEPRODUIT_FK` | [ETATSTOCK](tables.md#etatstock).`IDTYPEPRODUIT` → [TYPE_PRODUIT](tables.md#type-produit).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `ETATSTOCK_UNITE_FK` | [ETATSTOCK](tables.md#etatstock).`IDUNITE` → [UNITE](tables.md#unite).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SYS_C007841` | [EVALUATION_A_CHAUD](tables.md#evaluation-a-chaud).`IDFORMATIONSUIVIE` → [ACTION_FORMATION](tables.md#action-formation).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008227` | [EVALUATION_A_CHAUD](tables.md#evaluation-a-chaud).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008228` | [EVALUATION_A_CHAUD](tables.md#evaluation-a-chaud).`IDINTERVENANT` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007915` | [EVALUATION_A_CHAUD_FILLE](tables.md#evaluation-a-chaud-fille).`IDEVALUATIONCHAUD` → [EVALUATION_A_CHAUD](tables.md#evaluation-a-chaud).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008336` | [EVALUATION_A_CHAUD_FILLE](tables.md#evaluation-a-chaud-fille).`IDEVALUATIONCRITERE` → [CRITERE_EVAL_A_CHAUD](tables.md#critere-eval-a-chaud).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ED_TYPE_COMP_FP` | [EVALUATION_DETAIL](tables.md#evaluation-detail).`IDTYPECOMPETENCEFP` → [TYPE_COMPETENCES_FP](tables.md#type-competences-fp).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007914` | [EVALUATION_DETAIL](tables.md#evaluation-detail).`IDEVALUATION` → [EVALUATION_ANNUELLE](tables.md#evaluation-annuelle).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FAB_OFFILE_FK` | [FABRICATION](tables.md#fabrication).`IDOFFILLE` → [OFFILLE](tables.md#offille).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_FABRICATION_BDC` | [FABRICATION](tables.md#fabrication).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_FABFILLE_BDCFILLE` | [FABRICATIONFILLE](tables.md#fabricationfille).`IDBCFILLE` → [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_FABFILLE_OPERATEUR` | [FABRICATIONFILLE](tables.md#fabricationfille).`OPERATEUR` → [PERSONNEL](tables.md#personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007917` | [FABRICATIONFILLE](tables.md#fabricationfille).`IDMERE` → [FABRICATION](tables.md#fabrication).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FC_RESERV_FK` | [FACTURECLIENT](tables.md#factureclient).`IDRESERVATION` → [RESERVATION](tables.md#reservation).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FACTURECLIENTDET_PROD_FK` | [FACTURECLIENTDETAILS](tables.md#factureclientdetails).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FACTURECLIENT_MEREFILLE_FK` | [FACTURECLIENTDETAILS](tables.md#factureclientdetails).`IDFACTURECLIENT` → [FACTURECLIENT](tables.md#factureclient).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FD_FK` | [FACTUREDECLARATION](tables.md#facturedeclaration).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FD_MODEPAIEMENT_FK` | [FACTUREDECLARATION](tables.md#facturedeclaration).`IDMODEPAIEMENT` → [MODEPAIEMENT](tables.md#modepaiement).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FK_IDDMDACHAT_FD` | [FACTUREDECLARATION](tables.md#facturedeclaration).`IDDMDACHAT` → [DMDACHAT](tables.md#dmdachat).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008041` | [FACTUREDECLARATION](tables.md#facturedeclaration).`IDTYPEFACTURE` → [TYPE_FACTURE](tables.md#type-facture).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008084` | [FACTUREDECLARATION](tables.md#facturedeclaration).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008085` | [FACTUREDECLARATION](tables.md#facturedeclaration).`DEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007921` | [FACTUREDECLARATIONFILLE](tables.md#facturedeclarationfille).`IDFACTUREFOURNISSEUR` → [FACTUREDECLARATION](tables.md#facturedeclaration).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008088` | [FACTUREDECLARATIONFILLE](tables.md#facturedeclarationfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FACTFRNS_MODEPAIEMENT_FK` | [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDMODEPAIEMENT` → [MODEPAIEMENT](tables.md#modepaiement).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FACTURE_FOURNISSEUR_FK` | [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FK_IDDMDACHAT_FF` | [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDDMDACHAT` → [DMDACHAT](tables.md#dmdachat).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008042` | [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDTYPEFACTURE` → [TYPE_FACTURE](tables.md#type-facture).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008086` | [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008087` | [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`DEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FACTFRNS_MEREFILLE_FK` | [FACTUREFOURNISSEURFILLE](tables.md#facturefournisseurfille).`IDFACTUREFOURNISSEUR` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FFFILLE_DEVISE_FK` | [FACTUREFOURNISSEURFILLE](tables.md#facturefournisseurfille).`DEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SYS_C008082` | [FACTUREFOURNISSEURFILLE](tables.md#facturefournisseurfille).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_FICHE_POSTE_DEPARTEMENT` | [FICHE_POSTE](tables.md#fiche-poste).`IDDEPARTEMENT` → [DEPARTEMENT](tables.md#departement).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_FICHE_POSTE_TYPECONTRAT` | [FICHE_POSTE](tables.md#fiche-poste).`IDTYPECONTRAT` → [TYPE_CONTRAT](tables.md#type-contrat).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_FP_NIVEAUFORMATION` | [FICHE_POSTE](tables.md#fiche-poste).`IDNIVEAUFORMATION` → [FORMATION_DIPLOME](tables.md#formation-diplome).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_FP_PERMIS` | [FICHE_POSTE](tables.md#fiche-poste).`IDPERMIS` → [PERMIS](tables.md#permis).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_FPF_FICHE_POSTE` | [FICHE_POSTE_FILLE](tables.md#fiche-poste-fille).`IDFICHEPOSTE` → [FICHE_POSTE](tables.md#fiche-poste).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_FOURNISSEUR_DEVISE` | [FOURNISSEUR](tables.md#fournisseur).`DEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FRNS_TYPE_FK` | [FOURNISSEUR](tables.md#fournisseur).`IDTYPEFOURNISSEUR` → [TYPEFOURNISSEUR](tables.md#typefournisseur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_FP_OBJECTIF_FP` | [FP_OBJECTIF_INDIVIDUEL](tables.md#fp-objectif-individuel).`IDFICHEPOSTE` → [FICHE_POSTE](tables.md#fiche-poste).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FUMIGATION_BATIMENT_FK` | [FUMIGATION](tables.md#fumigation).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FUMIGATION_LOT_FK` | [FUMIGATION](tables.md#fumigation).`IDLOT` → [LOT](tables.md#lot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FUMIGATION_NUMVAGUE_FK` | [FUMIGATION](tables.md#fumigation).`IDNUMEROVAGUE` → [NUMEROCOLLECTE](tables.md#numerocollecte).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FUMIGATION_OPER_FK` | [FUMIGATION](tables.md#fumigation).`IDOPERATEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FUMIGATION_PARQUET_FK` | [FUMIGATION](tables.md#fumigation).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FUMIGATION_PRODUIT_FK` | [FUMIGATION](tables.md#fumigation).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `HISTDEMANDE_DEMANDE_ID_FK` | [HISTORIQUEDEMANDE](tables.md#historiquedemande).`IDDEMANDE` → [DEMANDE](tables.md#demande).`ID` | ENABLED | VALIDATED | NO ACTION |
| `HISTDEMANDE_PAIEINFOPERS_ID_FK` | [HISTORIQUEDEMANDE](tables.md#historiquedemande).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_HISTOINSPECTIONF_ELEMENT` | [HISTORIQUEINSPECTIONFILLE](tables.md#historiqueinspectionfille).`IDELEMENT` → [ELEMENTINSPECTION](tables.md#elementinspection).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007968` | [HISTORIQUEINSPECTIONMERE](tables.md#historiqueinspectionmere).`IDINSPECTEUR` → [PERSONNEL](tables.md#personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008299` | [HISTORIQUEINSPECTIONMERE](tables.md#historiqueinspectionmere).`IDELEMENT` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `HISTOPRODUIT_PRODUIT_FK` | [HISTORIQUE_PRODUIT](tables.md#historique-produit).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SYS_C008275` | [INFOSAUTO](tables.md#infosauto).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_INSPECTIONFILLE_ELEMENT` | [INSPECTIONFILLE](tables.md#inspectionfille).`IDELEMENT` → [ELEMENTINSPECTION](tables.md#elementinspection).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_INSPECTION_FILLE_MERE` | [INSPECTIONFILLE](tables.md#inspectionfille).`IDMERE` → [INSPECTIONMERE](tables.md#inspectionmere).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ELEMENT_MERE` | [INSPECTIONMERE](tables.md#inspectionmere).`IDELEMENT` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_INSPECTEUR` | [INSPECTIONMERE](tables.md#inspectionmere).`IDINSPECTEUR` → [PERSONNEL](tables.md#personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_INTERDUREEPANNE_MACHINE` | [INTERDUREEPANNE](tables.md#interdureepanne).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_CATEGORIE_INGREDIENT` | [INVENTAIRE](tables.md#inventaire).`IDCATEGORIE` → [CATEGORIEINGREDIENT](tables.md#categorieingredient).`ID` | ENABLED | VALIDATED | NO ACTION |
| `INVENTAIRE_MEREFILLE_FK` | [INVENTAIREFILLE](tables.md#inventairefille).`IDINVENTAIRE` → [INVENTAIRE](tables.md#inventaire).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `JAUGE_MAGASIN_FK` | [JAUGE](tables.md#jauge).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `LIVRAISON_VENTE_FK` | [LIVRAISON](tables.md#livraison).`IDVENTE` → [VENTE](tables.md#vente).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `LIVINTERNE_FRNS_FK` | [LIVRAISONINTERNE](tables.md#livraisoninterne).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `LIVINTERNE_MEREFILLE_FK` | [LIVRAISONINTERNEFILLE](tables.md#livraisoninternefille).`IDMERE` → [LIVRAISONINTERNE](tables.md#livraisoninterne).`ID` | ENABLED | VALIDATED | NO ACTION |
| `LIVINTERNFILLE_ING_FK` | [LIVRAISONINTERNEFILLE](tables.md#livraisoninternefille).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_LOG_PERSONNEL_CIVILITE` | [LOG_PERSONNEL](tables.md#log-personnel).`IDCIVILITE` → [CIVILITE](tables.md#civilite).`ID` | ENABLED | VALIDATED | NO ACTION |
| `LOGPERS_UTILISATEUR_ID_FK` | [LOG_PERSONNEL](tables.md#log-personnel).`REFUSER` → [UTILISATEUR](tables.md#utilisateur).`REFUSER` | ENABLED | VALIDATED | NO ACTION |
| `FK_LOT_CATEGORIELOT` | [LOT](tables.md#lot).`IDCATEGORIELOT` → [CATEGORIELOT](tables.md#categorielot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `LOT_ARTICLE_FK` | [LOT](tables.md#lot).`IDARTICLE` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `LOT_FERME_FK` | [LOT](tables.md#lot).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `LOT_ORIGINE_FK` | [LOT](tables.md#lot).`IDORIGINE` → [ORIGINELOT](tables.md#originelot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `LOT_PROGRAMME_FK` | [LOT](tables.md#lot).`IDPROGRAMME` → [PROGRAMMEZOOTECHNIQUE](tables.md#programmezootechnique).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007905` | [LOT](tables.md#lot).`IDSOUCHE` → [SOUCHE](tables.md#souche).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MACHINE_LIGNE_FK` | [MACHINE](tables.md#machine).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_MAGASIN2_LIGNE` | [MAGASIN2](tables.md#magasin2).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MAGASIN2_MERE_FK` | [MAGASIN2](tables.md#magasin2).`IDMAGASINMERE` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MAGASIN_POINT_FK` | [MAGASIN2](tables.md#magasin2).`IDPOINT` → [POINT](tables.md#point).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `MAGASIN_TYPE_FK` | [MAGASIN2](tables.md#magasin2).`IDTYPEMAGASIN` → [TYPEMAGASIN](tables.md#typemagasin).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `MIRAGE_MACHINE_FK` | [MIRAGE](tables.md#mirage).`IDMACHINE` → [MACHINE](tables.md#machine).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MIRAGEDET_BAT_FK` | [MIRAGEDETAIL](tables.md#miragedetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MIRAGEDET_MERE_FK` | [MIRAGEDETAIL](tables.md#miragedetail).`IDMERE` → [MIRAGE](tables.md#mirage).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MIRAGEDET_PARQ_FK` | [MIRAGEDETAIL](tables.md#miragedetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MIRAGEDET_QUAL_FK` | [MIRAGEDETAIL](tables.md#miragedetail).`IDQUALITEMIRAGE` → [QUALITEMIRAGE](tables.md#qualitemirage).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MISEENINCUB_INCUB_FK` | [MISEENINCUBATEUR](tables.md#miseenincubateur).`IDINCUBATEUR` → [INCUBATEUR](tables.md#incubateur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MISEENINCUB_RESP_FK` | [MISEENINCUBATEUR](tables.md#miseenincubateur).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MISEENINCUBDET_BAT_FK` | [MISEENINCUBATEURDETAIL](tables.md#miseenincubateurdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MISEENINCUBDET_LOT_FK` | [MISEENINCUBATEURDETAIL](tables.md#miseenincubateurdetail).`IDLOT` → [LOT](tables.md#lot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MISEENINCUBDET_MERE_FK` | [MISEENINCUBATEURDETAIL](tables.md#miseenincubateurdetail).`IDMERE` → [MISEENINCUBATEUR](tables.md#miseenincubateur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MISEENINCUBDET_PARQ_FK` | [MISEENINCUBATEURDETAIL](tables.md#miseenincubateurdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MODULPRESTA_FORMATEUR_FK` | [MODULE_PRESTATAIRE](tables.md#module-prestataire).`IDFORMATEUR` → [FORMATEUR](tables.md#formateur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MVTABS_PAIEINFO_FK` | [MOUVEMENTABSENCE](tables.md#mouvementabsence).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MOUVEMENTCAISSE_CAISSE_FK` | [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `MOUVEMENTCAISSE_VENTEDETAIL_FK` | [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `MVTCAISSE_DEVISE_FK` | [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `MVTCAISSE_MERE_FK` | [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDMVTCAISSEMERE` → [MOUVEMENTCAISSEMERE](tables.md#mouvementcaissemere).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MVTCAISSE_PREVISION_FK` | [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDPREVISION` → [PREVISION](tables.md#prevision).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SYS_C007981` | [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDTRAITE` → [TRAITE](tables.md#traite).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008009` | [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`IDTYPEPAIEMENT` → [TYPEPAIEMENT](tables.md#typepaiement).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_MULTIPREV_PREVISION` | [MULTIPLICATION_PREVISION](tables.md#multiplication-prevision).`IDPREVISION` → [PREVISION](tables.md#prevision).`ID` | ENABLED | VALIDATED | NO ACTION |
| `MVT_MVTCAISSE_FK` | [MVTCAISSEPREVISION](tables.md#mvtcaisseprevision).`ID1` → [MOUVEMENTCAISSE](tables.md#mouvementcaisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `MVT_PREVISION_FK` | [MVTCAISSEPREVISION](tables.md#mvtcaisseprevision).`ID2` → [PREVISION](tables.md#prevision).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FK_MVTSTOCK_CAT` | [MVTSTOCK](tables.md#mvtstock).`IDCATEGORIESTOCK` → [CATEGORIESTOCK](tables.md#categoriestock).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_POINT` | [MVTSTOCK](tables.md#mvtstock).`IDPOINT` → [POINT](tables.md#point).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `MVTSTOCK_TYPE_FK` | [MVTSTOCK](tables.md#mvtstock).`IDTYPEMVSTOCK` → [TYPEMVTSTOCK](tables.md#typemvtstock).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `MVTSTOCK_VENTE_FK` | [MVTSTOCK](tables.md#mvtstock).`IDVENTE` → [VENTE](tables.md#vente).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `MVTSTOCKFILLE_VENTEDETAIL_FK` | [MVTSTOCKFILLE](tables.md#mvtstockfille).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `MVTSTOCKMERE_FILLE_FK` | [MVTSTOCKFILLE](tables.md#mvtstockfille).`IDMVTSTOCK` → [MVTSTOCK](tables.md#mvtstock).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `NOTIFICATION_RECEIVER_FKEY` | [NOTIFICATION2](tables.md#notification2).`RECEIVER` → [UTILISATEUR](tables.md#utilisateur).`REFUSER` | ENABLED | VALIDATED | NO ACTION |
| `FK_OFAB_BDC` | [OFAB](tables.md#ofab).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_OFAB_LANCEUR` | [OFAB](tables.md#ofab).`LANCEUR` → [UTILISATEUR](tables.md#utilisateur).`REFUSER` | ENABLED | VALIDATED | NO ACTION |
| `FK_OFFILLE_BDCFILE` | [OFFILLE](tables.md#offille).`IDBCFILLE` → [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007958` | [OFFILLE](tables.md#offille).`IDMERE` → [OFAB](tables.md#ofab).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_OFFRE_TYPE_CONTRAT` | [OFFRE_EMPLOI](tables.md#offre-emploi).`IDTYPECONTRAT` → [TYPE_CONTRAT](tables.md#type-contrat).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_FILLE_MERE` | [ONBOARDING_FILLE](tables.md#onboarding-fille).`IDMERE` → [ONBOARDING_MERE](tables.md#onboarding-mere).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_ONB_MERE_FONCTION` | [ONBOARDING_MERE](tables.md#onboarding-mere).`IDFONCTION` → [PAIE_FONCTION](tables.md#paie-fonction).`ID` | ENABLED | VALIDATED | NO ACTION |
| `OPDETAIL_FF_FK` | [ORDONNERPAIEMENTDETAIL](tables.md#ordonnerpaiementdetail).`IDFF` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `OP_MEREFILLE_FK` | [ORDONNERPAIEMENTDETAIL](tables.md#ordonnerpaiementdetail).`IDOP` → [ORDONNERPAIEMENT](tables.md#ordonnerpaiement).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FK_OTFILLE_BDCFILE` | [ORDRETRAVAUXFILLE](tables.md#ordretravauxfille).`IDBCFILLE` → [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008210` | [ORDRETRAVAUXFILLE](tables.md#ordretravauxfille).`IDMERE` → [ORDRETRAVAUX](tables.md#ordretravaux).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007876` | [OUVERTURECAISSEFILLE](tables.md#ouverturecaissefille).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008214` | [OUVERTURECAISSEFILLE](tables.md#ouverturecaissefille).`IDOUVERTURE` → [OUVERTURECAISSE](tables.md#ouverturecaisse).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008263` | [PACKINGLISTACHAT](tables.md#packinglistachat).`IDBR` → [AS_BONDELIVRAISON](tables.md#as-bondelivraison).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008215` | [PACKINGLISTACHATFILLE](tables.md#packinglistachatfille).`IDMERE` → [PACKINGLISTACHAT](tables.md#packinglistachat).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008272` | [PACKINGLISTACHATFILLE](tables.md#packinglistachatfille).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PAIEMENTBON_CAISSEBON_FK` | [PAIEMENTBON](tables.md#paiementbon).`IDCAISSEBON` → [CAISSE](tables.md#caisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `PAIEMENTBON_CAISSEPAIEMENT_FK` | [PAIEMENTBON](tables.md#paiementbon).`IDCAISSEPAIEMENT` → [CAISSE](tables.md#caisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `PAIEMENTBON_CLIENT_FK` | [PAIEMENTBON](tables.md#paiementbon).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `PAIEMENTFF_FF_FK` | [PAIEMENTFF](tables.md#paiementff).`IDFF` → [FACTUREFOURNISSEUR](tables.md#facturefournisseur).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SYS_C008223` | [PAIEMENTHEURESUP](tables.md#paiementheuresup).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PAIE_ARCHIVE_PERSONNEL_FK` | [PAIE_ARCHIVE](tables.md#paie-archive).`IDPERSONNEL` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_PAIE_EDITIONMOISANNEE` | [PAIE_EDITION](tables.md#paie-edition).`IDEDITION` → [PAIE_EDITIONMOISANNEE](tables.md#paie-editionmoisannee).`ID` | ENABLED | VALIDATED | NO ACTION |
| `CATEGORIE_PAIE_FK` | [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`IDCATEGORIE_PAIE` → [CATEGORIE_PAIE](tables.md#categorie-paie).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_PAIEINFO_AGENCE` | [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`IDAGENCE` → [BANQUE_AGENCE](tables.md#banque-agence).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_PAIEINFO_BANQUE` | [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`IDBANQUE` → [BANQUE](tables.md#banque).`ID` | ENABLED | VALIDATED | NO ACTION |
| `QUALIFICATION_PAIE_FK` | [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`IDQUALIFICATION` → [QUALIFICATION_PAIE](tables.md#qualification-paie).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PAIE_CATEGORIE_FK` | [PAIE_PERSONNEL_ELEMENTPAIE](tables.md#paie-personnel-elementpaie).`IDCATEGORIE_QUALIFICATION` → [CATEGORIE_QUALIFICATION](tables.md#categorie-qualification).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PAIE_PERSONNEL_FONCTION_FK` | [PAIE_PERSONNEL_ELEMENTPAIE](tables.md#paie-personnel-elementpaie).`IDFONCTION` → [PAIE_FONCTION](tables.md#paie-fonction).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008074` | [PERSONNEL](tables.md#personnel).`IDDEPARTEMENT` → [DEPARTEMENTMAINTENANCE](tables.md#departementmaintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PERTE_TYPEGAIN_FK` | [PERTEGAINIMPREVUE](tables.md#pertegainimprevue).`IDTYPEGAINPERTE` → [TYPEGAINPERTE](tables.md#typegainperte).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `PESEEPOUSSIN_BAT_FK` | [PESEEPOUSSIN](tables.md#peseepoussin).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PESEEPOUSSIN_FERME_FK` | [PESEEPOUSSIN](tables.md#peseepoussin).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PESEEPOUSSIN_LOT_FK` | [PESEEPOUSSIN](tables.md#peseepoussin).`IDLOT` → [LOT](tables.md#lot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PESEEPOUSSIN_PARQ_FK` | [PESEEPOUSSIN](tables.md#peseepoussin).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PESEEPOUSSIN_RESP_FK` | [PESEEPOUSSIN](tables.md#peseepoussin).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PESEEPOUSSIN_SEXE_FK` | [PESEEPOUSSIN](tables.md#peseepoussin).`IDSEXE` → [SEXE](tables.md#sexe).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PESEEPOUSSIN_TYPE_FK` | [PESEEPOUSSIN](tables.md#peseepoussin).`IDTYPEPESEE` → [TYPEPESEE](tables.md#typepesee).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PESEEPOUSSINDET_MERE_FK` | [PESEEPOUSSINDETAIL](tables.md#peseepoussindetail).`IDMERE` → [PESEEPOUSSIN](tables.md#peseepoussin).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_PLANCOMMANDE_DMDACHAT` | [PLANCOMMANDE](tables.md#plancommande).`IDDMDACHAT` → [DMDACHAT](tables.md#dmdachat).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_PLANCOMMANDE_PRODUIT` | [PLANCOMMANDE](tables.md#plancommande).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PLANNINGTPMAINTENANCE_FK` | [PLANNING](tables.md#planning).`IDTYPEMAINTENANCE` → [TYPEMAINTENANCE](tables.md#typemaintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PLANNING_LIGNE_FK` | [PLANNING](tables.md#planning).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SITUATION_LIGNE_FK` | [PLANNING](tables.md#planning).`IDSITUATION` → [SITUATION](tables.md#situation).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007999` | [PLANPAIEMENTACHAT](tables.md#planpaiementachat).`IDTYPEDEPART` → [TYPEDEPART](tables.md#typedepart).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008261` | [PLANPAIEMENTACHAT](tables.md#planpaiementachat).`IDBCF` → [AS_BONDECOMMANDE](tables.md#as-bondecommande).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008352` | [PLANPAIEMENTACHAT](tables.md#planpaiementachat).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `POMPE_MAGASIN_FK` | [POMPE](tables.md#pompe).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `PRECISDET_CATEGORIECAISSE_FK` | [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`IDCATEGORIECAISSE` → [CATEGORIECAISSE](tables.md#categoriecaisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `PRECISDET_CLIENT_FK` | [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `PRECISDET_ENCAISSEMENT_FK` | [PRECISION_DETAIL_ENCAISSEMENT](tables.md#precision-detail-encaissement).`IDENCAISSEMENT` → [ENCAISSEMENT](tables.md#encaissement).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SYS_C007976` | [PRELEVEMENT](tables.md#prelevement).`IDPOMPE` → [POMPE](tables.md#pompe).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008051` | [PRELEVEMENT](tables.md#prelevement).`IDPOMPISTE` → [UTILISATEUR](tables.md#utilisateur).`REFUSER` | ENABLED | VALIDATED | NO ACTION |
| `ENCAISSE_PRELEVEMENT_FK` | [PRELEVEMENT_ENCAISSE](tables.md#prelevement-encaisse).`IDPRELEVEMENT` → [PRELEVEMENT](tables.md#prelevement).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `PRELEVEMENT_ENCAISSEMENT_FK` | [PRELEVEMENT_ENCAISSE](tables.md#prelevement-encaisse).`IDENCAISSEMENT` → [ENCAISSEMENT](tables.md#encaissement).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `PREVISION_CAISSE_FK` | [PREVISION](tables.md#prevision).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `PREVISION_DEVISE_FK` | [PREVISION](tables.md#prevision).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `PREVISION_VENTEDET_FK` | [PREVISION](tables.md#prevision).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SYS_C007953` | [PREVISIONFERME](tables.md#previsionferme).`IDMVTSTOCKFILLE` → [MVTSTOCKFILLE](tables.md#mvtstockfille).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008146` | [PREVISIONFERME](tables.md#previsionferme).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008271` | [PREVISIONFERME](tables.md#previsionferme).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PRODUIT_CATEGORIE_FK` | [PRODUIT](tables.md#produit).`IDCATEGORIE` → [CATEGORIE](tables.md#categorie).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `PRODUIT_TYPE_FK` | [PRODUIT](tables.md#produit).`IDTYPEPRODUIT` → [TYPE_PRODUIT](tables.md#type-produit).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `PRODUIT_UNITE_FK` | [PRODUIT](tables.md#produit).`IDUNITE` → [UNITE](tables.md#unite).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SYS_C007906` | [PRODUIT](tables.md#produit).`IDSOUSCATEGORIE` → [SOUSCATEGORIE](tables.md#souscategorie).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008190` | [PROFORMA](tables.md#proforma).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PROFORMDET_UNITE_FK` | [PROFORMA_DETAILS](tables.md#proforma-details).`UNITE` → [AS_UNITE](tables.md#as-unite).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008078` | [PROFORMA_DETAILS](tables.md#proforma-details).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008323` | [PROFORMA_DETAILS](tables.md#proforma-details).`IDPROFORMA` → [PROFORMA](tables.md#proforma).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PROGZOOTECH_SOUCHE_FK` | [PROGRAMMEZOOTECHNIQUE](tables.md#programmezootechnique).`IDSOUCHE` → [SOUCHE](tables.md#souche).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PROGZOOTECHDET_MERE_FK` | [PROGRAMMEZOOTECHNIQUEDETAILS](tables.md#programmezootechniquedetails).`IDMERE` → [PROGRAMMEZOOTECHNIQUE](tables.md#programmezootechnique).`ID` | ENABLED | VALIDATED | NO ACTION |
| `PROGZOOTECHDET_SEXE_FK` | [PROGRAMMEZOOTECHNIQUEDETAILS](tables.md#programmezootechniquedetails).`IDSEXE` → [SEXE](tables.md#sexe).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_PROG_PERSONNEL` | [PROGRAMME_INTEGRATION](tables.md#programme-integration).`IDPERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_PROG_INTERVENANT` | [PROGRAMME_INTEGRATION_DETAIL](tables.md#programme-integration-detail).`IDINTERVENANT` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_PROG_MERE` | [PROGRAMME_INTEGRATION_DETAIL](tables.md#programme-integration-detail).`IDPROGRAMEDETAIL` → [PROGRAMME_INTEGRATION](tables.md#programme-integration).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_POSTE` | [QUALIFICATION_PAIE](tables.md#qualification-paie).`IDPOSTE` → [POSTE](tables.md#poste).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_RAPPROCHEMENT_DETAIL` | [RAPPROCHEMENT](tables.md#rapprochement).`IDRELEVERDETAIL` → [RELEVERDETAIL](tables.md#releverdetail).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RECEPTIONOAC_CHAMBFROID_FK` | [RECEPTIONOAC](tables.md#receptionoac).`IDCHAMBREFROIDE` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RECEPTIONOAC_CHAUFF_FK` | [RECEPTIONOAC](tables.md#receptionoac).`IDCHAUFFEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RECEPTIONOAC_NUMCOL_FK` | [RECEPTIONOAC](tables.md#receptionoac).`IDNUMEROCOLLECTE` → [NUMEROCOLLECTE](tables.md#numerocollecte).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RECEPTIONOAC_PROV_FK` | [RECEPTIONOAC](tables.md#receptionoac).`IDPROVENANCE` → [ORIGINELOT](tables.md#originelot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RECEPTIONOAC_RESP_FK` | [RECEPTIONOAC](tables.md#receptionoac).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RECEPTIONOAC_VEHIC_FK` | [RECEPTIONOAC](tables.md#receptionoac).`IDVEHICULE` → [VEHICULE](tables.md#vehicule).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RECEPTIONOACDET_BAT_FK` | [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RECEPTIONOACDET_LOT_FK` | [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDLOT` → [LOT](tables.md#lot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RECEPTIONOACDET_MERE_FK` | [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDMERE` → [RECEPTIONOAC](tables.md#receptionoac).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RECEPTIONOACDET_PARQ_FK` | [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RECEPTIONOACDET_QUAL_FK` | [RECEPTIONOACDETAIL](tables.md#receptionoacdetail).`IDQUALITETRIAGEOEUF` → [QUALITETRIAGEOEUF](tables.md#qualitetriageoeuf).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_RECPOUSS_LOT` | [RECEPTIONPOUSSINAEROPORT](tables.md#receptionpoussinaeroport).`IDLOT` → [LOT](tables.md#lot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_RECPOUSSDET_MERE` | [RECEPTIONPOUSSINAEROPORTDETAIL](tables.md#receptionpoussinaeroportdetail).`IDMERE` → [RECEPTIONPOUSSINAEROPORT](tables.md#receptionpoussinaeroport).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_RECPOUSSDET_QUALITE` | [RECEPTIONPOUSSINAEROPORTDETAIL](tables.md#receptionpoussinaeroportdetail).`IDQUALITEPOUSSIN` → [QUALITEPOUSSIN](tables.md#qualitepoussin).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_RECPOUSSDET_SEXE` | [RECEPTIONPOUSSINAEROPORTDETAIL](tables.md#receptionpoussinaeroportdetail).`IDSEXE` → [SEXE](tables.md#sexe).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RECETTE_MERE_FILLE_FK` | [RECETTE_FILLE](tables.md#recette-fille).`IDMERE` → [RECETTE_MERE](tables.md#recette-mere).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_RELEVERDETAIL_RELEVER` | [RELEVERDETAIL](tables.md#releverdetail).`IDMERE` → [RELEVER](tables.md#relever).`ID` | ENABLED | VALIDATED | NO ACTION |
| `REMISEFILLE_FK` | [REMISEFILLE](tables.md#remisefille).`CATEGORIEPRODUIT` → [CATEGORIEINGREDIENT](tables.md#categorieingredient).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007971` | [REMISEFILLE](tables.md#remisefille).`IDPOINT` → [POINT](tables.md#point).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007993` | [REMISEFILLE](tables.md#remisefille).`IDCATEGORIECLIENT` → [TYPECLIENT](tables.md#typeclient).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008033` | [REMISEFILLE](tables.md#remisefille).`IDREMISE` → [REMISE](tables.md#remise).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008266` | [REMISEFILLE](tables.md#remisefille).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `REPORTCAISSE_CAISSE_FK` | [REPORTCAISSE](tables.md#reportcaisse).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `RESERVATION_CLIENT_FK` | [RESERVATION](tables.md#reservation).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RESERVATION_MEREFILLE_FK` | [RESERVATIONDETAILS](tables.md#reservationdetails).`IDMERE` → [RESERVATION](tables.md#reservation).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_QUALIFICATION_RES` | [RESSOURCEPARFABRICATION](tables.md#ressourceparfabrication).`IDQUALIFICATION` → [QUALIFICATION_PAIE](tables.md#qualification-paie).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RESPARFAB_FAB_FK` | [RESSOURCEPARFABRICATION](tables.md#ressourceparfabrication).`IDFABRICATION` → [FABRICATION](tables.md#fabrication).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RESPARFAB_POSTE_FK` | [RESSOURCEPARFABRICATION](tables.md#ressourceparfabrication).`IDPOSTE` → [POSTE](tables.md#poste).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RESPARFAB_RESSOURCE_FK` | [RESSOURCEPARFABRICATION](tables.md#ressourceparfabrication).`IDRESSOURCE` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RESULTATMAINT_ETAT_FK` | [RESULTATMAINTENANCE](tables.md#resultatmaintenance).`ETATMACHINE` → [ETATMACHINE](tables.md#etatmachine).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RESULTATMAINT_ORDRE_FK` | [RESULTATMAINTENANCE](tables.md#resultatmaintenance).`IDORDRETRAVAUX` → [ORDRETRAVAUX](tables.md#ordretravaux).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RESULTATMAINT_USER_FK` | [RESULTATMAINTENANCE](tables.md#resultatmaintenance).`IDPERSONNEL` → [UTILISATEUR](tables.md#utilisateur).`REFUSER` | ENABLED | VALIDATED | NO ACTION |
| `RISTOURNEDETAILS_INGRE_FK` | [RISTOURNEDETAILS](tables.md#ristournedetails).`IDPRODUIT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RISTOURNE_MEREFILLE_FK` | [RISTOURNEDETAILS](tables.md#ristournedetails).`IDRISTOURNE` → [RISTOURNE](tables.md#ristourne).`ID` | ENABLED | VALIDATED | NO ACTION |
| `RISTOURNEFACTURE_RISTOURNE_FK` | [RISTOURNEFACTURE](tables.md#ristournefacture).`IDRISTOURNE` → [RISTOURNE](tables.md#ristourne).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SANCTION_PAIEINFO_FK` | [SANCTION](tables.md#sanction).`IDPERSONNE` → [PAIE_INFO_PERSONNEL](tables.md#paie-info-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SANCTION_REGLE_FK` | [SANCTION](tables.md#sanction).`IDREGLEENFREINTE` → [REGLEMENTINTERIEUR](tables.md#reglementinterieur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SANCTION_TYPEFAUTE_FK` | [SANCTION](tables.md#sanction).`TYPEFAUTE` → [TYPEFAUTE](tables.md#typefaute).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SANCTION_TYPE_FK` | [SANCTION](tables.md#sanction).`TYPESANCTION` → [TYPESANCTION](tables.md#typesanction).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_SCINDERPREVISION_PREV` | [SCINDERPREVISION](tables.md#scinderprevision).`IDPREVISION` → [PREVISION](tables.md#prevision).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_SECTION_SERVICE` | [SECTION](tables.md#section).`IDSERVICE` → [DEPARTEMENTDIVERS](tables.md#departementdivers).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SEUIL_PRODUIT_FK` | [SEUIL](tables.md#seuil).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `SEUILPERTEACHAT_INGREDIENT_FK` | [SEUILPERTEACHAT](tables.md#seuilperteachat).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008257` | [SOUS_FAMILLE_PRO](tables.md#sous-famille-pro).`IDFAMILLE` → [FAMILLE_PROFESSIONNELLE](tables.md#famille-professionnelle).`ID` | ENABLED | VALIDATED | NO ACTION |
| `STOCK_ENGAGE_VENTE_FK` | [STOCK_ENGAGE](tables.md#stock-engage).`IDVENTE` → [VENTE](tables.md#vente).`ID` | ENABLED | VALIDATED | NO ACTION |
| `STOCK_ENGAGEMERE_FILLE_FK` | [STOCK_ENGAGE_FILLE](tables.md#stock-engage-fille).`IDMVTSTOCK` → [STOCK_ENGAGE](tables.md#stock-engage).`ID` | ENABLED | VALIDATED | NO ACTION |
| `STOCK_ENGAGE_F_VENTEDETAIL_FK` | [STOCK_ENGAGE_FILLE](tables.md#stock-engage-fille).`IDVENTEDETAIL` → [VENTE_DETAILS](tables.md#vente-details).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_SUIVICF_SALSTOCKOEUF` | [SUIVICHAMBREFROIDE](tables.md#suivichambrefroide).`IDSALLESTOCKAGEOEUF` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_SUIVICFDETAIL_LOGPERSO` | [SUIVICHAMBREFROIDEDETAIL](tables.md#suivichambrefroidedetail).`IDRESPONSABLE` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_SUIVICFDETAIL_MERE` | [SUIVICHAMBREFROIDEDETAIL](tables.md#suivichambrefroidedetail).`IDMERE` → [SUIVICHAMBREFROIDE](tables.md#suivichambrefroide).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SUIVIJOURN_FERME_FK` | [SUIVIJOURNALIER](tables.md#suivijournalier).`IDFERME` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SUIVIJOURN_LOT_FK` | [SUIVIJOURNALIER](tables.md#suivijournalier).`IDLOT` → [LOT](tables.md#lot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SUIVIJOURNDET_BAT_FK` | [SUIVIJOURNALIERDETAIL](tables.md#suivijournalierdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SUIVIJOURNDET_MERE_FK` | [SUIVIJOURNALIERDETAIL](tables.md#suivijournalierdetail).`IDMERE` → [SUIVIJOURNALIER](tables.md#suivijournalier).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SUIVIJOURNDET_PARQ_FK` | [SUIVIJOURNALIERDETAIL](tables.md#suivijournalierdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_SUIVI_FILLE_MERE` | [SUIVI_PRESENCE_FILLE](tables.md#suivi-presence-fille).`IDSUIVIPRESENCEMERE` → [SUIVI_PRESENCE_MERE](tables.md#suivi-presence-mere).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_SUIVI_FILLE_PARTICIPATION` | [SUIVI_PRESENCE_FILLE](tables.md#suivi-presence-fille).`IDPARTICIPATIONFORMATION` → [PARTICIPATION_FORMATION](tables.md#participation-formation).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_SUIVI_MERE_SESSION` | [SUIVI_PRESENCE_MERE](tables.md#suivi-presence-mere).`IDSESSIONFORMATION` → [SESSION_FORMATION](tables.md#session-formation).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007994` | [TARIF_INGREDIENTS](tables.md#tarif-ingredients).`IDTYPECLIENT` → [TYPECLIENT](tables.md#typeclient).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008267` | [TARIF_INGREDIENTS](tables.md#tarif-ingredients).`IDINGREDIENT` → [AS_INGREDIENTS](tables.md#as-ingredients).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TAUXDECHANGE_DEVISE_FK` | [TAUXDECHANGE](tables.md#tauxdechange).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FK_TEMPSOUVERTURE_MACHINE` | [TEMPSOUVERTURE](tables.md#tempsouverture).`IDMACHINE` → [AS_INGREDIENT_MAINTENANCE](tables.md#as-ingredient-maintenance).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TEMPSOUVERTURE_UNITE` | [TEMPSOUVERTURE](tables.md#tempsouverture).`IDUNITE` → [AS_UNITE](tables.md#as-unite).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRAITEPAIE_EDITION_FK` | [TRAITEMENT_PAIE](tables.md#traitement-paie).`IDEDITION` → [PAIE_EDITIONMOISANNEE](tables.md#paie-editionmoisannee).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRANSFPOULET_LOT` | [TRANSFERTPOULET](tables.md#transfertpoulet).`IDLOT` → [LOT](tables.md#lot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRANSFPOULDET_BATARR` | [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDBATIMENTARRIVE` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRANSFPOULDET_BATDEP` | [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDBATIMENTDEPART` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRANSFPOULDET_CHAUFFEUR` | [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDCHAUFFEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRANSFPOULDET_CONTROLEUR` | [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDCONTROLEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRANSFPOULDET_FERMEARR` | [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDFERMEARRIVE` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRANSFPOULDET_FERMEDEP` | [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDFERMEDEPART` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRANSFPOULDET_MERE` | [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDMERE` → [TRANSFERTPOULET](tables.md#transfertpoulet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRANSFPOULDET_PARQARR` | [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDPARQUETARRIVE` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRANSFPOULDET_PARQDEP` | [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDPARQUETDEPART` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRANSFPOULDET_SEXE` | [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDSEXE` → [SEXE](tables.md#sexe).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRANSFPOULDET_VEHICULE` | [TRANSFERTPOULETDETAIL](tables.md#transfertpouletdetail).`IDVEHICULE` → [VEHICULE](tables.md#vehicule).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRANSFERTSTOCK_DEMANDE` | [TRANSFERTSTOCK](tables.md#transfertstock).`IDDEMANDETRANSFERT` → [DEMANDETRANSFERT](tables.md#demandetransfert).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRANSFERTSTOCK_OF_FK` | [TRANSFERTSTOCK](tables.md#transfertstock).`IDOF` → [OFAB](tables.md#ofab).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TSD_FOURNISSEUR` | [TRANSFERTSTOCKDETAILS](tables.md#transfertstockdetails).`IDFOURNISSEUR` → [FOURNISSEUR](tables.md#fournisseur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRANSFERTSTOCK_MEREFILLE_FK` | [TRANSFERTSTOCKDETAILS](tables.md#transfertstockdetails).`IDTRANSFERTSTOCK` → [TRANSFERTSTOCK](tables.md#transfertstock).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `FAB_OTFILE_FK` | [TRAVAUX](tables.md#travaux).`IDOFFILLE` → [ORDRETRAVAUXFILLE](tables.md#ordretravauxfille).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRAVAUX_BDC` | [TRAVAUX](tables.md#travaux).`IDBC` → [BONDECOMMANDE_CLIENT](tables.md#bondecommande-client).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRAFILLE_BDCFILLE` | [TRAVAUXFILLE](tables.md#travauxfille).`IDBCFILLE` → [BONDECOMMANDE_CLIENT_FILLE](tables.md#bondecommande-client-fille).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRAFILLE_OPERATEUR` | [TRAVAUXFILLE](tables.md#travauxfille).`OPERATEUR` → [PERSONNEL](tables.md#personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007984` | [TRAVAUXFILLE](tables.md#travauxfille).`IDMERE` → [TRAVAUX](tables.md#travaux).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRAFILLE_MACHINE_FK` | [TRAVAUXFILLE](tables.md#travauxfille).`IDMACHINE` → [MACHINE](tables.md#machine).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEBATPARQ_LOT_FK` | [TRIAGEBATIMENTPARQUET](tables.md#triagebatimentparquet).`IDLOT` → [LOT](tables.md#lot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEBATPARQDET_BAT_FK` | [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEBATPARQDET_MERE_FK` | [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDMERE` → [TRIAGEBATIMENTPARQUET](tables.md#triagebatimentparquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEBATPARQDET_PARQ_FK` | [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEBATPARQDET_QUAL_FK` | [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDQUALITE` → [QUALITEPOUSSIN](tables.md#qualitepoussin).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEBATPARQDET_SEXE_FK` | [TRIAGEBATIMENTPARQUETDETAIL](tables.md#triagebatimentparquetdetail).`IDSEXE` → [SEXE](tables.md#sexe).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEOEUF_BAT_FK` | [TRIAGEOEUF](tables.md#triageoeuf).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEOEUF_NUMCOL_FK` | [TRIAGEOEUF](tables.md#triageoeuf).`IDNUMEROCOLLECTE` → [NUMEROCOLLECTE](tables.md#numerocollecte).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEOEUF_OPER_FK` | [TRIAGEOEUF](tables.md#triageoeuf).`IDOPERATEUR` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEOEUF_PARQ_FK` | [TRIAGEOEUF](tables.md#triageoeuf).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEOEUFDET_DEST_FK` | [TRIAGEOEUFDETAIL](tables.md#triageoeufdetail).`IDDESTINATION` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEOEUFDET_MERE_FK` | [TRIAGEOEUFDETAIL](tables.md#triageoeufdetail).`IDMERE` → [TRIAGEOEUF](tables.md#triageoeuf).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEOEUFDET_QUAL_FK` | [TRIAGEOEUFDETAIL](tables.md#triageoeufdetail).`IDQUALITETRIAGEOEUF` → [QUALITETRIAGEOEUF](tables.md#qualitetriageoeuf).`ID` | ENABLED | VALIDATED | NO ACTION |
| `TRIAGEOEUFDET_TYPECOL_FK` | [TRIAGEOEUFDETAIL](tables.md#triageoeufdetail).`IDTYPECOLLECTE` → [TYPECOLLECTE](tables.md#typecollecte).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRIAGEPOUS_ECLOSOIR` | [TRIAGEQUALITEPOUSSIN](tables.md#triagequalitepoussin).`IDECLOSOIR` → [ECLOSOIR](tables.md#eclosoir).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRIAGEPOUS_INCUBATEUR` | [TRIAGEQUALITEPOUSSIN](tables.md#triagequalitepoussin).`IDINCUBATEUR` → [INCUBATEUR](tables.md#incubateur).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRIAGEPOUS_LOT` | [TRIAGEQUALITEPOUSSIN](tables.md#triagequalitepoussin).`IDLOT` → [LOT](tables.md#lot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRIAGEDETAIL_BATIMENT` | [TRIAGEQUALITEPOUSSINDETAIL](tables.md#triagequalitepoussindetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRIAGEDETAIL_MERE` | [TRIAGEQUALITEPOUSSINDETAIL](tables.md#triagequalitepoussindetail).`IDMERE` → [TRIAGEQUALITEPOUSSIN](tables.md#triagequalitepoussin).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRIAGEDETAIL_PARQUET` | [TRIAGEQUALITEPOUSSINDETAIL](tables.md#triagequalitepoussindetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_TRIAGEDETAIL_QUALITE` | [TRIAGEQUALITEPOUSSINDETAIL](tables.md#triagequalitepoussindetail).`IDQUALITE` → [QUALITEPOUSSIN](tables.md#qualitepoussin).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C007928` | [TYPE_PRODUIT](tables.md#type-produit).`IDLIGNE` → [LIGNE](tables.md#ligne).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_UP_PERSONNEL` | [UTILISATEUR_PERSONNEL](tables.md#utilisateur-personnel).`IDPERSONNEL` → [LOG_PERSONNEL](tables.md#log-personnel).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_VACCPOUSS_LOT` | [VACCINATIONPOUSSIN](tables.md#vaccinationpoussin).`IDLOT` → [LOT](tables.md#lot).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_VACCPOUSSDET_BATIMENT` | [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDBATIMENT` → [BATIMENT](tables.md#batiment).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_VACCPOUSSDET_MALADIE` | [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDMALADIEPOUSSIN` → [MALADIEPOUSSIN](tables.md#maladiepoussin).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_VACCPOUSSDET_MERE` | [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDMERE` → [VACCINATIONPOUSSIN](tables.md#vaccinationpoussin).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_VACCPOUSSDET_MODEADMIN` | [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDMODEADMINISTRATION` → [MODEADMINISTRATIONVACCIN](tables.md#modeadministrationvaccin).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_VACCPOUSSDET_PARQUET` | [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDPARQUET` → [PARQUET](tables.md#parquet).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_VACCPOUSSDET_TYPEVACC` | [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDTYPEVACCINATION` → [TYPEVACCINATION](tables.md#typevaccination).`ID` | ENABLED | VALIDATED | NO ACTION |
| `FK_VACCPOUSSDET_VACCIN` | [VACCINATIONPOUSSINDETAIL](tables.md#vaccinationpoussindetail).`IDVACCIN` → [VACCINPOUSSIN](tables.md#vaccinpoussin).`ID` | ENABLED | VALIDATED | NO ACTION |
| `SYS_C008332` | [VALIDATION_ROLE](tables.md#validation-role).`ROLE` → [ROLES](tables.md#roles).`IDROLE` | ENABLED | VALIDATED | NO ACTION |
| `VENTE_CLIENT_FK` | [VENTE](tables.md#vente).`IDCLIENT` → [CLIENT](tables.md#client).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `VENTELUBRIFIANT_PRODUIT_FK` | [VENTELUBRIFIANT](tables.md#ventelubrifiant).`IDPRODUIT` → [PRODUIT](tables.md#produit).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `VENTELUB_ENCAISSEMENT_FK` | [VENTELUBRIFIANT](tables.md#ventelubrifiant).`IDENCAISSEMENT` → [ENCAISSEMENT](tables.md#encaissement).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `VENTELUB_MAGASIN_FK` | [VENTELUBRIFIANT](tables.md#ventelubrifiant).`IDMAGASIN` → [MAGASIN2](tables.md#magasin2).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `VENTEDET_DEVISE_FK` | [VENTE_DETAILS](tables.md#vente-details).`IDDEVISE` → [DEVISE](tables.md#devise).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `VENTE_MEREFILLE_FK` | [VENTE_DETAILS](tables.md#vente-details).`IDVENTE` → [VENTE](tables.md#vente).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `VERSEMENTCHEQUE_CAISSE_FK` | [VERSEMENTCHEQUE](tables.md#versementcheque).`IDCAISSE` → [CAISSE](tables.md#caisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `VERSCHEQUEDETAILS_CHEQUE_FK` | [VERSEMENTCHEQUEDETAILS](tables.md#versementchequedetails).`IDCHEQUE` → [CHEQUE](tables.md#cheque).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `VERSEMENTCHEQUEDETAILS_MERE_FK` | [VERSEMENTCHEQUEDETAILS](tables.md#versementchequedetails).`IDVERSEMENTCHEQUE` → [VERSEMENTCHEQUE](tables.md#versementcheque).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `VIREMENTINTRACAISSE_ARRIVE_FK` | [VIREMENTINTRACAISSE](tables.md#virementintracaisse).`IDCAISSEARRIVE` → [CAISSE](tables.md#caisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
| `VIREMENTINTRACAISSE_DEPART_FK` | [VIREMENTINTRACAISSE](tables.md#virementintracaisse).`IDCAISSEDEPART` → [CAISSE](tables.md#caisse).`ID` | ENABLED | NOT VALIDATED | NO ACTION |
