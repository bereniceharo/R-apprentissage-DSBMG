# ==============================================================================
# Lolipop box plot pour couverture HPV
# 15 mai 2026
# ==============================================================================

# --- Importer le fichier excel-------------------------------------------------
library(readxl)
library(dplyr)
library(ggplot2)
library(scales)
library(forcats)
library(stringr)
library(ggtext)

# 1. Lecture des données triées --------------------------------------------
hpv <- read_excel("CV HPV_janv_Avril26.xlsx", sheet ="CV HPV_Janv_Avril26")
names(hpv)

hpv_final <- hpv |> 
# 1.simplifier les noms pour plus de lisibilité
  rename(
    fs = `Formations sanitaires`, #simplifier les noms pour plus de lisibilité
    cv_annuelle = couverure_annuelle
    ) |> 
# 2. netoyage des noms de valeurs de la colonne fs
  mutate(fs_propre = str_remove(fs, "^(CSPS|CMU|CM|Dispensaire de)\\s+")) |> 
  mutate(fs_propre = recode(fs_propre, 
                            "Ds Boulmiougou" = "Total District",
                            "Secteur 29 Ouagadougou" = "Secteur 29",
                            "Secteur 14 Ouagadougou" = "Secteur 14",
                            "Secteur 12 Ouagadougou" ="Secteur 12"),
         performance = cv_annuelle >= 33.3) |> 
# 3. trier les fs_propre en ordre decroissant
  arrange(desc(cv_annuelle)) |> 
# 4. Transformation de la colonne fs_propre en facteur ordonné selon l'ordre de tri 
  mutate(fs_propre = factor(fs_propre, levels = fs_propre)) |> 
# 5. inversion de l'ordre adapté pour un graphique( 1er en haut et faible en bas)
  mutate(fs_propre = fct_rev(fs_propre))
  


# 2. Paramètres -------------------------------------------------------------
cible <- 33.3
colour_ok <- "darkgreen"
couleur_ko <- "red3"

# 3. Lollipop chart ---------------------------------------------------------
loli <- hpv_final |>
  ggplot(aes(x = cv_annuelle, y = fs_propre))+
  geom_segment(
    aes(x = 0, xend = cv_annuelle, yend = fs_propre, color = performance),
    linewidth = 0.7)+
  geom_point(aes(colour = performance), size = 2.3)+
  geom_text(aes(label = sprintf("%.1f%%", cv_annuelle), colour = performance), 
            size = 3, hjust = -0.3, show.legend = FALSE)+
  geom_vline(xintercept = 33.3, color = "grey40", linewidth = 0.8,
             linetype = "dashed")+
  annotate(
    geom = "text", x = cible, y = 4, label = "Cible : 33.3%", 
    color = "gray30", size = 3, angle = 90, vjust = -0.5, fontface = "italic"
  )+
  scale_color_manual(
    values = c(`TRUE` = colour_ok, `FALSE` = couleur_ko),
    labels = c("Objectif atteint", "Objectif non atteint"),
    name   = NULL)+
  scale_x_continuous(
    labels = label_percent(scale = 1),
    breaks = seq(0,500, by = 50),
    limits = c(0,500),
    expand = expansion(mult = c(0.01, 0.10)))+
  labs(
    x = "Taux de couverture annuelle",
    y = "Formations sanitaires",
    title = "couverture vaccinale du HPV. Flles de 9 ans",
    subtitle = "District sanitaire de Boulmiougou, couverture cumulée janvier-avril 2026",
    caption = "Source: service du PEV/ENDOS")+
  theme_minimal(base_size = 8)+
  theme(
    plot.title = element_text(face = "bold", size = 14),
    axis.text.y = element_text(
      face = ifelse(levels(hpv_final$fs_propre)== "Total District", "bold", "plain")),
    legend.position = "bottom"
  )

ggsave(
  filename = "couv_hpv_avril.png",
  plot = loli,
  dpi = 300,
  width = 9,
  height = 12,
  bg = "white"
)
loli 
  


  
  
  
  
  
  
  
  
  
  
