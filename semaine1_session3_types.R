# ==========================================
# District sanitaire de Boulmiougou
# HARO Emmanuel
# Date : 22 avril 2026
# Objectif : apprentissage des types de données en R
# ==========================================

couverture_cpn4 <- 67.4
couverture_cpn4
class(couverture_cpn4)

# Creation d'objets
nom_fs <- "csps zongo"
class(nom_fs)
objectif_atteint <- TRUE
class(objectif_atteint)
nb_accouchements_manquant <- NA
class(nb_accouchements_manquant)

z <- c(TRUE, FALSE, 1)
class(z)
z
sum(z)

a <- "5"
b <- 3
a + b
codes <- c("1", "2", "10", "20")
sort(codes)

x <- c(67.4, 82.1, NA, 45.0, 78.3)
sum(x)
mean(x)

NA == NA
NA > 5
NA == TRUE

x <- c(67.4, 82.1, NA, 45.0, 78.3)
x == NA

x <- c(67.4, 82.1, NA, 45.0, 78.3)
sum(x, na.rm = TRUE)
mean(x, na.rm = TRUE)

is.na(x)
sum(is.na(x))
(sum(is.na(x))/length(x))*100

csps <- c("CSPS Pissy", "CSPS Zongo", "CSPS Tanghin", "CSPS Karpala",
          "CSPS Bassinko")
couverture_cpn4 <- c(67.4, 82.1, NA, 45.0, 78.3)
cpn4_moyen <- mean(couverture_cpn4, na.rm = TRUE)
rapport_manquant <- sum(is.na(couverture_cpn4))
prop_manquants <- (sum(is.na(couverture_cpn4)) /length(couverture_cpn4))
csps_faible <- sum(couverture_cpn4 < 50, na.rm = TRUE)

couverture_cpn4[1]
couverture_cpn4[2]
couverture_cpn4[0]
couverture_cpn4[6]

couverture_cpn4[c(1,3)]
couverture_cpn4[c(3, 4, 5)]
couverture_cpn4[-2] 
couverture_cpn4[3:5]

couverture_cpn4[couverture_cpn4 < 50]

couverture_cpn4[couverture_cpn4 >= 80]
sum(couverture_cpn4 < 50, na.rm =TRUE)
max(couverture_cpn4, na.rm = TRUE)

csps[which.max(couverture_cpn4)]

couverture_cpn4_aj <- couverture_cpn4+5 
couverture_cpn4_aj

t1 <- c(65.0, 78.0, 82.0, 45.0)
t2 <- c(70.0, 75.0, 85.0, 50.0)
mean(c(t1, t2))

moyen_csps <- (t1+t2)/2
moyen_csps





