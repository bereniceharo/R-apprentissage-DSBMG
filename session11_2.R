#==============================================================================
#Session 11.2 application sur ENDOS
#À la prochaine session : 11.2 — récupérer les métadonnées des unités d'organisation
#(/organisationUnits)

#==============================================================================
#Packages necessaires
library(httr2)
library(jsonlite)
library(usethis)

#requête pour trouver l'UID du DS-BMG sur ENDOS-BF
#predict: une liste de deux éléments
ds_bmg_uid <- request("https://endos.minsante.bf/api") |> 
  req_url_path_append("organisationUnits") |>
  req_url_query(
    pageSize = 10, filter = "name:ilike:DS Boulmiougou") |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()

#donne-moi toutes les unités qui sont enfants de DS Boulmiougou (UID =eVFAuZOzogt)
#predict: liste de 2 éléments, 80 FS attendues
ds_bmg_fs <- request("https://endos.minsante.bf/api") |> 
  req_url_path_append("organisationUnits") |>
  req_url_query(pageSize = 7000, parent = "eVFAuZOzogt", fields = "id, displayName, level") |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()

length(ds_bmg_fs$organisationUnits)
ds_bmg_fs$pager
ds_bmg_fs$organisationUnits[[1]]
View(ds_bmg_fs$organisationUnits)

#liste de 2 éléments, total d'élement de organisationunitname = 200'
ds_bmg_fs2 <- request("https://endos.minsante.bf/api") |>
  req_url_path_append("organisationUnits") |>
  req_url_query(pageSize = 500, 
                filter = "path:like:eVFAuZOzogt", 
                level = 6) |>
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform() |>
  resp_body_json()

length(ds_bmg_fs2)
ds_bmg_fs2
ds_bmg_fs2$pager

ds_bmg_fs2$organisationUnits[[1]]
ds_bmg_fs2$organisationUnits[[150]]
ds_bmg_fs2$organisationUnits[[304]]
ds_bmg_fs2$organisationUnits[[305]]
length(ds_bmg_fs2$organisationUnits)

#Chaque groupe a un UID et contient la liste des FS qui en sont membres
#==============================================================================
#Session 11.2: Extraction des Formations sanitaires du district et de leurs UID
#NB: hors session
#Objectif: Savoir identifier les formations sanitaires et leurs UID et les extraires par 
#groupe
#==============================================================================


#Determiner l'UID des groupes FS privee et FS public
UID_group_FS <- request("https://endos.minsante.bf/api") |>
  req_url_path_append("organisationUnitGroups") |>
  req_url_query(pageSize = 500, 
                filter = "name:ilike:public") |> #"name:ilike:privee" pour l'ID du privé
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform() |>
  resp_body_json()

#UID_group_FS

# _____________________________________________________________________________
# Ramener uniquement les FS publiques
# ____________________________________________________________________________
#predict: liste de e éléments avec 75 formations sanitaires publiques
ds_bmg_public <- request("https://endos.minsante.bf/api") |>
  req_url_path_append("organisationUnits") |>
  req_url_query(pageSize = 500,
                level = 6, # Niveau exact des Formations Sanitaires
                filter = c("path:like:eVFAuZOzogt", #dans le DS Boulmiougou
                           "organisationUnitGroups.id:eq:Dy3iQqsTCjS" #Dans le  groupe FS public
                           ), 
                .multi = "explode"
                ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform() |>
  resp_body_json()


length(ds_bmg_public$organisationUnits)
ds_bmg_public$organisationUnits[[74]]

#transformation des formations sanitaires publiques et leurs UID en data frame.
# avec en colonne displayName et id
ds_bmg_public$organisationUnits[[1]]$id
#Extraire les noms et les id sous forme de vecteur chacun
displayName_public <- sapply(
  ds_bmg_public$organisationUnits,
  \(x) x$displayName)

id_public <- sapply(
  ds_bmg_public$organisationUnits,
  \(x) x$id)
#Creer le data.frame des FS public
uid_fs_public <- data.frame(displayName_public, id_public)


#transformation des formations sanitaires privéess et leurs UID en data frame.
# avec en colonne displayName et id
displayName_privee <- sapply(
  fs_privee$organisationUnits,
  \(x) x$displayName)

id_privee <- sapply(
  fs_privee$organisationUnits,
  \(x) x$id)

uid_fs_privee <- data.frame(displayName_privee, id_privee)

#Exporter au format excel sur des feuilles différentes
fs_bmg_endos <- list(
  "Fs_Public" = uid_fs_public,
  "Fs_Privée" = uid_fs_privee)
write_xlsx(fs_bmg_endos, "Formations_sanitaires_endos.xlsx")



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
      "path:like:eVFAuZOzogt", #uniquement les FS ayant UID de DS Boulmiougou dans leur chemin d'accès
      "organisationUnitGroups.id:eq:xal4L12FhTJ" #uniquement les FS privées
    ),
    .multi = "explode" # Permet d'applique les parametres de façon séparée
  ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()

fs_privee$pager  #Toujours verifier qu'il n'y a pas de page restantes
length(fs_privee$organisationUnits)  

# _____________________________________________________________________________
