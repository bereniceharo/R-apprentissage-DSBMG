# ==============================================================================
# PROJET      : export en table d'indicateurs
# SCRIPT      : Pipline Extraction nettoyage des indicateurs FS 2025
# OBJECTIF    : Netoyer, transformer et exporter des données d'indicateurs sous forme de table publiable
# ==============================================================================

# ====================
# Packages necessaires
# ====================
library(gtsummary)
library(readxl)
library(dplyr)
library(stringr)
library(flextable)
library(here)

# ====================
# PIPELINE DE NETOYAGE TRANSFORMATION ET EXPORT EN TABLE D'INDICATEURS
# ====================
# Prédiction: Une table de dimension 48x5 comprenant les 48 formations sanitaires 
#             publiques du district et comme colonnes 4 indicateurs chosis et 1 colonne 
#             catégorielle du type des formations sanitaires.

# 1.Import du fichier source
df_indicators <- read_excel("indicateurs_FS_2025.xlsx",
                            sheet = "FS_2025", skip =1) |> 
  
# 2. Filtrer et exclure les autres FS de type CMA et infirmérie
  filter(str_detect(
    organisationunitname,
    regex(
      "CMA Pissy:|CM camp|infirmerie|infirmérie|DS Boulmiougou",
      ignore_case = TRUE),
    negate = TRUE)) |> 
  
# 3. Créer une colonne spécifiant pour chaque FS son type (CSPS, CM, Dispensaire)
  mutate(
    type_fs = factor(case_when(
    str_detect(organisationunitname, "CSPS")~ "CSPS",
    str_detect(organisationunitname, "CM")~ "CM",
    str_detect(organisationunitname, "Dispensaire") ~ "Dispensaire",
    TRUE ~ NA_character_
  ), levels = c("Dispensaire", "CSPS", "CM"))
  ) |> 
  
# 4. Garder les colonnes des variables d'intérêt
  select( 
    `Couverture CPN4 (%)` = `CibleFS-Couverture en CPN4 2025 FS Public`,
    `Couverture accouchement (%)` = `CibleFS-Couverture en accouchement 2025 FS Public`,
    `Utilisation Methode contraceptive` = `CibleFS-Taux d'utilisation des méthodes contraceptives 2025 FS Public`,
    `Proportion enfants PCIME (%)` = `CE-Proportion d’enfants PEC selon l’approche PCIME 2025 FS Public`,
    `Type de formation sanitaire` = type_fs
    ) |> 
# 5. Transformer le data frame en table d'indicateurs publiable et formater
  tbl_summary(by = `Type de formation sanitaire`) |> 
  modify_header(label= "**Indicateurs**") |> 
  
# 6. Transformer la table en objet flextable exportable
  as_flex_table() |> 
  save_as_docx(path = here("data", "table_indicateurs.docx"))

df_indicators
  
