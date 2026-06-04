###############################################################################
# TITRE       : Dictionnaire des FS publiques de district (semaine 11, sans filet)
# FICHIER     :
# AUTEUR      : HARO Emmanuel
# DATE        : 03/06/2026
# VERSION     : 1.0.0
#
# DESCRIPTION :
# Production autonome du pipeline complet de la semaine 11 sur les données
# ENDOS-BF de production : authentification, navigation, pagination,
# filtrage, jointure et export.
#
# ENTREES     : API ENDOS
###############################################################################
# Contexte métier. Tu veux individualiser les 48 formations sanitaires publiques de district du DS-BMG — celles qui portent le suivi des indicateurs — en excluant les services du CMA, infirmeries et SST qui se sont retrouvés mélangés dans ton extraction des 75. Livrable : un dictionnaire propre dictionnaire_fs_publiques_district.xlsx (UID ↔ nom lisible), versionné sur GitHub.

# Les packages utiles
library(dplyr)
library(usethis)
library(httr2)

# 1. Authentification — requête de base----- 
#predict: status de l'appel API de ENDOS retourne 200
response_endos <- request("https://endos.minsante.bf/api") |> 
  req_url_path_append("me") |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform()






