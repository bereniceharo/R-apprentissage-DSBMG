# =============================================================================
# Graphique 1 : Tendance globale avec seuil
# =============================================================================
library(ggplot2)

graph_cma <- ggplot(df_cma, aes(x = mois, y = letalite_totale, group = 1)) +
  
  # AJOUT : La ligne de seuil à 10%
  geom_hline(yintercept = 10, linetype = "dashed", color = "#cc0000", linewidth = 1) +
  
  # AJOUT : L'étiquette textuelle du seuil
  annotate("text", x = 1, y = 10.5, label = "Seuil d'alerte (10%)", 
           color = "#cc0000", hjust = 0, fontface = "bold") +
  
  # Les formes géométriques
  geom_line(color = "#005a9c", linewidth = 1.2) + 
  geom_point(color = "#005a9c", size = 3) +       
  
  # Affichage des valeurs
  geom_text(aes(label = paste0(letalite_totale, "%")), 
            vjust = -1.5, size = 4.5, color = "#333333") +
  
  scale_y_continuous(limits = c(0, max(max(df_cma$letalite_totale), 12))) + # Ajusté pour laisser la place au seuil
  
  labs(
    title = "Évolution de la létalité globale au CMA",
    subtitle = "Janvier à Mai 2026",
    x = "",
    y = "Taux de létalité (%)",
    caption = "Source : ENDOS-BF / DHIS2"
  ) +
  
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", color = "#1a1a1a"),
    plot.subtitle = element_text(color = "#595959", margin = margin(b = 15)),
    panel.grid.minor = element_blank(), 
    panel.grid.major.x = element_blank() 
  )

print(graph_cma)