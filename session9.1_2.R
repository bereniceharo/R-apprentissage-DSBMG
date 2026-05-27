# ====================================================================
# Session 91
# OTendance centrale et dispersion : choisir le bon résumé selon la distribution
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
summary(linelist_norm$age)
summary(linelist_norm$delai_hospit)


age_delai <- linelist_norm |> 
  summarise(
    n = n(),
    manquant = sum(is.na(age)),
    min = min(age, na.rm = TRUE),
    max = max(age, na.rm = TRUE),
    mediane = median(age, na.rm = TRUE),
    q1 = quantile(age, 0.25, na.rm = TRUE),
    q2 = quantile(age, 0.75, na.rm = TRUE)
  )
  
delai_hospit <- linelist_norm |> 
  summarise(
    n = n(),
    manquant = sum(is.na(delai_hospit)),
    min = min(delai_hospit, na.rm = TRUE),
    max = max(delai_hospit, na.rm = TRUE),
    mediane = median(delai_hospit, na.rm = TRUE),
    q1 = quantile(delai_hospit, 0.25, na.rm = TRUE),
    q2 = quantile(delai_hospit, 0.75, na.rm = TRUE)
  )

#Bloc 1 — geom_histogram()

# prédit : structure: numeric continue, type numeric, 
#fourchette des valeurs sur l'axe x: 3
age_dist <- linelinelist_norm |> 
  ggplot(aes(x = age))+
  geom_histogram(bins = 30)+
  labs(
    x = "age (année)",
    title = "distribution de l'age des patients"
  )

#Bloc 2 — geom_boxplot()

# prédit : [combien de boîtes: 2, fourchette approximative de l'axe y: 0 à 85,
#  est-ce que tu t'attends à voir des points aberrants ? Oui

linelist_norm |> 
  ggplot(aes( x = outcome, y = age))+
  geom_boxplot()+
  labs(
    y = "age(année)",
    x = "outcomes",
    title = "Distribution de l'age selon l'issue des patients"
  )
table(linelist_norm$outcome, useNA = "always")

# Bloc 3 — geom_density()
# prédit : [nombre de courbes: 3, forme attendue: étalée vers la droite,
#           est-ce que tu t'attends à ce que les trois courbes se superposent
#           ou soient bien séparées? Courbes supperposées]

linelist_norm |> 
  ggplot(aes( x = age, colour = outcome))+
  geom_density()+
  labs(
    x = "age(année)",
    title = "Distribution de l'age selon l'issue des patients"
  )

#QQ plot
# prédit : les points ne vont pas s'aligner sur la droite, ils vont s'en ecarter 
#en remontant vers le haut par ce que la distribution est asymétrique à droite.

linelist_norm |> 
  ggplot(aes(sample = age))+
  stat_qq()+
  stat_qq_line()
  
qqnorm(linelist_norm$age)
qqline(linelist_norm$age)

#===============================================================================
#Questions: 
#Quelles sont les ameliorations qu'on peut apporter à geom_histogramme 
#pour une éventuelle présentation'?

