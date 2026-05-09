#===========================================================
# Session 7.3 — geom_line() : suivre l'évolution dans le temps
# Date: 9 mai 2026
# Objectif: Traçer une courbe avec ggplot2 avec geom_line()
#============================================================
library(tidyr) #utile pour netoyer les données
library(dplyr)
library(ggplot2)


# 1--- Importer le data frame qui sera utlisé ------------

tloh_2026 <- readRDS("tloh_data_tidy.rds")
glimpse(tloh_2026)
names(tloh_2026)

# 2---Transformer la colonne semaine épidemiologique en facteur----

# prédiction: data frame avec 3 colonnes et 54 lignes. La colonne semaine
# transformée en facteur avec 0 = level "S1"...54 = level "S54"
tloh_palu <- tloh_2026 |> 
  select(`Semaines Epidémiologiques`, 
         `Paludisme Simple_Total cas`,
         `Paludisme Grave_Total cas`
         ) |> 
  rename(semaine = `Semaines Epidémiologiques`)|>
  mutate(semaine = factor(semaine, levels = paste0("S", 1:54)))
#Sauvegarder la sortie du data frame netoyé en .RDS (palu_2026.rds)
# pour usage ultérieur

saveRDS(tloh_palu, "palu_2026.rds")

# 3---Construire un line chart montrant l'évolution des cas de paludisme
# sur les semaines épidémiologiques -------------------------------------

# charger package forcats (tidyverse) pour supprimer les niveaux de facteur
# non utilisé
library(forcats)

#prediction: Retourne une courbe montrant les tendances au cours des semaines 1 à 18,
# avec pic à s6.

tloh_palu |>
  filter(!is.na(`Paludisme Simple_Total cas`) & !is.na(semaine)) |>
  ggplot(
    aes(x = semaine, y = `Paludisme Simple_Total cas`, group = 1) #Tous les points appartiennent au même ensemble
  ) +
  geom_line(color = "blue", linewidth = 1 ) +
  labs(x = "Semaines épidémiologiques",
       y = "Cas de paludisme simple",
       title = "Évolution des cas de paludisme simple",
       subtitle = "District Sanitaire de Boulmiougou — semaines 1 à 18, 2026",
       caption = "source TLOH 2026"
       ) +
  theme_bw()


#Observations





