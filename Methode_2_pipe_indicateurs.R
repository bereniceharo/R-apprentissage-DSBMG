# ==============================================================================
# PROJET      : ENDOS-BF Production
# SCRIPT      : Extraction et nettoyage des indicateurs clés CSPS
# OBJECTIF    : Construire un data frame propre des indicateurs pour les 48 CSPS 
#               publics avec identification explicite des données manquantes (NA).
# NOTE        : Le périmètre exclut volontairement le CMA/HD-BMG ainsi que les 
#               infrieries par ce qu'ils n'ont pas de populations cibles.
# ==============================================================================

library(httr2)
library(dplyr)
library(tidyr)
library(purrr)
library(readxl)
library(writexl)
# ==============================================================================
# 1. PARAMÈTRES ET IMPORTATION DES DICTIONNAIRES
# ==============================================================================

endos_url <- "https://endos.minsante.bf/api"
periodes_analyse <- c("202601", "202602", "202603", "202604")

# Chargement des dictionnaires
df_fs48 <- read_excel("data/dictionnaire_fs_48_district.xlsx")
uids_fs48 <- df_fs48$uid

indicateurs_cle_csps <- read_excel("data/dictionnaire_endos_bf.xlsx", 
                                   sheet = "indicateurs cle csps")
uid_indicateurs_cle <- indicateurs_cle_csps$id

# ==============================================================================
# 2. REQUÊTE API ENDOS-BF
# ==============================================================================

requete <- request(endos_url) |>
  req_url_path_append("analytics") |>
  req_url_query(
    dimension = c(
      paste0("dx:", paste(uid_indicateurs_cle, collapse = ";")),
      paste0("pe:", paste(periodes_analyse, collapse = ";")),
      paste0("ou:", paste(uids_fs48, collapse = ";"))
    ),
    .multi = "explode"
  ) |>
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD"))
  
# Exécution
reponse <- req_perform(requete)
corps_json <- resp_body_json(reponse)

# ==============================================================================
# 3. TRAITEMENT ET NETTOYAGE DES DONNÉES
# ==============================================================================

# Extraction des noms de colonnes depuis l'en-tête de l'API
noms_colonnes <- map_chr(corps_json$headers, "name")

# Conversion du JSON en data.frame de manière fonctionnelle
donnees_brutes <- corps_json$rows |> 
  map(~ as.data.frame(t(unlist(.x)))) |> 
  list_rbind() |> 
  setNames(noms_colonnes) |> 
  mutate(value = as.numeric(value))

# Création du panel complet (intégration des NA) et jointures des métadonnées
donnees_finales <- donnees_brutes |>
  # 3.1. Génération de toutes les combinaisons possibles (Révèle les NA)
  complete(
    ou = uids_fs48, 
    pe = periodes_analyse, 
    dx = uid_indicateurs_cle
  ) |>
  # 3.2. Ajout des libellés (Formations sanitaires et Indicateurs)
  left_join(df_fs48, by = c("ou" = "uid")) |>
  left_join(indicateurs_cle_csps, by = c("dx" = "id")) |>
  # 3.3. Réorganisation et nettoyage des colonnes inutiles
  relocate(formations_sanitaires, indicateurs) |> 
  select(-ou, -dx)

# ==============================================================================
# 4. EXPORTATION
# ==============================================================================

write_xlsx(donnees_finales, "data/taux2026_11_indicateurs_avril.xlsx")

