#==============================================================================
#Session 11.2: Extraction des Formations sanitaires du district et de leurs UID
#NB: hors session
#Objectif: Savoir identifier les formations sanitaires et leurs UID et les extraires par 
#groupe
#==============================================================================
library(httr2)
library(jsonlite)
library(usethis)
library(writexl)

# --1---Identifier les uid du DS et des groupe de FS (privee et public)----

#uid_public
UID_group_FS <- request("https://endos.minsante.bf/api") |>
  req_url_path_append("organisationUnitGroups") |>
  req_url_query(pageSize = 500, 
                filter = "name:ilike:public") |> #"name:ilike:privee" pour l'ID du privé
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform() |>
  resp_body_json()

#uid_privee
UID_FS_Privee <- request("https://endos.minsante.bf/api") |>
  req_url_path_append("organisationUnitGroups") |>
  req_url_query(pageSize = 500, 
                filter = "name:ilike:privee") |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform() |>
  resp_body_json()

#uid_ds
ds_bmg_uid <- request("https://endos.minsante.bf/api") |> 
  req_url_path_append("organisationUnits") |>
  req_url_query(
    pageSize = 10, filter = "name:ilike:DS Boulmiougou") |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()

UID_group_FS$organisationUnitGroups #verifier l'index de FS publique
uid_public <- UID_group_FS$organisationUnitGroups[[2]]$id

UID_FS_Privee$organisationUnitGroups #verifier l'index de FS privee
uid_privee <- UID_FS_Privee$organisationUnitGroups[[1]]$id

ds_bmg_uid$organisationUnits #verifier l'index de DS Boulmiougou
uid_ds <- ds_bmg_uid$organisationUnits[[1]]$id

# _____________________________________________________________________________
# Ramener uniquement les FS publiques
# ____________________________________________________________________________
#predict: liste de  éléments avec 75 formations sanitaires publiques
ds_bmg_public <- request("https://endos.minsante.bf/api") |>
  req_url_path_append("organisationUnits") |>
  req_url_query(pageSize = 300,
                level = 6, # Niveau exact des Formations Sanitaires
                filter = c(paste0("path:like:", uid_ds), #dans le DS Boulmiougou
                           paste0("organisationUnitGroups.id:eq:",uid_public) #Dans le  groupe FS public
                ), 
                .multi = "explode"
  ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform() |>
  resp_body_json()

ds_bmg_public$pager #verifier la concordance 
length(ds_bmg_public$organisationUnits)


# _____________________________________________________________________________
# Ramener uniquement les FS privées du DS Boulmiougou
# ____________________________________________________________________________

fs_privee <- request("https://endos.minsante.bf/api") |>
  #Entrer par le endpoint organisation unit
  req_url_path_append("organisationUnits") |>
  req_url_query(
    pageSize = 300,
    level = 6,
    filter = c(
      paste0("path:like:", uid_ds), #uniquement les FS ayant UID de DS Boulmiougou dans leur chemin d'accès
      paste0("organisationUnitGroups.id:eq:", uid_privee) #uniquement les FS privées
    ),
    .multi = "explode" # permet d'itérer filter sur des valeurs multiples qui lui 
    #sont passées. Cela permet d'obtenir les resultats des parametres multiples de filter (ici 2) dans l'url definitif.
  ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()

fs_privee$pager  #Toujours verifier qu'il n'y a pas de pages restantes
length(fs_privee$organisationUnits)  

# _____________________________________________________________________________
#Créer un data frame de FS et leurs UID.
# _____________________________________________________________________________

#Data frame FS Public
displayName_public <- sapply(
  ds_bmg_public$organisationUnits,
  \(x) x$displayName)

id_public <- sapply(
  ds_bmg_public$organisationUnits,
  \(x) x$id)
#Creer le data.frame des FS public
uid_fs_public <- data.frame(
  displayName = displayName_public, 
  id = id_public)

# Data frame FS Privee
displayName_privee <- sapply(
  fs_privee$organisationUnits,
  \(x) x$displayName)

id_privee <- sapply(
  fs_privee$organisationUnits,
  \(x) x$id)

uid_fs_privee <- data.frame(
  displayName = displayName_privee, 
  id = id_privee)

#Exporter au format excel sur des feuilles différentes
fs_bmg_endos <- list(
  "Fs_Public" = uid_fs_public,
  "Fs_Privée" = uid_fs_privee)
write_xlsx(fs_bmg_endos, "Formations_sanitaires_endos.xlsx")



