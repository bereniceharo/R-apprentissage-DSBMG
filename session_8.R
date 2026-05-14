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
library(readxl)


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

#Session 8.3 — Concepts qualité des données
#On commence par la complétude globale sur l'ensemble des indicateurs des FS
#Predic: Retourne 40*34= 1360 valeurs attendues. moins de 100 valeurs manquantes
csps_2025 <- readRDS("csps_2025.rds")
fs <- nrow(csps_2025)
indicateurs <- ncol(csps_2025)
(sum(!is.na(csps_2025))/(fs*indicateurs))*100

#complétude par formation sanitaire, pour identifier les FS les plus problématiques.
#ajoute une colonne complétude des FS variant de 80 à 100%
completude <- numeric()
for (i in 1:length(csps_2025$organisationunitname)) {
  completude[i] <- round((sum(
    !is.na(filter(csps_2025,
                  organisationunitname == organisationunitname[i]
    )))/length(csps_2025))*100, 1)
  }
csps_completude <- csps_2025 |> 
  mutate(completude)

#Calcul de la coomplétude avec dplyr group_by, summarise et across()+ where()
# retourne un data frame avec deux colonnes et 40 lignes
completude_csps <- csps_2025 |> 
  group_by(organisationunitname) |> 
  summarise(completude = (sum(!is.na(across(where(is.numeric)))))/(ncol(csps_2025)-1)*100
  )

#créer colonne type formation sanitaire
fs_2025 <- csps_2025
fs_2025_type <- fs_2025 |> 
  mutate(type_fs = ifelse(grepl("CSPS", fs_2025$organisationunitname), "CSPS",
       ifelse(grepl("CMA", fs_2025$organisationunitname), "CMA", "CM")))
#retourne un data frame avec 3 lignes et 34 colonnes
fs_2025_type |> 
  group_by(type_fs) |> 
  summarise(across(where(is.numeric), \(x) mean(x, na.rm = TRUE)))

saveRDS(fs_2025_type, "fs_2025_type.rds")
# =================================================
#Complétude
#==================================================
#Simulation de séquence de date de transmission
#Le rapport du mois objet est cloturé le 25 du mois. 
#lignes 40 colonnes 35,
#type colonne "date_tranmis": date
#J'ai généré aléaloirement 40 dates entre le 26 janvier et le 10 fevrier. les plages seront aleatoires
set.seed(2026) #fixer le nombre aleatoire généré en mai 2026
date_transmis <- sample(
  seq(as.Date("2025-01-26"), as.Date("2025-02-10"), by = "day"), size = 40,
  replace = TRUE
  )

csps_2025 <- csps_2025 |> 
  mutate(date_transmis)
glimpse(csps_2025)
saveRDS(csps_2025, "csps_2025_aualite.rds")
#Promptitude
# predict: promptitude autour de 80%
promp_fs <- csps_2025 |> 
  filter(date_transmis<= "2025-02-05") |> 
  count()
promptitude <- (promp_fs/40)*100
 
#--- Calcul de la cohérence interne------------
#Predict: On aura moins de 10 formations sanitaires avec plus de 100% de cpn4

csps_2025|>
  filter(`CibleFS-Couverture en CPN4 2025 FS Public`>100) |>
  select(organisationunitname, `CibleFS-Couverture en CPN4 2025 FS Public`)

#Deuxième type de cohérence interne — valeurs contradictoires.
#predict aucune formation sanitaire n'atteindra 100%
csps_2025 |> 
  filter(`SMI-Proportion de femmes vues au 1er trimestre pour la CPN1 2025 FS Public`>100) |> 
  select(organisationunitname, `SMI-Proportion de femmes vues au 1er trimestre pour la CPN1 2025 FS Public`)


# ---Session 8.4 -----------------------------------------------
# Identification des valeurs abérantes
#On code la méthode Tukey sur la colonne CPN4. Voici les étapes :

# Calculer Q1, Q3 et IQR
# Predict: Q1 30, Q3 70, IQR = 15
Q1_cpn4 <- quantile(csps_2025$`CibleFS-Couverture en CPN4 2025 FS Public`, probs =  0.25, na.rm = TRUE)
Q3_cpn4 <- quantile(csps_2025$`CibleFS-Couverture en CPN4 2025 FS Public`, probs =  0.75, na.rm = TRUE)
Q1_cpn4
Q3_cpn4

iqr_cpn4 <- IQR(csps_2025$`CibleFS-Couverture en CPN4 2025 FS Public`,
                type = 7, na.rm = TRUE)
iqr_cpn4

# Calculer les bornes inférieure et supérieure
#predict: min = 12%, max = 200%
borne_inf_tukey <- Q1_cpn4 - 1.5*iqr_cpn4
borne_sup_tukey <- Q3_cpn4 + 1.5*iqr_cpn4

borne_inf_tukey
borne_sup_tukey

# Filtrer les FS hors bornes
#predict: 15 formations sanitaires hors bornes
csps_2025 |> 
  filter(`CibleFS-Couverture en CPN4 2025 FS Public`< borne_inf_tukey|
           `CibleFS-Couverture en CPN4 2025 FS Public`>borne_sup_tukey) |> 
  select(organisationunitname, `CibleFS-Couverture en CPN4 2025 FS Public`)








# - Est-ce que pour le parametre orders de parse_date_time() on doit systématiquement lister les trois formats de date (dmy, myd et ymd)?
# - Si  une colonne compte des date au format janvier, février, mars en français. que faut-il faire?
# est ce qu'on vera ces fonction where plus tard et across?
# quel est ta critique sur mon code?
# pourquoi length(csps_2025)-1 n'est pas le bon denominateur. explique moi la différence fondamentale avec ncol(csps_2025)-1
# library(writexl)
# write_xlsx(csps_2025, "csps_2025.xlsx")




