# ==============================================================================
# PROJET      : ENDOS-BF Production
# SCRIPT      : Extraction et nettoyage des indicateurs clés CSPS
# OBJECTIF    : Construire un data frame propre des indicateurs pour les 48 CSPS 
#               publics avec identification explicite des données manquantes (NA).
# NOTE        : Le périmètre exclut volontairement 1 structure (CMA) sur les 49 
#               que compte le district pour se concentrer sur le niveau CSPS.
# ==============================================================================
library(httr2)
library(dplyr)
library(tidyr)
library(readxl)
library(writexl)
# ==============================================================================
# PARAMETRES ET IMPORTATION DES DICTIONNAIRES
endos.bf <- "https://endos.minsante.bf/api"
cpn4 <- "zmakCFoXPXN"                                    #CibleFS-Couverture en CPN4
df_fs48 <- read_excel("data/dictionnaire_fs_48_district.xlsx")
uids_fs48 <- df_fs48$uid                                 #toutes les 48 fs publiques
dico_indicateurs <- read_excel("data/dictionnaire_endos_bf.xlsx")
indicateurs_cle_csps <- read_excel("data/dictionnaire_endos_bf.xlsx",
                                   sheet = "indicateurs cle csps")
uid_indicateurs_cle <- indicateurs_cle_csps$id


# --- BLOC 1 ---
#predi: 2112 lignes 4 colonnes
resp <- request(endos.bf) |>
  req_url_path_append("analytics") |>
  req_url_query(
    dimension = c(
      paste0("dx:", paste(uid_indicateurs_cle, collapse = ";")),
      "pe:202601;202602;202603;202604",
      paste0("ou:", paste(uids_fs48, collapse = ";"))
    ),
    .multi = "explode"
  ) |>
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |>
  req_perform()

# --- BLOC 2 ---
body <- resp_body_json(resp)
body$height       #contrôle : 2103, certains services non offert par certaines structures?
length(body$rows)

# --- BLOC 3 ---
#predit: data frame 94x4
df <- as.data.frame(
  do.call(
    rbind, 
    lapply(body$rows, \(ligne) unlist(ligne))),
  stringsAsFactors = FALSE)

colnames(df) <- sapply(body$headers, \(h) h$name)
df$value <- as.numeric(df$value)

dim(df)

# --- BLOC 4 ---
#predit: une data frame de 96x4
grille <- expand.grid(
  ou = uids_fs48,
  pe = c("202601","202602","202603","202604"),
  dx = uid_indicateurs_cle,
  stringsAsFactors = FALSE
)
df2 <- left_join( #association avec la grille des combinaisons
  grille, 
  df, 
  by = c("ou","pe","dx")
)
dim(df2)
#Completer les noms des formations sanitaires
#predit: df 96x5
cle_quadri1_2026 <- left_join(  #joindre les correspondances des noms d'unité
  df_fs48, 
  df2, 
  by = c("uid" = "ou")
) 
quadri1_icle2026 <- left_join(
  indicateurs_cle_csps,
  cle_quadri1_2026,
  by = c("id" = "dx")
)

dim(quadri1_icle2026)

#Netoyage des colonnes
quadri1_icle2026 <- quadri1_icle2026 |> 
  relocate(formations_sanitaires) |> 
  select(-c(id, uid))

#exporter au format excel
write_xlsx(quadri1_icle2026, "data/taux2026_11_indicateurs_avril.xlsx")

