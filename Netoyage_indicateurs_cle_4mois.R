# ==============================================================================
# PROJET      : ENDOS-BF Production
# SCRIPT      : Nettoyage des indicateurs clés CSPS
# OBJECTIF    : Transformer au format large, Faire les visualisations.
# ==============================================================================

library(dplyr)
library(tidyr)
library(purrr)
library(readxl)
library(writexl)
library(stringr)
library(ggplot2)
library(forcats)

#-------------------------------------------------------------------------------  
# 1. ----IMPORTER LE FICHIER-
#-------------------------------------------------------------------------------  

indicateurs_cle_4mois <- read_excel("data/taux2026_11_indicateurs_avril.xlsx")

# Diagnostic du fichier
# predict: 
#         - 2112 lignes 4 colonnes
#         - colonne value en numeric, les autres en chr
#         - 12 NA pour value (3 indicateurs maternité*4mois), Dispensaire de Pissy 17
glimpse(indicateurs_cle_4mois)
sum(is.na(indicateurs_cle_4mois$value))
indicateurs_cle_4mois |> 
  filter(is.na(value)) 
indicateurs_cle_4mois |> 
  summarise(n(), .by = indicateurs)

#-------------------------------------------------------------------------------  
# 2. ---Netoyage du fichier
#-------------------------------------------------------------------------------  

# |Corrigeable par règle générale |fonction|Nécessite correction manuelle|fonction|
# |Des indicateurs avec des mots séparés|str_squish() + str_replace_all() |Des noms incorrects|str_replace()|
# |Casse hétérogène|str_to_lower()|Format de nommage différents variant|str_replace()|

#Netoyer la colonne indicateur
#predit: 2112 lignes 4 colonnes, 11 indicateurs distincts. conserve mêm types que le data frame source

indicateurs_cle4mois_clean <- indicateurs_cle_4mois |> 
  mutate(
    indicateurs = str_to_lower(indicateurs),
    indicateurs = str_replace_all(
      str_squish(indicateurs), 
      pattern = " ",
      replacement = "_"),
    indicateurs = case_when(
      indicateurs ==    "ouveaux_contact_5ans" ~ "nouveaux_contact_5ans",
      indicateurs == "nouveauxcontacts_totale" ~ "nouveaux_contacts_total",
      TRUE                                     ~ indicateurs
    )
    )
str(indicateurs_cle4mois_clean)
indicateurs_cle4mois_clean |> 
  distinct(indicateurs)
#-------------------------------------------------------------------------------  
# 3. ---Traiter les valeurs manquantes NA du dispensaire Pissy 17
#-------------------------------------------------------------------------------  

# Remplacer les NA de Pissy 17 par 0. le Dispensaire n'offre pas de services de maternité
#predit: Il restera 5 NA dans value correspondant aux données non transmises par
#       Dayoubsi, Kienfangué et Zambanega

indicateurs_cle4mois_clean <-  indicateurs_cle4mois_clean |> 
  mutate(
    value = case_when(
      is.na(value)&
        (formations_sanitaires == "Dispensaire de Pissy 17")&
        indicateurs == "cpn1_1er_trimestre"~ 0,
      TRUE ~ value
    ))
   sum(is.na(indicateurs_cle4mois_clean$value))
   
#-------------------------------------------------------------------------------  
# 4. ---Transformer en format large 
#-------------------------------------------------------------------------------  
   
# predit: 
#     - après pivot_larger: 48 lignes et 45 colonnes = 1+44 (11 indicateurs*4 mois+ 1 colonne de formations_sanitaires)
#     - noms colonnes: formations_sanitaires, indicateurs_pe (couverture_cpn4_202604)
#     - chaque valeur provient de la combinaison entre les colonnes indicateurs et periode:couverture_cpn4_202601,
#     couverture_cpn4_202602, couverture_cpn4_202603, couverture_cpn4_202604

indicateurs_cle4mois_large <- indicateurs_cle4mois_clean |> 
  pivot_wider(
    names_from = c(indicateurs, pe),
    values_from = value
  )
str(indicateurs_cle4mois_large)

#-------------------------------------------------------------------------------  
# 5. ---Faire la visualisation 
#-------------------------------------------------------------------------------  

#un graphique en barres horizontales du contact par habitant-total moyen par FS sur les 4 mois.
# prédit :
# pipeline : filter(nouveaux_contacts_total) → group_by(formations_sanitaires)
#            → summarise(cumul = sum(value, na.rm = FALSE))
# nb lignes intermédiaire : 48
# fourchette des cumuls : entre 0.20 et 0.5, FS attendue la plus haute : CM Zagtouli
# nb barres absentes (NA) sur le graphique : 1
# trois couches : ggplot() + aes(x = cumul nouveau contact, y = formation sanitaire) + geom_col()

contact_cumul <- indicateurs_cle4mois_clean |>
  filter(indicateurs == "nouveaux_contacts_total") |> 
  summarise(cumul = sum(value, na.rm = FALSE), .by = formations_sanitaires) |> 
  mutate(formations_sanitaires = fct_reorder(
    formations_sanitaires,
    replace_na(cumul, -Inf)))
   

# GRAPHIC BAR CHART

poster_contact_avril <- contact_cumul |> 
  ggplot(aes(x = cumul, y = formations_sanitaires, fill = cumul)) +
  
  # 1. On affine légèrement les barres pour laisser respirer le graphique
  geom_col(width = 0.75) +
  
  # 2. Ajout de la taille et arrondissement à 2 décimales pour éviter les chiffres trop longs
  geom_text(
    aes(label = round(cumul, 2)), 
    hjust = -0.2, 
    vjust = 0.4,
    size = 4.5,          # Texte plus grand pour le format A3
    fontface = "bold"
  ) +
  
  # 3. Ligne d'objectif rendue plus épaisse et pointillée
  geom_vline(
    xintercept = 0.33, 
    color = "firebrick", 
    linewidth = 1.2, 
    linetype = "dashed"
  ) +
  
  # 4. Étiquette de l'objectif ajustée
  annotate(
    geom = "text",
    x = 0.34,            # Légèrement décalé de la ligne
    y = 25,              # Position Y approximative au centre
    color = "firebrick",
    label = "Objectif période (0.33)",
    hjust = 0,
    size = 5,
    fontface = "bold"
  ) +
  
  # 5. Dégradé de couleurs
  scale_fill_gradient2(
    low = "red",
    high = "darkgreen",
    mid = "gold",
    midpoint = 0.33
  ) +
  
  # 6. Espace étendu à droite pour ne pas couper le texte
  scale_x_continuous(expand = expansion(mult = c(0, 0.12))) +
  
  # 7. LE SECRET DU FORMAT POSTER : base_size = 16 augmente proportionnellement tout le texte
  theme_minimal(base_size = 16) +
  theme(
    legend.position = "none",
    
    # Épure l'axe Y : on enlève le titre "Formations sanitaires" qui est évident
    axis.title.y = element_blank(),
    axis.text.y = element_text(size = 11, face = "bold", color = "grey20"),
    
    # Nettoyage du fond : on supprime les lignes horizontales inutiles
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_line(color = "grey85", linetype = "dotted"),
    
    # Mise en forme du bloc titre
    plot.title = element_text(size = 20, face = "bold", hjust = 0.5, margin = margin(b = 10)),
    plot.subtitle = element_text(size = 16, hjust = 0.5, color = "grey40", margin = margin(b = 20)),
    plot.caption = element_text(size = 12, color = "grey50", margin = margin(t = 15))
  ) +
  labs(
    title = "Couverture cumulée des nouveaux contacts par habitant",
    subtitle = "District Sanitaire de Boulmiougou (Janvier - Avril 2026)",
    caption = "Source : DHIS2 / ENDOS-BF | Juin 2026",
    x = "Nouveaux contacts par habitant (Cumul)"
  )

# Exportation avec les mêmes paramètres A3
ggsave(
  filename = here("figures", "contact_Q1_FS_poster.pdf"),
  plot = poster_contact_avril,
  dpi = 300,
  width = 29.7,
  height = 42,
  units = "cm",
  bg = "white"
)















