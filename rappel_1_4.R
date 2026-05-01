# ------------------------------------------------------------------------------
# Question 1 — Indexation et data frames
# ------------------------------------------------------------------------------
# Creer data frame fs_district
fs_district <- data.frame(
  nom_fs     = c("CSPS Boassa", "CSPS Bazoulé", " CMA Pissy", " CSPS Tanghin",
                 " CMU Zagtouli"),
  type       = c( "CSPS", "CSPS","CMA","CSPS","CMU"),
  cpn4       = c(145, 89, 420, 212, 510),
  population = c(8200, 6500, 18000, 9100, 21000)
)
# ---Trois manières différents d'extraires la colonne cpn4 --- 
fs_district["cpn4"] # retourne une data frame d'une colonne
fs_district[["cpn4"]] # retourne un vecteur de valeurs de la colonne
fs_district$cpn4 # l'équivalent du précendant. retourne un vecteur

# ------------------------------------------------------------------------------
# Question 2 — Vecteurs, indexation, et famille which()
# ------------------------------------------------------------------------------
# 2a
cpn4_pct <- c(82, 67, NA, 91, 45, 73, NA, 58)
# Retourne position des formations sanitaire dont couverture <= 60%

which(cpn4_pct <= 60) # prédit: Retourne vecteur contenant les index des valeurs TRUE

# 2b retourne les valeurs de couverture (pas les positions) des FS qui sont 
# strictement au-dessus de la moyenne des couvertures observées (sans les NA)

cpn4_pct[cpn4_pct > mean(cpn4_pct, na.rm = TRUE)] # prédit: retourne un vecteur des 
# valeurs des FS > moyenne sans les NA

#2c
which.min(cpn4_pct) #prédit: retourne index 5

#Quelle est la différence entre which(cpn4_pct > X) et cpn4_pct[cpn4_pct > X] ?
# which(cpn4_pct > X) retourne un vecteur constitué des positions correspondants 
# aux "TRUE" de la condition
# cpn4_pcy[cpn4_pct > X], retourne un vecteur constitué des valeurs correspondant
# aux "TRUE" de la condition
# Par ailleurs, which() ne tient pas compte des NA donc n'affiche pas des NA dans
#le vecteur résultat alors que cpn4_pcy[cpn4_pct > X], tient compte des NA dans le résultats
# Pour les exclure, il faut necessairement faire une condition associée avec & 
# entre les non NA et les valeurs disponibles (!is.na(X)&X)

cpn4_pct[!is.na(cpn4_pct) > mean(cpn4_pct, na.rm = TRUE)]
# Résultat attendu : 82 91 73

# ---Question 3 ------
fs_district <- data.frame(
  nom_fs = c("CSPS Boassa", "CSPS Bazoulé", "CMA Pissy",
             "CSPS Tanghin", "CMU Zagtouli", "CSPS Wayalghin",
             "CSPS Sandogo", "CSPS Tampouy"),
  cpn4 = c(145, 89, 420, 212, 510, NA, 178, 95),
  attendues = c(180, 110, 480, 240, 550, 130, 200, 140)
)
#3a
fs_district$couverture_pct <- round((fs_district$cpn4/fs_district$attendues)*100)
fs_district # retourne une data frame avec une nouvelle colonne couverture_pct

#3b
fs_district[!is.na(fs_district$couverture_pct) & fs_district$couverture_pct <80, ]
# retourne une data frame contenant toutes les colonnes,
# mais uniquement pour les FS avec les couverture_pct <80 et sans NA

#3c
fs_district[which.max(fs_district$couverture_pct), "nom_fs" ]
# Retourne le nom de la formation sanitaire ayant la couverture la plus élevée

#3d
# Une seule formation sanitaire a une faible performance en couvertures cpn4 (inférieure à 80%).
# Cela parrait étrange. Une investigation par l'ECD dans ladite formation sanitaire est requise pour identifier
# les facteurs de contre-performance.
fs_district[which(fs_district$couverture_pct == max(fs_district$couverture_pct, na.rm = TRUE)), "nom_fs"]















