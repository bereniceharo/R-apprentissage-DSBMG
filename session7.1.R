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
       aes(x = reorder(organisationunitname, 
                       `CibleFS-Couverture en CPN4 2025 FS Public`),
           y = `CibleFS-Couverture en CPN4 2025 FS Public`)) +
  geom_point() +
  labs(title = "Couverture des CPN4 par formation sanitaire",
       y     = "Couverture CPN4 (%)",
       x     = "Formations sanitaires") +
  geom_hline(yintercept = 80, color = "red") +
  coord_flip() 





