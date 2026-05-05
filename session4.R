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

paste("test", noms_fs, sep = "_")

ifelse(couvertures>=50, "norme", "en alerte")


ifelse(couvertures>=50, paste("norme", noms_fs, sep =" "),
       paste("en alerte", noms_fs, sep = " "))

niveau_couverture <- cut(couvertures, breaks = c(0,50,80,100),
    labels = c("faible", "moyen", "bonne"))
print(niveau_couverture)

df <- data.frame(
  couvertures = c(45, 72, 38, 61, 55),
  noms_fs = c("FS1", "FS2", "FS3", "FS4", "FS5")
)

lapply(df, mean)
sapply(df, length)

df_district <- data.frame(
  cpn4 = c(45, 72, 38, 61, 55),
  accouchements = c(120, 150, 95, NA, 130),
  penta3 = c(80, 110, 60, 100, 95)
  #complet = c("oui", "oui", "oui", "non", "non")
)
sapply(df_district,max, na.rm = TRUE)

sapply(indic2025, c(mean, min, max), na.rm = TRUE)

sapply(df_district, function(x) c(
  mean = mean(x, na.rm = TRUE),
  min = min(x, na.rm = TRUE),
  max = max(x, na.rm = TRUE)
))
  
summary(df_district) 
sapply(df_district, c, na.rm = TRUE)

df_district <- data.frame(
  fs = c("CSPS A", "CSPS A", "CSPS B", "CSPS B", "CSPS C"),
  cpn4 = c(45, 52, 38, 42, 61)
)
tapply(df_district$cpn4, df_district$fs, mean)

tapply(df_district$fs, df_district$fs, length)




