# ====================================================================
# Mini-projet fin de mois 2
# Objectif de la session: rapport visuel accouchement avec taux cumulés
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
# prédit : data frame de 48lignes × 2 colonnes
# valeurs de taux_cumule : entre 1 et 20%

delivery_cum <- read_excel("delivery_q1_2026.xls", skip = 2) |> 
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
    fosa = str_to_title(fosa)
    )
# aggregation
delivery_cum <- delivery_cum |> 
  summarise(taux_cumul = sum(taux_acc), .by = fosa)
# Ajouter une ligne District 
delivery_cum <- delivery_cum |> 
  add_row(fosa = "District",
          taux_cumul = mean(delivery_cum$taux_cumul)) |> 
  mutate(fosa = fct_reorder(factor(fosa), taux_cumul))

delivery_cum <- delivery_cum |> 
  mutate(statut = case_when(
    fosa == "District" ~ "district",
    taux_cumul>30 ~ "Atteint",
    TRUE          ~ "Non atteint"
  ))
delivery_cum |> 
  count(statut)

# graphic bar_chart 
accouch_cum <- delivery_cum |> 
  ggplot(aes(x = taux_cumul, y = fosa, fill = taux_cumul))+
  geom_col()+
  geom_vline(xintercept = 30, color = "red1")+
  annotate(
    geom = "text",
    x = 32,
    y = 20,
    color = "red1",
    label = "objectif période",
    hjust = 0
  )+
  scale_fill_gradient2(low = "red",
                      high = "darkgreen",
                      mid = "yellow2",
                      midpoint = 30)+
  theme_minimal()+
  theme(
    axis.text.y = element_text(
      size = 10,
      color = ifelse(levels(delivery_cum$fosa) == "District", "darkred", "grey20"),
      face = ifelse(levels(delivery_cum$fosa) == "District", "bold", "plain")),
    legend.position = "none"
  )+
  labs(
    title = "Couverture cumulée des accouchements réalisées par formation sanitaire",
    subtitle = "District sanitaire-Boulmiougou, janvier-avril",
    caption = "DHIS2-BF, mai-2026",
    y = "Formations sanitaires",
    x = "taux d'accouchement (%)",
    fill = "Taux accouchement(%)"
  )+
  scale_x_continuous(expand = c(0, 0.3))
  
ggsave(
  filename = "accouchement_Q1.png",
  plot = accouch_cum,
  dpi = 300,
  width = 20,
  height = 35,
  units ="cm",
  bg = "white"
)


#Graphic 2-------------------------------------------------------

# accouch_cum <- delivery_cum |> 
#   ggplot(aes(x = taux_cumul, y = fosa, fill = statut))+
#   geom_col()+
#   geom_vline(xintercept = 30, color = "red1")+
#   scale_fill_manual(values = 
#                     c("Atteint" = "darkgreen",
#                     "Non atteint" = "red3",
#                     "district" = "grey40"))+
#   theme_minimal()+
#   theme(
#     axis.text.y = element_text(size = 7),
#   )+
#   labs(
#     title = "Couverture cumulée des accouchements réalisées 
#     par formation sanitaire",
#     subtitle = "District sanitaire-Boulmiougou, janvier-avril",
#     caption = "DHIS2-BF, mai-2026",
#     y = "Formations sanitaires",
#     x = "taux d'accouchement (%)"
#   )+
#   scale_x_continuous(expand = c(0, 0.3))

#----------------------------------------------------------------


 

