# ==============================================================================
# PROJET      : ENDOS-BF Production
# SCRIPT      : Transformation et Calcul des Indicateurs (Janvier - Mai 2026)
# ==============================================================================

# 1. LIBRAIRIES
library(dplyr)
library(tidyr)
library(readxl)
library(writexl)
library(here)
library(janitor)

# 2. Importation du fichier brut (Janvier à Mai)
df_brutes <- read_excel(here("data", "dataElements_CMA_jan_mai26.xlsx"))

# 3. Transformation : Pivotage des données (Passage du format "long" au format "large")
df_large <- df_brutes |> 
  pivot_wider(
    names_from = element_donnee,
    values_from = value
  ) |>
  clean_names()


# 4. CRÉATION ET CALCUL DES NOUVEAUX INDICATEURS
df_clean <- df_large |> 
  mutate(
    total_malades_sorties = (
      nombre_de_malades_sorties_sans_avis_medical
      +nombre_de_malades_sorties_decedes
      +nombre_de_malades_sorties_transferes
      +nombre_de_malades_sorties_normales_gueris
      +nombre_de_malades_sorties_evacues
      +nombre_de_malades_sorties_referes
      ),
    letalite_totale = round(
      (nombre_de_malades_sorties_decedes/total_malades_sorties)*100,1),
    accouchement_totaux = (
      accouchement_normal
      +accouchement_par_cesarienne
      +accouchement_assiste_a_l_aide_d_instruments_et_ou_de_produits
      ),
    consultants_nouveaux_totaux = (
      nouveaux_consultants_auto_orientes
      +nouveaux_consultants_evacues
      +nouveaux_consultants_transferes
      +nouveaux_consultants_referes
      ),
    contre_references_taux = round(((
      nombre_de_contre_reference_realisees
      /(nouveaux_consultants_referes + nouveaux_consultants_evacues)
      ))*100,1),
    nouveau_nes_dcd =( 
      nouveau_nes_decedes_de_7_28_jours
      +nouveau_nes_decedes_de_0_6_jours
      ),
    audit_deces_nn_taux = round((deces_neonatals_audites/nouveau_nes_dcd)*100,1),
    mort_nes = mort_ne_frais+mort_ne_macere,
    mortinatalite = round((mort_nes/accouchement_totaux)*100,1),
    deces_mas_taux = round((
      (mas_enfants_sortie_decedes_interne
       /(mas_enfants_sortie_abandon_interne
         +mas_enfants_sortie_gueris_interne
         +mas_enfants_sortie_decedes_interne)))*100,1) #pas de référer ni evacués???
  )
# data_frame sans les NA, NaN et Inf afin d'eviter les erreurs de ggplot2
df_clean_ggplot <- df_clean |> 
  mutate(across(where(is.numeric), ~ if_else(!is.finite(.), 0, .)))
         
# 5. Séparation des données (Isoler la ligne globale du CMA pour éviter le double comptage avec les services)

df_cma <- df_clean_ggplot |> 
  filter(orgunit == "cma_total")

df_services <- df_clean_ggplot |> 
  filter(orgunit != "cma_total")

# Pour voir rapidement s'il y a des valeurs aberrantes
summary(df_clean_ggplot$letalite_totale)
summary(df_cma$letalite_totale)
summary(df_services$letalite_totale)
# Le biais de l'agrégation : Le CMA global "lisse" les performances. Un service en grande difficulté (le max à 28,4%) est "sauvé" statistiquement par les autres services qui ont une létalité proche de zéro. Si vous ne regardiez que df_cma, vous pourriez conclure que tout va bien, alors qu'un service est en crise.

# La puissance du résumé statistique : Le summary sur df_services vous donne une information sur la variabilité. La différence entre la médiane (3,5%) et la moyenne (9,8%) indique une distribution très étalée : certains mois ou certains services sont très loin de la norme, ce qui appelle une investigation de terrain (audit de décès, manque de matériel, surcharge de travail ?).

# 6. Exportation des tableaux finaux (Sauvegarde des fichiers prêts pour ggplot2)
write_xlsx(
  list(
  cma_services = df_clean_ggplot,
  services_janv_mai_2026 = df_services,
  cma_janv_mai_2026 = df_cma),
  here("data", "indicateurs_cma_jan_mai_2026.xlsx")
  ) 

# =============================================================================
# Graphique 1 : Tendance globale avec seuil
# =============================================================================
library(ggplot2)

# Préparation : Rendre les mois lisibles
library(ggplot2)
library(dplyr)

# 1. On crée une colonne 'mois' lisible et bien ordonnée pour les graphiques
df_cma <- df_cma |>
  mutate(mois = factor(pe, 
                       levels = c("202601", "202602", "202603", "202604", "202605"),
                       labels = c("Janv", "Fév", "Mars", "Avril", "Mai")))

df_services <- df_services |>
  mutate(mois = factor(pe, 
                       levels = c("202601", "202602", "202603", "202604", "202605"),
                       labels = c("Janv", "Fév", "Mars", "Avril", "Mai")))

#graph 1:
graph_cma <- ggplot(df_cma, aes(x = mois, y = letalite_totale, group = 1)) +
  
  # AJOUT : La ligne de seuil à 10%
  geom_hline(yintercept = 10, linetype = "dashed", color = "#cc0000", linewidth = 1) +
  
  # AJOUT : L'étiquette textuelle du seuil
  annotate("text", x = "Janv", y = 10.5, label = "Seuil d'alerte (10%)", 
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

# =============================================================================
# Graphique 2 : Dispersion par service avec seuil
#=========================================================================
graph_services <- ggplot(df_services, aes(x = reorder(orgunit, letalite_totale, FUN = median), y = letalite_totale, fill = orgunit)) +
  
  # AJOUT : La ligne de seuil à 10%
  geom_hline(yintercept = 10, linetype = "dashed", color = "#cc0000", linewidth = 1) +
  
  # La boîte à moustaches
  geom_boxplot(alpha = 0.6, outlier.shape = NA, color = "#4d4d4d") +
  
  # Les points de données
  geom_jitter(width = 0.15, size = 2.5, color = "#1a1a1a", alpha = 0.8) +
  
  labs(
    title = "Dispersion de la létalité par service",
    subtitle = "Identification des services dépassant le seuil d'alerte (10%)",
    x = "Service",
    y = "Taux de létalité (%)",
    caption = "Chaque point représente un mois d'activité"
  ) +
  
  scale_fill_brewer(palette = "Pastel1") +
  
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "none", 
    plot.title = element_text(face = "bold", color = "#1a1a1a"),
    panel.grid.major.x = element_blank(),
    axis.text.x = element_text(face = "bold") 
  )

print(graph_services)









 