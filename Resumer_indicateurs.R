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
    sous_seuil = nb_seuil,
    valeurs_manquantes = nb_na))
}

indicateurs_2025 <- indicateurs_2025[-1, ]
resumer_indicateur(indicateurs_2025, 
                   "CibleFS-Couverture en CPN4 2025 FS Public", 
                   seuil = 60)

indicateurs_2025[which.max(indicateurs_2025$`CibleFS-Couverture en CPN4 2025 FS Public`), 
                 c("organisationunitname", "CibleFS-Couverture en CPN4 2025 FS Public")]
