# ==============================================================================
# Section 8: Lubridate
# Objectif de la session : parser des dates, en extraire des composantes 
#(mois, année), calculer des différences. Appliqué aux données du DS-BMG.
# Date: 12 mai 2026
#Auteur: HARO Emmanuel
# ==============================================================================

# chargement des packages utiles ----
library(lubridate)
library(dplyr)
library(tidyr)
library(stringr)


# 1---Importation du data set ----
meningite_list <- read.csv("line_liste_meningite_boulmiougou.csv")
glimpse(meningite_list)
head(meningite_list, 4)

# 2---Transformer date_debut_symptomes avec parse_date_time ---
# prediction: "date_debut_symptômes" est transformé en un format unique "dmy" dans une colonne debut_symptom tout en gardant l'ancienne colone "date_debut_symptômes"  
meningite_clean <- meningite_list |> 
  mutate(date_symptoms = as.Date(parse_date_time(
    date_debut_symptomes,
    orders = c("ymd","mdy", "dmy"))))
#Avant de continuer, vérifié systématiquement la qualité du parsing en comptant # les NA
sum(is.na(meningite_clean$date_symptoms))

# 3---Nombre de cas par semaine epidémiologique pour tracer une courbe #épidémique
#prediction: Retourne une data frame avec 2 colonnes (semaine et nb_cas) 
# et n-lignes de semaines epidemiologiques
meningite_se <- meningite_clean |> 
  mutate(semaine = epiweek(date_symptoms)) |> 
  group_by(semaine) |> 
  summarise(nb_cas = n())

head(meningite_se, 5)

#calcul de délai: date_debut_symptomes et date_consultation

#Et determination du nombre de cas depassant 48 heures
#prediction: Retourne le nombre de cas ayant un delai_consultation de plus de 48 heures (2 jours)
meningite_clean <- meningite_clean |> 
  mutate(date_consult2 = as.Date(
    parse_date_time(date_consultation,
                    orders = c("dmy", "ymd", "mdy")
                    ))) |>
  mutate(delai_consultation = as.numeric(
    date_consult2 - date_symptoms))
 #nombre de cas avec delai superieur à 2 jours 
 sum(meningite_clean$delai_consultation>2, na.rm = TRUE)
 # nombre de NA dans delai_consultation
 sum(is.na(meningite_clean$delai_consultation))
 # delai maximum observé
 max(meningite_clean$delai_consultation)
  

meningite_clean[which.max(meningite_clean$delai_consultation), c("date_debut_symptomes", "date_consultation", "date_symptoms", "date_consult2", "delai_consultation")]

#Session 8.2 — stringr avancé : regex pour normaliser des noms

# 8.2.1---Supprimer un préfixe répétitif (CSPS , CMA de )----

# retourne un vecetur avec les nom des formations sanitaires sans "CSPS" et "CMA de "
meningite_clean <- meningite_clean |> 
  mutate(fs_clean = str_remove(
    formation_sanitaire,
    "^[A-Z]+(\\s)(de )?"
    ))
# 8.2.2----- noms trop longs-----------------------------------
#Les noms des csps presenteront un maximum de 10 caractères. seul "Bonnheur ville" sera touché
meningite_clean <- meningite_clean |> 
  mutate(
    fs_tronque = str_trunc(fs_clean,
                           width = 7,
                           ellipsis = "..."))

# 8.2.3--- Troisième problème — détecter les variantes d'orthographe---------------

# pipeline complet pour isoler toutes les lignes dont formation_sanitaire contient "Tanghin" quelle que soit la casse. Prédiction en commentaire d'abord.
# Retourne un data frame filtrer sur les lignes contenant tanghin
meningite_tanghin <- meningite_clean |> 
  filter(str_detect(formation_sanitaire,
                    regex("tanghin", ignore_case = TRUE)))

unique(meningite_tanghin$formation_sanitaire)







#Questions
# - Est-ce que pour le parametre orders de parse_date_time() on doit systématiquement lister les trois formats de date (dmy, myd et ymd)?
# - Si  une colonne compte des date au format janvier, février, mars en français. que faut-il faire?







