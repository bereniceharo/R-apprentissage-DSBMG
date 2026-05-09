library(dplyr)
csps_2025 <- readRDS("csps_2025.rds")
names(csps_2025)
# un graphique en nuage de point avec x = "organisationunitname" et 
# y = "CibleFS-Couverture en CPN4 2025 FS Public"
library(ggplot2)
ggplot(csps_2025, aes(x =organisationunitname,
                      y =`CibleFS-Couverture en CPN4 2025 FS Public`)) +
  geom_point() +
  coord_flip()

csps_2025[which(is.na(csps_2025$`CibleFS-Couverture en CPN4 2025 FS Public`)), "organisationunitname"]
Qà
filter(csps_2025, is.na(csps_2025$`CibleFS-Couverture en CPN4 2025 FS Public`))
csps_2025 |> 
  filter(is.na(`CibleFS-Couverture en CPN4 2025 FS Public`))
#Change l'orientation du graphique avec les noms des csps en ordonné et les valeurs cpn4 en absis
ggplot(csps_2025, aes(x =organisationunitname,
                      y =`CibleFS-Couverture en CPN4 2025 FS Public`)) +
  geom_point() +
  coord_flip()

#Affiche un graphique allant du plus petit au plus grand du bas vers le haut
ggplot(csps_2025, aes(x =reorder(organisationunitname, `CibleFS-Couverture en CPN4 2025 FS Public`),
                      y =`CibleFS-Couverture en CPN4 2025 FS Public`)) +
  geom_point() + coord_flip()

ggplot(csps_2025, 
       aes(x = reorder(noms_fs, 
                       taux_cpn4),
           y = taux_cpn4)) +
  geom_point() +
  labs(title = "Couverture des CPN4 par formation sanitaire",
       y     = "Couverture CPN4 (%)",
       x     = "Formations sanitaires") +
  geom_hline(yintercept = 80, color = "red") +
  coord_flip() 

library(tidyr)
separate()
?unite()

library(ggplot2)

# données : data frame avec colonnes nom_fs et taux_cpn4
# objectif : bar chart horizontal, trié par taux, ligne de seuil à 80%

csps_2025 <- csps_2025 |> 
  rename(noms_fs = organisationunitname,
         taux_cpn4 = `CibleFS-Couverture en accouchement 2025 FS Public`
         )
csps_2025 |> 
  ggplot(aes(x=noms_fs, y = reorder(noms_fs, taux_cpn4))) +
  geom_col() +
  geom_vline(xintercept = 80, color = "red") +
  
  library(ggplot2)

# données : data frame avec colonnes nom_fs et taux_cpn4
# objectif : bar chart horizontal, trié par taux, ligne de seuil à 80%
# predict: bar chart avec barres en horizontal. le csps avec la plus petite couverture en bas et celle
#avec la plus grande couverure en haut.
csps_2025 |>
  filter(!is.na(taux_cpn4)) |>
  ggplot(aes(x = reorder(noms_fs, taux_cpn4), y = taux_cpn4)) +
  geom_col(fill = "steelblue") +
  geom_hline(yintercept = 80, color = "red", linetype = "dashed") +
  coord_flip() +
  labs(
    title = "couverture cpn4 par formation sanitaire",
    x = NULL,
    y = "taux cpn4(%)"
  )

# uniquement les CSPS sous le seuil de 50%, triées de la pire à la moins pire. 
# C'est le graphique le plus actionnable opérationnellement.
#une dizaine de formation sanitaire seront concernées
csps_2025 |>
  filter(!is.na(taux_cpn4) & taux_cpn4 <50) |>
  ggplot(aes(x = reorder(noms_fs, taux_cpn4), y = taux_cpn4)) +
  geom_col(fill = "darkblue") +
  coord_flip() +
  ylim(0, 60) +
  labs(
    title = "Formation sanitaire avec faible couverture de CPN4",
    x = NULL,
    y = "Taux cpn4(%)",
    subtitle = "DS-BMG, 2025 — 20 CSPS sur 40 sous le seuil de 50%"
  ) +
  geom_text(aes(label = round(taux_cpn4, 1)),
            hjust = -0.2, size = 3) 

df <- data.frame(
  fs = c("CSPS Paspanga", "CSPS Karpala", "CSPS Bogodogo"),
  cpn4 = c(0.72, NA, 0.41)
)
df[df$cpn4 > 0.5, ]

classer_fs <- function(couverture){
  if(couverture<0.5){statut = "Critique"}
  else if(couverture >= 0.8){statut = "Acceptable"}
  else{statut = "Insuffisant"}
  return(statut)
  }
classer_fs(c(0.72, 0.45, 0.61))

calculer_taux <- function(numerateur, denominateur, unite = 1000) {
  # Ligne A : arrêter si le dénominateur contient un zéro ou un négatif
  if(any(denominateur<= 0)){
    stop("vérifierr la valeur du dénominateur")
  }
  # Ligne B : calculer et retourner le taux
  return((numerateur/denominateur)*unite)
}

csps <- list(
  nom = "CSPS Paspanga",
  indicateurs = c(0.72, 0.88, 0.65),
  responsable = "ICP Sawadogo"
)
csps[2]
csps[[2]]
?replace_na



















