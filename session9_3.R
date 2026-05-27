# ====================================================================
# Session 9.3
# les tests de normalité et la statistique descriptive groupée.
# tester formellement si une distribution est normale avec shapiro.test()
# produire un tableau de statistiques descriptives groupées propre avec group_by() + summarise()
# choisir le bon résumé (moyenne/SD vs médiane/IQR) en fonction du résultat du test
#gtsummary()
# Auteur: HARO Emmanuel
# ====================================================================

#packages necessaires
library(dplyr)
library(tidyr)
library(stringr)
library(readxl)
library(janitor)
library(ggplot2)
library(readxl)
library(gtsummary)
library(forcats)
library(flextable)

#Bloc A — Import
linelist_raw <- read_excel("linelist_raw.xlsx")
dim(linelist_raw)


# Bloc B — Nettoyage

# normaliser tous les noms
linelist_clean <- linelist_raw |> 
  select(-merged_header, -...28) |>
  clean_names() |> 
  mutate(
    age = as.numeric(age),
    date_onset = as.Date(date_onset))
#Ajouter une colonne delai_hospit 
linelist_clean <- linelist_clean |> 
  mutate(delai_hospit = as.numeric(as.Date(hosp_date) - date_onset),
         age = case_when( 
           age_unit == "months" ~ age/12,
           TRUE                 ~ age),
         gender = fct_recode(gender,
                             "féminin" = "f",
                             "masculin"= "m"),
         outcome = fct_recode(outcome,
                             "Décès"= "Death",
                              "Guéris" = "Recover")
         )

table1_ebola <- linelist_clean |>
  select(outcome, gender, age, temp, wt_kg, delai_hospit,
         fever, chills, cough, aches, vomit) |> 
  tbl_summary(
    by = outcome,
    label = list(
      gender~"Genre", 
      age~"Âge (année)", 
      temp~"Température",
      wt_kg~"Poids(kg)", 
      delai_hospit~"Délai hospitalisation",
      fever~"Fièvre",
      chills~"Frissons",
      cough~"Toux", 
      aches~"Myalgies", 
      vomit~"Vomissement"),
    missing_text = "Données manquantes") |> 
  modify_header(label~"**Caractéristiques**") |> 
  as_flex_table() |> 
  save_as_docx(path ="R-apprentissage-DSBMG/table1_ebola.docx")
  
  
table1_ebola

# ====================================================================

#Tableaux 1 publiables avec `gtsummary`

# ====================================================================

#Packages


table_ebola <- linelist_norm |> 
  select(
    age,gender, wt_kg,
    fever,delai_hospit, outcome
  ) |> 
  mutate(gender = fct_recode(gender,
                             "Féminin" = "f",
                             "Masculin" ="m"),
         outcome = fct_recode(outcome,
                              "Décès"= "Death",
                              "Guéris" = "Recover")
         ) |> 
  tbl_summary(
    label = list(
      age ~ "Âge (ans)",
      wt_kg ~ "Poids (kg)",
      outcome ~ "Issue clinique",
      gender ~ "Sexe",
      fever ~ "Fièvre",
      delai_hospit ~ "Délais hospitalisation"),
    missing_text = "Indisponibles") |> 
  modify_header(label~"**Caractéristiques**") |> 
  as_flex_table() |> 
  save_as_docx(path = "tableau1_ebola.docx")

table_ebola
#Les noms de colonnes sont en anglais et en snake_case :

# ====================================================================

#Session 9.4 — Mise en forme avec flextable pour Word

# ====================================================================

library(flextable)

linelist_clean |> 
  summarise(n = n(), .by = age_unit)
skimr::skim(linelist_clean)

