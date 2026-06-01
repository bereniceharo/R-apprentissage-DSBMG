#==============================================================================
#Session 11.5: Récupérer les indicateurs ENDOS-BF production
#Objectif: savoir récuperer les uid et les noms des indicateurs de ENDOS
#==============================================================================
library(httr2)
library(jsonlite)
library(usethis)
library(writexl)

#-------------------------------------------------------------------------------
# 1.---Récupérer les indicateurs ENDOS-BF production----
#-------------------------------------------------------------------------------

# prédit :
# - resp_indicators : type [list], structure [liste imbriquée]
# - $pager$total : entre [100 et [200]
# - length($indicators) : égal à $pager$total ? [incertain]
# - $indicators[[1]] : $displayName, $id
base_url <- "https://endos.minsante.bf/api"
resp_indicators <- request(base_url) |>
  req_url_path_append("indicators") |> # étape 1 : choisir le endpoint indicateurs en l'ajoutant à l'url de base
  req_url_query(pageSize = 4000) |> # étape 2 : Etendre le nombre d'élément possible par page à 200..
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> # étape manquante : l'authentification avec les identifiants de connexion stockés en variables d'environnement
  req_perform() |> # étape 3 : Envoyer la requête à l'API ENDOS
  resp_body_json()# étape 4 : decoder la reponse sous forme d'objet liste R.

#resp_indicators$pager
#length(resp_indicators$indicators)

#-------------------------------------------------------------------------------
# 2.---récupérer la liste des groupes d'indicateurs disponibles dans ENDOS-BF----
#-------------------------------------------------------------------------------

# prédit : [liste R, liste de 2 éléments imbriqués, nombre de groupes attendu: 70,
#           champs visibles dans [[1]]]: $displayName, $id
indicators_group <- request(base_url) |> 
  req_url_path_append("indicatorGroups") |> 
  req_url_query(pageSize = 100) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()

# indicators_group$pager
# length(indicators_group$indicatorGroups)

#-------------------------------------------------------------------------------
# 3.---explorer les noms des groupes------------- 
#-------------------------------------------------------------------------------

# Extrait tous les displayName des 60 groupes dans un vecteur 
#character, et affiche le résultat.
# prédit : [vector de longeur 60, contenu attendu: noms des groupes d'indicateurs]
names_indicators <- sapply(indicators_group$indicatorGroups, \(x) x$displayName)
names_indicators
#Extraire les UIDs des 9 groupes sélectionnés
# prédit : [type: vecteur chr, longueur: 9, contenu: uids uniquement]
uids_igroup <- sapply(which(names_indicators %in% c(
  "ASBC",
  "Couverture PEV",
  "Indicateurs Formations sanitaires",
  "Morbidite et PCIME",
  "Paludisme",
  "Planification familiale",
  "Rapport de progrès District",
  "Santé maternelle et infantile",
  "SIMR")), \(x) indicators_group$indicatorGroups[[x]]$id)
# uids_igroup

#-------------------------------------------------------------------------------
# 4. ---Récupèrer les indicateurs des 9 groupes sélectionnés dans ENDOS-BFproduction----
#-------------------------------------------------------------------------------
#predict: environ 400 indicateurs
indicators_ds <- request(base_url) |> 
  req_url_path_append("indicators") |> #Dans tous les indicateurs
  req_url_query(
    filter       = paste0("indicatorGroups.id:eq:", uids_igroup), #Dans les 9 groupes d'indicateurs
    rootJunction = "OR", #la valeur par défaut est AND. Sans OR, on obtiendra 
                         #zéro com résultat. aucun indicateur ne peut appartenir à 9 groupes à la fois.
    pageSize     = 500,
    .multi = "explode"  #Permet de serialiser le vecteur de valeur de filter en 
                        #repetant la clé correspondant à chacune dans l'url
  ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()

# indicators_ds$pager
# length(indicators_ds$indicators)

#-------------------------------------------------------------------------------
#construire le data frame et exporter----
#-------------------------------------------------------------------------------

#Temps 1 : Extrais un data frame df_dict_indicators à 2 colonnes (id, displayName)
# prédit : [data.frame, dimensions: 339X2, types des colonnes: chr]
disp1 <- sapply(indicators_ds$indicators, \(x) x$displayName)
id1 <- sapply(indicators_ds$indicators, \(x) x$id)
df_dict_indicators <- data.frame(
  displayName = disp1,
  id          = id1
)
class(df_dict_indicators)
dim(df_dict_indicators)
class(df_dict_indicators$displayName)
class(df_dict_indicators$id)

#Temps 2 — Export vers Excel
write_xlsx(df_dict_indicators, "data/dictionnaire_endos_bf.xlsx")


