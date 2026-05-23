# ====================================================================
# Mini-projet fin de mois 2
# Objectif de la session: rapport visuel accouchement q1 sur les 49 FS du DS-BMG
# Auteur: HARO Emmanuel
# ====================================================================

#packages necessaires
library(dplyr)
library(tidyr)
library(stringr)
library(readxl)
library(ggplot2)
library(forcats)
library(skimr)
library(scales)

# ---pipeline complet--------------------------------------------------

#---1---Importer les données
delivery_q1 <- read_excel("delivery_q1_2026.xls", skip = 2) |> 
  #---2---transfromer les donner au format long
  filter(organisationunitname != "Dispensaire de Pissy 17") |> 
  pivot_longer(
    cols = !organisationunitname,
    names_to = "mois",
    values_to = "taux_acc",
  ) |> 
  #---3---Nettoyer les données
  rename("fosa" = organisationunitname) |> 
  mutate(
    fosa = str_remove(fosa, "^(CSPS |CMU |CM )"),
    fosa = str_remove(fosa, " Ouagadougou"),
    mois = str_remove(mois, " 2026")
    ) |> 
  mutate(
    mois = factor(mois, levels = c("January", "February","March","April")),
    mois = fct_recode(mois, 
                      "Janvier" = "January",
                      "Février" = "February",
                      "Mars" = "March",
                      "Avril" = "April"),
    fosa = str_to_title(fosa),
    fosa = fct_reorder(factor(fosa), taux_acc, mean))
    

                       
  #---4---Construire un heatmaps FSXmois
heatmap_acc <- delivery_q1 |> 
  ggplot(
    aes(x = mois, y = fosa, fill = taux_acc)
  )+
  geom_tile()+
  scale_fill_gradient2(
    low = "red3",
    high ="forestgreen",
    mid = "white",
    midpoint = 7.5,
    na.value = "grey40",
    labels = label_percent(suffix = "%", scale = 1)
    )+
  theme_minimal()+
  labs(
    title = "Taux de couverture mensuelle des accouchements réalisées par
    formation sanitaire",
    subtitle = "District sanitaire de Boulmiougou, Janvier à avril 2026",
    caption = "DHIS2-BF mai-2026",
    y = "Formations sanitaires",
    x = "Periode (mois)",
    fill = "Taux d'accouchement"
  )+
  theme(
    axis.text.y = element_text(size = 7),
    legend.position = "bottom",
    panel.background = element_rect(fill = "white"),
    )+
  scale_x_discrete(expand = c(0,0.4))
  
ggsave(
  filename ="heatmap_acc.png",
  plot = heatmap_acc,
  width = 20,
  height = 35,
  dpi = 300,
  bg = "white"
  )  
  heatmap_acc
  
  

# Vérification 1 — dimensions
dim(delivery_q1)

# Vérification 2 — structure
glimpse(delivery_q1)

# Vérification 3 — valeurs uniques des mois
levels(delivery_q1$mois)

# Vérification 4 — noms de FS résiduels suspects
delivery_q1 |> distinct(fosa) |> print(n = 50)