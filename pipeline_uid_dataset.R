# _____________________________________________________________________________
# CONSTITUER LE DICTIONNAIRE DES DataElements du CMA
# ____________________________________________________________________________

# Packages
library(httr2)
library(jsonlite)
library(usethis)
library(writexl)
library(here)
library(readxl)
library(purrr)

#   PARAMETRES
endos_url <- "https://endos.minsante.bf/api"
uid_dataset <- read_excel(
  here("data", "dictionnaire_dataSet_endos.xlsx"),
  sheet ="dataSet_cle") |> 
  pull(id) # pull(), prend en entrée une data frame et une colonne et retourne un             vecteur
id_dataset_combine <- paste(uid_dataset, collapse = ",")
dataset_filtre <- paste0(
  "dataSetElements.dataSet.id:in:[",id_dataset_combine,"]"
  )
# BLOC I. REQUETE dataSet uid

# 1.envoyer la requête de dataSets à l'API endos
requete <- request(endos_url) |> 
  req_url_path_append("dataSets") |> 
  req_url_query(
    pageSize = 100,
    fields = "id,name",
    filter = "name:ilike:cma"
    ) |> 
  req_auth_basic(
    Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")
    ) |> 
  req_perform()

# 2. décoder le JSON en liste R, avec simplification
#predit: revoi une liste de 2 éléments aplatis
reponse_brute <- requete |> 
  resp_body_json(simplifyVector = TRUE)
class(reponse_brute)
length(reponse_brute)
# 3. Construire le dictionnaire de dataSet. Transformer la table de dataSet en tiblle
dico_endos_dataSet <- as_tibble(reponse_brute$dataSets)

# Selectionner les dataSets clé
dico_datasetCMA_cle <- dico_endos_dataSet |> 
  filter(
    name %in% c(
      "2021-CM-CMA 01- Santé maternelle et infantile",
      "2021-CM-CMA 02 - Nutrition-Planification familiale",
      "2021-CM-CMA 06 Morbidité_1",
      "2021-CM-CMA 07 Morbidité_2",
      "2021-CM-CMA 08 - Consultants, mouvements des malades et personnes âgées",
      "2021-CM-CMA 09 - Chirurgies et actes spécifiques"
         )
    )
# 4.exporter le dico en excel
write_xlsx(
  list(
    dataSet = dico_endos_dataSet, 
    dataSet_cle = dico_datasetCMA_cle
    ),
  here("data","dictionnaire_dataSet_endos.xlsx")
             )
# ------------------------------------------------------------------------------
# BLOC II. REQUETE dataElements uid 
# _____________________________________________________________________________

# Requete des dataElements à partir de leurs datasets d'appartenance
# Predit: plus de 500 dataElements
requete2 <- request(endos_url) |> 
  req_url_path_append("dataElements") |> 
  req_url_query(
    pageSize = 1000,
    fields = "id,name",
    filter = dataset_filtre
  ) |> 
  req_auth_basic(
    Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")
  ) |> 
  req_perform()

reponse_complete <- requete2 |> 
  resp_body_json(simplifyVector = TRUE)
table_dataElements <- as_tibble(reponse_complete$dataElements)

write_xlsx(table_dataElements, here("data", "dictionnaires_dataE.xlsx"))








########################################




