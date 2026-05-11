# =============================================================================
# Session 7.4: Heatmaps : visualiser les patterns spatiotemporels
# Date: 9 mai 2026
# Auteur: Dr Emmanuel HARO
# Objectifs:
# - Construire une heatmap avec la nouvelle fonction geom_tile()
# - Choisir et appliquer une palette de couleurs adaptée à un indicateur 
#   de couverture sanitaire (gradient continu)
# - Ordonner les FS par performance globale ou alphabétiquement selon le besoin 
#   de lecture
# - Habiller la heatmap pour usage institutionnel (titre, légende, axes, source)
# ==============================================================================

# Charger les packages utiles
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)

# 1--- Importer le data set de la couverture cpn4 par mois-------------------
cpn4_mensuel <- read_excel("/Users/Haro/apprentissage_R/couverture_cpn4_2025.xlsx")
glimpse(cpn4_mensuel) # verifier les données
head(cpn4_mensuel, 5)
names(cpn4_mensuel)

# 2---Pivoter cpn4_mensuel au format long-------------------------
#Obtient un data frame de 46*12 = 552 lignes et 3 colonnes
cpn4_mois <- cpn4_mensuel |>
  pivot_longer(cols = -organisationunitname,
               names_to = "mois",
               values_to = "taux_cpn4",
               )
#Netoyage colone mois pour conserver uniquement les mois sans l'annee
cpn4_mois <- separate(cpn4_mois, mois, into = c("mois","annee"), sep = " ") 
cpn4_mois <- cpn4_mois[-3]

# Transformer la colonne mois en factor pour faciliter le trie ordonné sur 
#ggplot2
#prediction: retourne une une table avec la colonne mois transformée
#en facteur au lieu de character
cpn4_mois <- cpn4_mois |> 
  mutate(mois = factor(mois, levels = c("January", "February", "March",
                       "April","May","June","July",
                       "August","September","October",
                       "November", "December")))

# 2---Représenation graphique: heatmap avec geom_tile (voir observatyion 
#pour la structure)
#prediction: on obtient un graphique rectancle avec des couleurs différente selon
# le csps et selon la periode(saison)
#la couleur dominante sera le rouge comme je l'avait dit à ma proposition précédente,
# le CM Tanguin Dassouri aura une couleur plus verte pour septembre. 
# Le csps de Kalzi sera individualisé en gris pour le mois de juin
# Le graphique inclura un titre supérieur, 
# une légende intitulée "Couverture CPN4 (%)", des noms de mois inclinés à 15° 
# et une réduction de la taille des 46 noms de FS sur l'axe y pour limiter leur chevauchement.
# Non
g_heatmap <- cpn4_mois |> 
  ggplot(
    aes(x = mois,
        y = organisationunitname,
        fill = taux_cpn4)
  ) +
  geom_tile() +
  scale_fill_gradient(
    low = "red",
    high = "green",
    na.value = "grey80", name = "couverture CPN4"
  )+
  theme_bw() +
  theme(axis.text.y = element_text(size = 7),
        axis.text.x = element_text(size = 7, angle = 15)) +
  labs(x = NULL, y = "formation sanitaire", 
  title = "Carte de chaleur Couverture CPN4",
  subtitle = "Janvier à décembre 2025 - DS BMG",
  caption = "ENDOS-BF") +
  theme_minimal()

# 4----Palettes professionnelles ---------------
# scale_fill_distiller() et 
#scale_fill_viridis_c()

# prédit : heatmap à fond blanc, couleurs rouge→jaune→vert
# (taux bas = rouge alerte, taux haut = vert OK),
# étiquettes des mois en x toujours inclinées à 45°,
# CSPS Kalzi de juin 2025 en gris (NA conservé)
cpn4_mois |> 
  ggplot(
    aes(x = mois,
        y = organisationunitname,
        fill = taux_cpn4)) +
  geom_tile() +
  scale_fill_distiller(palette = "RdYlGn",
                       na.value = "grey90",
                       direction = -1)+
  labs(x = "Mois", 
       y = "Formation sanitaire", 
       title = "Couverture CPN4 mensuelle — DS-BMG, 2025",
       subtitle = "46 formations sanitaires × 12 mois",
       fill = "Taux CPN4 (%)",
       caption = "Source : ENDOS-BF, extraction DS-BMG") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 8),
        axis.text.x = element_text(size = 9, angle = 45, hjust = 1))


# prédit : heatmap à fond blanc, couleurs rouge→jaune→vert
# (taux bas = rouge alerte, taux haut = vert OK),
# étiquettes des mois en x toujours inclinées à 45°,
# CSPS Kalzi de juin 2025 en gris (NA conservé)

g_heatmap_v1 <- ggplot(cpn4_mois, 
       aes(x = mois, y =organisationunitname , fill = taux_cpn4)) +
  geom_tile() +
  scale_fill_distiller(palette = "RdYlGn",
                       na.value = "grey80",
                       direction = 1) +
  labs(title = "Couverture CPN4 mensuelle — DS-BMG, 2025",
       subtitle = "46 formations sanitaires × 12 mois",
       x = "Mois",
       y = "Formation sanitaire",
       fill = "Taux CPN4 (%)",
       caption = "Source : ENDOS-BF, extraction DS-BMG") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 9),
        axis.text.y = element_text(size = 8))
# La fonction dir.create("figures") permet de créer un dossier directement 
# dans le repertoire de travail
# dir.create("figures")

# ---Créer un une sauvegarde de l'image dans un dossier ---------------
#---a------------
#Export en PNG
#---------------
# prédit : ggsave crée un fichier PNG dans figures/, taille 15×25 cm,
# fond blanc, lisible avec les 46 noms de CSPS visibles sans chevauchement

ggsave(filename = "figures/heatmap_cpn4.png",
       plot = g_heatmap_v1,
       width = 15,
       height = 25,
       units = "cm",
       dpi = 300,
       bg = "white")
#---b--------------
#Export en PDF — pour montrer la différence raster vs vectoriel
#------------------
ggsave(filename = "figures/mensuel_cpn4.pdf",
       plot = g_heatmap_v1,
       width = 15,
       height = 25,
       units = "cm",
       bg = "white") 
#produit un warning don les details sont les suivants:
# grid.Call.graphics(C_text, ...) : ggplot a appelé sa fonction interne pour 
# dessiner du texte (en l'occurrence, ton titre).
# 'Couverture CPN4 mensuelle — DS-BMG, 2025' : c'est ton titre. R cite la chaîne où 
#                    le problème se produit.
# mbcsToSbcs : multi-byte character set to single-byte character set. R a tenté de convertir un caractère codé sur plusieurs octets (caractère "exotique") vers un encodage limité à un octet.
#  - substituted for — (U+2014) : R a remplacé le caractère — (cadratin, le long tiret) par le caractère - (tiret court) dans le fichier PDF produit. Le code Unicode U+2014 est l'identifiant officiel du cadratin.

# le code suivant ne produit aucun avertissement
ggsave(filename = "figures/mensuel_cpn4_1.pdf",
       plot = g_heatmap_v1,
       width = 15,
       height = 25,
       units = "cm",
       bg = "white",
       device = cairo_pdf)






#calculer le taux de couverture CPN4 annualisé par FS à partir des
#prediction: retourne data frame de 46 lingnes 2 colonnes (organisationunitname
# et moyenne), On aura un nombre pour csps kalzi par ce qu'on a ignoré les NA
# On s'attendra à une moyenne comprise entre 12-20%
cpn4_moy <- cpn4_mois |> 
  group_by(organisationunitname) |> 
  summarise(moyenne = mean(taux_cpn4, na.rm = TRUE))









#Observations:
# a---Pourquoi mettre mois en facteur au lieu de le laisser en character?
#   Quand ggplot2 reçoit une variable character sur un axe, il trie les valeurs alphabétiquement. Pas chronologiquement.
# Résultat sur ta heatmap : les colonnes seraient dans cet ordre :
#   April | August | December | February | January | July | June | ...
# Un lecteur DRS qui regarde cette heatmap ne peut pas lire la tendance temporelle — les mois sont mélangés.
# Un facteur avec levels explicites, c'est une instruction à ggplot2 : "respecte cet ordre précis, pas l'ordre alphabétique". Résultat :
# January | February | March | April | ... | December
# En résumé : character → ggplot2 trie comme il veut. Facteur → ggplot2 trie comme tu lui dis.

# b---geom_tile()

# Ce qu'elle prend en entrée : un data frame avec au minimum trois variables mappées dans aes() :
# 
# x → la variable qui va sur l'axe horizontal (ici : mois)
# y → la variable qui va sur l'axe vertical (ici : organisationunitname)
# fill → la variable numérique qui détermine la couleur de chaque cellule (ici : taux_cpn4)

# c---pour CSPS Kalzi, tu calcules une moyenne sur 11 mois, pas 12. A en tenur compte
#dans l'interprétation même si c'est négligeable











