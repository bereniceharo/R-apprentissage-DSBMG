taux <- c(0.91, 0.45, 0.83, 0.38, 0.76)

statut <- ifelse(taux >= 0.8, "objectif atteint", "alerte")
statut
library(readxl)
indic2025 <- read_excel("Indicateurs_FS_2025.xlsx", sheet = "FS_2025")
str(indic2025)
indic2025$`CibleFS-Couverture en CPN4 2025 FS Public`
seuil_cpn4 <- 80
indic2025$statut_cpn4 <- ifelse(indic2025$`CibleFS-Couverture en CPN4 2025 FS Public` >= 80,
                               "objectif atteint", "alerte")
indic2025$statut_cpn4
View(indic2025)
view(indic2025)
head(indic2025)
str(indic2025)
indic2025 <- indic2025[-indic2025$satut_cpn4]
names(indic2025)
indic2025$satut_cpn4 <- NULL
names(indic2025)
factor(indic2025$statut_cpn4, labels = "objectif atteint", "alerte")
factor()
factor
table(indic2025$statut_cpn4)

table(indic2025$statut_cpn4)

couvertures <- c(45, 72, 38, 61, 55)
noms_fs <- c("CSPS Kossodo", "CSPS Tampouy", "CSPS Pazanni", 
             "CSPS Kilwin", "CSPS Larlé")

status <- character(5)
for(i in 1:5){
  if(couvertures[i]>= 50) { 
    status[i] <- paste("norme", noms_fs[i], sep = " ")
  } else {
    status[i] <- paste("en alerte", noms_fs[i], sep = " ")
  }
}
status











