couvertures <- c(45, 78, 32, 91, 55)
mean(couvertures)

#Tâche : écris une boucle for qui parcourt les 5 FS et affiche pour chacune un message de ce type :
 # CMU Zagtouli : 45% — ALERTE
#CSPS Boassa : 78% — OK

fs_noms <- c("CMU Zagtouli", "CSPS Boassa", "CSPS Kossodo", "CMA Pissy", "CSPS Tampouy")
couvertures <- c(45, 78, 32, 91, 55)
# retourne un vecteur avec les noms des FS, leur couverture et le statut alerte ou ok
statut <- character()
for (i in 1:5) {
  if (couvertures[i]< 60){
  statut[i]<- paste(fs_nom[i], ":", couvertures[i], "-", "ALERTE")} else{
  statut[i]<- paste(fs_noms[i], ":", couvertures[i], "-", "OK")
  }
} 
statut

cpn4 <- c(42, 85, 63, 91, 47, 78)

calculer_taux_cpn4 <- function(cpn4_realise, population_cible) {
  taux_cpn4 <-  round((cpn4_realise/population_cible*100), 1)
  return(taux_cpn4)
}

calculer_taux_cpn4(312, 0)

fs_data <- data.frame(
  fs = c("CSPS Nagrin", "CSPS Tampouy", "CSPS Karpala", 
         "CSPS Zongo", "CSPS Ouidi"),
  cpn4_realise = c(312, 198, 445, 0, 267),
  population_cible = c(480, 320, 600, 415, 0)
)

calcul_taux_cpn4 <- function(cpn4_realise, population_cible, multiplicateur = 100){
  taux_cpn4 <-round((cpn4_realise/population_cible)*multiplicateur, 1)
  return(taux_cpn4)
  }

calcul_taux_cpn4(45, 300)
calcul_taux_cpn4(45, 300, 100)
calcul_taux_cpn4(45, 300, 1000)

# R retourne inf
calcul_taux_cpn4(45, 0)


calcul_taux_cpn4 <- function(cpn4_realise, population_cible, multiplicateur = 100){
  if (population_cible <= 0){
    stop("population_cible ne peut pas être égale ou inférieur à zéro ")
  } 
  taux_cpn4 <-round((cpn4_realise/population_cible)*multiplicateur, 1)
  return(taux_cpn4)
}

calcul_taux_cpn4(45, 0)
calcul_taux_cpn4(45, 300)

cpn4 <- c(45, 12, 0, 78, NA, 33)
pop  <- c(300, 150, 200, 0, 400, 250)
calcul_taux_cpn4(cpn4, pop)

calcul_taux_cpn4 <- function(cpn4_realise, population_cible, multiplicateur = 100){
  if(any (population_cible <= 0)){
  stop("population_cible ne peut pas être égale ou inférieur à zéro ")}
  taux_cpn4 <-round((cpn4_realise/population_cible)*multiplicateur, 1)
  return(taux_cpn4)
}

library(readxl)

indicateurs_2025 <- read_excel("Indicateurs_FS_2025.xlsx", sheet = "FS_2025")
str(indicateurs_2025)
# Retourne une liste avec les 5 valeurs et leurs noms de libelé
resumer_indicateur <- function(df, colonne, seuil = 50) {
  moy <- mean(df[[colonne]], na.rm = TRUE )
  mini <- min(df[[colonne]], na.rm = TRUE)
  maxi <- max(df[[colonne]], na.rm = TRUE)
  nb_seuil <- sum(df[[colonne]] < seuil, na.rm = TRUE)
  nb_na <- sum(is.na(df[[colonne]]))
  return( list(
    moyenne = moy, 
    minimum = mini,
    maximum = maxi, 
    sous_seuil_50 = nb_seuil,
    valeurs_manquantes = nb_na))
}

indicateurs_2025 <- indicateurs_2025[-1, ]
resumer_indicateur(indicateurs_2025, 
                   "CibleFS-Couverture en CPN4 2025 FS Public", 
                   seuil = 60)

indicateurs_2025[which.max(indicateurs_2025$`CibleFS-Couverture en CPN4 2025 FS Public`), 
                 c("organisationunitname", "CibleFS-Couverture en CPN4 2025 FS Public")]


install.packages("epirhandbook")
# install the latest version of the Epi R Handbook package
pacman::p_install_gh("appliedepi/epirhandbook")

fs <- c("CSPS Somgande", "CSPS Paspanga", "CSPS Karpala")
couvertures <- c(72, 45, 88)

fs_couverture <- character() 
for(i in 1:length(couvertures)){
  fs_couverture[i] <- paste("La FS",fs[i],"a une couverture de", paste0(couvertures[i],"%")) 
  print(fs_couverture[i])}

FS_2025 |>
  filter(
    !grepl("CM",`organisationunitname`),
    !grepl("DS", `organisationunitname`),
    !grepr("Dispensaire",`organisationunitname`)
    !grepl("infirm", `organisationunitname`)
    ) |>
  select(`organisationunitname`,
         `CibleFS-Couverture en CPN4 2025 FS Public`) |>
  arrange(des(`CibleFS-Couverture en CPN4 2025 FS Public`))

FS_2025 <- readRDS("district_2025.rds")
type_fs <- FS_2025 |>
  ifelse(grepl("CM",`organisationunitname`), "CM",
         ifelse(grepl("CMA",`organisationunitname`), "CMA"),
         ifelse(grepl("DS",`organisationunitname`), "District"),
         ifelse(grepl("CSPS", `organisationunitname`), "CSPS"),
         "Infirmerie et dispensaire"
         )
FS_2025_type <- FS_2025 |>
  mutate(type_fs = ifelse(grepl("CMA",`organisationunitname`), "CMA",
                          ifelse(grepl("CMU",`organisationunitname`), "CMU",
                                 ifelse(grepl("CM",`organisationunitname`), "CM",
                                        ifelse(grepl("DS",`organisationunitname`), "District",
                                               ifelse(grepl("CSPS", `organisationunitname`), "CSPS",
                                                      "Infirmerie et dispensaire")
                                        )
                                 )
                          )
  ))|>
  group_by(type_fs)|>
  summarise(moyen_cpn4 = mean(`CibleFS-Couverture en CPN4 2025 FS Public`,
                              na.rm = TRUE))
print(FS_2025_type)
View(FS_2025)
library(dplyr)
#Dans les CSPS uniquement,
#quelle est la distribution de la couverture CPN4 — moyenne, 
#minimum, maximum et nombre de CSPS sous 50%
#retourne la moyenne des couvertures cpn4 des csps, la valeur maximale de couverture
# des csps, le minimum et le mombre de FS ayant une couvertur de moins de 50%
# On aura un tiblle de 4 colonnnes et une ligne
csps_2025 <- indicateurs_2025|>
  filter(grepl("CSPS", organisationunitname))|>
  summarise(
    moyenne_cpn4_csps = mean(`CibleFS-Couverture en CPN4 2025 FS Public`, na.rm = TRUE),
    max_cpn4_csps = max(`CibleFS-Couverture en CPN4 2025 FS Public`, na.rm = TRUE),
    min_cpn4_csps = min(`CibleFS-Couverture en CPN4 2025 FS Public`, na.rm = TRUE),
    nombre_csps_50 = sum(`CibleFS-Couverture en CPN4 2025 FS Public`< 50, na.rm = TRUE)
  )
print(csps_2025)
#retourner liste csps à partir de leurs valeurs
# Écris le code qui retourne la liste des CSPS avec leur couverture CPN4, 
# triés du plus faible au plus élevé, en ne gardant que ceux sous 50%.  
# retourne une table avec 2 colonnes et 20 lignes correspondant au nombre de csps
csps_desc_50 <- FS_2025 |> 
  filter(grepl("CSPS", organisationunitname)& `CibleFS-Couverture en CPN4 2025 FS Public`<50) |> 
  select(organisationunitname, `CibleFS-Couverture en CPN4 2025 FS Public`) |>
  arrange(`CibleFS-Couverture en CPN4 2025 FS Public`)
print(csps_desc_50)

dim(csps_2025)








