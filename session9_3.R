# ====================================================================
# Session 9.3
# les tests de normalité et la statistique descriptive groupée.
# tester formellement si une distribution est normale avec shapiro.test()
# produire un tableau de statistiques descriptives groupées propre avec group_by() + summarise()
# choisir le bon résumé (moyenne/SD vs médiane/IQR) en fonction du résultat du test
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

#Bloc A — Import
linelist_raw <- read_excel("linelist_raw.xlsx")
dim(linelist_raw)


# Bloc B — Nettoyage

# normaliser tous les noms
linelist_norm <- linelist_raw |> 
  select(-merged_header, -...28) |>
  clean_names() |> 
  mutate(
    age = as.numeric(age),
    date_onset = as.Date(date_onset))

#Bloc C — Tendance centrale et dispersion
#Ajoute une colonne delai_hospit 
linelist_norm <- linelist_norm |> 
  mutate(delai_hospit = as.numeric(as.Date(hosp_date) - date_onset))

dim(linelist_norm)
summary(linelist_norm$age)

set.seed(123)

age_sample <- sample(
  linelist_norm$age[!is.na(linelist_norm$age)], 
  size = 500
)

length(age_sample)
summary(age_sample)

shapiro.test(age_sample)
