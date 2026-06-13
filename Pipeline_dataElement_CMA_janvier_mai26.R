# ==============================================================================
# PROJET      : ENDOS-BF Production
# SCRIPT      : Extraction et nettoyage des DataElements du CMA
# OBJECTIF    : récupérer les valeurs des 48 data elements, pour la période 202605
# ==============================================================================

# 1. LIBRAIRIES
library(httr2)
library(dplyr)
library(tidyr)
library(readxl)
library(writexl)
library(here) # AJOUT : Nécessaire pour la gestion des chemins

# ==============================================================================
# 2. PARAMETRES ET IMPORTATION DES DICTIONNAIRES

endos.bf <- "https://endos.minsante.bf/api"
periode <- c("202601", "202602", "202603", "202604", "202605")

# OPTIMISATION : Lecture unique des fichiers en mémoire
dictionnaire_dataE_CMA <- read_excel(here("data","dictionnaires_dataElements_CMA.xlsx"), sheet = "Cle")
id_dataElements <- dictionnaire_dataE_CMA$id # Extraction depuis l'objet en mémoire

dico_cma <- read_excel(here("data", "dictionnaire_endos_CMA.xlsx"))
id_cma <- dico_cma$uid # Extraction depuis l'objet en mémoire

# 3. REQUETE API ANALYTICS
requete <- request(endos.bf) |>
  req_url_path_append("analytics") |> 
  req_url_query(
    ignoreLimit = "true",
    dimension = c(
      paste0("dx:", paste(id_dataElements, collapse = ";")),
      paste0("ou:", paste(id_cma, collapse = ";")),
      paste0("pe:", paste(periode, collapse = ";"))
    ),
    .multi = "explode"
  ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform()

# 4. REPONSE ET CONTROLE
reponse_brute <- requete |> 
  resp_body_json(simplifyVector = TRUE)

recu <- nrow(reponse_brute$rows)
attendu <- (length(id_dataElements) * length(id_cma) * length(periode))
ecart <- round(((attendu - recu) / attendu) * 100, 1) 

print(paste("Lignes reçues:", recu, "| Lignes attendues:", attendu, "| Écart:", ecart, "%"))

if(ecart > 80){
  stop("L'ecart entre attendu et recu de ", ecart, "% est trop élevé. Vérifier les valeurs manquantes.")
}

# 5. TRANSFORMATION ET NETTOYAGE
dataelement_mai_cma <- as_tibble(reponse_brute$rows) |> 
  setNames(reponse_brute$headers$name) |> 
  mutate(value = as.numeric(value)) |> 
  
  # Combinaison pour s'assurer que toutes les paires possibles existent
  complete(dx = id_dataElements, ou = id_cma, pe = periode) |> 
  
  # OPTIMISATION : Les trous créés par complete() (NA) deviennent des zéros (0)
  mutate(value = replace_na(value, 0)) |> 
  
  # Jointures
  left_join(dico_cma, by = c("ou" = "uid")) |> 
  left_join(dictionnaire_dataE_CMA, by = c("dx" = "id")) |> 
  
  # Sélection et renommage clair (Attention: vérifier que 'nom' et 'name' sont bien les bons en-têtes de vos Excel)
  select(
    orgunit = nom,             # Supposant que l'en-tête dans dico_cma est 'nom'
    element_donnee = name,     # Supposant que l'en-tête dans dictionnaire_dataE_CMA est 'name'
    pe,
    value
  )

glimpse(dataelement_mai_cma)

# 6. EXPORTATION
write_xlsx(dataelement_mai_cma, here("data", "dataElements_CMA_jan_mai26.xlsx"))

