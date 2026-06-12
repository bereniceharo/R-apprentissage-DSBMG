# # ==============================================================================
# PIPELINE ETL — PALUDISME (Simple + Grave), TLOH 2025 vs 2026
# Objectif : actualiser fichier source → exécuter → tableaux nettoyés + graphiques pour équipe et tableau de bord
# Source : SYNTHESE_TLOH_2025_BLMG.xlsx (feuille Feuil1) + SYNTHESE_TLOH_2026_DS_BLMG.xlsx (feuille Base TLOH 2026)
# # ==============================================================================
# 
# .PHASE 0 — CONFIGURATION  [NOUVEAU partiel]
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(ggplot2)
library(forcats)
library(janitor)
library(here)
#
#   PARAMETRES :

current_year <- 2026
current_week <- 23
# 
# PHASE 1 — PRÉPARATION DES DONNÉES (Data Wrangling)
# 
#     BLOC 1 — Importation brute des deux années
tloh_2025_brute <- read_excel(here("paludisme", "SYNTHESE TLOH 2025_BLMG.xlsx"), 
                        col_names = FALSE)
tloh_2026_brute <- read_excel(
  here("paludisme", "SYNTHESE_TLOH_2026_DS_BLMG.xlsx"),
  sheet = "Base TLOH 2026",col_names = FALSE) |> 
  slice(-3)  #la ligne 3 qui est vide 

#     BLOC 2 — Reconstruction des noms de colonnes----

# Bloc 2.1 table 2025
#   Récupérer les 2 lignes d'en-tête de la table 2025 (maladie en haut, Cas/Décès en bas)
ligne_1 <- unlist(tloh_2025_brute[1, ])
ligne_2 <- unlist(tloh_2025_brute[2, ])

#     Propager le nom de maladie sur les cellules fusionnées vides  -> forward fill 
#2025
for(i in 2:length(ligne_1)){
  if (is.na(ligne_1[i])){
    ligne_1[i] <- ligne_1[i-1]
  }
}
#     Fusionner les 2 niveaux en un nom unique (ex. "palu_simple_cas")
names_1 <- paste(ligne_1, ligne_2, sep = "_")
#     Réassigner ces noms au tibble  -> colnames() (#69), unlist() (#91)
colnames(tloh_2025_brute) <- names_1
#     Normaliser les noms de colonnes
tloh_2025_brute <- clean_names(tloh_2025_brute) |> 
  rename(
    semaine_epi = semaines_epidemiologiques_na
  )

## Bloc 2.2 table 2026
ligne_1 <- unlist(tloh_2026_brute[1, ])
ligne_2 <- unlist(tloh_2026_brute[2, ])

for(i in 2:length(ligne_1)){
  if (is.na(ligne_1[i])){
    ligne_1[i] <- ligne_1[i-1]
  }
}
names_2 <- paste(ligne_1, ligne_2, sep = "_")
colnames(tloh_2026_brute) <- names_2
tloh_2026_brute <- clean_names(tloh_2026_brute) |> 
  rename(
    semaine_epi = semaines_epidemiologiques_na
  )

#   BLOC 3 — Sélection du paludisme + standardisation des types et NA

#   Table TLOH 2025----

#predit: data frame 23x7, colonnes numériques sauf semaine_epi
tloh_2025_clean <- tloh_2025_brute |> 
  filter(
    !(is.na(semaine_epi)
      |semaine_epi=="Semaines Epidémiologiques"
      |semaine_epi == "DS"
      )
         ) |> 
  select(
    semaine_epi,
    palu_simple      = palu_simple_cas, 
    palu_simple_5ans = palu_simple_dont_5ans,
    palu_grave       = pg_cas,
    palu_grave_5ans  = pg_dont_5ans,
    palu_grave_dcd   = pg_dcd,
    pg_dcd_5ans      = pg_dont_5ans_2
    ) |> 
# Nettoyer la colonne semaine "S1", 
  mutate(
    semaine_epi = as.numeric(str_remove(semaine_epi, "S")),
    across(where(is.character), as.numeric)
    ) |> 
# Exclure les semaines hors période
  filter(semaine_epi <= current_week)

#Contrôler et valider le remplacement des NA
exist_NA <- sum(is.na(tloh_2025_clean))
cat("Nombre total de valeurs manquantes (NA):",exist_NA)
if(exist_NA !=0){
  tloh_2025 <- mutate(tloh_2025_clean, across(where(is.numeric),~coalesce(.x, 0)))
  cat(exist_NA,"valeur(s) manquante(s) sont remplacées par 0.")
}else{
  tloh_2025 <- tloh_2025_clean
  cat("Le data frame n'a pas de valeurs manquantes")
}

# TLOH 2026----

tloh_2026_clean <- tloh_2026_brute |> 
  filter(
    !(is.na(semaine_epi)
      |semaine_epi=="Semaines Epidémiologiques"
      |semaine_epi == "TOTAL"
    )) |> 
  select(
    semaine_epi,
    palu_simple      = paludisme_simple_total_cas, 
    palu_simple_5ans = paludisme_simple_dont_5ans,
    palu_grave       = paludisme_grave_total_cas,
    palu_grave_5ans  = paludisme_grave_dont_5ans,
    palu_grave_dcd   = paludisme_grave_dcd,
    pg_dcd_5ans      = paludisme_grave_dont_5ans_2
  ) |>
  mutate(
    semaine_epi = as.numeric(str_remove(semaine_epi, "S")), 
    across(where(is.character), as.numeric)
  ) |>  
  filter(semaine_epi <= current_week)

exist_NA <- sum(is.na(tloh_2026_clean))
cat("Nombre total de valeurs manquantes (NA):",exist_NA,"\n")
if(exist_NA !=0){
  tloh_2026 <- mutate(tloh_2026_clean, across(where(is.numeric),~coalesce(.x, 0)))
  cat(exist_NA,"valeur(s) manquante(s) sont remplacées par 0. \n")
}else{
  tloh_2026 <- tloh_2026_clean
  cat("Le data frame n'a pas de valeurs manquantes.\n")
}

#vérifier que la structure des colonnes est identique entre année
identical(names(tloh_2025), names(tloh_2026))
dim(tloh_2025)
dim(tloh_2026)
#       
#       PHASE 2 — TRANSFORMATION ET CALCULS
#       
#       BLOC 4 — Fusion des deux années
#       Ajouter une colonne "annee" à chacun
tloh_2025 <- tloh_2025 |> 
  mutate(annee = "2025")
tloh_2026 <- tloh_2026 |> 
  mutate( annee = "2026")

#         Empiler verticalement les deux tables
# Predit: table 46X8
tloh_combine <- bind_rows(tloh_2025, tloh_2026) |> 
  mutate(
    annee = factor(annee, levels = c("2025", "2026"))
    )

glimpse(tloh_combine)
levels(tloh_combine$annee)
#           
#           BLOC 5 — Calculs d'indicateurs paludisme
#     Total cas simple + grave, létalité grave = décès/cas, proportion grave/total
paludisme_annuel <- tloh_combine |> 
  summarise(
    total_ps       = sum(palu_simple),
    total_pg       = sum(palu_grave),
    total_dcd      = sum(palu_grave_dcd),
    letalite_grave = if_else(total_pg == 0, NA_real_,
                             round((total_dcd/total_pg)*100, 1)),
    proportion_grave = round((total_pg/(total_ps+total_pg))*100,1),
    .by = annee
  )

paludisme_semaine <- tloh_combine |> 
  summarise(
    total_ps       = sum(palu_simple),
    total_pg       = sum(palu_grave),
    total_dcd      = sum(palu_grave_dcd),
    letalite_grave = if_else(total_pg == 0, NA_real_,
                             round((total_dcd/total_pg)*100, 1)),
    proportion_grave = round((total_pg/(total_ps+total_pg))*100,1),
    .by = semaine_epi
  )
print(paludisme_annuel)
#           
#           PHASE 3 — VISUALISATION (ggplot2)
#           
#           BLOC 6 — Courbe d'évolution hebdomadaire 2025 vs 2026
#     Cas de paludisme par semaine, une courbe par année  
#     Sortie : graphique superposant les 2 années
courbe_ps <- tloh_combine |> 
  ggplot(
    aes(x = semaine_epi, y = palu_simple, color = annee)
  )+
  geom_line()+
  geom_point()+
  scale_x_continuous(breaks = seq(0,23, by = 1))


str(tloh_combine)



#   BLOC 7 — Graphique de sévérité / létalité
#     [optionnel selon ce que tu veux montrer]  -> geom_col (#26), fct_reorder (#51) si classement
#     Sortie : barres ou lollipop de l'indicateur de gravité
#           
#           BLOC 8 — Habillage  -> theme_minimal (#33), labs(), scales  -> [révision #33 le piège de l'ordre des couches]
#             
#             
#             PHASE 4 — CHARGEMENT (Load) / EXPORT AUTOMATISÉ
#             
#             BLOC 9 — Sauvegarde reproductible
#             Tableau nettoyé  -> write_xlsx ou write_csv2 (#8b)
#               Graphiques  -> ggsave avec width/height/dpi/bg explicites (#35) [révision du jour]
#                 [NOUVEAU] nom de fichier dynamique avec la date/semaine  -> paste0() ou glue() (à présenter)
#                 Sortie : fichiers .xlsx et .png horodatés, prêts à partager / afficher