# ====================================================================
# Session 10.1 
#Concepts HTTP et premier appel httr2
# comprendre ce qu'est une requête HTTP, ce que fait httr2, et exécuter 
#ton premier appel à une API publique.
# Auteur: HARO Emmanuel
# ====================================================================

library(httr2)

#Requête sur un serveur public
reponse <- request("https://httpbin.org/get") |> 
  req_perform() |> 
  resp_body_json()
#Lecture de la reponse par httr2
donnees <- reponse |> 
  resp_body_json()
# Ajout de paramètres
reponse2 <- request("https://httpbin.org/get") |> 
  req_url_query(district = "Boulmiougou",
                annee = 2025) |> 
  req_perform()

donnees2 <- reponse2 |> 
  resp_body_json()

donnees2
# ==============================================================================
#Session 10.2 — Format JSON et jsonlite
#L'objectif de cette session : comprendre la structure du format JSON, savoir 
#le parser avec jsonlite::fromJSON(), et naviguer dans une liste R imbriquée à 
#plusieurs niveaux — comme tu le feras avec les réponses ENDOS-BF.
# ==============================================================================
library(jsonlite)

#Voici le premier bloc.

json_texte <- '{"district": "Boulmiougou", "cpn4": 67.3, "annee": 2025}'

resultat <- fromJSON(json_texte)

resultat
class(resultat$annee)

# un JSON plus proche de la réalité ENDOS-BF 
json_fs <- '[
  {"fs": "CSPS Bissighin", "cpn4": 67.3, "mois": "Janvier"},
  {"fs": "CSPS Tampouy",   "cpn4": 54.1, "mois": "Janvier"},
  {"fs": "CSPS Nagrin",    "cpn4": 81.2, "mois": "Janvier"}
]'

resultat2 <- fromJSON(json_fs)

resultat2
class(resultat2)

#un JSON imbriqué à plusieurs niveaux, structuré comme une vraie réponse ENDOS-BF
# 1. liste,
# 2. dataframe 3X2
# 3. dataframe, 3X3. Type cpn4("67.3") = chr

json_endos <- '{
  "headers": [
    {"name": "ou",    "column": "Organisation unit"},
    {"name": "pe",    "column": "Periode"},
    {"name": "value", "column": "Valeur"}
  ],
  "rows": [
    ["CSPS Bissighin", "202501", "67.3"],
    ["CSPS Tampouy",   "202501", "54.1"],
    ["CSPS Nagrin",    "202501", "81.2"]
  ],
  "height": 3
}'

resultat3 <- fromJSON(json_endos)

class(resultat3)
resultat3$headers
resultat3$rows
resultat3$height

#Convertit resultat3$rows en data frame
#predit: nouveaux data frame de 3X3 
df_fs <- as.data.frame(resultat3$rows)
colnames(df_fs) <- resultat3$headers$name
df_fs <- df_fs |> 
  mutate(value = as.numeric(value))
df_fs
glimpse(df_fs)

#Session 10.3 — Authentification et sécurité
#L'objectif : comprendre comment prouver ton identité à un serveur API sans jamais écrire ton mot de passe dans ton script — et comprendre pourquoi c'est critique.

fct_recode()



