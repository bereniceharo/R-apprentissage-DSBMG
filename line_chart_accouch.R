# ====================================================================
# Mini-projet fin de mois 2
#Line chart district + FS : évolution mensuelle du taux moyen du district avec
#courbe de référence. Permet de voir si le district rattrape ou décroche mois par mois.# Auteur: HARO Emmanuel
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

# ---taux moyen du district par mois — une seule valeur par mois, pas par FS.
delivery_mensuel <- read_excel("delivery_q1_2026.xls", skip = 2) |> 
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
    mois = str_remove(mois, " 2026"),
    fosa = str_to_title(fosa),
    mois = case_match(mois, 
          "January"  ~ "Janvier",
          "February" ~ "Février",
          "March"    ~ "Mars",
          "April"    ~ "Avril")) |> 
  summarise(taux_district = mean(taux_acc, na.rm = TRUE), 
            .by = mois) |> 
  mutate(
    mois =factor(mois, levels = c("Janvier", "Février", "Mars", "Avril"))) |> 
  arrange(mois)

delivery_line <- delivery_mensuel |> 
  ggplot(aes(x = mois, y = taux_district, group = 1))+
  geom_line(color="darkblue")+
  geom_point(size=2)+
  geom_hline(yintercept = 7.5, color = "orange2")+
  theme_minimal()+
  scale_y_continuous(
    breaks = seq(0, 10, by= 2),
    limits = c(0, 10)
  )+
  labs(
    title = "Evolution de la couverture mensuelle des accouchement du district",
    subtitle = "District sanitaire de Boulmiougou-Premier quadrimestre",
    caption = "DHIS2_BF-mai_2026",
    x = "Période en mois",
    y = "Taux d'accouchement (%)"
  )+
  annotate(
    geom = "text",
    label ="Objectif mensuel 7.5%",
    x = 2.5,
    y = 8,
    color = "orange2",
    size = 4
  )+
  geom_label(
    aes(label = round(taux_district, 1)),
    size = 3,
    fill = "white",
    color ="darkblue",
    vjust = 1.7
  )

ggsave(
  filename = "delivery_line.png",
  plot = delivery_line,
  units = "cm",
  height = 10,
  width = 20,
  dpi = 300,
  bg = "white"
)   

delivery_line







