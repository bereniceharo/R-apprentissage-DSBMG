###############################################################################
# TITRE       : Dictionnaire des FS publiques de district (semaine 11, sans filet)
# FICHIER     :
# AUTEUR      : HARO Emmanuel
# DATE        : 03/06/2026
# VERSION     : 1.0.0
#
# DESCRIPTION :
# Production autonome du pipeline complet de la semaine 11 sur les données
# ENDOS-BF de production : authentification, navigation, pagination,
# filtrage, jointure et export.
#
# ENTREES     : API ENDOS
###############################################################################
# Contexte métier. Tu veux individualiser les 48 formations sanitaires publiques de district du DS-BMG — celles qui portent le suivi des indicateurs — en excluant les services du CMA, infirmeries et SST qui se sont retrouvés mélangés dans ton extraction des 75. Livrable : un dictionnaire propre dictionnaire_fs_publiques_district.xlsx (UID ↔ nom lisible), versionné sur GitHub.

# Les packages utiles
library(dplyr)
library(usethis)
library(httr2)
library(purrr)
library(writexl)
library(stringr)
library(writexl)

# 1. Authentification — requête de base----- 
endos.bf <- "https://endos.minsante.bf/api"
#predict: status de l'appel API de ENDOS retourne 200
response_endos <- request("https://endos.minsante.bf/api") |> 
  req_url_path_append("me") |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform()
resp_status(response_endos)

# 2.maillon 2 — navigation + pagination : récupérer toutes les unités du DS-BMG en level = 6

# Recuperer l'UID du DS Boulmiougou et le stocker dans une variable uid_DS_BMG
# predict: une liste de longueur 2 imbriquée avec 1 élément organisationUnit 
uid_DS_BMG <-request("https://endos.minsante.bf/api") |>
  req_url_path_append("organisationUnits") |>
  req_url_query(pageSize = 10,
                filter = "name:like:DS Boulmiougou", #Dans les unités d'organisation de niveau 4, celle correspondant au DS Boulmiougou
                level = 4
                ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()
uid_DS_BMG$pager$total

# Extraire l'UID_DS BMG'
uid_DS_BMG <- sapply(uid_DS_BMG$organisationUnits, \(x) x$id)
uid_public <- "Dy3iQqsTCjS"
#Récupérer les Formations sanitaires publiques (unités) de niveau 6 du DS BMG
#predict: Data frame de deux colonnes, 75 lignes
unite75_bmg <- request("https://endos.minsante.bf/api") |>
  req_url_path_append("organisationUnits") |>
  req_url_query(pageSize = 100,
                level = 6, #strictement du niveau 6
                filter = c(paste0("path:like:", uid_DS_BMG), #Dans le DS de Boulmiougou
                           paste0("organisationUnitGroups.id:eq:", uid_public)
                           ), #appartenant au groupe FS publique
                .multi = "explode", # itérer filter sur chacun de ses deux parametre et                                ajouter les resultats respectifs aux parametres de l'url base
                fields = "displayName,id,level"
                ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()

unite75_bmg$pager$total
length(unite75_bmg$organisationUnits) #(76/75) une différence d'une unité. probablement l'unité du CMA faisant partie du path DS_BMG est rétiré de la liste par ce que level = 5#6

#Toutes les FS du district
unite76_bmg <- request("https://endos.minsante.bf/api") |>
  req_url_path_append("organisationUnits") |>
  req_url_query(pageSize = 100,
                fields = "displayName, id, level",
                filter = c(paste0("path:like:", uid_DS_BMG), #Dans le DS de Boulmiougou
                           paste0("organisationUnitGroups.id:eq:", uid_public)
                ), #appartenant au groupe FS publique
                .multi = "explode" # itérer filter sur chacun de ses deux parametre et                                ajouter les resultats respectifs aux parametres de l'url base
  ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()

unite76_bmg$pager$total
length(unite76_bmg$organisationUnits)

#identifier la formation sanitaire intruse (predict:CMA de Pissy, level 5)
displayName76 <- sapply(unite76_bmg$organisationUnits, \(x) x$displayName) #estraire liste des 76 FS
displayName75 <- sapply(unite75_bmg$organisationUnits, \(x) x$displayName) # extraire liste des 75 FS
id75 <- sapply(unite75_bmg$organisationUnits,\(x) x$id ) # id des 75 FS
id76 <- sapply(unite76_bmg$organisationUnits,\(x) x$id ) # id des 76 FS
level75 <- sapply(unite75_bmg$organisationUnits, \(x) x$level)
level76 <- sapply(unite76_bmg$organisationUnits, \(x) x$level)
displayName76[[which(!(displayName76 %in% displayName75))]]
displayName76[[which(!(level76 %in% level75))]] 

df75_bmg <- data.frame(
  displayName = displayName75, 
  uid = id75)
dim(df75_bmg)

# 3. Recuperer les 48 formations sanitaires
#Une liste de 6 groupes de formtions sanitaires
group75_bmg <- request(endos.bf) |> 
  req_url_path_append("organisationUnitGroups") |> 
  req_url_query(
    pageSize =  100,
    filter = "name:in:[Services_CMA,CMA,Infirmerie,CSPS,CM,Dispensaire]"
  ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()
group75_bmg$pager
length(group75_bmg$organisationUnitGroups)
displayName_g <- sapply(group75_bmg$organisationUnitGroups, \(x) x$displayName)
id_g <- sapply(group75_bmg$organisationUnitGroups, \(x) x$id)

#Data frame des groupes de formations sanitaires publiques
group_fsp <- data.frame(displayName_g, id_g)
write_xlsx(group_fsp, "UIDs_groupes_fs_publiques.xlsx")

#####

#liste de 352 groupes
group_bmg_brut <- request(endos.bf) |> 
  req_url_path_append("organisationUnitGroups") |> 
  req_url_query(pageSize = 500)|> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()
group_bmg_brut$pager
length(group_bmg_brut$organisationUnitGroups)

#data frame des 352 
#predict: petit nombre indeterminé à inspecter
displayName <- sapply(group_bmg_brut$organisationUnitGroups, \(x) x$displayName)
id <-sapply(group_bmg_brut$organisationUnitGroups, \(x) x$id) 
group_candidats <- data.frame(displayName, id) |>
  filter(
    str_detect(displayName, 
               regex("CMA|infirmerie|services_cma|sst", ignore_case = TRUE)))
  group_candidats
  
  uid_cma <- "z9rUEinX6Rn"
  uid_infirmerie <- "hmlymEVhylR"
  uid_services_cma <- "q32WIPyZ76w"
  
#Vérifier le contenu de chaque groupe à exclure
  CMA <- request(endos.bf) |> 
    req_url_path_append("organisationUnits") |> 
    req_url_query(
      pageSize = 100,
      filter = c(
        paste0("path:like:",uid_DS_BMG),
        paste0("organisationUnitGroups.id:eq:",uid_public),
        paste0("organisationUnitGroups.id:eq:",uid_cma)
      ),
      .multi = "explode"
    ) |> 
    req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
    req_perform() |> 
    resp_body_json()
CMA$organisationUnits

##Services_CMA
service_cma <- request(endos.bf) |> 
  req_url_path_append("organisationUnits") |> 
  req_url_query(
    pageSize = 100,
    filter = c(
      paste0("path:like:",uid_DS_BMG),
      paste0("organisationUnitGroups.id:eq:",uid_public),
      paste0("organisationUnitGroups.id:eq:", uid_services_cma)
    ),
    .multi = "explode"
  ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()
services_cma_id <- sapply(service_cma$organisationUnits, \(x) x$id)

##infirmérie
infirmeries <- request(endos.bf) |> 
  req_url_path_append("organisationUnits") |> 
  req_url_query(
    pageSize = 100,
    filter = c(
      paste0("path:like:",uid_DS_BMG),
      paste0("organisationUnitGroups.id:eq:",uid_public),
      paste0("organisationUnitGroups.id:eq:", uid_infirmerie)
    ),
    .multi = "explode"
  ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()
infirmeries$organisationUnits
length(infirmeries$organisationUnits)
infirmeries_uid <- sapply(infirmeries$organisationUnits,\(x) x$id) 

#CM_camp Lamizana
CM_lamizana <- "i61YzCyJsT3"

# Construction de la liste des fs à exclure.
# predict: retourne un vecteur chr de 27 éléments
uid_a_exclure <- c(services_cma_id, infirmeries_uid, CM_lamizana) #concatener les uid des vecteur de fs à exclure (infirmerie, services_cma, CM camp lamizana)
length(uid_a_exclure)
#Le contrôle de conservation
sum(df75_bmg$uid %in% uid_a_exclure) #verifier si le matching fait 27
#Construire le df des 48 fs (avec le filtre non destructif).
# predict: une dataframe de 48X2
df48_bmg <- df75_bmg |> 
  filter(!(uid %in% uid_a_exclure))
dim(df48_bmg)  
 
# Export de la liste des 48 formations sanitaires publiques au format xlsx
write_xlsx(df48_bmg, "dictionnaire_fs_48_district.xlsx")



