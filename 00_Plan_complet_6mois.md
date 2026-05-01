# Plan d'apprentissage R sur 6 mois — MCD-Épidémiologiste

**Apprenant** : Dr Emmanuel, Médecin Chef de District, DS-BMG (Burkina Faso)
**Durée nominale** : 24 semaines (6 mois)
**Charge hebdomadaire** : 5-7 heures, réparties en 3-4 sessions de 1h30
**Objectif final** : autonomie professionnelle sur l'ensemble des compétences analytiques d'un MCD-épidémiologiste

---

## Sommaire

1. [Objectifs pédagogiques globaux](#objectifs-pédagogiques-globaux)
2. [Cadrage métier](#cadrage-métier)
3. [Vue d'ensemble des 6 mois](#vue-densemble-des-6-mois)
4. [Mois 1 — Fondations R](#mois-1--fondations-r)
5. [Mois 2 — Tidyverse, qualité des données et visualisation](#mois-2--tidyverse-qualité-des-données-et-visualisation)
6. [Mois 3 — Statistique descriptive et inférentielle](#mois-3--statistique-descriptive-et-inférentielle)
7. [Mois 4 — API ENDOS-BF et automatisation](#mois-4--api-endos-bf-et-automatisation)
8. [Mois 5 — Surveillance épidémiologique et cartographie](#mois-5--surveillance-épidémiologique-et-cartographie)
9. [Mois 6 — Reporting professionnel et projet de synthèse](#mois-6--reporting-professionnel-et-projet-de-synthèse)
10. [Ressources principales](#ressources-principales)
11. [Méthode de travail](#méthode-de-travail)
12. [Indicateurs de progression](#indicateurs-de-progression)
13. [Ce que ce programme ne couvre pas](#ce-que-ce-programme-ne-couvre-pas)

---

## Objectifs pédagogiques globaux

À la fin des 6 mois, l'apprenant sera capable de :

1. **Importer, nettoyer, transformer** n'importe quel fichier de données du SNIS en autonomie.
2. **Produire des analyses statistiques rigoureuses** (descriptives et inférentielles) adaptées à la santé publique.
3. **Interroger directement l'API ENDOS-BF** pour automatiser ses pipelines data.
4. **Produire des cartes thématiques** professionnelles pour ses 49 FS.
5. **Détecter des signaux épidémiologiques** (épidémies, dérives, valeurs aberrantes) automatiquement.
6. **Générer des rapports institutionnels reproductibles** en Word/PDF.
7. **Maintenir un workflow versionné** sur Git/GitHub.
8. **Produire de la recherche opérationnelle** publiable (statistique, visualisation, reproductibilité).

---

## Cadrage métier

Les 9 familles de compétences couvertes :

| # | Famille | Exemples concrets DS-BMG |
|---|---|---|
| 1 | Analyse de couverture sanitaire | CPN1-4, accouchements assistés, Penta3, PF |
| 2 | Surveillance épidémiologique | Paludisme, méningite, rougeole, COVID-19 |
| 3 | Analyse de mortalité | Maternelle, néonatale, hospitalière (cf. étude UMC) |
| 4 | Évaluation qualité des données | Complétude, promptitude, cohérence, valeurs aberrantes |
| 5 | Cartographie sanitaire | Choroplèthes par FS, hotspots, accessibilité |
| 6 | Statistique inférentielle | Tests, IC 95 %, régressions |
| 7 | Démographie sanitaire | Populations cibles, projections, taux standardisés |
| 8 | Reporting institutionnel | Rapports DRS, présentations CCS |
| 9 | Recherche opérationnelle | Études comme la mortalité UMC, publications |

---

## Vue d'ensemble des 6 mois

| Mois | Bloc thématique | Compétence métier débloquée |
|---|---|---|
| **M1** | Fondations R + Git | Autonomie technique de base |
| **M2** | Tidyverse + qualité + visualisation | Analyse de couverture, qualité des données |
| **M3** | Statistique descriptive et inférentielle | Comparaisons rigoureuses, IC, tests |
| **M4** | API ENDOS-BF + automatisation | Pipeline data direct depuis le SNIS |
| **M5** | Surveillance épidémiologique + cartographie | Détection d'épidémies, cartes thématiques |
| **M6** | Reporting Quarto + projet de synthèse | Rapports automatisés, dashboard MCD |

---

## MOIS 1 — Fondations R

**Objectif** : être autonome face à un fichier de données. Comprendre R en profondeur.

### Semaine 1 — S'installer et comprendre la logique R

| Session | Contenu | Durée |
|---|---|---|
| 1.1 | Installation R officiel (CRAN), RStudio, création d'un projet RStudio | 1h |
| 1.2 | Concepts : objet, fonction, opérateur d'assignation `<-`, console vs script | 1h |
| 1.3 | Types de données : `numeric`, `character`, `logical`, `NA` | 1h |
| 1.4 | Vecteurs : création, indexation, opérations vectorielles | 1h |
| 1.5 | Mini-exercice : statistiques descriptives sur un vecteur de couvertures CPN4 fictives | 1h |

**Lectures** : *R for Data Science (2e éd.)*, chap. 1-2

**Livrable** : script `semaine1_bases.R` commenté

**Indicateurs de progression fin de semaine** :
- Tu sais créer un vecteur, l'indexer, faire des opérations dessus.
- Tu comprends la différence entre `=`, `<-`, `==`.
- Tu sais ce qu'est un `NA` et comment il se propage.

### Semaine 2 — Structures de données et installation de Git

| Session | Contenu |
|---|---|
| 2.1 | Listes : différence avec les vecteurs, accès `[[ ]]` vs `[ ]` |
| 2.2 | Data frames : structure, manipulation de colonnes |
| 2.3 | Facteurs : pourquoi ils existent, leurs pièges |
| 2.4 | **Installation Git + création GitHub + premier dépôt** |
| 2.5 | Mini-exercice : créer un data frame de 10 indicateurs prioritaires de ton district |

**Lectures** : *R for Data Science*, chap. 3-4 ; *Happy Git with R*, chap. 1-12

**Livrable** : dépôt GitHub privé `R-apprentissage-DSBMG` avec scripts versionnés

**Indicateurs de progression fin de semaine** :
- Tu sais créer un data frame manuellement.
- Tu as fait ton premier `git commit` et `git push`.
- Tu comprends pourquoi un facteur n'est pas une simple chaîne.

### Semaine 3 — Lire et écrire des fichiers (cœur du métier)

| Session | Contenu |
|---|---|
| 3.1 | Lire un CSV : `read.csv()` (base R) — pièges (encodage UTF-8 vs latin1, séparateur, décimales françaises) |
| 3.2 | Lire un Excel : `readxl::read_excel()`, sélection de feuille, plages |
| 3.3 | Sauvegarder en CSV, Excel (`writexl`), RDS (format R natif) |
| 3.4 | Chemins relatifs avec les projets RStudio |
| 3.5 | **Cas réel** : importer un export ENDOS-BF, l'inspecter, le résumer |

**Lectures** : *R for Data Science*, chap. 7 ; documentation `readxl`

**Livrable** : script qui importe un export ENDOS-BF et produit un résumé statistique de chaque colonne

**Indicateurs de progression fin de semaine** :
- Tu importes correctement un fichier français (séparateur `;`, décimale `,`).
- Tu sais inspecter un dataset avec `str()`, `summary()`, `head()`, `glimpse()`.
- Tu sais sauvegarder dans 3 formats différents.

### Semaine 4 — Conditions, boucles et fonctions

| Session | Contenu |
|---|---|
| 4.1 | `if/else`, conditions vectorisées avec `ifelse()` |
| 4.2 | Boucles `for` (et pourquoi on essaie de les éviter en R) |
| 4.3 | Introduction à la vectorisation et aux fonctions de la famille `apply` |
| 4.4 | **Écrire ses propres fonctions** — la compétence qui transforme un débutant |
| 4.5 | Fonctions avec arguments par défaut, gestion des erreurs basique |

**Lectures** : *R for Data Science*, chap. 26

**Mini-projet de fin de mois 1** :
Écrire une fonction `resumer_indicateur()` qui prend un data frame d'indicateurs ENDOS-BF et retourne :
- moyenne, min, max
- nombre de FS sous le seuil de 50 %
- nombre de valeurs manquantes
La versionner sur GitHub avec un README.

**Indicateurs fin de mois 1** :
- [ ] Importer un Excel, le filtrer, le résumer, l'exporter sans aide
- [ ] Écrire une fonction qui prend des arguments et retourne un résultat
- [ ] Avoir un dépôt GitHub avec au moins 4 commits documentés

---

## MOIS 2 — Tidyverse, qualité des données et visualisation

**Objectif** : analyser et visualiser efficacement des données du district.

### Semaine 5 — `dplyr` : manipulation professionnelle

| Session | Contenu |
|---|---|
| 5.1 | Le pipe `\|>` : philosophie et syntaxe |
| 5.2 | `filter()` et `select()` |
| 5.3 | `mutate()` et `arrange()` |
| 5.4 | `group_by()` et `summarise()` |
| 5.5 | Exercice métier : moyenne CPN4 par CSPS sur 12 mois |

**Lectures** : *R for Data Science*, chap. 4-5

### Semaine 6 — `tidyr` et nettoyage

| Session | Contenu |
|---|---|
| 6.1 | `pivot_longer()` et `pivot_wider()` (format long vs large) |
| 6.2 | `separate()`, `unite()` |
| 6.3 | Gestion des `NA` : `na.rm`, `complete.cases()`, `replace_na()` |
| 6.4 | `stringr` initial : noms de FS incohérents |
| 6.5 | **Cas réel** : nettoyer un fichier de supervision avec problèmes typiques |

### Semaine 7 — `ggplot2` : visualiser

| Session | Contenu |
|---|---|
| 7.1 | Grammaire ggplot2 : `data + aes + geom` |
| 7.2 | Bar charts pour comparer des FS |
| 7.3 | Line charts pour suivre des indicateurs dans le temps |
| 7.4 | Heatmaps (très utiles pour les tableaux FS × mois) |
| 7.5 | Personnalisation : titres, légendes, thèmes, couleurs, export PNG/PDF |

**Lectures** : *R for Data Science*, chap. 1, 9-11 ; *R Graph Gallery*

### Semaine 8 — `lubridate` et qualité des données

| Session | Contenu |
|---|---|
| 8.1 | `lubridate` : parsing de dates françaises, extraction (mois, année), différences |
| 8.2 | `stringr` avancé : regex pour normaliser des noms |
| 8.3 | Concepts qualité des données : complétude, promptitude, cohérence interne |
| 8.4 | Détection des valeurs aberrantes : règle des 3 écarts-types, IQR, méthode de Tukey |
| 8.5 | Construction d'un score de qualité par FS |

**Mini-projet de fin de mois 2** : produire un **rapport visuel** (3 pages PDF) sur la couverture CPN4 dans tes 49 FS sur 12 mois, incluant graphiques, heatmap, et identification des FS en alerte qualité.

**Indicateurs fin de mois 2** :
- [ ] Manipuler un dataset avec `dplyr` sans copier-coller
- [ ] Produire 5 types de graphiques différents
- [ ] Pivoter des données entre format long et large
- [ ] Détecter les valeurs aberrantes d'une série

---

## MOIS 3 — Statistique descriptive et inférentielle

**Objectif** : produire des analyses statistiques rigoureuses adaptées à la santé publique. C'est ce qui distinguera tes rapports.

### Semaine 9 — Statistique descriptive professionnelle

| Session | Contenu |
|---|---|
| 9.1 | Tendance centrale et dispersion : choisir le bon résumé selon la distribution |
| 9.2 | Distribution : histogramme, boxplot, densité, QQ-plot |
| 9.3 | Tableaux 1 publiables avec `gtsummary` |
| 9.4 | Mise en forme avec `flextable` pour Word |
| 9.5 | Cas pratique : tableau 1 d'une cohorte hypothétique de 200 patients |

### Semaine 10 — Tests d'hypothèses

| Session | Contenu |
|---|---|
| 10.1 | Logique d'un test : H0/H1, p-value, erreur de type I et II |
| 10.2 | Comparaison de moyennes : t-test (Student, Welch), Mann-Whitney |
| 10.3 | Comparaison de proportions : chi², Fisher exact |
| 10.4 | ANOVA et alternatives non paramétriques |
| 10.5 | Arbre de décision : quel test pour quelle question |

### Semaine 11 — Intervalles de confiance et taux standardisés

| Session | Contenu |
|---|---|
| 11.1 | Intervalles de confiance : interprétation correcte, calcul pour proportions et moyennes |
| 11.2 | Pourquoi standardiser : effet d'âge, effet de structure |
| 11.3 | Standardisation directe et indirecte |
| 11.4 | Taux pour 1 000 / 100 000 — calculs et présentation |
| 11.5 | Cas pratique : taux de mortalité maternelle standardisé par âge |

### Semaine 12 — Régression linéaire et logistique

| Session | Contenu |
|---|---|
| 12.1 | Régression linéaire simple : équation, interprétation, hypothèses |
| 12.2 | Régression linéaire multiple : variables catégorielles, interactions |
| 12.3 | Régression logistique : odds ratio, interprétation |
| 12.4 | Diagnostics de modèle : résidus, leverage, ajustement |
| 12.5 | `gtsummary::tbl_regression` pour publier des tableaux de résultats |

**Mini-projet de fin de mois 3** : reproduire intégralement en R une analyse que tu as faite en Stata (ou que tu prévois de faire) pour ton étude UMC. Comparer les résultats et documenter les différences éventuelles.

**Indicateurs fin de mois 3** :
- [ ] Choisir et exécuter le bon test selon la question
- [ ] Produire un tableau 1 propre exportable en Word
- [ ] Faire et interpréter une régression linéaire et logistique
- [ ] Calculer un IC 95 % et un taux standardisé

---

## MOIS 4 — API ENDOS-BF et automatisation

**Objectif** : ne plus jamais télécharger manuellement depuis ENDOS-BF.

### Semaine 13 — Introduction aux API REST

| Session | Contenu |
|---|---|
| 13.1 | Concepts : client/serveur, verbes HTTP (GET, POST), codes de statut |
| 13.2 | Le format JSON : structure, parsing avec `jsonlite` |
| 13.3 | `httr2` : premier appel à une API publique (météo, REST Countries) |
| 13.4 | Authentification : basique vs token |
| 13.5 | Sécurité : `.Renviron`, ne jamais commiter ses identifiants |

### Semaine 14 — API DHIS2 / ENDOS-BF (1)

| Session | Contenu |
|---|---|
| 14.1 | Architecture DHIS2 : endpoints clés (`/me`, `/indicators`, `/dataElements`, `/organisationUnits`, `/analytics`) |
| 14.2 | Récupérer la liste des indicateurs avec leurs métadonnées |
| 14.3 | Récupérer la hiérarchie des unités d'organisation |
| 14.4 | Résoudre les UID (identifiants) en noms lisibles |
| 14.5 | Construire ton dictionnaire d'indicateurs ENDOS-BF en Excel |

### Semaine 15 — API DHIS2 / ENDOS-BF (2) : les vraies données

| Session | Contenu |
|---|---|
| 15.1 | L'API Analytics : structure de la requête (dx, pe, ou) |
| 15.2 | Récupérer les valeurs d'un indicateur sur une période, pour une liste de FS |
| 15.3 | Transformer la réponse JSON en data frame exploitable |
| 15.4 | Pagination, gestion des grandes requêtes |
| 15.5 | Cas pratique : couverture CPN4 mensuelle de tes 49 FS sur 24 mois |

### Semaine 16 — Automatisation et robustesse

| Session | Contenu |
|---|---|
| 16.1 | Refactoring : transformer un script en fonctions réutilisables |
| 16.2 | Paramétrage : un script qui prend en entrée la période, la FS, l'indicateur |
| 16.3 | Gestion d'erreurs : `tryCatch`, retry automatique en cas de timeout |
| 16.4 | Logs : tracer l'exécution dans un fichier daté |
| 16.5 | Cache : éviter de re-télécharger ce qui a déjà été demandé |

**Mini-projet de fin de mois 4** : un **pipeline reproductible** qui, à chaque exécution :
1. Se connecte à ENDOS-BF
2. Télécharge les 10 indicateurs prioritaires de ton district sur les 12 derniers mois
3. Produit un fichier Excel formaté avec mise en forme conditionnelle
4. Logue l'exécution

**Indicateurs fin de mois 4** :
- [ ] Faire un appel API authentifié sans regarder de tutoriel
- [ ] Récupérer une donnée ENDOS-BF et la transformer en data frame
- [ ] Construire un pipeline rejouable mensuellement

---

## MOIS 5 — Surveillance épidémiologique et cartographie

**Objectif** : faire de la vraie épidémiologie de terrain en R.

### Semaine 17 — Surveillance épidémiologique

| Session | Contenu |
|---|---|
| 17.1 | Concepts : courbe épidémique, taux d'incidence, taux d'attaque |
| 17.2 | Le package `incidence2` : courbes épidémiques par jour/semaine/mois |
| 17.3 | Seuils d'alerte : moyenne mobile, méthode CDC, méthode des moyennes ± 2 ET |
| 17.4 | Détection automatique de dépassements |
| 17.5 | Cas pratique : surveillance paludisme dans tes 49 FS, alerte automatique |

**Lectures** : *Epidemiologist R Handbook*, chap. surveillance

### Semaine 18 — Analyse de mortalité

| Session | Contenu |
|---|---|
| 18.1 | Indicateurs : létalité, mortalité proportionnelle, taux brut, taux spécifique |
| 18.2 | Pyramide des âges, structure par sexe |
| 18.3 | Le package `epitools` : OR, RR, IC associés |
| 18.4 | Tables de mortalité simples |
| 18.5 | Cas pratique : analyse exploratoire de tes données UMC |

### Semaine 19 — Cartographie (1) : fondations spatiales

| Session | Contenu |
|---|---|
| 19.1 | Concepts : système de coordonnées (CRS), shapefiles, GeoJSON |
| 19.2 | Le package `sf` : importer un shapefile, manipuler des objets spatiaux |
| 19.3 | Trouver/utiliser les shapefiles du Burkina Faso (régions, districts, communes) |
| 19.4 | Jointure : associer un data frame d'indicateurs à un shapefile |
| 19.5 | Première carte choroplèthe avec `ggplot2 + geom_sf` |

**Lectures** : *Geocomputation with R*, chap. 1-3, 8

### Semaine 20 — Cartographie (2) : cartes professionnelles

| Session | Contenu |
|---|---|
| 20.1 | `tmap` : alternative spécialisée pour cartes thématiques |
| 20.2 | Cartes choroplèthes par classes (Jenks, quantiles), palettes de couleur |
| 20.3 | Cartes interactives avec `leaflet` |
| 20.4 | Cartes de hotspots, cartes proportionnelles |
| 20.5 | Export pour rapports DRS et présentations |

**Mini-projet de fin de mois 5** : un **bulletin épidémiologique mensuel** automatisé incluant :
- Courbes épidémiques des 5 maladies surveillées
- Carte de risque par aire sanitaire
- Alertes automatiques sur les seuils dépassés
- Tableau récapitulatif

**Indicateurs fin de mois 5** :
- [ ] Détecter automatiquement un dépassement de seuil épidémique
- [ ] Produire une carte choroplèthe avec légende propre
- [ ] Calculer un OR, un RR avec leur IC 95 %
- [ ] Construire une courbe épidémique paramétrable

---

## MOIS 6 — Reporting professionnel et projet de synthèse

**Objectif** : produire des livrables institutionnels automatisés et boucler la formation.

### Semaine 21 — Quarto : fondations

| Session | Contenu |
|---|---|
| 21.1 | Installer Quarto, premier document `.qmd` |
| 21.2 | Structure : YAML, prose Markdown, blocs de code |
| 21.3 | Options de blocs : `echo`, `eval`, `include`, `fig.width`, etc. |
| 21.4 | Tableaux : `knitr::kable`, `gt`, `flextable` |
| 21.5 | Rendu en HTML, PDF, Word |

### Semaine 22 — Quarto avancé : rapports institutionnels

| Session | Contenu |
|---|---|
| 22.1 | Paramètres : un même document qui produit N rapports (un par FS, par mois) |
| 22.2 | Templates Word personnalisés (logo DS-BMG, polices, en-têtes) |
| 22.3 | Pieds de page, numérotation, table des matières |
| 22.4 | Conditional content : sections qui apparaissent seulement si données pertinentes |
| 22.5 | Cas pratique : modèle de rapport mensuel paramétrable pour la DRS |

### Semaine 23 — Tableaux de bord

| Session | Contenu |
|---|---|
| 23.1 | `quarto dashboard` : philosophie et structure |
| 23.2 | Layouts : rangées, colonnes, value boxes |
| 23.3 | Graphiques interactifs avec `plotly` |
| 23.4 | Tables interactives avec `DT` |
| 23.5 | Mini-dashboard MCD : indicateurs clés du jour, alertes, tendances |

### Semaine 24 — Projet final

**Système intégré qui fait, en une seule commande** :

1. Connexion à l'API ENDOS-BF
2. Téléchargement des indicateurs prioritaires des 49 FS
3. Calcul des écarts, alertes, tendances
4. Production de :
   - Un **rapport mensuel Word** automatisé pour la DRS
   - Une **carte choroplèthe** PNG de la performance par FS
   - Un **mini-dashboard HTML** consultable depuis l'iPhone
5. Versionné sur GitHub, documenté, rejouable mensuellement

**Indicateurs fin de mois 6** :
- [ ] Générer un rapport Quarto paramétré qui se met à jour mensuellement
- [ ] Produire un dashboard HTML fonctionnel
- [ ] Exécuter le projet final en une commande, sans intervention manuelle

---

## Ressources principales

| Ressource | Lien | Usage principal |
|---|---|---|
| *R for Data Science (2e éd.)* | https://r4ds.hadley.nz/ | Référence Mois 1-2 |
| *Hands-On Programming with R* | https://rstudio-education.github.io/hopr/ | Bases solides |
| *The Epidemiologist R Handbook* | https://epirhandbook.com/ | **Référence centrale Mois 5** |
| *Geocomputation with R* | https://r.geocompx.org/ | Cartographie Mois 5 |
| *R for Epidemiology* | https://www.r4epi.com/ | Stat épidémio Mois 3 |
| *Happy Git with R* | https://happygitwithr.com/ | Git Mois 1 |
| Posit Cheatsheets | https://posit.co/resources/cheatsheets/ | Référence rapide permanente |
| DHIS2 Web API Docs | https://docs.dhis2.org/ | API Mois 4 |
| R Graph Gallery | https://r-graph-gallery.com/ | Inspiration ggplot2 |
| Posit Community | https://forum.posit.co/ | Pour bloquer moins longtemps |

---

## Méthode de travail

| Pratique | Pourquoi |
|---|---|
| 3-4 sessions de 1h30/sem plutôt qu'un bloc de 6h | Apprentissage par espacement |
| Coder à la main, pas copier-coller | Mémoire procédurale |
| Carnet d'erreurs systématique | Inestimable au mois 3+ |
| Versionner sur GitHub à chaque session | Apprendre Git en l'utilisant |
| Cahier de questions à clarifier | Éviter la frustration accumulée |
| Pas plus de 2 nouveaux packages/semaine | Profondeur > largeur |
| Refaire les exercices à 24h, 7j, 30j | Consolidation par espacement |

---

## Indicateurs de progression

| Fin du… | Tu sais faire ceci sans aide ni Google |
|---|---|
| Mois 1 | Importer un Excel, le filtrer, le résumer, l'exporter ; écrire une fonction |
| Mois 2 | Produire 5 graphiques différents adaptés à 5 questions analytiques |
| Mois 3 | Faire un tableau 1 publiable + un test statistique justifié + IC 95 % |
| Mois 4 | Récupérer une donnée ENDOS-BF par API et la transformer en livrable |
| Mois 5 | Produire une carte choroplèthe + une courbe épidémique avec seuil d'alerte |
| Mois 6 | Générer un rapport Quarto paramétré qui se met à jour mensuellement |

**Règle absolue** : si à la fin d'un mois les indicateurs ne sont pas validés, **consolider avant d'avancer**. Pas d'accumulation sans maîtrise.

---

## Ce que ce programme ne couvre pas

| Domaine | Pourquoi laissé de côté | Quand l'ajouter |
|---|---|---|
| Modélisation épidémique avancée (SIR, SEIR) | Trop spécialisé, peu d'usage en district | Mois 7-9 si recherche |
| Shiny (apps interactives web) | Très chronophage, ROI faible pour MCD | Mois 7-9 si projet d'app district |
| Modèles mixtes / multiniveaux | Niveau master/doctorat | Si reprise d'études |
| Programmation orientée package | Compétence avancée | Optionnel |
| Machine learning | Hype, peu utile au district | Plus tard, si vraiment besoin |
| Text mining / NLP | Hors champ | Sauf cas spécifique |

---

## Engagement final

Ce programme demande **discipline et régularité**. La régularité prime sur l'intensité : mieux vaut 3 sessions de 1h30 par semaine pendant 6 mois qu'un sprint de 8h le week-end abandonné en semaine 5.

En cas de surcharge institutionnelle, **étaler plutôt qu'abandonner**. Le programme nominal est de 6 mois ; le programme calendaire réaliste est probablement 7-9 mois. C'est normal et acceptable.

**Le succès se mesure à la capacité, à la fin, de produire un système d'analyse autonome pour le district, pas au nombre de chapitres terminés.**
