# =====================================================
# Session 7.2 — Bar charts pour comparer des FS
# Date : 08/05/2026
# Objectif : produire un bar chart professionnel des CSPS
#            sous le seuil de 50% sur la CPN4 — DS-BMG 2025
# =====================================================

library(dplyr)
library(ggplot2)

#--- 1. Chargement et préparation -------------------------
csps_2025 <- readRDS("csps_2025.rds")

csps_2025 <- csps_2025 |> 
  rename(
    noms_fs   = organisationunitname,
    taux_cpn4 = `CibleFS-Couverture en CPN4 2025 FS Public`
  )

# ---2. Bar chart complet (40 FS) -------------------------
# Prédiction : barres horizontales, plus petite en bas
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

#--- 3. Bar chart filtré : FS en alerte (< 50%) -----------
# Prédiction : ~10 FS (réalisé : 20 )
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

library(tidyr)
ident






