# ==============================================================================
# Lolipop box plot pour couverture HPV
# 15 mai 2026
# ==============================================================================

library(readxl)
library(ggplot2)
library(stringr)
library(dplyr)
library(tidyr)

# --- Importer le fichier excel-------------------------------------------------
library(readxl)
library(dplyr)
library(ggplot2)
library(scales)

# 1. Lecture des données triées --------------------------------------------
df <- read_excel("CV HPV_Janv_Avril26.xlsx", sheet = "Data_R_triees")

df <- df %>%
  mutate(
    FS      = factor(FS, levels = rev(FS)),   # déjà triées, meilleur en haut
    atteint = couverture_annuelle_pct >= 33.3
  )

# 2. Paramètres -------------------------------------------------------------
cible      <- 33.3
couleur_ok <- "#2E7D32"
couleur_ko <- "#C62828"

# 3. Lollipop chart ---------------------------------------------------------
p <- ggplot(df, aes(x = couverture_annuelle_pct, y = FS)) +
  geom_segment(aes(x = 0, xend = couverture_annuelle_pct, yend = FS,
                   color = atteint), linewidth = 0.6) +
  geom_point(aes(color = atteint), size = 3) +
  geom_text(aes(label = sprintf("%.1f%%", couverture_annuelle_pct),
                color = atteint),
            hjust = -0.2, size = 2.8, show.legend = FALSE) +
  geom_vline(xintercept = cible, color = "red",
             linetype = "dashed", linewidth = 0.8) +
  annotate("text", x = cible, y = nrow(df) + 0.5,
           label = paste0("Cible fin avril : ", cible, "%"),
           color = "red", hjust = -0.05, vjust = 0, size = 3.5,
           fontface = "bold") +
  scale_color_manual(values = c(`FALSE` = couleur_ko, `TRUE` = couleur_ok),
                     labels = c("Sous la cible (< 33,3 %)",
                                "Atteint la cible (≥ 33,3 %)"),
                     name   = NULL) +
  scale_x_continuous(labels = label_percent(scale = 1),
                     expand = expansion(mult = c(0.01, 0.15))) +
  labs(
    title    = "Couverture vaccinale HPV — Filles de 9 ans",
    subtitle = "Cumul janvier–avril 2026, par formation sanitaire (classement décroissant)",
    x        = "Taux de couverture annuelle (%)",
    y        = NULL,
    caption  = "Source : CV HPV_Janv_Avril26  •  Ligne rouge = seuil attendu à fin avril (33,3 %)"
  ) +
  theme_minimal(base_size = 10) +
  theme(
    plot.title         = element_text(face = "bold", size = 14),
    plot.subtitle      = element_text(color = "grey30", margin = margin(b = 10)),
    plot.caption       = element_text(color = "grey40", hjust = 0),
    axis.text.y        = element_text(size = 8),
    panel.grid.major.y = element_blank(),
    panel.grid.minor   = element_blank(),
    panel.grid.major.x = element_line(color = "grey70", linetype = "dotted"),
    legend.position    = "top"
  )

ggsave("lollipop_CV_HPV.png", p, width = 9, height = 12, dpi = 300, bg = "white")
p