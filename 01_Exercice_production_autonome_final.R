###############################################################################
# TITRE       : Dictionnaire des FS publiques de district du DS-BMG
# FICHIER     : 00_Exercice_production_autonome.R
# AUTEUR      : HARO Emmanuel (MCD, DS-BMG)
# DATE        : 03/06/2026
# VERSION     : 1.1.0
#
# OBJECTIF    :
#   Produire un dictionnaire propre (nom <-> UID) des 48 formations
#   sanitaires PUBLIQUES DE DISTRICT du DS-BMG, c'est-a-dire les FS qui
#   portent une population cible et entrent dans le suivi des indicateurs
#   de couverture.
#
#   Le district compte 75 unites de niveau 6 taguees "FS Public" dans
#   ENDOS-BF. Parmi ces 75, 27 ne sont PAS des FS de couverture :
#     - 23 services internes du CMA Pissy (Cardiologie, Radiologie, ...)
#     -  3 infirmeries d'entreprise (BIR 3, ONEA, SONABY)
#     -  1 centre medical militaire (CM Camp Lamizana)
#   Aucune de ces 27 n'a de population cible geographique : un taux de
#   couverture y serait sans denominateur, donc sans sens. On les exclut.
#   75 - 27 = 48.  <-- equation de conservation, controlee dans le script.
#
# SOURCE      : API ENDOS-BF production  (https://endos.minsante.bf/api)
#               Identifiants lus dans ~/.Renviron (ENDOS_USER / ENDOS_PWD)
# SORTIE      : dictionnaire_fs_48_district.xlsx
#
# NOTE 6 MOIS : ENDOS tombe regulierement pour maintenance. Si l'etape 1
#               renvoie un timeout, ce n'est pas le code : c'est le serveur.
#               Verifier l'acces dans un navigateur avant de chercher un bug.
###############################################################################


# =============================================================================
# 0. PACKAGES
# =============================================================================
library(httr2)      # construction et envoi des requetes API
library(dplyr)      # filtrage non destructif (filter, pipe)
library(stringr)    # detection de motifs (str_detect) pour reperer les groupes
library(writexl)    # export final en .xlsx

# URL de base de l'API, reutilisee partout
endos.bf <- "https://endos.minsante.bf/api"


# =============================================================================
# 1. AUTHENTIFICATION
#    But : prouver que les identifiants .Renviron ouvrent bien l'API.
#    L'endpoint /me renvoie le profil de l'utilisateur connecte.
# =============================================================================

# predit : statut HTTP 200 (succes)
response_endos <- request(endos.bf) |>
  req_url_path_append("me") |>
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform()

resp_status(response_endos)   # doit afficher 200 avant d'aller plus loin (#74)


# =============================================================================
# 2. NAVIGATION : recuperer les 75 FS publiques de niveau 6 du district
# =============================================================================

# --- 2.1 UID du district (DS Boulmiougou), unite de niveau 4 --------------
# predit : pager$total = 1 (un seul DS-BMG)
reponse_ds <- request(endos.bf) |>
  req_url_path_append("organisationUnits") |>
  req_url_query(
    pageSize = 10,
    filter   = "name:like:DS Boulmiougou",
    level    = 4
  ) |>
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform() |>
  resp_body_json()

reponse_ds$pager$total                               # controle : doit valoir 1
uid_DS_BMG <- sapply(reponse_ds$organisationUnits, \(x) x$id)

# UID du groupe transversal "FS Public" (catalogue ENDOS, stable)
uid_public <- "Dy3iQqsTCjS"

# --- 2.2 Les FS publiques de niveau 6 sous le district --------------------
# path:like  -> capture TOUS les descendants du district (pas seulement
#               les enfants directs, contrairement a parent=)
# level = 6  -> ne garde que l'etage des formations sanitaires
# .multi = "explode" -> repete le parametre filter dans l'URL (filter=A&filter=B)
#                       pour cumuler les deux conditions (#83)
# predit : ~75 unites, 2 champs utiles (displayName, id)
unite75_bmg <- request(endos.bf) |>
  req_url_path_append("organisationUnits") |>
  req_url_query(
    pageSize = 100,
    level    = 6,
    filter   = c(
      paste0("path:like:", uid_DS_BMG),
      paste0("organisationUnitGroups.id:eq:", uid_public)
    ),
    .multi   = "explode",
    fields   = "displayName,id,level"    # ATTENTION : pas d'espaces dans fields
  ) |>
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform() |>
  resp_body_json()

# Table maitre des 75 FS publiques (nom + UID)
df75_bmg <- data.frame(
  displayName = sapply(unite75_bmg$organisationUnits, \(x) x$displayName),
  uid         = sapply(unite75_bmg$organisationUnits, \(x) x$id)
)
dim(df75_bmg)                                             # controle : 75 x 2


# =============================================================================
# 2 bis. VALIDATION  (non requis pour la production)
#    Explique l'ecart hérité du 31/05 : pager$total = 76 mais length() = 75.
#    On verifie quelle unite fait la difference et pourquoi elle sort.
#    CONCLUSION : l'intrus est "CMA Pissy", en niveau 5. Le filtre level = 6
#    le retire LEGITIMEMENT. L'ecart 76/75 n'est donc pas un bug.
#    -> Ce bloc peut etre commente une fois la validation acquise.
# =============================================================================

# Memes filtres SANS la contrainte de niveau -> ramene les 76 (dont le CMA)
unite76_bmg <- request(endos.bf) |>
  req_url_path_append("organisationUnits") |>
  req_url_query(
    pageSize = 100,
    fields   = "displayName,id,level",
    filter   = c(
      paste0("path:like:", uid_DS_BMG),
      paste0("organisationUnitGroups.id:eq:", uid_public)
    ),
    .multi   = "explode"
  ) |>
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform() |>
  resp_body_json()

# Extraction des noms et des niveaux des deux listes (76 et 75)
displayName76 <- sapply(unite76_bmg$organisationUnits, \(x) x$displayName)
displayName75 <- sapply(unite75_bmg$organisationUnits, \(x) x$displayName)
level76       <- sapply(unite76_bmg$organisationUnits, \(x) x$level)
level75       <- sapply(unite75_bmg$organisationUnits, \(x) x$level)

# L'intrus = le nom present dans les 76 mais absent des 75.
# Verification croisee par le niveau : la meme unite est aussi celle dont
# le niveau (5) n'apparait pas dans les 75 (tous en niveau 6).
displayName76[[which(!(displayName76 %in% displayName75))]]   # attendu : "CMA Pissy"
displayName76[[which(!(level76 %in% level75))]]               # attendu : "CMA Pissy"
# Resultat : "CMA Pissy" (niveau 5) -> retire legitimement par level = 6.


# =============================================================================
# 3. EXCLUSIONS : passer des 75 aux 48
#    Piege central : les services du CMA et les infirmeries sont en NIVEAU 6,
#    comme les vraies FS. Le niveau ne les separe donc PAS. On exclut par
#    APPARTENANCE A UN GROUPE, apres avoir verifie le contenu de chaque groupe
#    (le parametrage ENDOS n'est pas presume fiable, il est controle).
# =============================================================================

# --- 3.1 Reperer les UID des groupes a exclure ----------------------------
# On liste TOUS les groupes (sans filtre de nom, pour lire les intitules
# exacts tels qu'ENDOS les stocke), puis on filtre sur un motif large.
group_brut <- request(endos.bf) |>
  req_url_path_append("organisationUnitGroups") |>
  req_url_query(pageSize = 500, fields = "id,displayName") |>
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform() |>
  resp_body_json()

# predit : une poignee de lignes a inspecter (faux positifs possibles)
groupes_candidats <- data.frame(
  displayName = sapply(group_brut$organisationUnitGroups, \(x) x$displayName),
  id          = sapply(group_brut$organisationUnitGroups, \(x) x$id)
) |>
  filter(str_detect(displayName,
                    regex("CMA|infirmerie|sst", ignore_case = TRUE)))
groupes_candidats
# Inspection manuelle du resultat :
#   - "Obc ICPCMANGODARA"  -> FAUX POSITIF (le motif "CMA" est au milieu d'un mot)
#   - "SST"                -> ABSENT : aucun groupe SST dans ENDOS (cf. note 3.4)
# UID retenus apres inspection :
uid_services_cma <- "q32WIPyZ76w"   # services internes du CMA Pissy
uid_infirmerie   <- "hmlymEVhylR"   # infirmeries d'entreprise

# --- 3.2 Verifier le CONTENU de chaque groupe avant de l'utiliser ---------
# Services du CMA, publics : attendu = 23 unites (toutes "CMA Pissy: ...")
# Meme logique de double condition de groupe que pour les infirmeries.
# Meme triple condition AND que pour les infirmeries :
#   1. path:like:uid_DS_BMG  -> sous le district.
#   2. groupe "FS Public"    -> condition de coherence (ici sans effet :
#      tous les services du CMA sont publics, le compte reste 23).
#   3. groupe "Services_CMA" -> les services internes du CMA Pissy.
# Intersection -> les 23 services publics du CMA Pissy.
service_cma <- request(endos.bf) |>
  req_url_path_append("organisationUnits") |>
  req_url_query(
    pageSize = 100,
    filter   = c(
      paste0("path:like:", uid_DS_BMG),
      paste0("organisationUnitGroups.id:eq:", uid_public),
      paste0("organisationUnitGroups.id:eq:", uid_services_cma)
    ),
    .multi   = "explode"
  ) |>
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform() |>
  resp_body_json()
services_cma_id <- sapply(service_cma$organisationUnits, \(x) x$id)
length(services_cma_id)                                   # controle : 23

# Infirmeries PUBLIQUES : attendu = 3 unites (BIR 3, ONEA, SONABY)
# Filtrage par triple condition, combinees en AND (defaut DHIS2, #86) :
#   1. path:like:uid_DS_BMG  -> l'unite est sous le district (n'importe
#      quel descendant, pas seulement enfant direct).
#   2. groupe "FS Public"    -> ecarte les infirmeries privees.
#   3. groupe "Infirmerie"   -> ne garde que ce type d'unite.
# Intersection des trois -> les infirmeries PUBLIQUES du district.
# Sans la condition (2), on obtiendrait 7 (3 publiques + 4 privees).
# Pour une UNION il faudrait rootJunction = "OR".
infirmeries <- request(endos.bf) |>
  req_url_path_append("organisationUnits") |>
  req_url_query(
    pageSize = 100,
    filter   = c(
      paste0("path:like:", uid_DS_BMG),
      paste0("organisationUnitGroups.id:eq:", uid_public),
      paste0("organisationUnitGroups.id:eq:", uid_infirmerie)
    ),
    .multi   = "explode"
  ) |>
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform() |>
  resp_body_json()
infirmeries_id <- sapply(infirmeries$organisationUnits, \(x) x$id)
length(infirmeries_id)                                    # controle : 3

# --- 3.3 Exclusion manuelle DOCUMENTEE : CM Camp Lamizana -----------------
# DECISION MCD (03/06/2026) :
#   Le CM Camp Lamizana est une structure militaire SANS population cible
#   geographique -> aucun taux de couverture interpretable. Il doit sortir.
#   PROBLEME : dans ENDOS il est tague "FS Public" + groupe "CM" (comme les
#   vrais CM de district) et AUCUN groupe ne l'isole comme structure
#   militaire/parapublique. Il n'est donc separable par AUCUN critere de
#   donnee. -> exclusion par UID, en dernier recours, et tracee ici.
#   A signaler a l'equipe ENDOS / DRS pour corriger le tagging.
uid_CM_lamizana <- "i61YzCyJsT3"

# --- 3.4 NOTE PARAMETRAGE : groupe "SST" introuvable ----------------------
#   Aucun groupe ENDOS ne correspond aux SST (ni "SST", ni variante trouvee).
#   Si des SST existent dans les 48 restants, ils ne sont separables par
#   aucun groupe. A verifier / signaler. Sans impact sur le compte de ce jour
#   (l'equation 75 - 27 = 48 boucle sans eux).


# =============================================================================
# 4. FILTRAGE + CONTROLE DE CONSERVATION
#    On ne se contente pas de verifier que le resultat fait 48 : on verifie
#    que 75 - (nb reellement retire) = 48. Cela rend impossible une erreur
#    de compensation (une unite exclue a tort + une oubliee = faux 48).
# =============================================================================

# Vecteur des UID a exclure : 23 + 3 + 1
# predit : vecteur character de longueur 27
uid_a_exclure <- c(services_cma_id, infirmeries_id, uid_CM_lamizana)
length(uid_a_exclure)                                     # controle : 27

# Combien de ces UID sont REELLEMENT dans les 75 ? (#18 : somme d'un vecteur
# logique = nombre de TRUE)
# predit : 27
sum(df75_bmg$uid %in% uid_a_exclure)                      # controle : 27

# Filtre NON destructif : df75_bmg reste intact, df48_bmg est un nouvel objet.
# Dans un verbe dplyr on nomme la colonne nue (uid), jamais df75_bmg$uid (#14).
# predit : data frame 48 x 2
df48_bmg <- df75_bmg |>
  filter(!(uid %in% uid_a_exclure))
dim(df48_bmg)                                             # controle : 48 x 2  (75 - 27)


# =============================================================================
# 5. EXPORT
#    Pas de jointure necessaire : displayName et uid ont ete extraits ensemble
#    de l'API, aucun UID n'est orphelin. Le dictionnaire est complet en l'etat.
# =============================================================================
#write_xlsx(df48_bmg, "dictionnaire_fs_48_district.xlsx")

# Penser au commit Git depuis le Terminal Mac natif.

#Notes
# Le path interroge la position hiérarchique (où l'unité se situe dans l'arbre national → région → district → FS), tandis que les groupes sont transversaux (des étiquettes hors hiérarchie, #82). Le AND combine les deux familles sans problème,
