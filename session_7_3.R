#===========================================================
# Session 7.3 — geom_line() : suivre l'évolution dans le temps
# Date : 9 mai 2026
# Données : SYNTHESE_TLOH_2026_DS_BLMG.xlsx (déjà nettoyé en RDS)
# Objectif : tracer une courbe avec ggplot2 (geom_line)
#============================================================

library(tidyr)    # nettoyage
library(dplyr)    # manipulation
library(ggplot2)  # visualisation
library(forcats)  # gestion des niveaux de facteur (chargé section 3)


# 1 --- Importer le data frame déjà nettoyé -----------------
tloh_2026 <- readRDS("tloh_data_tidy.rds")
glimpse(tloh_2026)
# Note : 54 lignes (semaines de l'année), 102 colonnes.
# La dernière ligne du fichier source contient un cumul annuel
# avec semaine = NA. À filtrer plus bas (cf. section 3, piège 3).


# 2 --- Préparer le sous-ensemble paludisme -----------------
# prédiction (avant run) : data frame 54 × 3, colonne semaine 
# en facteur avec niveaux S1...S54 dans cet ordre.
#
# Pourquoi facteur ordonné ? Parce que la colonne 'semaine' 
# est de type character. Sans factor + levels, ggplot2 trie 
# alphabétiquement → S1, S10, S11... au lieu de S1, S2, S3...

tloh_palu <- tloh_2026 |>
  select(`Semaines Epidémiologiques`,
         `Paludisme Simple_Total cas`,
         `Paludisme Grave_Total cas`) |>
  rename(semaine = `Semaines Epidémiologiques`) |>
  mutate(semaine = factor(semaine, levels = paste0("S", 1:54)))

# PIÈGE rencontré en session : avoir voulu écrire
#   ... |> factor(semaine, levels = paste0("S", 1:54))
# ne marche PAS. factor() reçoit alors le data frame entier 
# comme premier argument (via le pipe), pas la colonne. 
# Il faut mutate() pour modifier une colonne dans un pipeline.

# Sauvegarde du sous-ensemble nettoyé pour réutilisation
saveRDS(tloh_palu, "palu_2026.rds")


# 3 --- Construire le line chart ----------------------------
# prédiction (avant run) : courbe S1 à S~18 (semaines vécues 
# de 2026), tendance attendue à la hausse vers S15 — 
# justifiée par la saison des pluies qui démarre en avril-mai.
#
# OBSERVATION post-run : prédiction INFIRMÉE.
# Pic réel à S6 (début février), puis décroissance.
# Hypothèse : queue de la saison des pluies 2025 + 
# sur-diagnostic clinique en début d'année. À investiguer 
# en session surveillance épidémio (mois 5).

# --- Vérification qualité données : ligne fantôme ---------
# Le fichier source contient une ligne de cumul annuel 
# (semaine = NA, palu_simple = 61 829). 
# Sans filtre, elle apparaît à la fin de la courbe et 
# fausse l'échelle. Vérification :
total_calc <- sum(tloh_palu$`Paludisme Simple_Total cas`, 
                  na.rm = TRUE) - 61829
total_calc  
# Si le résultat = 61829, la ligne est bien un cumul.
# Filtrer sur !is.na(semaine) suffit à l'éliminer.

# --- Pièges geom_line() avec un facteur sur l'axe x -------
# Piège 1 : sans group = 1 dans aes(), geom_line() ne trace 
# RIEN (warning "Each group consists of only one observation"). 
# Raison : avec un facteur en x, chaque niveau devient un 
# groupe à 1 point.
#
# Piège 2 (non corrigé ici, simple filter suffit) :
# après filter() sur un facteur, les niveaux non utilisés 
# restent dans la définition. fct_drop() permet de les 
# supprimer si besoin.

tloh_palu |>
  filter(!is.na(`Paludisme Simple_Total cas`) & !is.na(semaine)) |>
  ggplot(aes(x = semaine, 
             y = `Paludisme Simple_Total cas`, 
             group = 1)) +    # group = 1 obligatoire ici
  geom_line(color = "blue", linewidth = 1) +
  labs(
    x = "Semaines épidémiologiques",
    y = "Cas de paludisme simple",
    title = "Évolution des cas de paludisme simple",
    subtitle = "District Sanitaire de Boulmiougou — semaines 1 à 18, 2026",
    caption = "Source : TLOH 2026"
  ) +
  theme_bw()


# 4 --- Observations métier ---------------------------------
# - Pic à S6 (début février) : compatible avec la fin de 
#   transmission de la saison des pluies 2025.
# - Décroissance progressive jusqu'à S18, niveau bas 
#   correspondant à la saison sèche.
# - À surveiller : reprise attendue à partir de S20-S25 
#   (début saison des pluies 2026).
#
# Action MCD : suivre l'évolution semaine par semaine, 
# revérifier la nouvelle valeur dès S19 disponible.