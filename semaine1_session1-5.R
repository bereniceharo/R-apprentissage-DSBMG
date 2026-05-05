# --- Question 1 -----------------------------------
#La couvertures cpn4 de chacune des 12 
#formations sanitaires est-elle au dessus
#ou au dessous de l'objectif période?
# ---------------------------------------
# créer vecteur de cpn4 (colonne cpn4)
cpn4 <- c(63, 48, 71, 29, 85, 52, 44, 78, 91, 37, 66, 55)
# créer variable cpn4 et lui assigner le vecteur logique des couvertures < 60%
cpn_bas <- cpn4 < 60
# nombre de formations sanitaire avec couverture cpn4
# au dessous de 60%
sum(cpn_bas) 
# nombre de formations sanitaire avec couverture cpn4
# au dessus ou egal à 60% 
sum(!cpn_bas)
# Reponse question 1: Parmi les 12 formations sanitaires,
# la moitéié a une couverture cpn4 inférieure à
# l'objectif période de 60%

# --- Question 2 ---------------------------------------
# Combien de formation sanitaires ont une couverture au 
# moins égale à l'objectif période?
# Cette question a été repondue dans la question 1 avec 
# sum(!cpn_bas)
# Reponse: 6 formations sanitaires ont une couverture au moins
# au moins égale à la couverture période

# --- Question 3 -----------------------------------------
# Quelle est la formation sanitaire ayant la meilleure couverture cpn4?
# identifier la position de la couverture maximale dans le vecteur cpn4
which.max(cpn4)
# Reponse: La formation sanitaire ayant la meilleure cpn4 occupe
# la position 9 dans le vecteur cpn4.

# --- Question 4 -----------------------------------------
# Quelle est la formation sanitaire ayant la couverture cpn4 la plus basse?

# identifier la valeur minimum de couverture cpn4
min(cpn4) 
# identifier la position de la valeur minimum
which.min(cpn4)
# Reponse: La formation sanitaire ayant la  cpn4 la plus basse occupe
# la position 4 dans le vecteur cpn4.

# --- Question 5 -----------------------------------------
# Quelle est la moyenne des couvertures cpn4 des 12 formations sanitaires

# Deterniber la couverture moyenne des 12 formations sanitaires
moyenne_12fs <- mean(cpn4, na.rm = TRUE)
# arrondir pae excès à deux chiffres après la virgule le résultat
round(moyenne_12fs, 2)
# reponse: la moyenne des couvertures cpn4 des 12 FS est de 59,92. 
# ce qui est en dessous de l'objectif periode de 60%. Des efforts restent à faire

sd(cpn4)
moy_sd <- moyenne_12fs - sd(cpn4)
moy_sd
cpn4 < moy_sd
which(cpn4 < moy_sd)
