# # crée une colonne alerte_meningite qui prend la valeur 
# "Alerte" si le nombre de cas de méningite dans la semaine est ≥ 1, et
# "RAS" sinon.

library(dplyr)
library(readxl)
excel_sheets("SYNTHESE_TLOH_2026_DS_BLMG.xlsx")
tloh_2026 <- read_excel("SYNTHESE_TLOH_2026_DS_BLMG.xlsx", sheet ="Base TLOH 2026")
str(tloh_2026)
names(tloh_2026)
View(tloh_2026)
colnames(tloh_2026)

# prédit : combien de lignes et colonnes dans l'import brut? une cinquantaine de ligne
# et une centaine de colonnes
# quel type pour toutes les colonnes? Toutes les colones seront character

tloh_brut_26 <- read_excel(
  "SYNTHESE_TLOH_2026_DS_BLMG.xlsx",
  sheet = "Base TLOH 2026",
  col_names = FALSE
)

str(tloh_brut_26, list.len = 6)
ligne1 <- unlist(tloh_brut_26[1,])
ligne2 <- unlist(tloh_brut_26[2,])
tloh_l1[1:10]
ligne2[1:10]

#propager le nom de chaque maladies la lignes NA adjaccent
ligne1_ok <- character()
for(i in 1:length(ligne1)){
  ligne1_ok[i] <- ifelse(is.na(ligne1[i]), ligne1[i-1], ligne1[i])
}


ligne1_ok <- ligne1  # copie complète
for(i in 2:length(ligne1)){
  if(is.na(ligne1_ok[i])){
    ligne1_ok[i] <- ligne1_ok[i-1]
  }
}
class(ligne1_ok[1:10])

# Étape 4 — Construire les noms de colonnes combinés
# obtient colonne avec des noms de colonnes maladies associée à cas ou deces
nom_col <- character()
for(i in 1:length(ligne1)){
  if(is.na(ligne2[i])){
    nom_col[i] <- ligne1_ok[i]
  } else{
    nom_col[i] <- paste(ligne1_ok[i], ligne2[i], sep = "_" )
  }
}

nom_col[1:10]

# Étape 5 — Assembler le data frame final

# 1. Extraire les lignes de données 
# (supprimer les 3 premières lignes — 2 en-têtes + 1 vide)

tloh_data <- tloh_brut_26[4:nrow(tloh_brut_26), ]
colnames(tloh_data) <- nom_col
dim(tloh_data)
names(tloh_data)[1:10]
# Étape 6 — Reconvertir les colonnes numériques
str(tloh_data)
for (i in 2:length(tloh_data)){
  tloh_data[[i]] <- as.numeric(tloh_data[[i]])
}
#verification
class(tloh_data[["Méningite_Cas"]])
class(tloh_data[["Semaines Epidémiologiques"]])
head(tloh_data[, 1:4])

saveRDS(tloh_data, "tloh_data_tidy.rds")

#Rappel n°12 — Fonctions personnalisées
#fonction de calcul taux positivité
# retourne retourne message d'erreur avec le message d'erreur
taux_positivite <- function(cas_confirmes, cas_testes, unite = "percent"){
  if(cas_testes<=0){
    stop("vérifier le nombre de cas testés")
    } else if(cas_confirmes> cas_testes){
      stop("le nombre de cas confimés ne peut pas être supérieur
           au nombre de cas testés")
    } else if(!(unite %in% c("proportion", "percent"))){
      stop("taux accepte proportion ou percent")
    }
  taux <- round((cas_confirmes/cas_testes),1)
  if(unite !="percent"){
    return(taux)
  } else { return(taux*100)}
}







