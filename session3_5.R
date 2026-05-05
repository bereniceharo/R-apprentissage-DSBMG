# --- Charger le package --------------------- 
library(readxl)
# ---Importer le fichier dans un objet appelé indic25 -------------------
indic25 <- read_excel("Indicateurs  DS BLMG_CMA_FS_2025.xlsx", sheet = 2)

# ---Inspection du fichier excel importé -------------

str(indic25)
dim(indic25)
head(indic25)
summary(indic25)
# ---Commentaires --------
# Nombre de formation sanitaires: 70
# Combien d'indicateurs : 34
dim(indic25)
# Indicateur avec le plus de valeurs manquantes: Com-Palu-Taux de confirmation du Paludisme 2025 FS Public
is.na(indic25)
# Quelle formation sanitaire a la valeur la plus élevée,
# pour les cpn4 : 
fs_cp4_eleve <- which.max(indic25$`Nombre de CPN4 2025 FS Public`[-1]) +1
fs_cp4_eleve
indic25[26, ]
indic25[25, ]

indic25$organisationunitname[25]
indic25$`Nombre de CPN4 2025 FS Public`[25]

max(indic25$`Nombre de CPN4 2025 FS Public`[-1], na.rm = TRUE)
saveRDS(indicateurs_2025, "district_2025.RDS")

district_2025 <- readRDS("district_2025.RDS")
head(district_2025, 10)
dim(district_2025)
colnames(district_2025)











