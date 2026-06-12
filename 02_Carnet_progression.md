# Carnet de progression — Apprentissage R sur 6 mois

**Apprenant** : Dr Emmanuel **Démarrage** : \_\_\_\_\_ 19 avril 2026
**Cible de fin** : \_\_\_\_\_ 18 octobre 2026

|  |
|:-----------------------------------------------------------------------|
| \## TABLE DES MATIÈRES |
| \- [Mode d'emploi](#mode-demploi-de-ce-carnet) - [Table de rappel par espacement](#table-de-rappel-par-espacement) |
| **MOIS 1 — Fondations R** - [Semaine 1 — Installation et logique R](#semaine-1--installation-et-logique-r) - [Semaine 2 — Structures de données + Git](#semaine-2--structures-de-données--git) - [Semaine 3 — Lire et écrire des fichiers](#semaine-3--lire-et-écrire-des-fichiers) - [Semaine 4 — Conditions, boucles, fonctions](#semaine-4--conditions-boucles-fonctions) - [Bilan Mois 1](#bilan-mois-1) |
| **MOIS 2 — Tidyverse, qualité des données et visualisation** - [Semaine 5 — dplyr : manipulation professionnelle](#semaine-5--dplyr--manipulation-professionnelle) - [Semaine 6 — tidyr et nettoyage](#semaine-6--tidyr-et-nettoyage) - [Semaine 7 — ggplot2 : visualiser](#semaine-7--ggplot2--visualiser) - [Semaine 8 — lubridate et qualité des données](#semaine-8--lubridate-et-qualité-des-données) - [Bilan Mois 2](#bilan-mois-2) |
| **MOIS 3 — Statistique descriptive et inférentielle** - [Semaine 9 — Statistique descriptive professionnelle](#semaine-9--statistique-descriptive-professionnelle) - [Semaine 10 — Tests d'hypothèses](#semaine-10--tests-dhypothèses) - [Semaine 11 — Intervalles de confiance et taux standardisés](#semaine-11--intervalles-de-confiance-et-taux-standardisés) - [Semaine 12 — Régression linéaire et logistique](#semaine-12--régression-linéaire-et-logistique) - [Bilan Mois 3](#bilan-mois-3) |
| **MOIS 4 — API ENDOS-BF et automatisation** - [Semaine 13 — Introduction aux API REST](#semaine-13--introduction-aux-api-rest) - [Semaine 14 — API DHIS2 / ENDOS-BF (1) : métadonnées](#semaine-14--api-dhis2--endos-bf-1--métadonnées) - [Semaine 15 — API DHIS2 / ENDOS-BF (2) : données analytiques](#semaine-15--api-dhis2--endos-bf-2--données-analytiques) - [Semaine 16 — Automatisation et robustesse](#semaine-16--automatisation-et-robustesse) - [Bilan Mois 4](#bilan-mois-4) |
| **MOIS 5 — Surveillance épidémiologique et cartographie** - [Semaine 17 — Surveillance épidémiologique](#semaine-17--surveillance-épidémiologique) - [Semaine 18 — Analyse de mortalité](#semaine-18--analyse-de-mortalité) - [Semaine 19 — Cartographie (1) : fondations spatiales](#semaine-19--cartographie-1--fondations-spatiales) - [Semaine 20 — Cartographie (2) : cartes professionnelles](#semaine-20--cartographie-2--cartes-professionnelles) - [Bilan Mois 5](#bilan-mois-5) |
| **MOIS 6 — Reporting professionnel et projet de synthèse** - [Semaine 21 — Quarto : fondations](#semaine-21--quarto--fondations) - [Semaine 22 — Quarto avancé : rapports institutionnels](#semaine-22--quarto-avancé--rapports-institutionnels) - [Semaine 23 — Tableaux de bord](#semaine-23--tableaux-de-bord) - [Semaine 24 — Projet final](#semaine-24--projet-final) - [Bilan Mois 6 / Final](#bilan-mois-6--final) |
| \- [Notes libres](#notes-libres) |

## Mode d'emploi de ce carnet {#mode-demploi-de-ce-carnet}

À mettre à jour **à la fin de chaque session** (5-10 minutes maximum).
C'est un journal de bord, pas un mémoire — la valeur vient de la
régularité, pas de l'exhaustivité.

À chaque entrée : - **Date et durée** - **Ce qui était prévu** - **Ce
qui a été fait** - **Ce qui est acquis** - **Ce qui reste flou** -
**Prochaine étape**

À la fin de chaque **semaine** : un récapitulatif court (auto-évaluation
1-5 sur les compétences attendues).

À la fin de chaque **mois** : un bilan structuré (validation des
indicateurs de progression).

------------------------------------------------------------------------

## TABLE DE RAPPEL PAR ESPACEMENT {#table-de-rappel-par-espacement}

Cette table matérialise les révisions effectives selon le calendrier
J+1, J+7, J+30. Elle distingue désormais le **calendaire** (date
d'échéance prévue) de l'**effectif** (date à laquelle la révision a
réellement eu lieu).

### Définition d'une révision effective — niveau moyen

Une case "Révisé J+X le \_\_\_" peut être cochée si le concept a été
**mobilisé activement** dans un script ou exercice de la session du jour
— c'est-à-dire utilisé consciemment, pas juste présent par hasard dans
une ligne de code. La mobilisation en cascade par les sessions
ultérieures compte également (par exemple : `filter()` mobilise les
vecteurs et la coercition logique des semaines précédentes).

### Algorithme de calcul du statut

Pour chaque concept inscrit dans la table, Claude applique l'algorithme
suivant en début de session, en utilisant exclusivement la date réelle
du jour (jamais une date inscrite dans ce carnet) :

1.  Si "Révisé J+30 le" est rempli → **Consolidé**. Le concept sort du
    cycle actif (mais peut y revenir s'il défaille en session future).

2.  Sinon, si "Révisé J+7 le" est rempli ET J+30 prévu ≤ date du jour ET
    "Révisé J+30 le" est vide → **Dû J+30**.

3.  Sinon, si "Révisé J+1 le" est rempli ET J+7 prévu ≤ date du jour ET
    "Révisé J+7 le" est vide → **Dû J+7**.

4.  Sinon, si J+1 prévu ≤ date du jour ET "Révisé J+1 le" est vide →
    **Dû J+1**.

5.  Sinon → **À jour** (l'échéance suivante n'est pas encore arrivée).

**Règle d'enchaînement** : les révisions se font dans l'ordre. On ne
peut pas être "Dû J+7" si J+1 n'a pas été révisé. Si retard sur J+1, on
révise J+1 d'abord, même si J+7 est calendairement passé.

### Les 5 valeurs possibles — et seulement celles-là

| Valeur | Signification |
|------------------------------------|------------------------------------|
| **À jour** | L'échéance suivante n'est pas encore arrivée. Aucune révision n'est due. |
| **Dû J+1** | J+1 prévu est passé, "Révisé J+1 le" est vide. Premier rappel à faire. |
| **Dû J+7** | J+1 a été révisé, J+7 prévu est passé, "Révisé J+7 le" est vide. |
| **Dû J+30** | J+7 a été révisé, J+30 prévu est passé, "Révisé J+30 le" est vide. |
| **Consolidé** | "Révisé J+30 le" est rempli. Le concept sort du cycle actif. Peut y revenir s'il défaille lors d'une session future. |

### Colonne de synthèse "Dernière révision effective"

Pour faciliter la lecture de la table, une colonne synthétique "Dernière
révision effective" est ajoutée. Elle indique le dernier jalon de
révision effectivement réalisé pour chaque concept, sous la forme : "J+1
le DD/MM/YYYY", "J+7 le DD/MM/YYYY", "J+30 le DD/MM/YYYY" ou "Aucune" si
rien n'a encore été fait.

Cette colonne est redondante avec les colonnes "Révisé J+X le" qui
restent la source de vérité. Elle sert uniquement d'instrument de
lecture rapide pour le calcul de statut. En cas de doute, c'est toujours
la source de vérité (les colonnes détaillées) qui prime.

### TABLE DE RAPPEL

# | Concept | Source/sessions | Date d'introduction | J+1 prévu | Révisé J+1 le | J+7 prévu | Révisé J+7 le | J+30 prévu | Révisé J+30 le | Dernière révision effective | Statut |
|------|------|------|------|------|------|------|------|------|------|------|------|
| 0 | Concepts fondamentaux R : assignation `<-`, opérateurs `=` vs `==`, fonctions et arguments | session 1.1, 1.2 | 19/04/2026 | 20/04/2026 | 10/05/2026 | 26/04/2026 | 10/05/2026 | 19/05/2026 | J+30 le 23/05 | J+30 le 23/05 | Consolidé |
| 1 | Principaux types données, coercition, NA | session 1.3 | 22/04/2026 | 23/04/2026 | 10/05/2026 | 29/04/2026 | 10/05/2026 | 22/05/2026 | le 22/05 | le 22/05 | Consolidé |
| 2 | Vecteurs, indexation | session 1.4 | 23/04/2026 | 24/04/2026 | 10/05/2026 | 30/04/2026 | 10/05/2026 | 23/05/2026 | J+30 le 23/05 | J+30 le 23/05 | Consolidé |
| 3 | Les fonctions du groupe which() | session 1.5 | 23/04/2026 | 24/04/2026 | 10/05/2026 | 30/04/2026 | 10/05/2026 | 23/05/2026 | J+30 le 23/05 | J+30 le 23/05 | Consolidé |
| 4 | Liste, indexation d'une liste | session 2.1 | 23/04/2026 | 24/04/2026 | 10/05/2026 | 30/04/2026 | 10/05/2026 | 23/05/2026 | J+30 le 23/05 | J+30 le 23/05 | Consolidé |
| 5 | Structures data frames et manipulations, facteurs | 2.2, 2.3 | 24/04/2026 | 25/04/2026 | 10/05/2026 | 01/05/2026 | 10/05/2026 | 24/05/2026 | 25/05/2026 | J+30 le 25/05/2026 | Consolidé |
| 6 | GitHub, commits et push, versioning | 2.4 | 24/04/2026 | 25/04/2026 | 10/05/2026 | 01/05/2026 | 10/05/2026 | 24/05/2026 | 25/05/2026 | J+30 le 25/05/2026 | Consolidé |
| 7 | Indexation, filtrage, `is.na()`, coercition logique sur un data frame réel | 2.5 | 26/04/2026 | 27/04/2026 | 10/05/2026 | 03/05/2026 | 10/05/2026 | 26/05/2026 | 27/05/2026 | J+30 le 27/05/2026 | Consolidé |
| 8a | Lecture de fichiers : `read.csv2()`, `read_excel`, piège francophone | session 3.1, 3.2, 3.5 | 26/04/2026 | 27/04/2026 | 10/05/2026 | 03/05/2026 | 10/05/2026 | 26/05/2026 | 27/05/2026 | J+30 le 27/05/2026 | Consolidé |
| 8b | Sauvegarde fichier : `write.csv2()`, `write_xlsx`, `saveRDS` | 3.3 | 26/04/2026 | 27/04/2026 | 10/05/2026 | 03/05/2026 | 10/05/2026 | 26/05/2026 | 27/05/2026 | J+30 le 27/05/2026 | Consolidé |
| 8c | Organisation de projet | 3.4 | 26/04/2026 | 27/04/2026 | 10/05/2026 | 03/05/2026 | 10/05/2026 | 26/05/2026 | 27/05/2026 | J+30 le 27/05/2026 | Consolidé |
| 9 | `if/else`, conditions vectorisées avec `ifelse()` | 4.1 | 27/04/2026 | 28/04/2026 | 10/05/2026 | 04/05/2026 | 10/05/2026 | 27/05/2026 | 27/05/2026 | J+30 le 27/05/2026 | Consolidé |
| 10 | Boucle for | 4.2 | 28/04/2026 | 29/04/2026 | 10/05/2026 | 05/05/2026 | 10/05/2026 | 28/05/2026 | 28/05/2026 | J+30 le 28/05/2026 | Consolidé |
| 11 | `lapply()` et `sapply()` — appliquer une fonction aux éléments d'une liste ou aux colonnes d'un data frame ; lapply retourne toujours une liste, sapply simplifie quand il peut | 4.3 | 29/04/2026 | 30/04/2026 | 10/05/2026 | 06/05/2026 | 10/05/2026 | 29/05/2026 | 30/05/2026 | J+30 le 30/05/2026 | Consolidé |
| 12 | Fonctions personnalisées : structure, return(), vectorisation | 4.4 | 03/05/2026 | 04/05/2026 | 10/05/2026 | 10/05/2026 | 10/05/2026 | 02/06/2026 | 02/06/2026 | J+30 le 02/06/2026 | Consolidé |
| 13 | Arguments par défaut, stop(), any(), early return | 4.5 | 03/05/2026 | 04/05/2026 | 10/05/2026 | 10/05/2026 | 10/05/2026 | 02/06/2026 | 02/06/2026 | J+30 le 02/06/2026 | Consolidé |
| 14 | `df[[colonne]]` vs `df$colonne` — accès dynamique à une colonne | mini-projet mois 1 | 03/05/2026 | 04/05/2026 | 10/05/2026 | 10/05/2026 | 10/05/2026 | 02/06/2026 | 02/06/2026 | J+30 le 02/06/2026 | Consolidé |
| 15 | `filter()`, `select()`, `arrange()`, `mutate()`, pipe `\|>` | 5.1, 5.3 | 04/05/2026 | 05/05/2026 | 10/05/2026 | 11/05/2026 | 10/05/2026 | 03/06/2026 | 03/06/2026 | J+30 le 03/06/2026 | Consolidé |
| 16 | `grepl()` — détection de pattern dans un vecteur character, `table()`, `unique()` | 5.1, 5.3 | 04/05/2026 | 05/05/2026 | 10/05/2026 | 11/05/2026 | 10/05/2026 | 03/06/2026 | 07/06/2026 | J+30 le 07/06/2026 | Consolidé |
| 17 | `group_by()` + `summarise()` — regroupement et statistiques par groupe | 5.4 | 05/05/2026 | 06/05/2026 | 10/05/2026 | 12/05/2026 | 12/05/2026 | 04/06/2026 | 05/06/2026 | J+30 le 05/06/2026 | Consolidé |
| 18 | `sum()` sur vecteur logique — compter les lignes vérifiant une condition | 5.5 | 05/05/2026 | 06/05/2026 | 10/05/2026 | 12/05/2026 | 12/05/2026 | 04/06/2026 | 07/06/2026 | J+30 le 07/06/2026 | Consolidé |
| 19 | `pivot_longer()` / `pivot_wider()` — format large vs long | 6.1 | 06/05/2026 | 07/05/2026 | 10/05/2026 | 13/05/2026 | 15/05/2026 | 05/06/2026 | 07/06/2026 | J+30 le 07/06/2026 | Consolidé |
| 20 | Import structuré multi-niveaux : `col_names = FALSE`, `unlist()`, forward fill, `colnames()` | 6.1 rappels | 06/05/2026 | 07/05/2026 | 10/05/2026 | 13/05/2026 | 15/05/2026 | 05/06/2026 | 08/06/2026 | J+30 le 08/06/2026 | Consolidé |
| 21 | `str_to_upper/lower()`, `str_squish()`, `str_replace()` — normalisation de chaînes de caractères | 6.4 | 07/05/2026 | 08/05/2026 | 10/05/2026 | 14/05/2026 | 15/05/2026 | 04/06/2026 | 07/06/2026 | J+30 le 07/06/2026 | Consolidé |
| 22 | `separate()` et `unite()` — découpage et fusion de colonnes | 6.2 | 07/05/2026 | 08/05/2026 | 10/05/2026 | 14/05/2026 | 15/05/2026 | 04/06/2026 | 08/06/2026 | J+30 le 08/06/2026 | Consolidé |
| 23 | `complete.cases()`, `replace_na()` — gestion des NA dans un pipeline | 6.3 | 07/05/2026 | 08/05/2026 | 10/05/2026 | 14/05/2026 | 15/05/2026 | 04/06/2026 | 07/06/2026 | J+30 le 07/06/2026 | Consolidé |
| 24 | `identical()` — vérifier l'égalité exacte de deux objets R | 6.5 | 07/05/2026 | 08/05/2026 | 10/05/2026 | 14/05/2026 | 15/05/2026 | 04/06/2026 | 08/06/2026 | J+30 le 08/06/2026 | Consolidé |
| 25 | `ggplot()`, `aes()`, `geom_*()` — logique des trois couches obligatoires | 7.1 | 08/05/2026 | 09/05/2026 | 10/05/2026 | 15/05/2026 | 15/05/2026 | 07/06/2026 | 07/06/2026 | J+30 le 07/06/2026 | Consolidé |
| 26 | `geom_col()` vs `geom_bar()` : bar chart à partir de données pré-agrégées | 7.2 | 08/05/2026 | 09/05/2026 | 10/05/2026 | 15/05/2026 | 15/05/2026 | 07/06/2026 | 07/06/2026 | J+30 le 07/06/2026 | Consolidé |
| 27 | `geom_text()` + hjust + ylim() : étiquettes de valeurs et ajustement d'échelle | 7.2 | 08/05/2026 | 09/05/2026 | 10/05/2026 | 15/05/2026 | 15/05/2026 | 07/06/2026 | 07/06/2026 | J+30 le 07/06/2026 | Consolidé |
| 28 | `geom_line()` — courbe pour série temporelle | 7.3 | 09/05/2026 | 10/05/2026 | 10/05/2026 | 16/05/2026 | 17/05/2026 | 08/06/2026 | 08/06/2026 | J+30 le 08/06/2026 | Consolidé |
| 29 | `group = 1` dans `aes()` — connecter les points quand x est un facteur | 7.3 | 09/05/2026 | 10/05/2026 | 10/05/2026 | 16/05/2026 | 17/05/2026 | 08/06/2026 | 08/06/2026 | J+30 le 08/06/2026 | Consolidé |
| 30 | Détection d'une ligne fantôme (cumul/total) dans un fichier SNIS | 7.3 | 09/05/2026 | 10/05/2026 | 10/05/2026 | 16/05/2026 | 17/05/2026 | 08/06/2026 | 08/06/2026 | J+30 le 08/06/2026 | Consolidé |
| 31 | `geom_tile()` — heatmap avec `x`, `y`, `fill` dans `aes()` | 7.4 | 09/05/2026 | 10/05/2026 | 10/05/2026 | 16/05/2026 | 17/05/2026 | 08/06/2026 | 08/06/2026 | J+30 le 08/06/2026 | Consolidé |
| 32 | `theme()` + `element_text()` — modifier les éléments non-données d'un graphique | 7.4 | 09/05/2026 | 10/05/2026 | 10/05/2026 | 16/05/2026 | 17/05/2026 | 08/06/2026 | 08/06/2026 | J+30 le 08/06/2026 | Consolidé |
| 33 | `theme_minimal()` (et famille `theme_*()`) — thèmes pré-construits et règle d'ordre : la dernière couche `theme` écrite l'emporte sur les propriétés communes | 7.5 | 11/05/2026 | 12/05/2026 | 12/05/2026 | 18/05/2026 | 18/05/2026 | 10/06/2026 | 10/06/2026 | J+30 le 10/06/2026| Consolidé |
| 34 | `scale_fill_distiller()` + argument `direction` — palette ColorBrewer continue, sens d'application à vérifier par lecture de la légende | 7.5 | 11/05/2026 | 12/05/2026 | 12/05/2026 | 18/05/2026 | 18/05/2026 | 10/06/2026 | 10/06/2026 | J+30 le 10/06/2026 | Consolidé|
| 35 | `ggsave()` — export reproductible PNG/PDF avec `width`, `height`, `units`, `dpi`, `bg` explicites | 7.5 | 11/05/2026 | 12/05/2026 | 12/05/2026 | 18/05/2026 | 18/05/2026 | 10/06/2026 |  10/06/2026 | J+30 le 10/06/2026 | Consolidé|
| 36 | `parse_date_time()` + `as.Date()` — parsing de formats hétérogènes, argument `orders` | 8.1 | 12/05/2026 | 13/05/2026 | 15/05/2026 | 19/05/2026 | 22/05/2026 | 11/06/2026 |  | J+7 le 22/05/2026 | À jour |
| 37 | `epiweek()` — numéro de semaine épidémiologique à partir d'une `Date` | 8.1 | 12/05/2026 | 13/05/2026 | 15/05/2026 | 19/05/2026 | 22/05/2026 | 11/06/2026 |  | J+7 le 22/05/2026 | À jour |
| 38 | Soustraction de deux `Date` + `as.numeric()` — calcul de délai en jours | 8.1 | 12/05/2026 | 13/05/2026 | 15/05/2026 | 19/05/2026 | 22/05/2026 | 11/06/2026 |  | J+7 le 22/05/2026 | À jour |
| 39 | `str_remove()` + regex — suppression de pattern variable dans une chaîne | 8.2 | 12/05/2026 | 13/05/2026 | 15/05/2026 | 19/05/2026 | 22/05/2026 | 11/06/2026 |  | J+7 le 22/05/2026 | À jour |
| 40 | `str_trunc()` — tronquer une chaîne à une largeur maximale | 8.2 | 12/05/2026 | 13/05/2026 | 15/05/2026 | 19/05/2026 | 22/05/2026 | 11/06/2026 |  | J+7 le 22/05/2026 | À jour |
| 41 | `str_detect()` + `regex(ignore_case = TRUE)` — détecter un pattern sans contrainte de casse | 8.2 | 12/05/2026 | 13/05/2026 | 15/05/2026 | 19/05/2026 | 22/05/2026 | 11/06/2026 |  | J+7 le 22/05/2026 | À jour |
| 42 | `sample()` + `set.seed()` — simulation aléatoire reproductible | 8.3 | 12/05/2026 | 13/05/2026 | 15/05/2026 | 19/05/2026 | 22/05/2026 | 11/06/2026 |  | J+7 le 22/05/2026 | À jour |
| 43 | `across()` + `where()` — opérer sur plusieurs colonnes par type dans summarise() et select() | 8.3 | 12/05/2026 | 13/05/2026 | 15/05/2026 | 19/05/2026 | 22/05/2026 | 11/06/2026 |  | J+7 le 22/05/2026 | À jour |
| 44 | Complétude = sum(!is.na()) / valeurs attendues x 100 — indicateur qualité données | 8.3 | 12/05/2026 | 13/05/2026 | 15/05/2026 | 19/05/2026 | 22/05/2026 | 11/06/2026 | 11/06/2026 | J+30 le 11/06/2026 | Consolidé |
| 45 | Promptitude = sum(date <= délai) / total x 100 — indicateur qualité données | 8.3 | 12/05/2026 | 13/05/2026 | 15/05/2026 | 19/05/2026 | 22/05/2026 | 11/06/2026 | 11/06/2026 | J+30 le 11/06/2026 | Consolidé |
| 46 | `quantile()` + `probs` — calcul de percentiles (Q1, Q3) sur un vecteur numérique | 8.4 | 12/05/2026 | 13/05/2026 | 15/05/2026 | 19/05/2026 | 22/05/2026 | 11/06/2026 |  | J+7 le 22/05/2026 | À jour |
| 47 | Méthode Tukey : bornes = Q1 - 1.5xIQR et Q3 + 1.5xIQR — détection aberrants robuste | 8.4 | 12/05/2026 | 12/05/2026 | 15/05/2026 | 19/05/2026 | 22/05/2026 | 11/06/2026 |  | J+7 le 22/05/2026 | À jour |
| 48 | `case_when()` — alternative à ifelse() | session 8.5 | 18/05/2026 | 19/05/2026 | 23/05/2026 | 25/05/2026 | 25/05/2026 | 17/06/2026 |  | J+7 le 25/05/2026 | À jour |
| 49 | `scale_fill_gradient2()` — dégradé bidirectionnel avec `low`, `mid`, `high` et `midpoint` ; `na.value` pour distinguer les NA | mini-projet mois 2 | 23/05/2026 | 24/05/2026 | 25/05/2026 | 30/05/2026 | 30/05/2026 | 22/06/2026 |  | J+7 le 30/05/2026 | À jour |
| 50 | `fct_recode()` — renommer les niveaux d'un factor avec paires `"nouveau" = "ancien"` ; ordre des niveaux préservé | mini-projet mois 2 | 23/05/2026 | 24/05/2026 | 25/05/2026 | 30/05/2026 | 30/05/2026 | 22/06/2026 |  | J+7 le 30/05/2026 | À jour |
| 51 | `fct_reorder()` — réordonner les niveaux d'un factor selon une variable numérique et une fonction résumé (`mean`, `median`) | mini-projet mois 2 | 23/05/2026 | 24/05/2026 | 25/05/2026 | 30/05/2026 | 30/05/2026 | 22/06/2026 |  | J+7 le 30/05/2026 | À jour |
| 52 | `scale_x_discrete(expand = c(m, a))` — contrôle des marges autour d'un axe discret : m = multiplicateur proportionnel, a = ajout absolu | mini-projet mois 2 | 23/05/2026 | 24/05/2026 | 25/05/2026 | 30/05/2026 | 30/05/2026 | 22/06/2026 |  | J+7 le 30/05/2026 | À jour |
| 53 | `clean_names()` — normalise noms de colonnes en snake_case : espaces->_, majuscules->minuscules, caractères spéciaux supprimés (package `janitor`) | 9.1 | 25/05/2026 | 26/05/2026 | 26/05/2026 | 01/06/2026 | J+7 le 01/06/2026 | 24/06/2026 |  | J+7 le 01/06/2026 | À jour |
| 54 | Règle distribution -> résumé : asymétrique -> médiane + IQR ; symétrique -> moyenne + SD | 9.1 | 25/05/2026 | 26/05/2026 | 26/05/2026 | 01/06/2026 | J+7 le 01/06/2026 | 24/06/2026 |  | J+7 le 01/06/2026 | À jour |
| 55 | `geom_histogram()` — visualiser la distribution d'une variable continue par intervalles de valeurs ; argument clé : `bins` ou `binwidth` | 9.2 | 26/05/2026 | 27/05/2026 | 27/05/2026 | 02/06/2026 | 02/06/2026 | 25/06/2026 |  | J+7 le 02/06/2026 | À jour |
| 56 | `geom_boxplot()` — comparer la distribution d'une variable continue entre groupes : médiane, IQR, moustaches, points aberrants | 9.2 | 26/05/2026 | 27/05/2026 | 27/05/2026 | 02/06/2026 | 02/06/2026 | 25/06/2026 |  | J+7 le 02/06/2026 | À jour |
| 57 | `geom_density()` — comparer la forme de la distribution d'une variable continue entre groupes via courbe lissée ; axe y = densité de probabilité, aire totale = 1 | 9.2 | 26/05/2026 | 27/05/2026 | 27/05/2026 | 02/06/2026 | 02/06/2026 | 25/06/2026 |  | J+7 le 02/06/2026 | À jour |
| 58 | `stat_qq()` + `stat_qq_line()` — évaluer si une distribution s'approche d'une loi normale théorique ; utilise `aes(sample = variable)` et non `aes(x = )` | 9.2 | 26/05/2026 | 27/05/2026 | 27/05/2026 | 02/06/2026 | 02/06/2026 | 25/06/2026 |  | J+7 le 02/06/2026 | À jour |
| 59 | `shapiro.test()` — tester la normalité : H0 = distribution normale ; p < 0.05 -> rejeter H0 ; W proche de 1 = proche de la normale ; limité à 5000 observations | 9.3 | 27/05/2026 | 28/05/2026 | 28/05/2026 | 03/06/2026 | 08/06/2026 | 26/06/2026 |  | J+7 le 08/06/2026 | À jour |
| 60 | `tbl_summary()` — tableau 1 publiable : résumé automatique médiane/IQR pour continu, n/% pour catégoriel ; arguments clés : `label`, `missing_text` | 9.3 | 27/05/2026 | 28/05/2026 | 28/05/2026 | 03/06/2026 | 05/06/2026 | 26/06/2026 |  | J+7 le 05/06/2026 | À jour |
| 61 | `modify_header()` (gtsummary) — modifie l'en-tête d'une colonne ; cible le nom interne (`label` à gauche, `stat_0`/`stat_1`… pour les stats) ; gras via markdown `**texte**` ; n'agit que sur les titres, pas les données | 12.x reporting | 07/06/2026 | 08/06/2026 | 08/06/2026 | 14/06/2026 |  | 07/07/2026 |  | J+1 le 08/06/2026 | À jour |
| 62 | `as_flex_table()` (gtsummary) — convertit un objet gtsummary en objet flextable pour export Word/PPT ; point de non-retour : après conversion, les fonctions gtsummary ne s'appliquent plus ; toujours en dernier de la chaîne gtsummary | 12.x reporting | 07/06/2026 | 08/06/2026 | 08/06/2026 | 14/06/2026 |  | 07/07/2026 |  | J+1 le 08/06/2026 | À jour |
| 63 | `save_as_docx()` (flextable) — écrit un objet flextable en fichier .docx ; effet de bord (retourne le chemin, pas un objet R) ; exige un flextable en entrée ; chemin relatif ancré sur getwd(), ou here() pour ancrage projet | 12.x reporting | 07/06/2026 | 08/06/2026 | 08/06/2026 | 14/06/2026 |  | 07/07/2026 |  | J+1 le 08/06/2026 | À jour |
| 64 | `request()` — construit un objet `httr2_request` avec l'URL de base du serveur ; point de départ de tout pipeline `httr2` | 10.3 | 28/05/2026 | 29/05/2026 | 30/05/2026 | 04/06/2026 | 03/06/2026 | 27/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 65 | `req_url_query()` — ajoute des paramètres nommés à l'URL d'un objet `httr2_request` ; construit la query string automatiquement (`?clé=valeur&clé=valeur`) | 10.3 | 28/05/2026 | 29/05/2026 | 30/05/2026 | 04/06/2026 | 03/06/2026 | 27/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 66 | `req_perform()` — envoie la requête au serveur et retourne un objet `httr2_response` contenant le code de statut, les headers et le body brut (bytes) | 10.3 | 28/05/2026 | 29/05/2026 | 30/05/2026 | 04/06/2026 | 03/06/2026 | 27/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 67 | `resp_body_json()` — décode le body JSON d'un objet `httr2_response` en liste R imbriquée | 10.3 | 28/05/2026 | 29/05/2026 | 30/05/2026 | 04/06/2026 | 03/06/2026 | 27/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 68 | `fromJSON()` — parse une chaîne JSON en objet R ; tableau homogène → data frame, hétérogène → liste ; piège : valeurs numériques entre guillemets arrivent en chr | 10.2 | 28/05/2026 | 29/05/2026 | 30/05/2026 | 04/06/2026 | 07/06/2026 | 27/06/2026 |  | J+7 le 07/06/2026 | À jour |
| 69 | `colnames(df) <- vecteur` — assigne les noms des colonnes d'un data frame à partir d'un vecteur character | 10.2 | 28/05/2026 | 29/05/2026 | 30/05/2026 | 04/06/2026 | 03/06/2026 | 27/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 70 | `as.data.frame()` — convertit une matrice, liste ou vecteur en data frame ; noms de colonnes génériques (V1, V2...) si non assignés | 10.2 | 28/05/2026 | 29/05/2026 | 30/05/2026 | 04/06/2026 | 03/06/2026 | 27/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 71 | `req_url_path_append()` — ajoute un segment de chemin à un `httr2_request` (gère le `/` automatiquement) ; entrée : requête + segment(s) ; sortie : requête au chemin allongé | 10.3 | 30/05/2026 | 31/05/2026 | 31/05/2026 | 06/06/2026 | 03/06/2026 | 29/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 72 | `req_auth_basic(req, username, password)` — ajoute l'authentification HTTP basique (header Authorization) ; s'insère avant `req_perform()` ; l'auth est un sens unique, le mot de passe n'est jamais retourné | 10.4 | 30/05/2026 | 31/05/2026 | 31/05/2026 | 06/06/2026 | 03/06/2026 | 29/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 73 | Verbes HTTP : `GET` (lire/récupérer une ressource) et `POST` (créer/envoyer des données) ; pour ENDOS-BF, usage quasi exclusif de GET (extraction), jamais de POST | 10.1 | 28/05/2026 | 29/05/2026 | 30/05/2026 | 04/06/2026 | 03/06/2026 | 27/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 74 | Codes de statut HTTP : 200 (succès), 401 (non authentifié), 404 (introuvable), 500 (erreur serveur) — vérifier le statut avant de décoder le body | 10.1 | 28/05/2026 | 29/05/2026 | 30/05/2026 | 04/06/2026 | 03/06/2026 | 27/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 75 | `usethis::edit_r_environ()` — ouvre (et crée si absent) le fichier `~/.Renviron` dans RStudio ; redémarrage R obligatoire après modification | 10.5 | 31/05/2026 | 01/06/2026 | 01/06/2026 | 07/06/2026 | 03/06/2026 | 30/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 76 | `Sys.getenv("NOM")` — récupère la valeur d'une variable d'environnement définie dans `.Renviron` ; retourne `""` si la variable n'existe pas | 10.5 | 31/05/2026 | 01/06/2026 | 01/06/2026 | 07/06/2026 | 03/06/2026 | 30/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 77 | `pageSize` — paramètre de pagination DHIS2 : nombre de résultats retournés par page ; par défaut 50 ; augmenter pour récupérer tous les résultats en une requête ; `\$pager\$total` indique le nombre total de résultats disponibles | 11.1 | 31/05/2026 | 01/06/2026 | 01/06/2026 | 07/06/2026 | 03/06/2026 | 30/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 78 | `req_url_query(fields = "id,displayName,level")` — paramètre DHIS2 spécifiant les champs retournés dans la réponse ; sans lui, DHIS2 retourne le minimum (`id` + `displayName`) | 11.2 | 31/05/2026 | 01/06/2026 | 01/06/2026 | 07/06/2026 | 03/06/2026 | 30/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 79 | champ `path` d'une unité d'organisation DHIS2 — chaîne hiérarchique complète sous la forme `/uid_national/uid_region/.../uid_unite` ; permet de situer une unité dans l'arbre et de filtrer toutes les unités sous une branche | 11.2 | 31/05/2026 | 01/06/2026 | 01/06/2026 | 07/06/2026 | 03/06/2026 | 30/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 80 | `filter = "path:like:UID"` + `level = N` — isoler toutes les unités d'un niveau hiérarchique précis sous une branche donnée ; `parent` ne retourne que les enfants directs, `path:like` capture tous les descendants | 11.2 | 31/05/2026 | 01/06/2026 | 01/06/2026 | 07/06/2026 | 03/06/2026 | 30/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 81 | `like` vs `ilike` dans un filtre DHIS2 — `like` sensible à la casse, `ilike` insensible ; recherche de sous-chaîne dans les deux cas ; pour un `path` (UID à casse fixe) les deux sont équivalents | 11.2 | 31/05/2026 | 01/06/2026 | 01/06/2026 | 07/06/2026 | 03/06/2026 | 30/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 82 | endpoint `/organisationUnitGroups` + filtre `organisationUnitGroups.id:eq:UID` — catégorisation transversale des unités (public/privé) indépendante de la hiérarchie géographique | 11.2 | 31/05/2026 | 01/06/2026 | 01/06/2026 | 07/06/2026 | 03/06/2026 | 30/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 83 | `.multi = "explode"` dans `req_url_query()` — sérialise un vecteur de plusieurs valeurs pour un même paramètre en répétant la clé dans l'URL (`filter=A&filter=B`) ; nécessaire pour cumuler plusieurs filtres DHIS2 | 11.2 | 31/05/2026 | 01/06/2026 | 01/06/2026 | 07/06/2026 | 03/06/2026 | 30/06/2026 |  | J+7 le 03/06/2026 | À jour |
| 84 | `left_join(x, y, by = c("col_x" = "col_y"))` — jointure gauche : toutes les lignes de x conservées, colonnes de y ajoutées avec NA si pas de correspondance ; colonne-clé de y supprimée, celle de x conservée ; x = table maître | 11.4 | 01/06/2026 | 02/06/2026 | 02/06/2026 | 08/06/2026 | 08/06/2026 | 01/07/2026 |  | J+7 le 08/06/2026 | À jour |
| 85 | `%in%` — teste si chaque élément d'un vecteur appartient à un ensemble de valeurs de référence ; retourne un vecteur logique de même longueur que le vecteur testé ; combiné avec `which()` pour retrouver les index | 11.5 | 01/06/2026 | 02/06/2026 | 02/06/2026 | 08/06/2026 | 08/06/2026 | 01/07/2026 |  | J+7 le 08/06/2026 | À jour |
| 86 | `rootJunction = "OR"` dans `req_url_query()` DHIS2 — inverse la logique de combinaison des filtres multiples : par défaut AND -> OR (au moins un filtre vrai) ; indispensable pour filtrer par appartenance à l'un de plusieurs groupes | 11.5 | 01/06/2026 | 02/06/2026 | 02/06/2026 | 08/06/2026 | 08/06/2026 | 01/07/2026 |  | J+7 le 08/06/2026 | À jour |
| 87 | endpoint `/api/analytics` — syntaxe canonique `dimension=dx:UID&dimension=pe:...&dimension=ou:...` sérialisée via `.multi = "explode"` ; ce serveur ENDOS-BF REFUSE les raccourcis `dx=/pe=/ou=` (erreur 409 / E7104) ; périodes absolues `YYYYMM` (jamais `LAST_12_MONTHS` en production) | 12.1 | 05/06/2026 | 06/06/2026 | 07/06/2026 | 12/06/2026 |  | 05/07/2026 |  | J+1 le 07/06/2026 | À jour |
| 88 | structure réponse analytics : `\$rows` (liste de lignes), `\$headers` (colonnes, `\$name` = nom court : dx/pe/ou/value), `\$metaData\$items` (dictionnaire UID->nom), `\$height` (nb lignes reçues) ; toutes les valeurs sont en texte, d'où `as.numeric()` obligatoire sur `value` | 12.1 | 05/06/2026 | 06/06/2026 | 07/06/2026 | 12/06/2026 |  | 05/07/2026 |  | J+1 le 07/06/2026 | À jour |
| 89 | `do.call(rbind, liste)` — applique `rbind` sur une liste de longueur inconnue en déballant ses éléments comme arguments séparés ; `do.call(f, args)` = `f(args[[1]], args[[2]], ...)` | 12.1 | 05/06/2026 | 06/06/2026 | 07/06/2026 | 12/06/2026 |  | 05/07/2026 |  | J+1 le 07/06/2026 | À jour |
| 90 | `expand.grid()` — génère toutes les combinaisons possibles de vecteurs (grille de référence du « ce qui devrait exister ») ; nb lignes = produit des longueurs ; `stringsAsFactors = FALSE` obligatoire sinon colonnes en facteurs -> conflit de types au `left_join` | 12.1 | 05/06/2026 | 06/06/2026 | 07/06/2026 | 12/06/2026 |  | 05/07/2026 |  | J+1 le 07/06/2026 | À jour |
| 91 | `unlist()` — aplatit une liste (même imbriquée) en un vecteur atomique unique ; supprime la structure de liste et concatène les éléments terminaux | 12.1 | 05/06/2026 | 06/06/2026 | 07/06/2026 | 12/06/2026 |  | 05/07/2026 |  | J+1 le 07/06/2026 | À jour |
| 92 | piège `do.call(rbind, liste_de_listes)` -> colonnes de type `list` (et non `chr`), invisibles à `dim()`/`class(value)` mais révélées par `str()`, qui bloquent `left_join` ; corriger en aplatissant chaque ligne AVANT empilement : `lapply(rows, \(l) unlist(l))` | 12.1 | 05/06/2026 | 06/06/2026 | 07/06/2026 | 12/06/2026 |  | 05/07/2026 |  | J+1 le 07/06/2026 | À jour |
| 93 | `left_join` — complément #84 : peut AUGMENTER le nombre de lignes de la table de gauche si une clé y correspond à plusieurs lignes à droite (expansion par appariement, différent de déduplication) | 12.x | 05/06/2026 | 06/06/2026 | 07/06/2026 | 12/06/2026 |  | 05/07/2026 |  | J+1 le 07/06/2026 | À jour |
| 94 | `here()` (package here) — construit un chemin absolu depuis la racine du projet (.Rproj/.here) à partir de fragments en chaînes : `here("data","fichier.docx")` ; reproductible multi-OS et multi-poste, supérieur aux chemins relatifs et à setwd() | 12.x reporting | 07/06/2026 | 08/06/2026 | 08/06/2026 | 14/06/2026 |  | 07/07/2026 |  | J+1 le 08/06/2026 | À jour |
| 95 | `bind_rows()` — empilement vertical de tibbles ; union des colonnes, NA si colonne absente d'un côté (sans avertissement) ; prérequis `identical(names())` ; opposé de `bind_cols()` | pipeline palu TLOH | 10/06/2026 | 11/06/2026 | J+1 le 11/06/2026 | 17/06/2026 |  | 10/07/2026 |  |J+1 le 11/06/2026 J+0| À jour |
| 96 | `coalesce(x, y)` — remplace les NA de x par y ; vectoriel et asymétrique ; ne touche pas `Inf` (mais oui `NaN`) ; idiomatique dans `across()` ; complément de `replace_na()` (#23) | pipeline palu TLOH | 10/06/2026 | 11/06/2026 |  | 17/06/2026 |  | 10/07/2026 |  | J+0 le 10/06/2026 | À jour |
| 97 | `cat()` — affichage console sans guillemets ni `[1]` ; n'ajoute pas `\n` automatiquement (piège du prompt collé) ; retourne NULL invisible ; ≠ `message()` qui va vers stderr | pipeline palu TLOH | 10/06/2026 | 11/06/2026 | J+1 le 11/06/2026 | 17/06/2026 |  | 10/07/2026 |  | J+1 le 11/06/2026 | À jour |
| 98 | `grep(pattern, x, value = TRUE)` — recherche de motif dans un vecteur character ; sans `value` retourne les indices, avec `value = TRUE` retourne les valeurs ; sensible à la casse (`ignore.case = TRUE` pour neutraliser) | pipeline palu TLOH | 10/06/2026 | 11/06/2026 |  | 17/06/2026 |  | 10/07/2026 |  | J+0 le 10/06/2026 | À jour |
| 99 | `seq(from, to, by)` — vecteur numérique régulier (graduations d'axe) ; borne `to` incluse seulement si elle tombe juste sur le pas ; variante `length.out` | pipeline palu TLOH | 10/06/2026 | 11/06/2026 |  | 17/06/2026 |  | 10/07/2026 |  | J+0 le 10/06/2026 | À jour |
| 100 | `.by = ` dans `summarise()` — groupement ponctuel (vs `group_by()` persistant qui exige `ungroup()`) ; ne laisse pas de groupement résiduel ; plus robuste en pipeline de production | pipeline palu TLOH | 10/06/2026 | 11/06/2026 |  | 17/06/2026 |  | 10/07/2026 |  | J+0 le 10/06/2026 | À jour |
| 101 | Évaluation séquentielle dans `summarise()`/`mutate()` — une colonne créée peut être réutilisée par un argument suivant du même appel (ordre d'écriture = ordre d'exécution) | pipeline palu TLOH | 10/06/2026 | 11/06/2026 |  | 17/06/2026 |  | 10/07/2026 |  | J+0 le 10/06/2026 | À jour |
| 102 | ignoreLimit="true" comme garde anti-troncature analytics | pipeline indicateurs ENDOS | 11/06/2026 | 12/06/2026 |  | 19/06/2026 |  | 11/07/2026 |  | J+0 le 11/06/2026 | À jour |

---
editor_options: 
  markdown: 
    wrap: 72
---

### Semaine 1 — Installation et logique R

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_

#### Session 1.1 — Installation

-   **Date** :19 avril 2026 (2 heures)
-   **Durée** : 02 heures
-   **Prévu** : Installation R officiel CRAN, RStudio, premier projet
-   **Fait** : installation, création de script, création de projet,
    calcul arithmetiques, assignation d'objet
-   **Acquis** : Tous les éléments prévus ont été acquis
-   **Flou** : Quand est ce que la console est silencieuse? Confusion
    calcul et assignation d'objet
-   **Prochaine étape** : session 1.2: concepts objet/fonction/\<-/
    console vs script

#### Session 1.2 — Concepts fondamentaux

-   **Date** : 21 avril 2026
-   **Durée** : 1h30
-   **Prévu** : objet, fonction, `<-`, console vs script
-   **Fait** : objets, arguments nommés, arguments positionnels, syntax
    d'appel console et script
-   **Acquis** : différence entre objet, noms et valeurs, fonctions
    comment rediger les commentaires, règle de redaction des
    commentaires, distinction paranetre et argument
-   **Flou** : néant
-   **Prochaine étape** : session suivante

#### Session 1.3 — Types de données

-   **Date** : 22 avril 2026

-   **Durée** : 3 heures avec pauses

-   **Prévu** : numeric, character, logical, NA

-   **Fait** :Bloc 1: Les quatre types fondamentaux : numeric,
    character, logical, NA Bloc 2: La coercition automatique et la
    hiérarchie L-N-C Bloc 3: Le comportement de NA : propagation,
    incomparabilité, détection, exclusion Bloc 4: Mini-cas couverture
    CPN4 : application concrète de tout ce qui précède

-   **Acquis** : la maitrise des types de données, l'ordre de coercition
    entre les types de données, character gagne sur tout, logical perd
    sur tout, la coercition silencieuse, calculs avec NA, distinction
    entre = et ==

-   **Flou** : néant

-   **Prochaine étape** : session 1.4 — vecteurs (création, indexation,
    opérations vectorielles)

#### Session 1.4 — Vecteurs

-   **Date** : 23 avril 2026

-   **Durée** : 1h30

-   **Prévu** : création, indexation, opérations vectorielles

-   **Fait** : indexation par position, indexation logique, opération
    vectorielle

-   **Acquis** : vecteur[i], vecteur[i,j], vecteur[i:j], vecteur [-i]
    selection par condition

-   **Flou** : néant

-   **Prochaine étape** :session 1.5 — mini-exercice statistiques
    descriptives sur un vecteur CPN4

#### Session 1.5 — Mini-exercice CPN4 fictif

-   **Date** : 23 avril 2026
-   **Durée** : 01h30
-   **Prévu** : statistiques descriptives sur un vecteur
-   **Fait** : calcul de moyenne, utilisation de which, max, min, sd et
    étendue
-   **Acquis** : maitrise de which.max(), which.min() et which()
    application de ce que j'ai appris jusque là pour faire quelques
    statistiques descriptives.
-   **Flou** : l'interpretation metier qui ne va ps jusqu'a la
    conclusion opérationnelle sans s'arrêter juste à la description des
    chiffres
-   **Prochaine étape** : entamer la semaine 2

#### Récapitulatif semaine 1

| Compétence attendue                        | Auto-éval (1-5) | Commentaire |
|--------------------------------------------|-----------------|-------------|
| Créer un vecteur, l'indexer, opérer dessus | 4               |             |
| Comprendre `=`, `<-`, `==`                 | 4.5             |             |
| Comprendre la propagation des `NA`         | 4.5             |             |

**Décision** : passer à la semaine 2 / consolider / autre : **Points à
réviser dans la semaine qui vient** :

------------------------------------------------------------------------

### Semaine 2 — Structures de données + Git

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 2.1 — Listes

-   **Date** : 23 avril 2026
-   **Durée** : \~1h30
-   **Prévu** : listes, différence entre vecteur et liste, opérateurs
    `[ ]` vs `[[ ]]` vs `$`
-   **Fait** : création avec `list()`, accès par les trois opérateurs,
    pièges syntaxe (guillemets dans `[[ ]]`), cas CSPS Boassa et Bazoulé
-   **Acquis** : distinction `[ ]` (retourne liste) vs `[[ ]]` et `$`
    (retournent contenu brut) ; `length()` d'une liste = nombre
    d'éléments de premier niveau
-   **Flou** : lecture rapide de l'affichage console d'une liste
    (hiérarchie `$nom` puis `[position]`)
-   **Prochaine étape** : session 2.2 — Data frames (structure, colonnes
    comme vecteurs)

#### Session 2.2 — Data frames

-   **Date** : 24 avril 2026
-   **Durée** :1h30
-   **Prévu** :data frame
-   **Fait** :structures data frame
-   **Acquis** :structure du data frame, syntaxe [ligne, colonne], ajout
    de colonne, filtrage conditionnel
-   **Flou** : le filtre et la selection des données dans une table
    surtout avec le vide avant et après dans les crochets
-   **Prochaine étape** : session 2.3 -facteurs \#### Session 2.3 —
    Facteurs
-   **Date** : 24/04/2026
-   **Durée** :30 minutes
-   **Prévu** :Facteurs
-   **Fait** : transformer vecteur character en facteur, levels,
    classement des categories avec le parametre levels, summary
-   **Acquis** : Un facteur est un vecteur character avec une liste fixe
    de catégories appelées niveaux (levels) factor() convertit un
    character en facteur summary() affiche les fréquences sur un facteur
    — pas sur un character Un facteur refuse toute valeur hors de ses
    niveaux — remplace par NA avec avertissement Tu contrôles l'ordre
    des niveaux avec l'argument levels
-   **Flou** :
-   **Prochaine étape** : Session 2.4 — Git + GitHub

#### Session 2.4 — Git + GitHub

-   **Date** : 24 avril 2026
-   **Durée** : 01h
-   **Prévu** : Git+gitHub
-   **Fait** :installation creation de compte et configurations gitHub
-   **Acquis** : creation compte, commit, push, utilisation de Git
-   **Flou** : pourquoi les termes commits, push et versionner?
-   **Prochaine étape** : Data frame des indicateurs prioritaires

#### Session 2.5 — Data frame des indicateurs prioritaires

-   **Date** : 26/04/2026
-   **Durée** : 01h
-   **Prévu** : dictionnaire avec data frame
-   **Fait** : créer un dictionnaire d'indicateurs structuré à partir de
    ta réflexion métier, identifier et corriger des problèmes de
    cohérence (espaces parasites, casse, nommage), et mobiliser les
    acquis des sessions précédentes (indexation, filtrage, is.na(),
    coercition logique)
-   **Acquis** : oui tout ce qui a était prévu
-   **Flou** :
-   **Prochaine étape** : semaine 3

#### Récapitulatif semaine 2

| Compétence attendue                        | Auto-éval (1-5) | Commentaire |
|--------------------------------------------|-----------------|-------------|
| Créer un data frame manuellement           | 4               |             |
| Premier `git commit` et `git push` réussis | 4               |             |
| Comprendre l'utilité d'un facteur          | 4.5             |             |

**Décision** : On progresse **Points à réviser** : facteur vs character

------------------------------------------------------------------------

### Semaine 3 — Lire et écrire des fichiers

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 3.1 — Lire un CSV

-   **Date** : 26/04/2026
-   **Durée** : 01h
-   **Prévu** : la fonction read.csv() et read.csv2()
-   **Fait** : lire csv et connaitre les argument utilisés
-   **Acquis** : read.csv et read.csv2 avec les arguments na.string,
    head et encode
-   **Flou** :
-   **Prochaine étape** : session 3.2 - lecture excel\
    \#### Session 3.2 — Lire un Excel
-   **Date** : 26/04/2026
-   **Durée** : 01h
-   **Prévu** : lire un fichier excel
-   **Fait** : read_excel() avec le paramètre sheet
-   **Acquis** : lire excel
-   **Flou** :
-   **Prochaine étape** : sauvegarder \#### Session 3.3 — Sauvegarder
-   **Date** : 26/04/2026
-   **Durée** : 3o minutes
-   **Prévu** : sauvegarde
-   **Fait** : write.csv2() pour partager, write_xlsx() pour
    l'institutionnel
-   **Acquis** : sauvegarde dans les trois formats principaux
-   **Flou** : Non
-   **Prochaine étape** : Chemins relatifs / projets RStudio \####
    Session 3.4 — Chemins relatifs / projets RStudio
-   **Date** : 26/04/2026
-   **Durée** : 30 minutes
-   **Prévu** : Chemins relatifs / projets RStudio
-   **Fait** : Chemins relatifs avec les projets RStudio, getwd()
-   **Acquis** : Chemins relatifs avec les projets RStudio, getwd()
-   **Flou** : non
-   **Prochaine étape** : cas réel ENDOS-BF \#### Session 3.5 — Cas réel
    ENDOS-BF
-   **Date** : 26/04/2026
-   **Durée** : 01h30
-   **Prévu** : Importation et inspection d'un vrai fichier ENDOS-BF
-   **Fait** : lignes agrégées à identifier, NA structurels, décalage
    d'index avec which.max()
-   **Acquis** : Importation et inspection d'un vrai fichier ENDOS-BF
-   **Flou** : non
-   **Prochaine étape** : semaine 4, les fonctions \#### Récapitulatif
    semaine 3 Session 3.1 — read.csv() vs read.csv2(), le piège
    francophone, les erreurs silencieuses d'importation. Session 3.2 —
    read_excel() avec le paramètre sheet, excel_sheets() pour lister les
    feuilles. Session 3.3 — Trois formats de sauvegarde : write.csv2()
    pour partager, write_xlsx() pour l'institutionnel, saveRDS() pour
    toi. Le CSV perd les types, le RDS conserve tout. Session 3.4 —
    Chemins relatifs avec les projets RStudio, getwd(). Session 3.5 —
    Importation et inspection d'un vrai fichier ENDOS-BF : lignes
    agrégées à identifier, NA structurels, décalage d'index avec
    which.max().

| Compétence attendue                           | Auto-éval (1-5) |
|-----------------------------------------------|-----------------|
| Importer un fichier français (`;`, `,`)       | 3               |
| Inspecter avec `str()`, `summary()`, `head()` | 4               |
| Sauvegarder dans 3 formats                    | 4               |

------------------------------------------------------------------------

### Semaine 4 — Conditions, boucles, fonctions

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 4.1 — `if/else`

complétée - **Date et durée**: 27 avril, 01h - **Ce qui était prévu**
conditions if/else - **Ce qui a été fait** if/else ifelse - **Ce qui est
acquis** - conditions vectorisées avec
`ifelse()  **Ce qui reste flou** - lfelse imbriqué. flou clos. **Prochaine étape** Boucles`for`#### Session 4.2 — Boucles`for`- **Date et durée**: 28 avril 2026, 02h  - **Ce qui était prévu** boucle for  - **Ce qui a été fait** structure de la boucle for construction de la boucle for, application sur un vecteur de longueur 5, la fonction paste(), la fonction print(), la fonction character pour la creation d'un vecteur vide pour stocker les résultats de la boucle for  - **Ce qui est acquis** structure de la boucle for construction de la boucle for, application sur un vecteur de longueur 5, la fonction paste(), la fonction print(), la fonction character() pour la creation d'un vecteur vide pour stocker les résultats de la boucle for, la fonction length()  - **Ce qui reste flou**: non #### Session 4.3 — Vectorisation et`apply -
**Date et durée**: 29 avril 2026, 02h - **Ce qui était prévu**
Vectorisation et\`apply - **Ce qui a été fait** lapply, sapply, tapply -
**Ce qui est acquis** vectorisation et les fonction du groupe apply -
**Ce qui reste flou**: non - **Prochaine étape** Fonctions
personnalisées \#### Session 4.4 — Fonctions personnalisées - **Date et
durée**: 03 mai 2026, 01h30 - **Ce qui était prévu** Fonctions
personnalisées - **Ce qui a été fait** Structure d'une fonction,
Écriture d'une fonction métier réelle, Test sur scalaires et cas
limites, Application vectorisée sur un data frame de FS - **Ce qui est
acquis** Structure d'une fonction, Écriture d'une fonction métier
réelle, Test sur scalaires, Application vectorisée sur un data frame de
FS - **Ce qui reste flou** gestion des cas limites - **Prochaine étape**
Fonctions avec arguments par défaut \#### Session 4.5 — Fonctions avec
arguments par défaut - **Date et durée** : 3 mai 2026, 01h - **Ce qui
était prévu**: Fonctions avec arguments par défaut - **Ce qui a été
fait**: - Arguments par défaut : syntaxe et comportement - Early return
: éliminer les cas invalides avant le corps principal - any() pour
évaluer une condition sur un vecteur - stop() pour interrompre avec un
message explicite - Gestion du mode débogage Browse[1]\> - **Ce qui est
acquis**: - Calcul d'un taux avec unité paramétrable via argument par
défaut - Rejet les données invalides avec un message explicite -
Fonction sur des vecteurs entiers, pas seulement des scalaires - **Ce
qui reste flou**: la limite de stop() sur vecteur avec NA n'a pas été
explorée - **Prochaine étape**: semaine 5

#### Récapitulatif semaine 4

| Compétence attendue                                   | Auto-éval (1-5) |
|-------------------------------------------------------|-----------------|
| Écrire une fonction simple                            | 4               |
| Comprendre quand utiliser une boucle vs vectorisation | 3.5             |

------------------------------------------------------------------------

### BILAN MOIS 1 {#bilan-mois-1}

**Période réelle** : du \_19_04_20\\26\_\_ au \_03_05_20\\26\_\_
**Heures totales investies** : \_\_\_ h **Heures prévues** : 20-28 h

#### Validation des indicateurs de progression du mois 1

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|------------------------|------------------------|------------------------|
| Importer un Excel, filtrer, résumer, exporter sans aide | oui |  |
| Écrire une fonction qui prend des arguments et retourne un résultat | oui |  |
| Avoir un dépôt GitHub avec au moins 4 commits documentés | oui |  |

#### Mini-projet de fin de mois (`resumer_indicateur()`)

-   **Statut** :complété et testé sur données réelles DS-BMG.
-   **Lien GitHub** :
    <https://github.com/bereniceharo/R-apprentissage-DSBMG.git>
-   **Difficultés rencontrées** : la selection de la colonne du df,
    df\$colonne vs df[[colonne]]
-   **Améliorations possibles** : Pas d'ameliorations suggérée; adaptée
    pour mon niveau

#### Réflexion personnelle

-   **Ce qui a marché dans ma méthode** : La methode learning by doing
    sur data réel
-   **Ce qui n'a pas marché** : le respect des échéances des revisions
    par espacement, introduction de nouveaux concepts sans souvent les
    explicité clairement
-   **Ajustements pour le mois 2** : Toujours bien expliquer les
    nouveaux concepts

#### Décision

-   [x] Passer au mois 2
-   [ ] Consolider avant de continuer (préciser quoi : \_\_\_)
-   [ ] Étaler le rythme (préciser : \_\_\_)

------------------------------------------------------------------------

## SUIVI HEBDOMADAIRE — MOIS 2

### Semaine 5 — `dplyr` : manipulation professionnelle

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 5.1 — Le pipe `|>` : philosophie et syntaxe

-   **Date et durée** : 04 mai 2026, \~2h (sessions 5.1 à 5.3 couvertes
    en une seule session réelle)
-   **Ce qui était prévu** : Le pipe `|>` : philosophie et syntaxe
-   **Ce qui a été fait** : Introduction du pipe \|\> — logique
    gauche-droite, analogie protocole de soins ; démonstration sur
    données réelles DS-BMG
-   **Ce qui est acquis** : Le pipe \|\> passe le résultat de gauche
    comme premier argument à la fonction de droite ; lecture
    séquentielle d'une chaîne de transformations
-   **Ce qui reste flou** :
-   **Prochaine étape** : Session 5.2

#### Session 5.2 — `filter()` et `select()`

-   **Date et durée** : 04 mai 2026 (suite de la même session)
-   **Ce qui était prévu** : `filter()` et `select()`
-   **Ce qui a été fait** : grepl() pour détecter des patterns textuels
    ; filter() avec !grepl() pour isoler les vraies FS (exclusion DS,
    CM/CMA/CMU, Dispensaire, Infirmeries) ; select() pour réduire aux
    colonnes utiles ; piège des noms avec espaces → backticks ; unique()
    pour explorer les valeurs distinctes avant de filtrer
-   **Ce qui est acquis** :filter() garde les lignes où la condition est
    TRUE ; select() garde les colonnes nommées ; aucun verbe dplyr ne
    modifie le data frame original ; grepl("CM") attrape aussi CMA et
    CMU ; ! inverse la sélection
-   **Ce qui reste flou** :
-   **Prochaine étape** : Session 5.3

#### Session 5.3 — `mutate()` et `arrange()`

-   **Date et durée** : 4 mai 2026 (suite de la même session)
-   **Ce qui était prévu** : `mutate()` et `arrange()`
-   **Ce qui a été fait** : arrange() avec tri croissant par défaut et
    desc() pour décroissant ; mutate() + ifelse() pour créer colonne
    alerte (\< 50% → "Alerte") ; détection d'une valeur manquante sur
    CSPS Sandogo 2 via filter(is.na(alerte))
-   **Ce qui est acquis** : arrange() trie le data frame complet selon
    une colonne ; desc() pour ordre décroissant ; mutate() ajoute une
    colonne sans modifier l'original ; ifelse() sur NA retourne NA → 20
    Alerte + 19 OK + 1 NA = 40 lignes
-   **Ce qui reste flou** :
-   **Prochaine étape** :Session 5.4 — group_by() et summarise()

#### Session 5.4 — `group_by()` et `summarise()`

-   **Date et durée** : 05 mai 2026, \~1h30
-   **Ce qui était prévu** : `group_by()` et `summarise()`
-   **Ce qui a été fait** : Mécanique de group_by() — étiquettes
    invisibles sans réduction de lignes ; summarise() pour calculer une
    statistique par groupe ; création d'une colonne type_fs avec
    mutate() + ifelse() imbriqués ; piège de l'ordre des conditions
    grepl() (spécifique avant général) ; calcul de moyenne CPN4 par type
    de FS sur données réelles DS-BMG ; summarise() multi-statistiques
    (mean, min, max) en une seule chaîne
-   **Ce qui est acquis** : group_by() seul ne modifie pas le nombre de
    lignes ; summarise() réduit à une ligne par groupe ; na.rm = TRUE
    obligatoire — un seul NA contamine tout le groupe ; NaN = na.rm a
    exclu toutes les valeurs (groupe entièrement vide) ; ordre des
    ifelse() imbriqués : du plus spécifique au plus général
-   **Ce qui reste flou** : distinction NaN vs NA à approfondir sur cas
    réels
-   **Prochaine étape** : Session 5.5 — exercice métier moyenne CPN4 par
    CSPS sur 12 mois

#### Session 5.5 — Exercice métier : moyenne CPN4 par CSPS

-   **Date et durée** : 05 mai 2026, \~1h
-   **Ce qui était prévu** : Exercice métier : moyenne CPN4 par CSPS sur
    12 mois
-   **Ce qui a été fait** : Adaptation de l'exercice — fichier FS_2025
    en agrégat annuel, pas mensuel ; calcul de la distribution CPN4 des
    CSPS (moyenne, min, max, nombre sous 50%) ; identification et tri
    des 20 CSPS sous le seuil de 50% ; interprétation de la valeur
    aberrante 219% (sous-estimation cible, erreur saisie, débordement
    d'aire) ; lecture opérationnelle du résultat — CSPS Gueswende le
    plus critique à 12.8%
-   **Ce qui est acquis** : Chaîne complète filter() + summarise() +
    select() + arrange() sur données réelles ; sum() sur vecteur logique
    pour compter les lignes vérifiant une condition ; lecture critique
    d'un résultat — valeur \> 100% n'est pas automatiquement une erreur
    ; 20 CSPS sur 40 sous 50% de couverture CPN4 dans le DS-BMG en 2025
-   **Ce qui reste flou** : néant
-   **Prochaine étape** : Semaine 6 — tidyr et nettoyage des données

#### Récapitulatif semaine 5

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|----|----|----|
| Utiliser le pipe `\|>` correctement | 4 |  |
| Filtrer un data frame avec `filter()` | 4 |  |
| Sélectionner des colonnes avec `select()` | 4 |  |
| Trier avec `arrange()` et `desc()` | 4 |  |
| Créer une colonne avec `mutate()` | 4 |  |
| Grouper et résumer avec `group_by()` + `summarise()` | 4 |  |

**Décision** : passer à la semaine 6 **Points à réviser** : ordre des
conditions ifelse() imbriqués

------------------------------------------------------------------------

### Semaine 6 — `tidyr` et nettoyage

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 6.1 — `pivot_longer()` et `pivot_wider()`

-   **Date et durée** : 06/05/2026, \~1h30
-   **Ce qui était prévu** : `pivot_longer()` et `pivot_wider()` (format
    long vs large)
-   **Ce qui a été fait** : Distinction format large vs format long —
    critère : les noms d'indicateurs sont-ils des en-têtes de colonnes
    ou des valeurs ; pivot_longer() — cols, names_to, values_to,
    values_drop_na ; pivot_wider() — names_from, values_from ;
    application sur données réelles DS-BMG : 40 CSPS × 33 indicateurs →
    1320 lignes ; clarification sur l'usage métier format long
    (facet_wrap, heatmap, automatisation)
-   **Ce qui est acquis** : pivot_longer() transforme les noms de
    colonnes en valeurs ; pivot_wider() fait l'inverse ; cols =
    -colonne_id pour exclure l'identifiant du pivot ; values_drop_na =
    TRUE pour alléger le data frame
-   **Ce qui reste flou** : néant
-   **Prochaine étape** : Session 6.2 — separate() et unite()

#### Session 6.2 — `separate()` et `unite()`

-   **Date et durée** : 07/05/2026, \~30min
-   **Ce qui était prévu** : `separate()`, `unite()`
-   **Ce qui a été fait** : separate() — découper une colonne composite
    en plusieurs colonnes ; unite() — fusionner plusieurs colonnes en
    une seule ; application sur format période "2025-T1" → colonnes
    annee + trimestre
-   **Ce qui est acquis** : separate() : col, into, sep — colonne
    d'origine supprimée par défaut (remove = TRUE) ; si le séparateur
    est absent, R produit un Warning (pas une erreur) et retourne NA ;
    unite() : col, colonnes sources, sep — symétrique à separate() ;
    ordre des arguments : donner le séparateur visible dans les données,
    pas celui souhaité
-   **Ce qui reste flou** : néant
-   **Prochaine étape** : Session 6.3

#### Session 6.3 — Gestion des `NA`

-   **Date et durée** : 07/05/2026, \~20min
-   **Ce qui était prévu** : Gestion des `NA` : `na.rm`,
    `complete.cases()`, `replace_na()`
-   **Ce qui a été fait** : na.rm = TRUE dans les fonctions statistiques
    ; complete.cases() pour identifier les lignes sans aucun NA ;
    replace_na() pour substituer les NA par une valeur, y compris une
    valeur calculée
-   **Ce qui est acquis** : complete.cases() retourne un vecteur logique
    — TRUE si ligne complète, FALSE sinon ; mean() sans na.rm retourne
    NA dès qu'un seul NA est présent ; replace_na(col, mean(col, na.rm =
    TRUE)) — imputation par la moyenne en une ligne
-   **Ce qui reste flou** : néant
-   **Prochaine étape** : Session 6.4

#### Session 6.4 — `stringr` initial : noms de FS incohérents

-   **Date et durée** : 07/05/2026, \~1h
-   **Ce qui était prévu** : `stringr` initial : noms de FS incohérents
-   **Ce qui a été fait** : str_to_upper() / str_to_lower() pour
    normaliser la casse ; str_squish() pour supprimer les espaces
    parasites internes et externes ; str_replace() pour remplacer des
    abréviations par des formes complètes ; application sur données
    réelles TLOH 2026 DS-BMG (noms de maladies incohérents entre
    feuilles 2025 et 2026)
-   **Ce qui est acquis** : str_to_upper() conserve les accents (È, É,
    Ü) ; str_squish() et str_to_upper() sont indépendantes — ordre
    indifférent ; str_replace() cherche le pattern partout dans la
    chaîne — risque de correspondance partielle sur les abréviations
    courtes (\\b pour y remédier)
-   **Ce qui reste flou** : néant
-   **Prochaine étape** : Session 6.5 — cas réel nettoyage fichier
    supervision

#### Session 6.5 — Cas réel : nettoyer un fichier de supervision

-   **Date et durée** : 07/05/2026, \~1h
-   **Ce qui était prévu** : Cas réel : nettoyer un fichier de
    supervision avec problèmes typiques
-   **Ce qui a été fait** : Normalisation des noms de maladies entre
    feuilles TLOH 2025 et 2026 ; pipeline complet str_to_upper() +
    str_squish() + str_replace() × 6 ; vérification finale avec
    identical()
-   **Ce qui est acquis** : str_replace() cherche le pattern tel quel —
    si le vecteur est déjà en majuscules, le pattern doit l'être aussi ;
    bug silencieux : aucun warning si le pattern ne matche pas ;
    identical() pour vérifier deux vecteurs attendus égaux
-   **Ce qui reste flou** : néant
-   **Prochaine étape** : Semaine 7 — ggplot2

#### Récapitulatif semaine 6

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|----|----|----|
| Pivoter entre format long et large | 4 |  |
| Séparer et unir des colonnes | 4 |  |
| Gérer les `NA` avec `replace_na()` et `complete.cases()` | 4 |  |
| Normaliser des noms avec `stringr` | 3 |  |

**Décision** : passer à la semaine 7 **Points à réviser** : pattern
case-sensitive dans str_replace()

------------------------------------------------------------------------

### Semaine 7 — `ggplot2` : visualiser

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 7.1 — Grammaire ggplot2 : `data + aes + geom`

-   **Date et durée** : 08/05/2026, \~1h30
-   **Ce qui était prévu** : Grammaire ggplot2 : `data + aes + geom`
-   **Ce qui a été fait** : Logique des trois couches obligatoires :
    ggplot(), aes(), geom\_\*() ; geom_point() sur données réelles
    DS-BMG (couverture CPN4 des CSPS) ; coord_flip() pour lisibilité
    avec 40 CSPS ; reorder() dans aes() pour trier par valeur ; labs()
    pour titres et étiquettes professionnelles ; geom_vline() pour ligne
    de seuil OMS à 80% ; scale_color_manual() — introduced, not yet
    practiced
-   **Ce qui est acquis** : aes() contrôle toute propriété visuelle
    dépendant des données ; propriété fixe → hors aes() ; propriété
    variable → dans aes() ; coord_flip() retourne le graphique —
    vline/hline se définissent par rapport aux données, pas au visuel ;
    reorder() remplace la variable dans aes(x=), ne s'y ajoute pas ;
    backticks obligatoires sur tout nom de colonne à caractères spéciaux
-   **Ce qui reste flou** : néant
-   **Prochaine étape** : Session 7.2 — Bar charts

#### Session 7.2 — Bar charts pour comparer des FS

**Date** : 08/05/2026 **Durée** : \_\_ min **Horaire** : 20h45 — **h**

**Prévu** : produire un bar chart professionnel comparant les FS sur la
couverture CPN4.

**Fait** : - Distinction `geom_bar()` (compte les occurrences) vs
`geom_col()` (utilise une valeur déjà calculée). Application au cas des
indicateurs agrégés en santé publique. - Bar chart complet (40 CSPS)
avec tri par `reorder()`, `coord_flip()`, ligne de seuil à 80%
(`geom_hline()`). - Bar chart filtré FS en alerte (\< 50% sur CPN4) : 20
CSPS sur 40, soit la moitié du district. - Approfondissement de
`geom_text()` (label calculé avec `round()`, `hjust = -0.2` pour
décalage à droite) et `ylim()` (couche d'échelle avec piège de
suppression silencieuse). - Erreur d'inattention rattrapée : `rename()`
qui pointait initialement sur la colonne accouchement et non CPN4 →
leçon : vérifier la valeur source avant tout rename sur des noms longs.

**Acquis** : - Logique en couches de ggplot2 : géométriques (`geom_*`),
d'échelle (`ylim`), d'habillage (`labs`), de transformation
(`coord_flip`). La relation `data → aes() → geom_*()` est la base. - Le
choix du graphique dépend du destinataire et de la décision : 40 barres
pour une présentation aux ICP, top 10 pour la planification des
supervisions, FS en alerte pour un rapport DRS. - `hjust` est un
alignement (proportion du texte à gauche du point d'ancrage), pas un
déplacement du point lui-même.

**Flou** : - Mécanique exacte de `hjust` avec `coord_flip()` — j'ai
retenu la règle pratique mais la justification théorique reste
partiellement abstraite. - Quand préférer `coord_cartesian(ylim = ...)`
à `ylim(...)` en dehors du cas "étiquettes coupées" ?

**Prochaine étape** : session 7.3 — line chart pour le suivi temporel
d'un indicateur.

**Indicateur métier observé** : 20 CSPS sur 40 du DS-BMG sont sous 50%
de couverture CPN4 en 2025 — problème district, pas problème de quelques
FS isolées.

#### Session 7.3 — Line charts

-   **Date et durée** : 09/05/2026, \~1h30
-   **Ce qui était prévu** : Line charts pour suivre des indicateurs
    dans le temps
-   **Ce qui a été fait** : geom_line() sur données réelles TLOH 2026
    (paludisme simple, 19 semaines) ; piège du facteur sur l'axe x —
    chaque niveau forme un groupe à 1 point, donc geom_line() ne trace
    rien sans group = 1 dans aes() ; piège des niveaux orphelins après
    filter() — fct_drop() pour les supprimer (introduit comme outil mais
    pas inscrit en rappel pour l'instant) ; détection d'une ligne
    fantôme dans le fichier source (cumul annuel 61 829 cas avec semaine
    = NA) — filtre sur !is.na(semaine) requis ; habillage labs() complet
    (titre, sous-titre district, caption source)
-   **Ce qui est acquis** : geom_line() relie des points dans l'ordre de
    x ; group = 1 obligatoire quand x est un facteur ; filter() agit sur
    les lignes mais pas sur les niveaux du facteur ; réflexe MCD :
    vérifier la cohérence d'une courbe avec son expertise terrain avant
    de la partager
-   **Ce qui reste flou** : pic précoce à S6 — hypothèses étiologiques à
    creuser en session surveillance (mois 5)
-   **Prochaine étape** : Session 7.4 — Heatmaps

#### Session 7.4 — Heatmaps

-   **Date et durée** : 09/05/2026, \~2h

-   **Ce qui était prévu** : Heatmaps (tableaux FS × mois)

-   **Ce qui a été fait** : Import données CPN4 mensuelles ENDOS-BF (46
    FS × 12 mois 2025) ; pivot_longer() format large → long (552 lignes)
    ; facteur ordonné sur colonne mois (piège alphabétique) ;
    geom_tile() avec fill = taux_cpn4 ; scale_fill_gradient() palette
    rouge→vert, na.value gris ; theme() + element_text() pour taille et
    angle des axes ; détection et traitement raisonné du NA CSPS Kalzi
    juin 2025 ; détection outlier CM Tanghin Dassouri septembre (40.93%)
    ; lecture opérationnelle MCD produite

-   **Ce qui est acquis** : geom_tile() reçoit trois dimensions dans
    aes() : x, y, fill ; scale_fill_gradient() remplace la palette par
    défaut ; theme(element = element_type(propriété)) — logique générale
    ; NA conservé = cellule grise sur heatmap = information utile ; une
    heatmap révèle en un coup d'œil ce qu'un tableau de 552 chiffres
    cache

-   **Ce qui reste flou** :

-   **Prochaine étape** : 7.5 personnalisation et export

#### Session 7.5 — Personnalisation et export

-   **Date et durée** : 11/05/2026, \~2h
-   **Ce qui était prévu** : Personnalisation : titres, légendes,
    thèmes, couleurs, export PNG/PDF
-   **Ce qui a été fait** : Trois blocs structurés. Bloc A : thèmes
    pré-construits (theme_minimal()) et règle d'ordre des couches theme
    — la dernière écrite gagne sur les propriétés communes. Bloc B :
    palettes professionnelles ; distinction viridis (perceptuellement
    linéaire, daltonien-compatible) vs ColorBrewer (signalétique
    culturelle pour pilotage opérationnel) ;
    scale_fill_distiller(palette = "RdYlGn") ; diagnostic empirique du
    comportement de direction par lecture de la légende — direction = 1
    met rouge en bas (alerte) pour RdYlGn. Bloc C : ggsave() en PNG (300
    dpi, bg = "white") et PDF ; convention de projet adoptée — éviter
    les caractères typographiques exotiques (cadratin, guillemets
    français) dans les titres pour ne pas dépendre du moteur cairo_pdf.
-   **Ce qui est acquis** : Ordre canonique des couches ggplot :
    geom\_\* puis scale\_\* puis labs() puis theme_pré-construit puis
    theme() d'ajustement ; le choix de palette se fait selon l'audience
    et la décision, pas selon le type R de la variable ; lire la légende
    est la seule discipline fiable pour vérifier le sens d'application
    d'une palette ; ggsave avec width/height/units/dpi/bg explicites
    produit un livrable reproductible ; PNG pour Word et email, PDF pour
    impression DRS ; un warning R n'est jamais à ignorer.
-   **Ce qui reste flou** : Le mécanisme exact qui fait que direction =
    -1 produit le même résultat que pas d'argument pour RdYlGn — à
    creuser si re-rencontré, pas prioritaire.
-   **Prochaine étape** : Semaine 8 — lubridate et qualité des données.

#### Récapitulatif semaine 7

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|----------------------------------------|----------------|----------------|
| Comprendre la grammaire `data + aes + geom` | 4 | Acquise et appliquée sur plusieurs cas (point, bar, line, tile) ; non testée sans aide |
| Produire un bar chart comparatif de FS | 4 | Avec reorder(), coord_flip(), geom_text(), ylim() ; non refaite seul depuis |
| Produire un line chart temporel | 4 | Piège group = 1 et ligne fantôme cumul intégrés ; non refait seul depuis |
| Produire une heatmap FS × mois | 4 | Pivot long, facteur ordonné, palette RdYlGn, NA gris ; non refaite seul depuis |
| Exporter un graphique en PNG/PDF | 4 | ggsave maîtrisé en PNG et PDF avec dimensions, dpi, fond blanc explicites |

**Décision** : passer à la semaine 8 **Points à réviser** : direction
dans scale_fill_distiller (lire la légende systématiquement), convention
de caractères ASCII dans les titres pour éviter les warnings PDF.

------------------------------------------------------------------------

### Semaine 8 — `lubridate` et qualité des données

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 8.1 — `lubridate` : dates françaises

-   **Date et durée** : 12/05/2026, \~1h30
-   **Ce qui était prévu** : lubridate : parsing de dates françaises,
    extraction (mois, année), différences
-   **Ce qui a été fait** : parse_date_time() avec orders multiples sur
    line liste méningite DS-BMG (347 cas, formats hétérogènes) ;
    epiweek() pour semaines épidémiologiques ; calcul de délai
    onset-to-consultation avec soustraction de dates + as.numeric() ;
    détection d'une erreur de parsing silencieuse (délai max 324 jours
    sur "01-12-2026" ambigu dmy/mdy) ; gestion des mois en français avec
    locale = "fr_FR" ou str_replace() comme alternative portable
-   **Ce qui est acquis** : parse_date_time() + as.Date() pour parser
    des formats multiples ; orders = formats réellement présents
    uniquement ; epiweek() pour numéro de semaine épidémiologique ;
    soustraction de deux Date → as.numeric() pour délai en jours ; sum()
    sur vecteur logique pour compter les cas dépassant un seuil ;
    which.max() pour isoler la ligne aberrante ; locale pour les mois
    texte non anglais
-   **Ce qui reste flou** : formats ambigus (dmy vs mdy sur
    "01-12-2026") — pas de solution technique fiable, solution à la
    source
-   **Prochaine étape** : session 8.2 — stringr avancé : regex pour
    normaliser des noms

#### Session 8.2 — `stringr` avancé : regex pour normaliser des noms

-   **Date et durée** : 12/05/2026, \~1h
-   **Ce qui était prévu** : stringr avancé : regex pour normaliser des
    noms
-   **Ce qui a été fait** : construction progressive des regex (\^,
    [A-Z]+, \\s, (de )?) ; str_remove() pour supprimer les préfixes
    variables (CSPS, CMA de) en une seule regex ; str_trunc() pour
    tronquer les noms trop longs ; str_detect() + regex(ignore_case =
    TRUE) pour détecter les variantes d'orthographe indépendamment de la
    casse ; application sur line liste méningite DS-BMG
-   **Ce qui est acquis** : \^ ancre en début de chaîne ; [A-Z]+ = une
    ou plusieurs majuscules ; \\s = espace ; (...)? = groupe optionnel ;
    str_trunc() avec width et ellipsis ; str_detect() retourne un
    vecteur logique utilisable directement dans filter() ;
    regex(ignore_case = TRUE) pour ignorer la casse
-   **Ce qui reste flou** : construction de regex complexes — les
    briques de base sont acquises, la combinaison reste à pratiquer
-   **Prochaine étape**

#### Session 8.3 — Concepts qualité des données

-   **Date et durée** : 12/05/2026, \~1h
-   **Ce qui était prévu** : Concepts qualité des données : complétude,
    promptitude, cohérence interne
-   **Ce qui a été fait** : calcul complétude globale (96.8%) et par FS
    avec across() + where() ; simulation dates transmission avec
    sample() + set.seed() + seq() ; calcul promptitude janvier 2025
    (70%) ; détection cohérence interne — valeurs impossibles (CPN4 \>
    100%) sur données réelles DS-BMG
-   **Ce qui est acquis** : across() + where(is.numeric) pour opérer sur
    toutes les colonnes numériques ; set.seed() pour reproductibilité ;
    sample() + seq() pour simuler des données ; complétude =
    sum(!is.na()) / valeurs attendues × 100 ; promptitude = sum(date \<=
    délai) / total × 100 ; cohérence interne = filter() sur seuils
    impossibles
-   **Ce qui reste flou** : seuils nationaux officiels à vérifier dans
    les outils de supervision DRS
-   **Prochaine étape** : session 8.4 — détection des valeurs aberrantes
    : règle des 3 écarts-types, IQR, méthode de Tukey

#### Session 8.4 — Détection des valeurs aberrantes

-   **Date et durée** : 12/05/2026, \~45min
-   **Ce qui était prévu** : Détection des valeurs aberrantes : règle
    des 3 écarts-types, IQR, méthode de Tukey
-   **Ce qui a été fait** : comparaison méthode 3 ET vs Tukey ; calcul
    Q1, Q3, IQR avec quantile() et IQR() ; calcul bornes Tukey (Q1 -
    1.5×IQR, Q3 + 1.5×IQR) ; détection 4 FS aberrantes sur CPN4 (borne
    sup = 128.7%) ; comparaison avec cohérence logique (6 FS \> 100%) —
    les deux méthodes sont complémentaires
-   **Ce qui est acquis** : quantile() avec probs pour Q1/Q3 ; IQR()
    pour l'écart interquartile ; bornes Tukey calculées depuis Q1/Q3/IQR
    ; filter() avec bornes calculées ; différence entre aberrant logique
    et aberrant statistique
-   **Ce qui reste flou** : argument type = 7 dans IQR() — non exploré
-   **Prochaine étape** : session 8.5 — score de qualité par FS

#### Session 8.5 — Score de qualité par FS
-   **Date et durée** 18/05/2026, ~1h30
-   **Ce qui était prévu** Construction d'un score de qualité par FS
-   **Ce qui a été fait** : Introduction formelle de case_when() (entrée/sortie, exemple métier, piège des NA, catch-all TRUE ~ ...) ; mini-exercice de classification de la promptitude (vecteur delais de 5 FS, 5 catégories incluant NA) ; construction d'un score composite par FS pondéré 40/30/30 (complétude/promptitude/cohérence) sur 10 FS fictives plausibles ; arrondi à 1 décimale avec round() ; tri décroissant ; classification qualitative en 4 catégories (Critique / Moyen / Bon / Excellent) ; conversion en facteur ordonné avec levels (initiative personnelle), introduction de l'argument ordered = TRUE
-   **Ce qui est acquis** : case_when() avec syntaxe condition ~ valeur ; ordre des conditions du plus restrictif au moins restrictif ; gestion des NA en premier ; catch-all TRUE ~ ... ; construction d'un score composite pondéré ; classification multi-niveaux d'un indicateur continu
-   **Ce qui reste flou**  : décalage de seuils ≤ vs >= sur les valeurs limites (84.5 par exemple) — bug silencieux à surveiller en données réelles ; distinction factor(levels = ...) vs factor(levels = ..., ordered = TRUE) à raffermir
-   **Prochaine étape** Bilan mois 2 et mini-projet de fin de mois (rapport visuel CPN4 49 FS)

#### Récapitulatif semaine 8

| Compétence attendue                            | Auto-éval (1-5) | Commentaire |
|-----------------------------------------|----------------|----------------|
| Parser et manipuler des dates avec `lubridate` |      4           |             |
| Utiliser des regex simples avec `stringr`      |    4          |             |
| Calculer un indicateur de complétude           |      4         |             |
| Détecter des valeurs aberrantes (IQR, 3 ET)    |    4            |             |
| Construire un score de qualité par FS          |    4           |             |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### BILAN MOIS 2 {#bilan-mois-2}

**Période réelle** : du 04/05/2026 au 23/05/2026  
**Heures totales investies** : ~21 h  
**Heures prévues** : 20-28 h

#### Validation des indicateurs de progression du mois 2

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|----|----|----|
| Manipuler un dataset avec `dplyr` sans copier-coller | Oui | filter, select, arrange, mutate, group_by, summarise, rename, pivot_longer appliqués sur données réelles DS-BMG |
| Produire 5 types de graphiques différents | Oui | geom_point, geom_col, geom_line, geom_tile, scale_fill_gradient2 — tous sur données réelles |
| Pivoter des données entre format long et large | Oui | pivot_longer appliqué sur fichier DHIS2 export (wide → long) sur données accouchements Jan-Avr 2026 |
| Détecter les valeurs aberrantes d'une série | Oui | Méthode Tukey (Q1-1.5×IQR, Q3+1.5×IQR) et cohérence logique (>100%) appliquées sur indicateurs CPN4 DS-BMG |

#### Mini-projet de fin de mois (rapport visuel accouchements 47 FS)

- **Statut** : Complété le 23/05/2026
- **Adaptation** : mini-projet recentré sur les accouchements Jan-Avr 2026 (données mensuelles DHIS2 disponibles) au lieu de CPN4 annuel
- **Lien GitHub** :To https://github.com/bereniceharo/R-apprentissage-DSBMG.git
   da53864..9407420  main -> main
- **Difficultés rencontrées** : gestion des mois en ordre alphabétique à l'export DHIS2 (piège factor) ; distinction `[ ]` vs `[[ ]]` ; erreur d'inattention `fosa = factor(mois, ...)` au lieu de `mois = factor(mois, ...)` — erreur critique silencieuse
- **Améliorations possibles** : ajouter vérification chiffrée automatique des FS sous seuil (calculer 30/47 par code plutôt que visuellement) ; ajouter coefficients saisonniers 2024-2025 comme référence ajustée

#### Réflexion personnelle
- Ce qui a marché dans ma méthode : les rappels des concepts clé, l'utilisation de données réelles du district, l'apprentissage et la decouverte de nouvelles fonctions en pratiquant.
- Ce qui n'a pas marché : le détails sur les nouveaux concepts abordés ne sont pas souvent suffisants.
- Ajustements pour le mois 3 : Detailler en language simple les nouveaux concepts avec les pieges possibles. Se focaliser sur l'objectif métier de MCD

#### Décision

- [X] Passer au mois 3
- [] Consolider avant de continuer (préciser quoi : néant
- [ ] Étaler le rythme (préciser : ___)

------------------------------------------------------------------------

## SUIVI HEBDOMADAIRE — MOIS 3

### Semaine 9 — Statistique descriptive professionnelle

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 9.1 — Tendance centrale et dispersion

-   **Date et durée** : 25/05/2026, ~2h
-   **Ce qui était prévu** : Tendance centrale et dispersion : choisir le bon résumé selon la distribution
-   **Ce qui a été fait** : Import et nettoyage de `linelist_raw.xlsx` (Epi R Handbook, épidémie Ebola fictive) ; `clean_names()` pour normaliser les noms de colonnes ; suppression colonnes inutiles (`merged_header`, `...28`) ; conversion `age` chr → numeric, `date_onset` chr → Date, `hosp_date` dttm → Date ; calcul de `delai_hospit` en jours (as.numeric + soustraction de deux Date) ; `summary()` sur `age` et `delai_hospit` ; tableau de synthèse avec `summarise()` : n, manquants, min, max, médiane, Q1, Q3
-   **Ce qui est acquis** : `clean_names()` normalise les noms en snake_case en une ligne (package `janitor`) ; distribution asymétrique → médiane + IQR ; distribution symétrique → moyenne + SD ; la moyenne est contaminée par les valeurs extrêmes, la médiane ne l'est pas ; `summarise()` avec calcul multi-indicateurs en un pipeline
-   **Ce qui reste flou** : néant (démontré : choix médiane + IQR justifié sur délais hospitalisation méningite)
-   **Prochaine étape** : Session 9.2 — Distribution : histogramme, boxplot, densité, QQ-plot
#### Session 9.2 — Distribution : histogramme, boxplot, densité, QQ-plot

-   **Date et durée** : 26/05/2026, ~2h
-   **Ce qui était prévu** : Distribution : histogramme, boxplot, densité, QQ-plot
-   **Ce qui a été fait** : `geom_histogram()` sur `age` (bins = 30) ; `geom_boxplot()` de `age` par `outcome` (3 groupes : Death, Recover, NA) ; `geom_density()` avec `color = outcome` (3 courbes superposées) ; `stat_qq()` + `stat_qq_line()` sur `age` — lecture asymétrie droite + accumulation de zéros à age = 0 ; `table(var, useNA = "always")` pour explorer les modalités avant prédiction
-   **Ce qui est acquis** : histogramme = fréquence par intervalle de valeurs ; boxplot = médiane, IQR, moustaches, aberrants + comparaison entre groupes ; densité = courbe lissée, axe y = densité de probabilité (aire totale = 1), comparaison de formes entre groupes ; QQ-plot = comparaison quantiles réels vs distribution normale théorique via `aes(sample = ...)` ; lecture directe de la non-normalité sur QQ-plot (écart à la droite = asymétrie, segment plat = accumulation)
-   **Ce qui reste flou** : QQ-plot 
-   **Prochaine étape** : Session 9.2.bis — Fondamentaux du test de normalité et `shapiro.test()`

#### Session 9.2.bis — Fondamentaux du test de normalité et `shapiro.test()`

- **Date et durée** : 27/05/2026
- **Ce qui était prévu** : Tests de normalité et statistique descriptive groupée
- **Ce qui a été fait** : Session spéciale fondamentaux — raisonnement hypothèse nulle/alternative, signification exacte de la p-valeur, application `shapiro.test()` sur données simulées (normales vs asymétriques) et sur linelist Epi R Handbook (variable age, n=500)
- **Ce qui est acquis** : La p-valeur n'est pas la probabilité que les données soient non normales — c'est la probabilité d'observer un écart aussi grand si H0 était vraie. Raisonnement H0/H1. Règle de décision p < 0.05 → rejeter H0. W proche de 1 = proche de la normale. Limite 5000 observations pour shapiro.test(). Sur grand échantillon : visualisation + différence moyenne/médiane + jugement métier.
- **Ce qui reste flou** : néant
- **Prochaine étape** : Session 9.3 — Tableaux 1 publiables avec `gtsummary`

#### Session 9.3 — Tableaux 1 publiables avec `gtsummary`

- **Date et durée** : 27/05/2026
- **Ce qui était prévu** : Tableaux 1 publiables avec `gtsummary`
- **Ce qui a été fait** : Introduction de `tbl_summary()` — tableau de caractéristiques de population publiable ; personnalisation avec `label`, `missing_text`, `modify_header()` ; recodage des modalités avec `fct_recode()` avant passage dans `tbl_summary()` ; correction de l'erreur de sélection de colonne interne (`label` et non `Characteristic`)
- **Ce qui est acquis** : Produire un tableau 1 en français avec labels personnalisés, valeurs manquantes renommées, en-têtes modifiés, modalités recodées. Distinction `gtsummary` (package) vs `tbl_summary()` (fonction). Syntaxe `variable ~ "label"` dans `label = list()`. Markdown `**texte**` pour le gras dans `modify_header()`.
- **Ce qui reste flou** : néant
- **Prochaine étape** : Session 9.4 — Mise en forme avec `flextable` pour export Word

#### Session 9.4 — Mise en forme avec `flextable` pour export Word

- **Date et durée** : 27/05/2026
- **Ce qui était prévu** : Mise en forme avec `flextable` pour Word
- **Ce qui a été fait** : Export du tableau `gtsummary` en Word avec `as_flex_table()` + `save_as_docx()` ; distinction `as_flex_table()` (gtsummary) vs `as_flextable()` (flextable) ; pipeline complet de la sélection des variables jusqu'au fichier `.docx`
- **Ce qui est acquis** : `as_flex_table()` vient de `gtsummary` et préserve la mise en forme ; `save_as_docx()` vient de `flextable` avec argument `path` ; pipeline complet tbl_summary → as_flex_table → save_as_docx
- **Ce qui reste flou** : néant
- **Prochaine étape** : Session 9.5 — Cas pratique : tableau 1 d'une cohorte hypothétique de 200 patients

#### Session 9.5 — Tableau 1 sur linelist ebola

- **Date et durée** : 27/05/2026 — [durée à compléter]
- **Ce qui était prévu** : Tableau 1 sur cohorte hypothétique
- **Ce qui a été fait** : Tableau 1 publiable sur linelist_raw.xlsx 
  (6611 cas) stratifié par outcome (Décès/Guéris) — nettoyage 
  (age_unit, fct_recode), tbl_summary(), modify_header(), 
  as_flex_table(), save_as_docx()
- **Ce qui est acquis** : gt_summary, tbl_summary, as_flex_table, save_as_docx, fct_recode
- **Ce qui reste flou** : néant
- **Prochaine étape** : Session 10.1 — Introduction aux API REST

#### Récapitulatif semaine 9

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|----|----|----|
| Choisir le bon résumé selon la distribution | 4 |  |
| Produire histogramme, boxplot, QQ-plot | 3.5 |  |
| Construire un tableau 1 avec `gtsummary` | 4 |  |
| Mettre en forme un tableau pour Word avec `flextable` | 4 |  |

**Décision** : passer au bloc M4-étendu (API ENDOS-BF) — semaines 10–12 reportées en M3-suite après le bloc API. **Points à réviser** :

------------------------------------------------------------------------

> **⚠ RESTRUCTURATION DU PLAN — 27/05/2026**
> Les semaines 10–12 (tests d'hypothèses, IC, régression) sont reportées après le bloc API ENDOS-BF. Elles forment le bloc **M3-suite** (semaines 16–18 du plan révisé). La prochaine session est la **10.1 du plan révisé — Introduction aux API REST**.
> Voir `00_Plan_complet_6mois.md` pour le séquencement complet.

------------------------------------------------------------------------

## BLOC M4-ÉTENDU — API ENDOS-BF et automatisation

**Période réelle** : début 27/05/2026 — fin à déterminer (6 semaines nominales, extensible à 8)

### Semaine 10 (révisée) — Introduction aux API REST et à `httr2`

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 10.1 — Concepts fondamentaux HTTP
-   **Date et durée** : 28/05/2026, ~0,5h (incluse dans la séance du 28/05)
-   **Ce qui était prévu** : Client/serveur, verbes HTTP (GET, POST, PUT), codes de statut (200, 401, 404, 500)
-   **Ce qui a été fait** : Sens littéral des termes techniques (HTTP, HTTPS, URL, API, query string, header, code de statut) ; mécanisme d'une requête HTTP (méthode, URL, headers, body, code de statut) ; verbes GET (lire) et POST (créer/envoyer) — distinction lire/écrire ; codes de statut 200 (succès), et notion des familles 4xx (client) / 5xx (serveur)
-   **Ce qui est acquis** : une requête HTTP = méthode + URL + headers + body ; GET sert à récupérer une ressource, POST à en envoyer une ; pour ENDOS-BF, usage quasi exclusif de GET (extraction), jamais de POST (pas d'écriture dans le SNIS depuis R) ; code 200 = succès ; le code de statut se vérifie avant de décoder le body
-   **Ce qui reste flou** : sens précis des codes 401 vs 404 (vus en théorie, pas encore rencontrés en pratique)
-   **Prochaine étape** : Session 10.2 — Format JSON et parsing avec jsonlite

#### Session 10.2 — Format JSON et `jsonlite`
-   **Date et durée** : 28/05/2026, ~1h
-   **Ce qui était prévu** : Structure JSON (objets, tableaux, scalaires), parsing avec `jsonlite::fromJSON()`
-   **Ce qui a été fait** : Sens littéral de JSON (JavaScript Object Notation) ; trois briques — scalaire, objet, tableau ; `fromJSON()` sur un objet JSON simple (liste 3 éléments, piège integer vs numeric) ; `fromJSON()` sur un tableau d'objets homogènes → data frame automatique 3×3 ; `fromJSON()` sur un JSON imbriqué à trois éléments (`headers`, `rows`, `height`) → liste contenant data frame + matrice + integer ; pipeline complet matrice → data frame exploitable : `as.data.frame()` + `colnames()` + `as.numeric()`
-   **Ce qui est acquis** : `fromJSON()` convertit tableau homogène → data frame automatiquement, tableau hétérogène → liste ; les valeurs numériques entre guillemets JSON arrivent en chr — conversion `as.numeric()` obligatoire ; `as.data.frame()` convertit une matrice en data frame ; `colnames(df) <- vecteur` assigne les noms de colonnes ; navigation dans liste imbriquée via `$element$sous_element`
-   **Ce qui reste flou** : néant (concept mobilisé activement le 28/05 et reconsolidé le 30/05)
-   **Prochaine étape** : Session 10.3 — Anatomie d'une requête httr2

#### Session 10.3 — `httr2` : anatomie d'une requête
-   **Date et durée** : 28/05/2026 (~0,5h, pipeline) + 30/05/2026 (~1h, premier appel API réel)
-   **Ce qui était prévu** : `request()`, `req_url_query()`, `req_perform()`, `resp_body_json()` ; anatomie complète d'une requête httr2
-   **Ce qui a été fait** : pipeline complet `request() |> req_url_query() |> req_perform() |> resp_body_json()` sur `httpbin.org` (28/05) — premier appel sans paramètres (statut 200, body 325 bytes, headers automatiques httr2), deuxième appel avec paramètres `district = "Boulmiougou"`, `annee = 2025` (query string construite automatiquement), observation d'une liste imbriquée (`$args$annee`) ; le 30/05 : premier appel API réel sur `play.im.dhis2.org` (DHIS2 2.43), endpoint `/me`, construction en deux temps avec `req_url_path_append("me")`, inspection de la réponse décodée (39 champs à la racine), extraction de `$id` (UID 11 caractères) et `$username`
-   **Ce qui est acquis** : `request()` construit l'objet `httr2_request` avec l'URL de base ; `req_url_query()` ajoute des paramètres (query string `?clé=valeur`) ; `req_url_path_append()` ajoute un segment de chemin (gère le `/`) ; `req_perform()` envoie et retourne un `httr2_response` (statut + headers + body brut) ; `resp_body_json()` décode le body en liste R ; distinction objet structuré (httr2_request/response) vs chaîne (URL/JSON) ; le body décodé ≠ les headers ; un UID DHIS2 = 11 caractères alphanumériques
-   **Ce qui reste flou** : distinction httr2_request/httr2_response et chemins resp_body_json (liste) vs fromJSON (data frame) pas encore automatique — à revérifier au J+7 (04/06) et J+30
-   **Prochaine étape** : Session 10.4 — Authentification basic auth vs token

#### Session 10.4 — Authentification : basic auth vs token
-   **Date et durée** : amorcée le 30/05/2026 (usage de `req_auth_basic()` pour l'appel `/me`) ; à compléter (token)
-   **Ce qui était prévu** : basic auth (`req_auth_basic()`) vs token (`req_auth_bearer_token()`)
-   **Ce qui a été fait** : `req_auth_basic(req, username, password)` utilisé pour l'appel authentifié à `/me` (admin/district) — header Authorization posé avant `req_perform()` ; constat que l'authentification est un sens unique (le mot de passe n'est jamais retourné dans la réponse). Token bearer : non encore vu
-   **Ce qui est acquis** : `req_auth_basic()` ajoute l'authentification HTTP basique ; s'insère avant `req_perform()` ; le mot de passe est envoyé, jamais retourné
-   **Ce qui reste flou** : néant
-   **Prochaine étape** :  Session 10.5 — Sécurité des identifiants

#### Session 10.5 — Sécurité : stockage des identifiants
-   **Date et durée** :1h
-   **Ce qui était prévu** : stocker ses identifiants dans `.Renviron`, `.gitignore` obligatoire, ne jamais commiter un mot de passe
-   **Ce qui a été fait** :stocker ses identifiants dans `.Renviron`, `.gitignore`
-   **Ce qui est acquis** :req_auth_bearer_token() — token généré par le serveur, passé comme bearer
Distinction basic auth (username/password) vs token (badge révocable)
.Renviron — fichier caché dans ~, lu automatiquement par R au démarrage
Sys.getenv() — récupérer une variable d'environnement dans un script
Principe : le script ne contient jamais de secret, seulement le nom de la variable
-   **Ce qui reste flou** :néant
-   **Prochaine étape** :`/me`, `/indicators`, `/dataElements`, `/organisationUnits`, `/analytics`
------------------------------------------------------------------------

### Semaine 11 (révisée) — Architecture DHIS2 / ENDOS-BF : métadonnées

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 11.1 — Endpoints DHIS2 fondamentaux

-   **Date et durée** : 31/05/2026 — [durée à compléter]
-   **Ce qui était prévu** : `/me`, `/indicators`, `/dataElements`, `/organisationUnits`, `/analytics`
-   **Ce qui a été fait** : Carte des 5 endpoints fondamentaux DHIS2 (me, indicators, dataElements, organisationUnits, analytics) ; distinction métadonnées vs données ; rôle des UIDs ; pipeline complet vers `/indicators` avec résolution de la pagination (`pageSize = 150`) ; extraction de `df_indicators` (77 lignes, 2 colonnes) via `sapply()` direct sur liste ; mécanique de `sapply()` clarifiée — itération sur éléments, pas sur indices
-   **Ce qui est acquis** : les 5 endpoints et leur rôle ; `pageSize` pour contourner la pagination ; `sapply(liste, function(x) x$champ)` sans `seq_along()` ; `$pager$total` pour connaître le nombre réel de résultats
-   **Ce qui reste flou** : néant
-   **Prochaine étape** : Session 11.2 — `/organisationUnits` : récupérer la hiérarchie des unités d'organisation du DS-BMG

#### Session 11.2 — Récupérer les métadonnées et indicateurs

-   **Date et durée** : 31/05/2026 — [durée à compléter]
-   **Ce qui était prévu** : Liste des indicateurs avec UIDs et métadonnées
-   **Ce qui a été fait** : Récupération des 77 indicateurs du serveur de démo via `/indicators` ; résolution de la pagination (`pageSize`) après constat que la réponse par défaut tronque à 50 résultats (`$pager$total` vs `length()`) ; extraction de `df_indicators` (77 lignes × 2 colonnes : id, displayName) via `sapply(liste, \(x) x$champ)` directement sur les éléments de la liste (sans `seq_along()`). NB : la session a débordé sur le contenu prévu en 11.3 (navigation hiérarchique des unités) — voir entrée 11.3.
-   **Ce qui est acquis** : distinction métadonnées (ce qui existe) vs données analytics (les valeurs chiffrées) ; flux de travail metadata → analytics ; `$pager$total` donne le nombre réel de résultats, à comparer systématiquement avec `length()` ; `pageSize` pour récupérer tout en une page ; `sapply()` itère sur les éléments d'une liste, pas sur les indices ; un UID est stable/unique/opaque (le nom est pour les humains, l'UID pour les machines)
-   **Ce qui reste flou** : néant
-   **Prochaine étape** : Session 11.3 (suite) — fin de la navigation hiérarchique, puis 11.4 (résolution UID → noms par jointure) et 11.5 (dictionnaire ENDOS-BF 4 colonnes)

#### Session 11.3 — Navigation hiérarchique des unités d'organisation

-   **Date et durée** : 01/06/2026 — [durée à compléter]
-   **Ce qui était prévu** : Paramètres `level` et `ouMode=DESCENDANTS` — toutes les FS du DS-BMG sans liste hardcodée
-   **Ce qui a été fait** : Revue critique du script `hors_session_11_2.R` (première connexion réelle à ENDOS-BF production) ; identification et correction de la fragilité des index hardcodés (`[[2]]`, `[[1]]`) → remplacement par pattern `sapply()` + `which()` pour recherche dynamique par nom ; décision métier documentée : pipeline FS publiques uniquement (les 227 FS privées exclues — rapportage irrégulier, hors supervision directe) ; confirmation comportement par défaut endpoint `/organisationUnits` (retourne `id` + `displayName` sans `fields`) ; constat que `ouMode=DESCENDANTS` n'est pas nécessaire — approche `path:like:uid_ds` + `level = 6` déjà implémentée et validée sur données réelles (75 FS publiques)
-   **Ce qui est acquis** : `which()` pour recherche dynamique d'index dans un vecteur ; pattern robuste `sapply()` → `which()` → `[[index_dynamique]]$id` ; les 75 FS publiques du DS-BMG sont extraites et exportées avec leurs UIDs
-   **Ce qui reste flou** : néant
-   **Prochaine étape** : Session 11.4 — jointure UID → noms lisibles dans le pipeline analytics

#### Session 11.4 — Résoudre les UIDs en noms lisibles

- **Date et durée** : 01/06/2026 — [durée à compléter]
- **Ce qui était prévu** : Jointure entre la réponse API et le
  dictionnaire local — UID → nom lisible
- **Ce qui a été fait** : Pipeline `left_join()` entre `dict_fs`
  (75 FS, table maître) et `df_analytics` (73 FS déclarantes)
  via clé `c("id" = "ou")` ; justification du choix `left_join`
  — conserver les 75 lignes, NA pour les FS silencieuses ;
  conversion `as.numeric(value)` — DHIS2 retourne les numériques
  en chr ; tri `arrange(displayName)` ; identification des FS
  silencieuses avec `filter(is.na(value))`
- **Ce qui est acquis** : `left_join(x, y, by = c("col_x" =
  "col_y"))` — table maître en x, clé de jointure avec noms
  différents ; colonne-clé de y supprimée, celle de x conservée ;
  NA ≠ zéro (absence de déclaration ≠ valeur nulle) ; pipeline
  complet : jointure → as.numeric → arrange → filter(is.na)
- **Ce qui reste flou** : néant
- **Prochaine étape** : Session 11.5 — Construire et sauvegarder
  `dictionnaire_endos_bf.xlsx` : UID ↔ nom ↔ groupe ↔ unité

#### Session 11.5 — Construire le dictionnaire ENDOS-BF

- **Date et durée** : 01/06/2026 — [durée à compléter]
- **Ce qui était prévu** : Construire et sauvegarder
  `dictionnaire_endos_bf.xlsx` : UID ↔ nom ↔ groupe ↔ unité
- **Ce qui a été fait** : Exploration des 60 groupes d'indicateurs
  ENDOS-BF via `/indicatorGroups` (`$pager$total` = 60, vérifié) ;
  extraction des `displayName` avec `sapply()` ; sélection de 9
  groupes pertinents pour le DS-BMG (ASBC, Couverture PEV,
  Indicateurs Formations sanitaires, Morbidite et PCIME, Paludisme,
  Planification familiale, Rapport de progrès District, Santé
  maternelle et infantile, SIMR) ; extraction des 9 UIDs avec
  `which()` + `%in%` + `sapply()` ; requête filtrée sur `/indicators`
  avec `filter = paste0("indicatorGroups.id:eq:", uids_igroup)`,
  `rootJunction = "OR"`, `.multi = "explode"`, `pageSize = 500` ;
  résultat : 339 indicateurs (`$pager$total` = 339, pageCount = 1,
  tout reçu en une page) ; construction de `df_dict_indicators`
  (339×2, chr) via double `sapply()` ; export `write_xlsx()` vers
  `data/dictionnaire_endos_bf.xlsx` ; configuration `.gitignore`
  (`data/`, `.DS_Store`), exercice de pipeline autonome, dictionaire de 48 formations
  sanitaires publiques.
- **Ce qui est acquis** : opérateur `%in%` — test d'appartenance à
  un ensemble, retourne vecteur logique ; pattern `which(%in%)` pour
  index multiples ; `rootJunction = "OR"` — inverser la logique AND
  par défaut de DHIS2 pour les filtres multiples ; `.multi =
  "explode"` — sérialiser un vecteur en clés répétées dans l'URL ;
  constat : ENDOS-BF contient 3392 indicateurs au niveau national,
  339 pertinents pour le DS-BMG ; `data/` exclu de Git via
  `.gitignore` — les métadonnées production ne se commitent pas
- **Ce qui reste flou** : néant
- **Prochaine étape** :  API Analytics : données réelles

------------------------------------------------------------------------

### Semaine 12 (révisée) — API Analytics : données réelles

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 12.1 — L'endpoint Analytics : structure dx/pe/ou

-   **Date et durée** : 05/06/2026
-   **Ce qui était prévu** : Structure de la requête Analytics — dimensions `dx` (indicateur), `pe` (période), `ou` (unité d'organisation)
-   **Ce qui a été fait** : Sessions 12.1→12.3 absorbées d'un bloc (option B). Pipeline analytics complet construit bloc par bloc sur ENDOS-BF production, indicateur réel CPN4 (`zmakCFoXPXN`, « CibleFS-Couverture en CPN4 »), périodes `202504;202505`, 48 CSPS publics. Premier appel échoué (409 / E7104). Diagnostic en plusieurs itérations : trois hypothèses successives sur l'encodage du `;` (httr2, puis curl, puis `I()`), toutes infirmées. Résolution par réduction au cas minimal (1 période × 1 FS, zéro `;`) → l'erreur persiste, ce qui DISCULPE le `;` et désigne le format des paramètres. Bascule vers la syntaxe canonique `dimension=…` + `.multi = "explode"` → statut 200, 1 ligne réelle (CM Komsilga, avril 2025, CPN4 = 11,31)
-   **Ce qui est acquis** : ce serveur exige `dimension=dx:UID&dimension=pe:…&dimension=ou:…`, pas les raccourcis `dx=/pe=/ou=` ; structure de la réponse analytics (`$rows`, `$headers$name`, `$metaData$items`, `$height`) ; valeurs toutes en texte ; lecture du JSON d'erreur DHIS2 via `last_response() |> resp_body_json()` même après une erreur `req_perform()`
-   **Ce qui reste flou** : —
-   **Prochaine étape** : Session 12.4 — pagination (`pager`, `pageSize`) sur grandes requêtes

#### Session 12.2 — Construire et exécuter une requête complète

-   **Date et durée** : 05/06/2026 (fusionnée avec 12.1)
-   **Ce qui était prévu** : Requête `httr2` complète pour un indicateur sur les FS du DS-BMG
-   **Ce qui a été fait** : Passage à l'échelle complète (2 périodes × 48 FS) après validation du test minimal ; les `;` réintroduits À L'INTÉRIEUR des valeurs `pe:` et `ou:` passent sans problème (confirmé par le test minimal). Inspection Bloc 2 : `body$height` = 94 et `length(body$rows)` = 94 (cohérents), contre 96 attendues → 2 trous prédits, conformes au phénomène des FS silencieuses
-   **Ce qui est acquis** : prédiction explicite de l'attendu (96) avant exécution, puis confrontation au réel (94) ; `height` = `length(rows)` confirme l'intégrité de la réponse ; un écart au compte attendu n'est pas une erreur mais un signal de complétude à investiguer
-   **Ce qui reste flou** : —
-   **Prochaine étape** : voir 12.4

#### Session 12.3 — Transformer JSON en data frame

-   **Date et durée** : 05/06/2026 (fusionnée avec 12.1)
-   **Ce qui était prévu** : Transformation de la réponse JSON brute en data frame exploitable
-   **Ce qui a été fait** : Bloc 3 — `do.call(rbind, body$rows)` produit d'abord des colonnes-LISTES (piège révélé par `str()`, invisible à `dim()` et `class(value)`). Correction par aplatissement en amont : `lapply(body$rows, \(l) unlist(l))` avant `rbind` → colonnes `chr` propres. Noms via `sapply(body$headers, \(h) h$name)`, `as.numeric()` sur `value`. Bloc 4 — `expand.grid(ou, pe)` (grille 96) + `left_join` → 2 NA révélés. Jointure nominative avec `df_fs48` → trous identifiés : **CSPS Sandogo 2** (`ZRfRQ6kc5cE`), muet sur avril ET mai 2025
-   **Ce qui est acquis** : piège `do.call(rbind, liste_de_listes)` et sa correction `lapply(x, unlist)` ; `expand.grid` comme grille de complétude ; `unlist()` ; `left_join` peut augmenter le nb de lignes (expansion par appariement) ; **le NA analytics est un point de départ d'investigation, pas un verdict** — 3 causes possibles (rapport non transmis / indicateur non renseigné / service non offert) aux conséquences managériales opposées
-   **Ce qui reste flou** : nature réelle du trou Sandogo 2 — à vérifier HORS R (statut ENDOS, paquet de services, complétude mensuelle)
-   **Prochaine étape** : Session 12.4 — pagination

#### Session 12.4 — Pagination et garde anti-troncature

-   **Date et durée** : 11/06/2026
-   **Ce qui était prévu** : Gérer les réponses volumineuses (pager, pageSize)
-   **Ce qui a été fait** : Constat empirique qu'ENDOS-BF analytics n'expose PAS de champ `$pager` (ni en réponse normale, ni via `skipData=true` qui renvoie height=0). Impossible de connaître le total serveur a priori. Construction d'une garde défensive alternative basée sur la comparaison attendu/reçu. Paramètre `ignoreLimit="true"` identifié comme le plus chirurgical contre la troncature (vs `paging=false`). Seuil d'alerte fixé à 1% par arbitrage métier conscient (double fonction : garde technique + signal de supervision). Test du bloc conditionnel par forçage du seuil (leçon : le code dans un `if` non déclenché n'est jamais testé).
-   **Ce qui est acquis** : ENDOS-BF analytics ne pagine pas comme les endpoints métadonnées ; pattern de garde défensive `ecart = (attendu-recu)/attendu` + `stop()` conditionnel ; `stop()` vs `warning()` en pipeline non surveillé (préférer l'arrêt bruyant à la donnée silencieusement fausse) ; principe single-source-of-truth appliqué au vecteur `periode` (défini une fois, consommé dans la requête ET dans le calcul du attendu) ; un bloc conditionnel doit être testé en forçant sa condition à TRUE
-   **Ce qui reste flou** : néant
-   **Prochaine étape** : Session 12.5 — pipeline CPN4 mensuel complet (requête → data frame propre)

#### Session 12.5 — Cas pratique : CPN4 mensuelle 49 FS sur 24 mois

-   **Date et durée** :
-   **Ce qui était prévu** : Pipeline complet de la requête au data frame propre — couverture CPN4 des 49 FS sur 24 mois
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

------------------------------------------------------------------------

### Semaine 13 (révisée) — Transformation, validation sémantique, `{renv}`

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 13.1 — Pipeline de transformation API → data frame

-   **Date et durée** :
-   **Ce qui était prévu** : API → renommage des colonnes → types corrects → jointure avec la liste des 49 FS
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 13.2 — Validation sémantique post-réception

-   **Date et durée** :
-   **Ce qui était prévu** : Vérifier que toutes les FS sont présentes, toutes les périodes couvertes, aucune valeur impossible
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 13.3 — Alertes qualité intégrées

-   **Date et durée** :
-   **Ce qui était prévu** : FS manquante = warning, valeur > seuil Tukey = flag, taux > 120 % = erreur
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 13.4 — Cas pratique : pipeline CPN4 avec rapport qualité

-   **Date et durée** :
-   **Ce qui était prévu** : Pipeline CPN4 complet avec rapport de qualité automatique en sortie
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 13.5 — `{renv}` : figer l'environnement

-   **Date et durée** :
-   **Ce qui était prévu** : `renv::init()`, `renv::snapshot()`, `renv::restore()` — garantir la reproductibilité dans le temps
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

------------------------------------------------------------------------

### Semaine 14 (révisée) — Refactoring et robustesse

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 14.1 — Refactoring en fonctions paramétrées

-   **Date et durée** :
-   **Ce qui était prévu** : Transformer le script monolithique en fonctions réutilisables : `get_indicateur()`, `valider_donnees()`, `exporter_excel()`
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 14.2 — Paramétrage du pipeline

-   **Date et durée** :
-   **Ce qui était prévu** : Script paramétré : période, liste d'indicateurs, niveau d'unité d'organisation en entrée
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 14.3 — Gestion d'erreurs avec `tryCatch()`

-   **Date et durée** :
-   **Ce qui était prévu** : `tryCatch()`, retry automatique en cas de timeout, message d'erreur informatif
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 14.4 — Logs horodatés

-   **Date et durée** :
-   **Ce qui était prévu** : Tracer chaque exécution dans un fichier `log_YYYYMMDD.txt` — données téléchargées, nombre de lignes, warnings
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 14.5 — Cache local

-   **Date et durée** :
-   **Ce qui était prévu** : Éviter de re-télécharger les données déjà présentes — comparaison date locale vs dernière mise à jour DHIS2
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

------------------------------------------------------------------------

### Semaine 15 (révisée) — Automatisation et `{khisr}`

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 15.1 — Scheduling avec `cronR`

-   **Date et durée** :
-   **Ce qui était prévu** : `cron_add()` — le pipeline tourne seul le 1er de chaque mois sans intervention humaine
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 15.2 — Introduction à `{khisr}`

-   **Date et durée** :
-   **Ce qui était prévu** : Ce que `{khisr}` fait vs ce que `httr2` fait en dessous — `khis_cred()`, `get_analytics()`, `get_analytics_by_level()`, `get_organisation_units()`
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 15.3 — Comparaison httr2 vs `{khisr}`

-   **Date et durée** :
-   **Ce qui était prévu** : Même pipeline CPN4 avec les deux approches — comprendre l'abstraction, identifier les cas où `httr2` reste nécessaire
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 15.4 — Refactorisation avec `{khisr}`

-   **Date et durée** :
-   **Ce qui était prévu** : Refactoriser le pipeline avec `{khisr}` là où il simplifie, conserver `httr2` pour les endpoints non couverts
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 15.5 — GitHub Actions (optionnel)

-   **Date et durée** :
-   **Ce qui était prévu** : Scheduling cloud — pipeline qui tourne sur les serveurs GitHub et envoie le rapport par email (si temps disponible)
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Bilan M4-étendu

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|---|---|---|
| Appel API authentifié avec `httr2` sans tutoriel |  |  |
| Navigation hiérarchique orgUnit sans liste hardcodée |  |  |
| Détection automatique des anomalies sémantiques |  |  |
| Pipeline mensuel automatisé sans intervention |  |  |
| Différence httr2 / `{khisr}` expliquée et appliquée |  |  |
| `renv::restore()` sur machine vierge |  |  |

------------------------------------------------------------------------

> **M3-SUITE — Statistique inférentielle (reportée)**
> Les sessions ci-dessous (semaines 10–12 du plan initial) sont conservées dans le carnet mais seront traitées après le bloc M4-étendu, sous le nom **M3-suite**. Ne pas remplir avant d'avoir validé le bilan M4-étendu.

### Semaine 10 — Tests d'hypothèses

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 10.1 — Logique d'un test : H0/H1, p-value

-   **Date et durée** :
-   **Ce qui était prévu** : Logique d'un test : H0/H1, p-value, erreur
    de type I et II
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 10.2 — Comparaison de moyennes

-   **Date et durée** :
-   **Ce qui était prévu** : Comparaison de moyennes : t-test (Student,
    Welch), Mann-Whitney
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 10.3 — Comparaison de proportions

-   **Date et durée** :
-   **Ce qui était prévu** : Comparaison de proportions : chi², Fisher
    exact
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 10.4 — ANOVA et alternatives non paramétriques

-   **Date et durée** :
-   **Ce qui était prévu** : ANOVA et alternatives non paramétriques
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 10.5 — Arbre de décision : quel test pour quelle question

-   **Date et durée** :
-   **Ce qui était prévu** : Arbre de décision : quel test pour quelle
    question
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 10

| Compétence attendue                    | Auto-éval (1-5) | Commentaire |
|----------------------------------------|-----------------|-------------|
| Interpréter une p-value correctement   |                 |             |
| Choisir entre t-test et Mann-Whitney   |                 |             |
| Appliquer un chi² ou Fisher exact      |                 |             |
| Utiliser l'arbre de décision des tests |                 |             |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### Semaine 11 — Intervalles de confiance et taux standardisés

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 11.1 — Intervalles de confiance

-   **Date et durée** :
-   **Ce qui était prévu** : Intervalles de confiance : interprétation
    correcte, calcul pour proportions et moyennes
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 11.2 — Pourquoi standardiser

-   **Date et durée** :
-   **Ce qui était prévu** : Pourquoi standardiser : effet d'âge, effet
    de structure
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 11.3 — Standardisation directe et indirecte

-   **Date et durée** :
-   **Ce qui était prévu** : Standardisation directe et indirecte
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 11.4 — Taux pour 1 000 / 100 000

-   **Date et durée** :
-   **Ce qui était prévu** : Taux pour 1 000 / 100 000 — calculs et
    présentation
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 11.5 — Cas pratique : mortalité maternelle standardisée

-   **Date et durée** :
-   **Ce qui était prévu** : Cas pratique : taux de mortalité maternelle
    standardisé par âge
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 11

| Compétence attendue                  | Auto-éval (1-5) | Commentaire |
|--------------------------------------|-----------------|-------------|
| Calculer et interpréter un IC 95 %   |                 |             |
| Expliquer pourquoi standardiser      |                 |             |
| Appliquer la standardisation directe |                 |             |
| Calculer un taux pour 100 000        |                 |             |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### Semaine 12 — Régression linéaire et logistique

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 12.1 — Régression linéaire simple

-   **Date et durée** :
-   **Ce qui était prévu** : Régression linéaire simple : équation,
    interprétation, hypothèses
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 12.2 — Régression linéaire multiple

-   **Date et durée** :
-   **Ce qui était prévu** : Régression linéaire multiple : variables
    catégorielles, interactions
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 12.3 — Régression logistique

-   **Date et durée** :
-   **Ce qui était prévu** : Régression logistique : odds ratio,
    interprétation
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 12.4 — Diagnostics de modèle

-   **Date et durée** :
-   **Ce qui était prévu** : Diagnostics de modèle : résidus, leverage,
    ajustement
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 12.5 — `gtsummary::tbl_regression`

-   **Date et durée** :
-   **Ce qui était prévu** : `gtsummary::tbl_regression` pour publier
    des tableaux de résultats
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 12

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|----|----|----|
| Interpréter les coefficients d'une régression linéaire |  |  |
| Interpréter un odds ratio |  |  |
| Diagnostiquer un modèle (résidus) |  |  |
| Publier un tableau de régression avec `gtsummary` |  |  |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### BILAN MOIS 3 {#bilan-mois-3}

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h **Heures prévues** : 20-28 h

#### Validation des indicateurs de progression du mois 3

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|----|----|----|
| Choisir et exécuter le bon test selon la question |  |  |
| Produire un tableau 1 propre exportable en Word |  |  |
| Faire et interpréter une régression linéaire et logistique |  |  |
| Calculer un IC 95 % et un taux standardisé |  |  |

#### Mini-projet (reproduction analyse Stata UMC en R)

-   **Statut** :
-   **Lien GitHub** :
-   **Comparaison avec Stata** :
-   **Difficultés rencontrées** :
-   **Améliorations possibles** :

#### Réflexion personnelle

-   **Ce qui a marché dans ma méthode** :
-   **Ce qui n'a pas marché** :
-   **Ajustements pour le mois 4** :

#### Décision sur Stata

-   [ ] Bascule complète vers R
-   [ ] Maintien de Stata pour la recherche, R pour le quotidien
-   [ ] Indécis (à trancher en mois 4)

#### Décision de progression

-   [ ] Passer au mois 4
-   [ ] Consolider avant de continuer (préciser quoi : \_\_\_)
-   [ ] Étaler le rythme (préciser : \_\_\_)

------------------------------------------------------------------------

## SUIVI HEBDOMADAIRE — MOIS 4

### Semaine 13 — Introduction aux API REST

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 13.1 — Concepts : client/serveur, verbes HTTP

-   **Date et durée** :
-   **Ce qui était prévu** : Concepts : client/serveur, verbes HTTP
    (GET, POST), codes de statut
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 13.2 — Le format JSON et `jsonlite`

-   **Date et durée** :
-   **Ce qui était prévu** : Le format JSON : structure, parsing avec
    `jsonlite`
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 13.3 — `httr2` : premier appel API

-   **Date et durée** :
-   **Ce qui était prévu** : `httr2` : premier appel à une API publique
    (météo, REST Countries)
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 13.4 — Authentification : basique vs token

-   **Date et durée** :
-   **Ce qui était prévu** : Authentification : basique vs token
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 13.5 — Sécurité : `.Renviron`

-   **Date et durée** :
-   **Ce qui était prévu** : Sécurité : `.Renviron`, ne jamais commiter
    ses identifiants
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 13

| Compétence attendue                      | Auto-éval (1-5) | Commentaire |
|------------------------------------------|-----------------|-------------|
| Expliquer la logique client/serveur      |                 |             |
| Parser un JSON avec `jsonlite`           |                 |             |
| Faire un appel GET avec `httr2`          |                 |             |
| Stocker des credentials dans `.Renviron` |                 |             |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### Semaine 14 — API DHIS2 / ENDOS-BF (1) : métadonnées

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 14.1 — Architecture DHIS2 : endpoints clés

-   **Date et durée** :
-   **Ce qui était prévu** : Architecture DHIS2 : endpoints clés (`/me`,
    `/indicators`, `/dataElements`, `/organisationUnits`, `/analytics`)
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 14.2 — Récupérer la liste des indicateurs

-   **Date et durée** :
-   **Ce qui était prévu** : Récupérer la liste des indicateurs avec
    leurs métadonnées
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 14.3 — Hiérarchie des unités d'organisation

-   **Date et durée** :
-   **Ce qui était prévu** : Récupérer la hiérarchie des unités
    d'organisation
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 14.4 — Résoudre les UID en noms lisibles

-   **Date et durée** :
-   **Ce qui était prévu** : Résoudre les UID (identifiants) en noms
    lisibles
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 14.5 — Dictionnaire d'indicateurs ENDOS-BF en Excel

-   **Date et durée** :
-   **Ce qui était prévu** : Construire le dictionnaire d'indicateurs
    ENDOS-BF en Excel
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 14

| Compétence attendue                       | Auto-éval (1-5) | Commentaire |
|-------------------------------------------|-----------------|-------------|
| Naviguer dans les endpoints DHIS2         |                 |             |
| Récupérer les métadonnées d'un indicateur |                 |             |
| Résoudre un UID en nom lisible            |                 |             |
| Produire un dictionnaire d'indicateurs    |                 |             |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### Semaine 15 — API DHIS2 / ENDOS-BF (2) : données analytiques

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 15.1 — L'API Analytics : structure de la requête

-   **Date et durée** :
-   **Ce qui était prévu** : L'API Analytics : structure de la requête
    (dx, pe, ou)
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 15.2 — Récupérer les valeurs d'un indicateur

-   **Date et durée** :
-   **Ce qui était prévu** : Récupérer les valeurs d'un indicateur sur
    une période, pour une liste de FS
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 15.3 — Transformer la réponse JSON en data frame

-   **Date et durée** :
-   **Ce qui était prévu** : Transformer la réponse JSON en data frame
    exploitable
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 15.4 — Pagination et grandes requêtes

-   **Date et durée** :
-   **Ce qui était prévu** : Pagination, gestion des grandes requêtes
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 15.5 — Cas pratique : CPN4 mensuelle 49 FS sur 24 mois

-   **Date et durée** :
-   **Ce qui était prévu** : Cas pratique : couverture CPN4 mensuelle de
    tes 49 FS sur 24 mois
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 15

| Compétence attendue                        | Auto-éval (1-5) | Commentaire |
|--------------------------------------------|-----------------|-------------|
| Construire une requête Analytics DHIS2     |                 |             |
| Transformer une réponse JSON en data frame |                 |             |
| Gérer la pagination d'une API              |                 |             |
| Extraire 24 mois de données pour 49 FS     |                 |             |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### Semaine 16 — Automatisation et robustesse

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 16.1 — Refactoring : script → fonctions

-   **Date et durée** :
-   **Ce qui était prévu** : Refactoring : transformer un script en
    fonctions réutilisables
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 16.2 — Paramétrage du pipeline

-   **Date et durée** :
-   **Ce qui était prévu** : Paramétrage : un script qui prend en entrée
    la période, la FS, l'indicateur
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 16.3 — Gestion d'erreurs : `tryCatch`

-   **Date et durée** :
-   **Ce qui était prévu** : Gestion d'erreurs : `tryCatch`, retry
    automatique en cas de timeout
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 16.4 — Logs : tracer l'exécution

-   **Date et durée** :
-   **Ce qui était prévu** : Logs : tracer l'exécution dans un fichier
    daté
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 16.5 — Cache : éviter les re-téléchargements

-   **Date et durée** :
-   **Ce qui était prévu** : Cache : éviter de re-télécharger ce qui a
    déjà été demandé
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 16

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|----|----|----|
| Transformer un script en fonctions réutilisables |  |  |
| Paramétrer un pipeline (période, FS, indicateur) |  |  |
| Gérer une erreur réseau avec `tryCatch` |  |  |
| Produire un fichier de log daté |  |  |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### BILAN MOIS 4 {#bilan-mois-4}

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h **Heures prévues** : 20-28 h

#### Validation des indicateurs de progression du mois 4

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|----|----|----|
| Faire un appel API authentifié sans tutoriel |  |  |
| Récupérer une donnée ENDOS-BF et la transformer en data frame |  |  |
| Construire un pipeline rejouable mensuellement |  |  |

#### Mini-projet (pipeline ENDOS-BF mensuel)

-   **Statut** :
-   **Lien GitHub** :
-   **Difficultés rencontrées** :
-   **Améliorations possibles** :

#### Réflexion personnelle

-   **Ce qui a marché dans ma méthode** :
-   **Ce qui n'a pas marché** :
-   **Ajustements pour le mois 5** :

#### Décision

-   [ ] Passer au mois 5
-   [ ] Consolider avant de continuer (préciser quoi : \_\_\_)
-   [ ] Étaler le rythme (préciser : \_\_\_)

------------------------------------------------------------------------

## SUIVI HEBDOMADAIRE — MOIS 5

### Semaine 17 — Surveillance épidémiologique

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 17.1 — Concepts : courbe épidémique, taux d'incidence

-   **Date et durée** :
-   **Ce qui était prévu** : Concepts : courbe épidémique, taux
    d'incidence, taux d'attaque
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 17.2 — Package `incidence2`

-   **Date et durée** :
-   **Ce qui était prévu** : Le package `incidence2` : courbes
    épidémiques par jour/semaine/mois
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 17.3 — Seuils d'alerte

-   **Date et durée** :
-   **Ce qui était prévu** : Seuils d'alerte : moyenne mobile, méthode
    CDC, méthode des moyennes ± 2 ET
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 17.4 — Détection automatique de dépassements

-   **Date et durée** :
-   **Ce qui était prévu** : Détection automatique de dépassements
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 17.5 — Cas pratique : surveillance paludisme 49 FS

-   **Date et durée** :
-   **Ce qui était prévu** : Cas pratique : surveillance paludisme dans
    tes 49 FS, alerte automatique
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 17

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|----|----|----|
| Construire une courbe épidémique avec `incidence2` |  |  |
| Calculer un seuil d'alerte (moyenne mobile) |  |  |
| Détecter automatiquement un dépassement |  |  |
| Interpréter une courbe épidémique opérationnellement |  |  |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### Semaine 18 — Analyse de mortalité

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 18.1 — Indicateurs de mortalité

-   **Date et durée** :
-   **Ce qui était prévu** : Indicateurs : létalité, mortalité
    proportionnelle, taux brut, taux spécifique
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 18.2 — Pyramide des âges

-   **Date et durée** :
-   **Ce qui était prévu** : Pyramide des âges, structure par sexe
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 18.3 — Package `epitools` : OR, RR

-   **Date et durée** :
-   **Ce qui était prévu** : Le package `epitools` : OR, RR, IC associés
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 18.4 — Tables de mortalité simples

-   **Date et durée** :
-   **Ce qui était prévu** : Tables de mortalité simples
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 18.5 — Cas pratique : analyse exploratoire données UMC

-   **Date et durée** :
-   **Ce qui était prévu** : Cas pratique : analyse exploratoire de tes
    données UMC
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 18

| Compétence attendue                          | Auto-éval (1-5) | Commentaire |
|----------------------------------------|----------------|----------------|
| Calculer létalité, mortalité proportionnelle |                 |             |
| Produire une pyramide des âges               |                 |             |
| Calculer OR et RR avec IC avec `epitools`    |                 |             |
| Analyser des données de mortalité réelles    |                 |             |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### Semaine 19 — Cartographie (1) : fondations spatiales

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 19.1 — Concepts spatiaux : CRS, shapefiles, GeoJSON

-   **Date et durée** :
-   **Ce qui était prévu** : Concepts : système de coordonnées (CRS),
    shapefiles, GeoJSON
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 19.2 — Package `sf` : objets spatiaux

-   **Date et durée** :
-   **Ce qui était prévu** : Le package `sf` : importer un shapefile,
    manipuler des objets spatiaux
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 19.3 — Shapefiles du Burkina Faso

-   **Date et durée** :
-   **Ce qui était prévu** : Trouver/utiliser les shapefiles du Burkina
    Faso (régions, districts, communes)
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 19.4 — Jointure : indicateurs + shapefile

-   **Date et durée** :
-   **Ce qui était prévu** : Jointure : associer un data frame
    d'indicateurs à un shapefile
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 19.5 — Première carte choroplèthe avec `ggplot2 + geom_sf`

-   **Date et durée** :
-   **Ce qui était prévu** : Première carte choroplèthe avec
    `ggplot2 + geom_sf`
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 19

| Compétence attendue                    | Auto-éval (1-5) | Commentaire |
|----------------------------------------|-----------------|-------------|
| Expliquer ce qu'est un CRS             |                 |             |
| Importer un shapefile avec `sf`        |                 |             |
| Joindre un data frame à un shapefile   |                 |             |
| Produire une carte choroplèthe basique |                 |             |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### Semaine 20 — Cartographie (2) : cartes professionnelles

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 20.1 — `tmap` : cartes thématiques

-   **Date et durée** :
-   **Ce qui était prévu** : `tmap` : alternative spécialisée pour
    cartes thématiques
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 20.2 — Choroplèthes par classes et palettes

-   **Date et durée** :
-   **Ce qui était prévu** : Cartes choroplèthes par classes (Jenks,
    quantiles), palettes de couleur
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 20.3 — Cartes interactives avec `leaflet`

-   **Date et durée** :
-   **Ce qui était prévu** : Cartes interactives avec `leaflet`
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 20.4 — Cartes de hotspots et proportionnelles

-   **Date et durée** :
-   **Ce qui était prévu** : Cartes de hotspots, cartes proportionnelles
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 20.5 — Export pour rapports DRS

-   **Date et durée** :
-   **Ce qui était prévu** : Export pour rapports DRS et présentations
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 20

| Compétence attendue                           | Auto-éval (1-5) | Commentaire |
|----------------------------------------|----------------|----------------|
| Produire une carte thématique avec `tmap`     |                 |             |
| Choisir une discrétisation (Jenks, quantiles) |                 |             |
| Produire une carte interactive avec `leaflet` |                 |             |
| Exporter une carte en PNG pour un rapport     |                 |             |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### BILAN MOIS 5 {#bilan-mois-5}

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h **Heures prévues** : 20-28 h

#### Validation des indicateurs de progression du mois 5

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|----|----|----|
| Détecter automatiquement un dépassement de seuil épidémique |  |  |
| Produire une carte choroplèthe avec légende propre |  |  |
| Calculer un OR, un RR avec leur IC 95 % |  |  |
| Construire une courbe épidémique paramétrable |  |  |

#### Mini-projet (bulletin épidémiologique mensuel)

-   **Statut** :
-   **Lien GitHub** :
-   **Difficultés rencontrées** :
-   **Améliorations possibles** :

#### Réflexion personnelle

-   **Ce qui a marché dans ma méthode** :
-   **Ce qui n'a pas marché** :
-   **Ajustements pour le mois 6** :

#### Décision

-   [ ] Passer au mois 6
-   [ ] Consolider avant de continuer (préciser quoi : \_\_\_)
-   [ ] Étaler le rythme (préciser : \_\_\_)

------------------------------------------------------------------------

## SUIVI HEBDOMADAIRE — MOIS 6

### Semaine 21 — Quarto : fondations

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 21.1 — Installer Quarto, premier document `.qmd`

-   **Date et durée** :
-   **Ce qui était prévu** : Installer Quarto, premier document `.qmd`
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 21.2 — Structure : YAML, prose, blocs de code

-   **Date et durée** :
-   **Ce qui était prévu** : Structure : YAML, prose Markdown, blocs de
    code
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 21.3 — Options de blocs

-   **Date et durée** :
-   **Ce qui était prévu** : Options de blocs : `echo`, `eval`,
    `include`, `fig.width`, etc.
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 21.4 — Tableaux : `knitr::kable`, `gt`, `flextable`

-   **Date et durée** :
-   **Ce qui était prévu** : Tableaux : `knitr::kable`, `gt`,
    `flextable`
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 21.5 — Rendu en HTML, PDF, Word

-   **Date et durée** :
-   **Ce qui était prévu** : Rendu en HTML, PDF, Word
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 21

| Compétence attendue                          | Auto-éval (1-5) | Commentaire |
|----------------------------------------|----------------|----------------|
| Créer un document `.qmd` fonctionnel         |                 |             |
| Maîtriser le YAML et les options de blocs    |                 |             |
| Intégrer un tableau formaté dans un document |                 |             |
| Rendre en HTML, PDF et Word                  |                 |             |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### Semaine 22 — Quarto avancé : rapports institutionnels

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 22.1 — Paramètres : N rapports depuis un seul document

-   **Date et durée** :
-   **Ce qui était prévu** : Paramètres : un même document qui produit N
    rapports (un par FS, par mois)
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 22.2 — Templates Word personnalisés

-   **Date et durée** :
-   **Ce qui était prévu** : Templates Word personnalisés (logo DS-BMG,
    polices, en-têtes)
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 22.3 — Pieds de page, numérotation, table des matières

-   **Date et durée** :
-   **Ce qui était prévu** : Pieds de page, numérotation, table des
    matières
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 22.4 — Conditional content

-   **Date et durée** :
-   **Ce qui était prévu** : Conditional content : sections qui
    apparaissent seulement si données pertinentes
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 22.5 — Cas pratique : rapport mensuel paramétrable pour la DRS

-   **Date et durée** :
-   **Ce qui était prévu** : Cas pratique : modèle de rapport mensuel
    paramétrable pour la DRS
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 22

| Compétence attendue                      | Auto-éval (1-5) | Commentaire |
|------------------------------------------|-----------------|-------------|
| Paramétrer un document Quarto            |                 |             |
| Appliquer un template Word personnalisé  |                 |             |
| Utiliser le conditional content          |                 |             |
| Produire un rapport mensuel paramétrable |                 |             |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### Semaine 23 — Tableaux de bord

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 23.1 — `quarto dashboard` : philosophie et structure

-   **Date et durée** :
-   **Ce qui était prévu** : `quarto dashboard` : philosophie et
    structure
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 23.2 — Layouts : rangées, colonnes, value boxes

-   **Date et durée** :
-   **Ce qui était prévu** : Layouts : rangées, colonnes, value boxes
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 23.3 — Graphiques interactifs avec `plotly`

-   **Date et durée** :
-   **Ce qui était prévu** : Graphiques interactifs avec `plotly`
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 23.4 — Tables interactives avec `DT`

-   **Date et durée** :
-   **Ce qui était prévu** : Tables interactives avec `DT`
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Session 23.5 — Mini-dashboard MCD

-   **Date et durée** :
-   **Ce qui était prévu** : Mini-dashboard MCD : indicateurs clés du
    jour, alertes, tendances
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

#### Récapitulatif semaine 23

| Compétence attendue                   | Auto-éval (1-5) | Commentaire |
|---------------------------------------|-----------------|-------------|
| Structurer un dashboard Quarto        |                 |             |
| Intégrer un graphique `plotly`        |                 |             |
| Intégrer une table interactive `DT`   |                 |             |
| Produire un dashboard MCD fonctionnel |                 |             |

**Décision** : **Points à réviser** :

------------------------------------------------------------------------

### Semaine 24 — Projet final

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h

#### Session 24 — Système intégré district

-   **Date et durée** :
-   **Ce qui était prévu** : Système intégré : API ENDOS-BF →
    indicateurs 49 FS → rapport Word + carte + dashboard HTML, en une
    commande
-   **Ce qui a été fait** :
-   **Ce qui est acquis** :
-   **Ce qui reste flou** :
-   **Prochaine étape** :

------------------------------------------------------------------------

### BILAN MOIS 6 / FINAL

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales
investies** : \_\_\_ h **Heures prévues** : 20-28 h

#### Validation des indicateurs de progression du mois 6

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|------------------------|------------------------|------------------------|
| Générer un rapport Quarto paramétré qui se met à jour mensuellement |  |  |
| Produire un dashboard HTML fonctionnel |  |  |
| Exécuter le projet final en une commande, sans intervention manuelle |  |  |

#### Projet final intégré

-   **Statut** :
-   **Lien GitHub** :
-   **Lien dashboard** :
-   **Date de première exécution réelle au district** :
-   **Difficultés rencontrées** :

#### Bilan global des 6 mois

**Compétences acquises** :

**Compétences à approfondir** :

**Usage réel dans le travail quotidien** (cas concrets) :

#### Décision pour la suite

-   [ ] Programme avancé (Mois 7-9 : Shiny, modélisation, recherche)

-   [ ] Consolidation par projets concrets seulement

-   [ ] Formation d'autres MCD à R

-   

    ## [ ] Autre : \|\>

## NOTES LIBRES {#notes-libres}

(Espace pour réflexions, idées, questions à poser plus tard, ressources
à explorer, etc.)
##Liste de concepts à introduire
apply() (version matricielle, argument MARGIN) 

#1er mai 2026 — Première application du cadre renforcé (7 dispositifs).
Retrieval practice de 3 questions. 6 concepts consolidés à J+30.
Capacité de reformulation post-séance fonctionnelle, à entretenir.

#05 mai 2026 — Session technique : connexion Claude → GitHub
opérationnelle.

-   URL de lecture directe configurée :
    <https://raw.githubusercontent.com/bereniceharo/R-apprentissage-DSBMG/refs/heads/main/02_Carnet_progression.md>
-   Dépôt rendu public pour permettre le fetch sans authentification
-   Algorithme de la TABLE DE RAPPEL corrigé : suppression de la date
    figée "1er mai 2026" — Claude calcule désormais les statuts à partir
    de la date réelle du jour, annoncée explicitement en début de
    session
-   Leçon Git apprise : toujours vérifier avec grep + git diff avant de
    commiter ; un commit vide ne modifie pas le fichier sur GitHub
-   Commande de vérification à retenir :

#10 mai 2026 — Refonte de la TABLE DE RAPPEL PAR ESPACEMENT.

#10 mai 2026 (suite) — Session de révision pure (1h environ) Application
complète du dispositif 5 (espacement opérationnalisé). Recalcul
dynamique des statuts à la date du jour : 2 concepts en Dû J+7, 5
concepts en Dû J+1. Retrieval practice : 7 questions au total (3 dans la
première phase, 4 dans la seconde après décision de reporter la session
7.4-suite). Concepts consolidés à J+7 le 10/05/2026 : #15 (verbes
dplyr + pipe), #16 (grepl/table/unique). Concepts consolidés à J+1 le
10/05/2026 : #28 (geom_line série temporelle), #29 (group = 1), #30
(ligne fantôme cumul), #31 (geom_tile), #32 (theme + element_text).
Erreurs corrigées en cours de session :

confusion efficacité/correction sur l'ordre filter→select (Q1) ;
mauvaise application de table() à des noms uniques au lieu de types de
FS (Q2) ; méconnaissance du tri alphabétique sur les semaines
"S1"..."S19" (Q4) ; justification incomplète du recours à element_text()
(Q7).

#11 mai 2026 — Renforcement procédural après erreur de lecture.

Incident : Claude a identifié à tort 9 concepts (#19 à #27) comme "Dû
J+1" alors qu'ils avaient été révisés le 10/05/2026. Cause racine :
lecture transversale du tableau (filtrage mental sur la seule colonne
"J+1 prévu") sans vérification de la colonne complémentaire "Révisé J+1
le".

Correctifs intégrés : - Dispositif 5 : ajout d'une étape 4 bis imposant
la lecture verticale ligne par ligne et l'annonce structurée par compte
total. - Dispositif 2 : Emmanuel vérifie au moins un verdict par
échantillonnage avant validation. - Carnet : ajout d'une colonne de
synthèse "Dernière révision effective" pour faciliter la lecture rapide.

Leçon générale : un dispositif anti-erreur n'est valide que si la
procédure rend l'erreur visible. Une condition logique composée (A ET B)
cachée dans deux colonnes éloignées est un piège structurel.

#30 mai 2026 — Réconciliation plan/carnet sur la numérotation des
sessions 10.x. Concepts httr2 (#64-67) réétiquetés 10.1→10.3 pour
suivre le plan. Ajout des concepts HTTP théoriques manquants : #73
(verbes), #74 (codes de statut), vus en 10.1 le 28/05 mais non
inscrits. Concepts du jour : #71 (req_url_path_append), #72
(req_auth_basic). Numérotation en option B (numéros à la suite,
ordre porté par date+session, pas par le numéro) pour ne casser
aucune référence existante.

#01 juin 2026 - Exercice de production anonyme à faire mercredi 3 juin
Ce que je te préparerai pour mercredi 3 juin :
Un exercice en plusieurs étapes couvrant l'intégralité du pipeline de la semaine 11 — authentification, navigation, pagination, filtrage, extraction, jointure, export — sur données ENDOS-BF production. Aucun nouveau concept. Tout ce que tu as fait aujourd'hui, mais sans filet.
Je ne te le donne pas maintenant (01 juin 2026) — tu le découvriras à l'ouverture de la session mercredi 3 juin 2026.
Avant de me solliciter, tu t'imposes trois étapes :
Avant de me soliciter pour cet exercice, tu dois: 
- Relire le message d'erreur et identifier la ligne fautive
- Consulter tes notes de session (carnet + scripts)
- Formuler une hypothèse sur la cause
Si après ces trois étapes tu n'as pas de piste, tu m'appelles. Pas avant.

#02 juin 2026 — Session retrieval practice. Concepts révisés : 
#12 (fonctions personnalisées + early return pattern if/any/stop), 
#13 (stop() mobilisé), #14 (df[[col]] dynamique) → J+30 Consolidés. 
#55-58 (geoms distribution, stat_qq sample=) → J+7 révisés. 
Erreur corrigée : stop() dans ifelse() vs if/any/stop() en tête de fonction. 
#84-86 reportés à demain.

#04 juin 2026
 ENDOS-BF : maintenances fréquentes → prévoir gestion timeout + retry + log en semaine 14 (cronR) ». 
#05 juin 2026
« ENDOS — CM Camp Lamizana tagué FS Public + groupe CM, aucun groupe 
distinctif → exclusion manuelle documentée. Prévoir gestion timeout en S14 (serveur instable). »
Exercice de pipeline autonone bouclé. Construction des dictionnaires de formations 
sanitaires acquise. Il reste a aborder le endpoint analytics

#05 juin 2026 —bis.  Premier pipeline analytics de bout en bout sur données chiffrées réelles (jalon).

Pipeline CPN4 complet ENDOS-BF : authentification → requête analytics → transformation → complétude révélée. Sessions 12.1→12.3 traitées d'un bloc (option B).

Déblocage du 409 / E7104 — leçon méthodologique centrale de la session :
les trois premières hypothèses portaient toutes sur l'encodage du `;` (httr2, curl, `I()`) et ont échoué. Ce qui a tranché : RÉDUIRE AU CAS MINIMAL (1 indicateur × 1 période × 1 FS, donc zéro `;`). L'erreur a persisté → le `;` était hors de cause → la vraie cause était le format des paramètres. Règle à retenir : **quand une hypothèse échoue deux fois, on cesse de la raffiner ; on réduit au cas minimal et on teste une seule variable à la fois.**

Cause racine du 409 : ENDOS-BF refuse les raccourcis `dx=/pe=/ou=`. Syntaxe exigée : `dimension=dx:UID&dimension=pe:…&dimension=ou:…` via `.multi = "explode"`.

Résultat métier : sur 48 CSPS × 2 mois (avril–mai 2025), une seule FS silencieuse sur CPN4 → CSPS Sandogo 2, sur les deux mois. À investiguer hors R avant toute relance (ne pas confondre absence structurelle de service et manquement de saisie).

Reste à faire : envelopper le pipeline dans `tryCatch()` + retry + log en Semaine 14 (cronR) — ENDOS-BF instable.

#03–04 juin 2026 — Exercice pipeline autonome (semaine 11, sans filet).

Reconstruction complète du pipeline de la semaine 11 sur données ENDOS-BF production, sans assistance préalable (les trois étapes imposées avant sollicitation : relire l'erreur, consulter le carnet, formuler une hypothèse).

Réalisations :
- 75 FS publiques DS-BMG extraites avec UIDs (`/organisationUnits`, `path:like:UID_ds`, `level = 6`)
- CM Camp Lamizana : taguée FS Public + groupe CM mais sans groupe distinctif → exclusion manuelle documentée. SST : aucun groupe trouvé → à signaler à ENDOS/DRS
- dictionnaire `df_dict_indicators` (339 indicateurs × 2 colonnes : id, displayName) exporté → `data/dictionnaire_endos_bf.xlsx`
- liste finale de **48 CSPS publics** verrouillée (base du pipeline analytics du 05/06)
- pipeline complet validé : authentification, navigation, pagination, filtrage, jointure, export

Note opérationnelle : ENDOS-BF subit des maintenances fréquentes → prévoir `tryCatch()` + retry + log en Semaine 14.

#07 juin 2026 — Session de production et révision en conditions reelles (approx. 2h)
 
Pipeline complet sur donnees ENDOS-BF production : script `Methode_2_pipe_indicateurs.R` analyse, nettoyage, transformation et visualisation du data frame `taux2026_11_indicateurs_avril.xlsx` (2112 lignes, 48 FS, 11 indicateurs, 4 mois janv-avril 2026).
 
Concepts Dû J+30 consolidés : #16 (grepl/table/unique), #18 (sum logique), #19 (pivot_wider/longer), #21 (str_*), #23 (replace_na), #25-27 (ggplot/geom_col/geom_text).
 
Concepts Dû J+7 liquidés par mobilisation active en pipeline autonome 03-04/06 : #64-67, #69-83 (sauf #68 fromJSON non mobilisé). Date J+7 retenue : 03/06/2026.
 
Concepts Dû J+1 révisés : #87-93 (analytics endpoint et structure reponse). J+1 le 07/06/2026.
 
Nouveau concept inscrit : #94 (glimpse, dplyr).
 
Incident pédagogique enregistré : erreur d'instruction sur le type de `pe` après aller-retour Excel - prediction basée sur inference Python/pandas (int64) ne reflete pas le comportement de R/read_excel (character). Correctif procédural : vérifier les types de cellules Excel natifs (openpyxl data_type) avant de prédire le comportement R.
 
Apprentissage methodologique séance : `na.rm = FALSE` pour conserver les NA visibles vs `replace_na(-Inf)` uniquement dans `fct_reorder()` pour le tri - les deux servent des objectifs distincts et ne sont pas interchangeables.
 
CSPS Yimdi : meilleure performance nouveaux contacts cumul janv-avril 2026 (0.98). CSPS Dayoubsi : NA sur la période - à investiguer.

#10 juin 2026 
Et les points "Flou" à inscrire dans ta section dédiée (ce ne sont pas des fonctions à part entière mais des confusions vécues, à réviser) :

color (trait) vs fill (surface) — confusion réelle aujourd'hui sur le mapping ggplot
Ne jamais factoriser une variable temporelle pour geom_line() — bug du graphique vide
as.numeric() sur un facteur → rend les codes internes, pas les valeurs ; passer par as.character() d'abord


