# Carnet de progression — Apprentissage R sur 6 mois

**Apprenant** : Dr Emmanuel **Démarrage** : \_\_\_\_\_ 19 avril 2026 **Cible de fin** : \_\_\_\_\_ 18 octobre 2026

------------------------------------------------------------------------

## Mode d'emploi de ce carnet

À mettre à jour **à la fin de chaque session** (5-10 minutes maximum). C'est un journal de bord, pas un mémoire — la valeur vient de la régularité, pas de l'exhaustivité.

À chaque entrée : 
- **Date et durée** 
- **Ce qui était prévu**
- **Ce qui a été fait** 
- **Ce qui est acquis** 
- **Ce qui reste flou** 
- **Prochaine étape**

À la fin de chaque **semaine** : un récapitulatif court (auto-évaluation 1-5 sur les compétences attendues).

À la fin de chaque **mois** : un bilan structuré (validation des indicateurs de progression).

------------------------------------------------------------------------

## TABLE DE RAPPEL PAR ESPACEMENT

Cette table tient le compte des concepts à réviser selon le calendrier J+1, J+7, J+30. 
À chaque session, Claude pose une question sur un concept dont la révision est due.
- Bonne réponse → cocher la case et passer à l'échéance suivante. 
- Erreur ou hésitation → laisser la case vide, le concept reste dû.

Pour chaque concept inscrit dans la table, Claude applique 
l'algorithme suivant en début de session, en utilisant 
exclusivement la date réelle du jour (jamais une date 
inscrite dans ce carnet) :

1. Si la date d'introduction est égale à la date du jour
   → "À jour" (aucune révision n'est encore due)
2. Sinon, si J+30 est dépassé → "Dû J+30"
3. Sinon, si J+7 est dépassé → "Dû J+7"

4. Sinon, si J+1 est dépassé → "Dû J+1"

5. Sinon → "À jour"

### Les 5 valeurs possibles — et seulement celles-là

Tu n'utilises que ces 5 valeurs fixes pour remplir la table :

| Valeur | Signification |
|------------------------------------|------------------------------------|
| **À jour** | Aucune révision n'est encore due. Le J+1 (ou J+7, J+30) suivant n'est pas encore arrivé. |
| **Dû J+1** | Le J+1 est arrivé ou dépassé, et la révision n'a pas été faite. |
| **Dû J+7** | Le J+7 est arrivé ou dépassé, et la révision n'a pas été faite. |
| **Dû J+30** | Le J+30 est arrivé ou dépassé, et la révision n'a pas été faite. |
| **Consolidé** | Les trois échéances J+1, J+7, J+30 ont été passées avec succès. Le concept sort du cycle de rappel. |

### TABLE DE RAPPEL

| # | Concept | Source/sessions | Date d'introduction | J+1 | J+7 | J+30 | Statut |
|---------|---------|---------|---------|---------|---------|---------|---------|
| 0 | Concepts fondamentaux R : assignation `<-`, opérateurs `=` vs `==`, fonctions et arguments | session 1.1, 1.2 | 19/04/2026 | 20/04/2026 | 26/04/2026 | 19/05/2026 | À jour |
| 1 | Principaux types données, coercition, NA | session 1.3 | 22/04/2026 | 23/04/2026 | 29/04/2026 | 22/05/2026 | À jour |
| 2 | Vecteurs, indexation | session 1.4 | 23/04/2026 | 24/04/2026 | 30/04/2026 | 23/05/2026 | À jour |
| 3 | Les fonctions du groupe which() | session 1.5 | 23/04/2026 | 24/04/2026 | 30/04/2026 | 23/05/2026 | À jour |
| 4 | Liste, indexation d'une liste | session 2.1 | 23/04/2026 | 24/04/2026 | 30/04/2026 | 23/05/2026 | À jour |
| 5 | Structures data frames et manipulations, facteurs | 2.2, 2.3 | 24/04/2026 | 25/04/2026 | 01/05/2026 | 24/05/2026 | À jour |
| 6 | GitHub, commits et push, versioning | 2.4 | 24/04/2026 | 25/04/2026 | 01/05/2026 | 24/05/2026 | À jour |
| 7 | Indexation, filtrage, `is.na()`, coercition logique sur un data frame réel | 2.5 | 26/04/2026 | 27/04/2026 | 03/05/2026 | 26/05/2026 | À jour |
| 8a | Lecture de fichiers : `read.csv2()`, `read_excel`, piège francophone | session 3.1, 3.2, 3.5 | 26/04/2026 | 27/04/2026 | 03/05/2026 | 26/05/2026 | À jour |
| 8b | Sauvegarde fichier : `write.csv2()`, `write_xlsx`, `saveRDS` | 3.3 | 26/04/2026 | 27/04/2026 | 03/05/2026 | 26/05/2026 | À jour |
| 8c | Organisation de projet | 3.4 | 26/04/2026 | 27/04/2026 | 03/05/2026 | 26/05/2026 | À jour |
| 9 | `if/else`, conditions vectorisées avec `ifelse()` | 4.1 | 27/04/2026 | 28/04/2026 | 04/05/2026 | 27/05/2026 | À jour |
| 10 | Boucle for | 4.2 | 28/04/2026 | 29/04/2026 | 05/05/2026 | 28/05/2026 | À jour |
| 11 | Fonctions de la famille `apply` | 4.3 | 29/04/2026 | 30/04/2026 | 06/05/2026 | 29/05/2026 | À jour |
| 12 | Fonctions personnalisées : structure, return(), vectorisation | 4.4 | 03/05/2026 | 04/05/2026 | 10/05/2026 | 02/06/2026 | À jour |
| 13 | Arguments par défaut, stop(), any(), early return | 4.5 | 03/05/2026 | 04/05/2026 | 10/05/2026 | 02/06/2026 | À jour |
| 14 | `df[[colonne]]` vs `df$colonne` — accès dynamique à une colonne | mini-projet mois 1 | 03/05/2026 | 04/05/2026 | 10/05/2026 | 02/06/2026 | À jour |
| 15 | `filter()`, `select()`, `arrange()`, `mutate()`, pipe `\|>` | 5.1, 5.3 | 04/05/2026 | 05/05/2026 | 11/05/2026 | 03/06/2026 | À jour|
| 16 | `grepl()` — détection de pattern dans un vecteur character, `table()`, `unique()` | 5.1, 5.3 | 04/05/2026 | 05/05/2026 | 11/05/2026 | 03/06/2026 |À jour  |
| 17 | `group_by()` + `summarise()` — regroupement et statistiques par groupe | 5.4 | 05/05/2026 | 06/05/2026 | 12/05/2026 | 04/06/2026 | À jour |
| 18 | `sum()` sur vecteur logique — compter les lignes vérifiant une condition | 5.5 | 05/05/2026 | 06/05/2026 | 12/05/2026 | 04/06/2026 | À jour|
| 19 | `pivot_longer()` / `pivot_wider()` — format large vs long | 6.1 | 06/05/2026 | 07/05/2026 | 13/05/2026 | 05/06/2026 |À jour  |
| 20 | Import structuré multi-niveaux : `col_names = FALSE`, `unlist()`, forward fill, `colnames()` | 6.1 rappels | 06/05/2026 | 07/05/2026 | 13/05/2026 | 05/06/2026 | À jour |
| 21 | `str_to_upper/lower()`, `str_squish()`, `str_replace()` — normalisation de chaînes de caractères | 6.4 | 07/05/2026 | 08/05/2026 | 14/05/2026 |04/06/2026 | À jour |
| 22 | `separate()` et `unite()` — découpage et fusion de colonnes | 6.2 |07/05/2026 | 08/05/2026 | 14/05/2026 | 04/06/2026 | À jour |
| 23 | `complete.cases()`, `replace_na()` — gestion des NA dans un pipeline | 6.3 |07/05/2026 | 08/05/2026 | 14/05/2026 | 04/06/2026 | À jour |
| 24 | `identical()`— vérifier l'égalité exacte de deux objets R | 6.5 |07/05/2026 | 08/05/2026 | 14/05/2026 | 04/06/2026 | À jour |
| 25 | `ggplot()`, `aes()`, `geom_*()` — logique des trois couches obligatoires | 7.1 | 08/05/2026 | 09/05/2026 | 15/05/2026 |07/06/2026 | À jour |
| 26 |geom_col() vs geom_bar() : bar chart à partir de données pré-agrégées | 7.2 | 08/05/2026 |09/05/2026 |15/05/2026 |07/06/2026 |À jour|
| 27 | geom_text() + hjust + ylim() : étiquettes de valeurs et ajustement d'échelle | 7.2 | 08/05/2026 |09/05/2026 |15/05/2026 |07/06/2026| À jour|

---
## SUIVI HEBDOMADAIRE
---

### Semaine 1 — Installation et logique R

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_

#### Session 1.1 — Installation

-   **Date** :19 avril 2026 (2 heures)
-   **Durée** : 02 heures
-   **Prévu** : Installation R officiel CRAN, RStudio, premier projet
-   **Fait** : installation, création de script, création de projet, calcul arithmetiques, assignation d'objet
-   **Acquis** : Tous les éléments prévus ont été acquis
-   **Flou** : Quand est ce que la console est silencieuse? Confusion calcul et assignation d'objet
-   **Prochaine étape** : session 1.2: concepts objet/fonction/\<-/ console vs script

#### Session 1.2 — Concepts fondamentaux

-   **Date** : 21 avril 2026
-   **Durée** : 1h30
-   **Prévu** : objet, fonction, `<-`, console vs script
-   **Fait** : objets, arguments nommés, arguments positionnels, syntax d'appel console et script
-   **Acquis** : différence entre objet, noms et valeurs, fonctions comment rediger les commentaires, règle de redaction des commentaires, distinction paranetre et argument
-   **Flou** : néant
-   **Prochaine étape** : session suivante

#### Session 1.3 — Types de données

-   **Date** : 22 avril 2026

-   **Durée** : 3 heures avec pauses

-   **Prévu** : numeric, character, logical, NA

-   **Fait** :Bloc 1: Les quatre types fondamentaux : numeric, character, logical, NA Bloc 2: La coercition automatique et la hiérarchie L-N-C Bloc 3: Le comportement de NA : propagation, incomparabilité, détection, exclusion Bloc 4: Mini-cas couverture CPN4 : application concrète de tout ce qui précède

-   **Acquis** : la maitrise des types de données, l'ordre de coercition entre les types de données, character gagne sur tout, logical perd sur tout, la coercition silencieuse, calculs avec NA, distinction entre = et ==

-   **Flou** : néant

-   **Prochaine étape** : session 1.4 — vecteurs (création, indexation, opérations vectorielles)

#### Session 1.4 — Vecteurs

-   **Date** : 23 avril 2026

-   **Durée** : 1h30

-   **Prévu** : création, indexation, opérations vectorielles

-   **Fait** : indexation par position, indexation logique, opération vectorielle

-   **Acquis** : vecteur[i], vecteur[i,j], vecteur[i:j], vecteur [-i] selection par condition

-   **Flou** : néant

-   **Prochaine étape** :session 1.5 — mini-exercice statistiques descriptives sur un vecteur CPN4

#### Session 1.5 — Mini-exercice CPN4 fictif

-   **Date** : 23 avril 2026
-   **Durée** : 01h30
-   **Prévu** : statistiques descriptives sur un vecteur
-   **Fait** : calcul de moyenne, utilisation de which, max, min, sd et étendue
-   **Acquis** : maitrise de which.max(), which.min() et which() application de ce que j'ai appris jusque là pour faire quelques statistiques descriptives.
-   **Flou** : l'interpretation metier qui ne va ps jusqu'a la conclusion opérationnelle sans s'arrêter juste à la description des chiffres
-   **Prochaine étape** : entamer la semaine 2

#### Récapitulatif semaine 1

| Compétence attendue                        | Auto-éval (1-5) | Commentaire |
|--------------------------------------------|-----------------|-------------|
| Créer un vecteur, l'indexer, opérer dessus | 4               |             |
| Comprendre `=`, `<-`, `==`                 | 4.5             |             |
| Comprendre la propagation des `NA`         | 4.5             |             |

**Décision** : passer à la semaine 2 / consolider / autre : **Points à réviser dans la semaine qui vient** :

------------------------------------------------------------------------

### Semaine 2 — Structures de données + Git

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 2.1 — Listes

-   **Date** : 23 avril 2026
-   **Durée** : \~1h30
-   **Prévu** : listes, différence entre vecteur et liste, opérateurs `[ ]` vs `[[ ]]` vs `$`
-   **Fait** : création avec `list()`, accès par les trois opérateurs, pièges syntaxe (guillemets dans `[[ ]]`), cas CSPS Boassa et Bazoulé
-   **Acquis** : distinction `[ ]` (retourne liste) vs `[[ ]]` et `$` (retournent contenu brut) ; `length()` d'une liste = nombre d'éléments de premier niveau
-   **Flou** : lecture rapide de l'affichage console d'une liste (hiérarchie `$nom` puis `[position]`)
-   **Prochaine étape** : session 2.2 — Data frames (structure, colonnes comme vecteurs)

#### Session 2.2 — Data frames

-   **Date** : 24 avril 2026
-   **Durée** :1h30
-   **Prévu** :data frame
-   **Fait** :structures data frame
-   **Acquis** :structure du data frame, syntaxe [ligne, colonne], ajout de colonne, filtrage conditionnel
-   **Flou** : le filtre et la selection des données dans une table surtout avec le vide avant et après dans les crochets
-   **Prochaine étape** : session 2.3 -facteurs 
#### Session 2.3 — Facteurs
-   **Date** : 24/04/2026
-   **Durée** :30 minutes
-   **Prévu** :Facteurs
-   **Fait** : transformer vecteur character en facteur, levels, classement des categories avec le parametre levels, summary
-   **Acquis** : Un facteur est un vecteur character avec une liste fixe de catégories appelées niveaux (levels) factor() convertit un character en facteur summary() affiche les fréquences sur un facteur — pas sur un character Un facteur refuse toute valeur hors de ses niveaux — remplace par NA avec avertissement Tu contrôles l'ordre des niveaux avec l'argument levels
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
-   **Fait** : créer un dictionnaire d'indicateurs structuré à partir de ta réflexion métier, identifier et corriger des problèmes de cohérence (espaces parasites, casse, nommage), et mobiliser les acquis des sessions précédentes (indexation, filtrage, is.na(), coercition logique)
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

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 3.1 — Lire un CSV

-   **Date** : 26/04/2026
-   **Durée** : 01h
-   **Prévu** : la fonction read.csv() et read.csv2()
-   **Fait** : lire csv et connaitre les argument utilisés
-   **Acquis** : read.csv et read.csv2 avec les arguments na.string, head et encode
-   **Flou** :
-   **Prochaine étape** : session 3.2 - lecture excel \
#### Session 3.2 — Lire un Excel 
-   **Date** : 26/04/2026
-   **Durée** : 01h
-   **Prévu** : lire un fichier excel
-   **Fait** : read_excel() avec le paramètre sheet
-   **Acquis** : lire excel
-   **Flou** :
- **Prochaine étape** : sauvegarder
#### Session 3.3 — Sauvegarder
-   **Date** : 26/04/2026
-   **Durée** : 3o minutes
-   **Prévu** : sauvegarde
-   **Fait** : write.csv2() pour partager, write_xlsx() pour l'institutionnel
-   **Acquis** : sauvegarde dans les trois formats principaux
-   **Flou** : Non
- **Prochaine étape** : Chemins relatifs / projets RStudio 
#### Session 3.4 — Chemins relatifs / projets RStudio 
-   **Date** : 26/04/2026
-   **Durée** : 30 minutes
-   **Prévu** : Chemins relatifs / projets RStudio 
-   **Fait** : Chemins relatifs avec les projets RStudio, getwd()
-   **Acquis** : Chemins relatifs avec les projets RStudio, getwd()
-   **Flou** : non
- **Prochaine étape** : cas réel ENDOS-BF
#### Session 3.5 — Cas réel ENDOS-BF 
-   **Date** : 26/04/2026
-   **Durée** : 01h30
-   **Prévu** :  Importation et inspection d'un vrai fichier ENDOS-BF
-   **Fait** : lignes agrégées à identifier, NA structurels, décalage d'index avec which.max()
-   **Acquis** : Importation et inspection d'un vrai fichier ENDOS-BF
-   **Flou** : non
- **Prochaine étape** : semaine 4, les fonctions
#### Récapitulatif semaine 3 
Session 3.1 — read.csv() vs read.csv2(), le piège francophone, les erreurs silencieuses d'importation. 
Session 3.2 — read_excel() avec le paramètre sheet, excel_sheets() pour lister les feuilles. 
Session 3.3 — Trois formats de sauvegarde : write.csv2() pour partager, write_xlsx() pour l'institutionnel, saveRDS() pour toi. 
Le CSV perd les types, le RDS conserve tout. 
Session 3.4 — Chemins relatifs avec les projets RStudio, getwd(). 
Session 3.5 — Importation et inspection d'un vrai fichier ENDOS-BF : lignes agrégées à identifier, NA structurels, décalage d'index avec which.max().

| Compétence attendue                           | Auto-éval (1-5) |
|-----------------------------------------------|-----------------|
| Importer un fichier français (`;`, `,`)       | 3               |
| Inspecter avec `str()`, `summary()`, `head()` | 4               |
| Sauvegarder dans 3 formats                    | 4               |

------------------------------------------------------------------------

### Semaine 4 — Conditions, boucles, fonctions

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 4.1 — `if/else`

complétée 
- **Date et durée**: 27 avril, 01h 
- **Ce qui était prévu** conditions if/else 
- **Ce qui a été fait** if/else ifelse 
- **Ce qui est acquis** - conditions vectorisées avec `ifelse() 
**Ce qui reste flou** - lfelse imbriqué. flou clos.
**Prochaine étape** Boucles`for`
#### Session 4.2 — Boucles`for`
- **Date et durée**: 28 avril 2026, 02h 
- **Ce qui était prévu** boucle for 
- **Ce qui a été fait** structure de la boucle for construction de la boucle for, application sur un vecteur de longueur 5, la fonction paste(), la fonction print(), la fonction character pour la creation d'un vecteur vide pour stocker les résultats de la boucle for 
- **Ce qui est acquis** structure de la boucle for construction de la boucle for, application sur un vecteur de longueur 5, la fonction paste(), la fonction print(), la fonction character() pour la creation d'un vecteur vide pour stocker les résultats de la boucle for, la fonction length() 
- **Ce qui reste flou**: non
#### Session 4.3 — Vectorisation et`apply 
- **Date et durée**: 29 avril 2026, 02h 
- **Ce qui était prévu** Vectorisation et\`apply 
- **Ce qui a été fait** lapply, sapply, tapply 
- **Ce qui est acquis** vectorisation et les fonction du groupe apply 
- **Ce qui reste flou**: non
- **Prochaine étape** Fonctions personnalisées 
#### Session 4.4 — Fonctions personnalisées 
- **Date et durée**: 03 mai 2026, 01h30 
- **Ce qui était prévu** Fonctions personnalisées 
- **Ce qui a été fait** Structure d'une fonction, Écriture d'une fonction métier réelle, Test sur scalaires et cas limites, Application vectorisée sur un data frame de FS
- **Ce qui est acquis** Structure d'une fonction, Écriture d'une fonction métier réelle, Test sur scalaires, Application vectorisée sur un data frame de FS
- **Ce qui reste flou** gestion des cas limites
- **Prochaine étape** Fonctions avec arguments par défaut
#### Session 4.5 — Fonctions avec arguments par défaut
- **Date et durée** : 3 mai 2026, 01h
- **Ce qui était prévu**: Fonctions avec arguments par défaut
- **Ce qui a été fait**:
  - Arguments par défaut : syntaxe et comportement
  - Early return : éliminer les cas invalides avant le corps principal
  - any() pour évaluer une condition sur un vecteur
  - stop() pour interrompre avec un message explicite
  - Gestion du mode débogage Browse[1]>
- **Ce qui est acquis**:
  - Calcul d'un taux avec unité paramétrable via argument par défaut
  - Rejet les données invalides avec un message explicite
  - Fonction sur des vecteurs entiers, pas seulement des scalaires
- **Ce qui reste flou**: la limite de stop() sur vecteur avec NA n'a pas été explorée 
- **Prochaine étape**: semaine 5

#### Récapitulatif semaine 4

| Compétence attendue                                   | Auto-éval (1-5) |
|-------------------------------------------------------|-----------------|
| Écrire une fonction simple                            |        4        |
| Comprendre quand utiliser une boucle vs vectorisation |      3.5        |

------------------------------------------------------------------------

### BILAN MOIS 1

**Période réelle** : du \_19\_04\_20\26_\_ au \_03\_05\_20\26_\_ **Heures totales investies** : \_\_\_ h **Heures prévues** : 20-28 h

#### Validation des indicateurs de progression du mois 1

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|------------------------|------------------------|------------------------|
| Importer un Excel, filtrer, résumer, exporter sans aide |  oui|  |
| Écrire une fonction qui prend des arguments et retourne un résultat | oui |  |
| Avoir un dépôt GitHub avec au moins 4 commits documentés | oui |  |

#### Mini-projet de fin de mois (`resumer_indicateur()`)

-   **Statut** :complété et testé sur données réelles DS-BMG.
-   **Lien GitHub** : https://github.com/bereniceharo/R-apprentissage-DSBMG.git
-   **Difficultés rencontrées** : la selection de la colonne du df, df$colonne vs
                                  df[[colonne]]
-   **Améliorations possibles** : Pas d'ameliorations suggérée; adaptée pour mon niveau

#### Réflexion personnelle

-   **Ce qui a marché dans ma méthode** : La methode learning by doing sur data réel
-   **Ce qui n'a pas marché** : le respect des échéances des revisions par espacement,
                                introduction de nouveaux concepts sans souvent les explicité clairement
-   **Ajustements pour le mois 2** : Toujours bien expliquer les nouveaux concepts 

#### Décision

-   [X] Passer au mois 2
-   [ ] Consolider avant de continuer (préciser quoi : \_\_\_)
-   [ ] Étaler le rythme (préciser : \_\_\_)

------------------------------------------------------------------------

## SUIVI HEBDOMADAIRE — MOIS 2

### Semaine 5 — `dplyr` : manipulation professionnelle

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 5.1 — Le pipe `|>` : philosophie et syntaxe
- **Date et durée** : 04 mai 2026, ~2h (sessions 5.1 à 5.3 
    couvertes en une seule session réelle)
- **Ce qui était prévu** : Le pipe `|>` : philosophie et syntaxe
- **Ce qui a été fait** : Introduction du pipe |> — logique gauche-droite, analogie protocole de soins ; 
    démonstration sur données réelles DS-BMG
- **Ce qui est acquis** : Le pipe |> passe le résultat de gauche comme premier argument à la fonction de droite ;
    lecture séquentielle d'une chaîne de transformations
- **Ce qui reste flou** :
- **Prochaine étape** : Session 5.2

#### Session 5.2 — `filter()` et `select()`
- **Date et durée** : 04 mai 2026 (suite de la même session)
- **Ce qui était prévu** : `filter()` et `select()`
- **Ce qui a été fait** : grepl() pour détecter des patterns textuels ; 
    filter() avec !grepl() pour isoler les vraies FS (exclusion DS, 
    CM/CMA/CMU, Dispensaire, Infirmeries) ; 
    select() pour réduire aux colonnes utiles ; 
    piège des noms avec espaces → backticks ; 
    unique() pour explorer les valeurs distinctes avant de filtrer
- **Ce qui est acquis** :filter() garde les lignes où la condition est TRUE ;
    select() garde les colonnes nommées ; 
    aucun verbe dplyr ne modifie le data frame original ;
    grepl("CM") attrape aussi CMA et CMU ; ! inverse la sélection
- **Ce qui reste flou** :
- **Prochaine étape** : Session 5.3

#### Session 5.3 — `mutate()` et `arrange()`
- **Date et durée** : 4 mai 2026 (suite de la même session)
- **Ce qui était prévu** : `mutate()` et `arrange()`
- **Ce qui a été fait** : arrange() avec tri croissant par défaut et 
    desc() pour décroissant ;
    mutate() + ifelse() pour créer colonne alerte (< 50% → "Alerte") ; 
    détection d'une valeur manquante sur CSPS Sandogo 2 via filter(is.na(alerte))
- **Ce qui est acquis** : arrange() trie le data frame complet selon une colonne ;
    desc() pour ordre décroissant ; 
    mutate() ajoute une colonne sans modifier l'original ; 
    ifelse() sur NA retourne NA → 20 Alerte + 19 OK + 1 NA = 40 lignes
- **Ce qui reste flou** :
- **Prochaine étape** :Session 5.4 — group_by() et summarise()

#### Session 5.4 — `group_by()` et `summarise()`
- **Date et durée** : 05 mai 2026, ~1h30
- **Ce qui était prévu** : `group_by()` et `summarise()`
- **Ce qui a été fait** : 
  Mécanique de group_by() — étiquettes invisibles sans réduction de lignes ; 
  summarise() pour calculer une statistique par groupe ; 
  création d'une colonne type_fs avec mutate() + ifelse() imbriqués ; 
  piège de l'ordre des conditions grepl() (spécifique avant général) ; 
  calcul de moyenne CPN4 par type de FS sur données réelles DS-BMG ; 
  summarise() multi-statistiques (mean, min, max) en une seule chaîne
- **Ce qui est acquis** : 
  group_by() seul ne modifie pas le nombre de lignes ; 
  summarise() réduit à une ligne par groupe ; 
  na.rm = TRUE obligatoire — un seul NA contamine tout le groupe ; 
  NaN = na.rm a exclu toutes les valeurs (groupe entièrement vide) ; 
  ordre des ifelse() imbriqués : du plus spécifique au plus général
- **Ce qui reste flou** : distinction NaN vs NA à approfondir sur cas réels
- **Prochaine étape** : Session 5.5 — exercice métier moyenne CPN4 par CSPS sur 12 mois

#### Session 5.5 — Exercice métier : moyenne CPN4 par CSPS
- **Date et durée** : 05 mai 2026, ~1h
- **Ce qui était prévu** : Exercice métier : moyenne CPN4 par CSPS sur 12 mois
- **Ce qui a été fait** :
  Adaptation de l'exercice — fichier FS_2025 en agrégat annuel, pas mensuel ;
  calcul de la distribution CPN4 des CSPS (moyenne, min, max, nombre sous 50%) ;
  identification et tri des 20 CSPS sous le seuil de 50% ;
  interprétation de la valeur aberrante 219% (sous-estimation cible, erreur saisie, 
  débordement d'aire) ;
  lecture opérationnelle du résultat — CSPS Gueswende le plus critique à 12.8%
- **Ce qui est acquis** :
  Chaîne complète filter() + summarise() + select() + arrange() sur données réelles ;
  sum() sur vecteur logique pour compter les lignes vérifiant une condition ;
  lecture critique d'un résultat — valeur > 100% n'est pas automatiquement une erreur ;
  20 CSPS sur 40 sous 50% de couverture CPN4 dans le DS-BMG en 2025
- **Ce qui reste flou** : néant
- **Prochaine étape** : Semaine 6 — tidyr et nettoyage des données

#### Récapitulatif semaine 5

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Utiliser le pipe `\|>` correctement | 4 | |
| Filtrer un data frame avec `filter()` | 4 | |
| Sélectionner des colonnes avec `select()` | 4 | |
| Trier avec `arrange()` et `desc()` | 4 | |
| Créer une colonne avec `mutate()` | 4 | |
| Grouper et résumer avec `group_by()` + `summarise()` | 4 | |

**Décision** : passer à la semaine 6
**Points à réviser** : ordre des conditions ifelse() imbriqués

---

### Semaine 6 — `tidyr` et nettoyage

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 6.1 — `pivot_longer()` et `pivot_wider()`
- **Date et durée** : 06/05/2026, ~1h30
- **Ce qui était prévu** : `pivot_longer()` et `pivot_wider()` (format long vs large)
- **Ce qui a été fait** : 
  Distinction format large vs format long — critère : les noms 
  d'indicateurs sont-ils des en-têtes de colonnes ou des valeurs ;
  pivot_longer() — cols, names_to, values_to, values_drop_na ;
  pivot_wider() — names_from, values_from ;
  application sur données réelles DS-BMG : 40 CSPS × 33 indicateurs 
  → 1320 lignes ; clarification sur l'usage métier format long 
  (facet_wrap, heatmap, automatisation)
- **Ce qui est acquis** : 
  pivot_longer() transforme les noms de colonnes en valeurs ;
  pivot_wider() fait l'inverse ;
  cols = -colonne_id pour exclure l'identifiant du pivot ;
  values_drop_na = TRUE pour alléger le data frame
- **Ce qui reste flou** : néant
- **Prochaine étape** : Session 6.2 — separate() et unite()

#### Session 6.2 — `separate()` et `unite()`
- **Date et durée** : 07/05/2026, ~30min
- **Ce qui était prévu** : `separate()`, `unite()`
- **Ce qui a été fait** :
  separate() — découper une colonne composite en plusieurs colonnes ;
  unite() — fusionner plusieurs colonnes en une seule ;
  application sur format période "2025-T1" → colonnes annee + trimestre
- **Ce qui est acquis** :
  separate() : col, into, sep — colonne d'origine supprimée par défaut (remove = TRUE) ;
  si le séparateur est absent, R produit un Warning (pas une erreur) et retourne NA ;
  unite() : col, colonnes sources, sep — symétrique à separate() ;
  ordre des arguments : donner le séparateur visible dans les données, pas celui souhaité
- **Ce qui reste flou** : néant
- **Prochaine étape** : Session 6.3

#### Session 6.3 — Gestion des `NA`
- **Date et durée** : 07/05/2026, ~20min
- **Ce qui était prévu** : Gestion des `NA` : `na.rm`, `complete.cases()`, `replace_na()`
- **Ce qui a été fait** :
  na.rm = TRUE dans les fonctions statistiques ;
  complete.cases() pour identifier les lignes sans aucun NA ;
  replace_na() pour substituer les NA par une valeur, y compris une valeur calculée
- **Ce qui est acquis** :
  complete.cases() retourne un vecteur logique — TRUE si ligne complète, FALSE sinon ;
  mean() sans na.rm retourne NA dès qu'un seul NA est présent ;
  replace_na(col, mean(col, na.rm = TRUE)) — imputation par la moyenne en une ligne
- **Ce qui reste flou** : néant
- **Prochaine étape** : Session 6.4

#### Session 6.4 — `stringr` initial : noms de FS incohérents
- **Date et durée** : 07/05/2026, ~1h
- **Ce qui était prévu** : `stringr` initial : noms de FS incohérents
- **Ce qui a été fait** :
  str_to_upper() / str_to_lower() pour normaliser la casse ;
  str_squish() pour supprimer les espaces parasites internes et externes ;
  str_replace() pour remplacer des abréviations par des formes complètes ;
  application sur données réelles TLOH 2026 DS-BMG (noms de maladies
  incohérents entre feuilles 2025 et 2026)
- **Ce qui est acquis** :
  str_to_upper() conserve les accents (È, É, Ü) ;
  str_squish() et str_to_upper() sont indépendantes — ordre indifférent ;
  str_replace() cherche le pattern partout dans la chaîne — risque de
  correspondance partielle sur les abréviations courtes (\\b pour y remédier)
- **Ce qui reste flou** : néant
- **Prochaine étape** : Session 6.5 — cas réel nettoyage fichier supervision

#### Session 6.5 — Cas réel : nettoyer un fichier de supervision
- **Date et durée** : 07/05/2026, ~1h
- **Ce qui était prévu** : Cas réel : nettoyer un fichier de supervision 
  avec problèmes typiques
- **Ce qui a été fait** :
  Normalisation des noms de maladies entre feuilles TLOH 2025 et 2026 ;
  pipeline complet str_to_upper() + str_squish() + str_replace() × 6 ;
  vérification finale avec identical()
- **Ce qui est acquis** :
  str_replace() cherche le pattern tel quel — si le vecteur est déjà 
  en majuscules, le pattern doit l'être aussi ;
  bug silencieux : aucun warning si le pattern ne matche pas ;
  identical() pour vérifier deux vecteurs attendus égaux
- **Ce qui reste flou** : néant
- **Prochaine étape** : Semaine 7 — ggplot2

#### Récapitulatif semaine 6

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Pivoter entre format long et large |4 | |
| Séparer et unir des colonnes | 4| |
| Gérer les `NA` avec `replace_na()` et `complete.cases()` |4 | |
| Normaliser des noms avec `stringr` |3 | |

**Décision** : passer à la semaine 7
**Points à réviser** : pattern case-sensitive dans str_replace()

---

### Semaine 7 — `ggplot2` : visualiser

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 7.1 — Grammaire ggplot2 : `data + aes + geom`
- **Date et durée** : 08/05/2026, ~1h30
- **Ce qui était prévu** : Grammaire ggplot2 : `data + aes + geom`
- **Ce qui a été fait** :
  Logique des trois couches obligatoires : ggplot(), aes(), geom_*() ;
  geom_point() sur données réelles DS-BMG (couverture CPN4 des CSPS) ;
  coord_flip() pour lisibilité avec 40 CSPS ;
  reorder() dans aes() pour trier par valeur ;
  labs() pour titres et étiquettes professionnelles ;
  geom_vline() pour ligne de seuil OMS à 80% ;
  scale_color_manual() — introduced, not yet practiced
- **Ce qui est acquis** :
  aes() contrôle toute propriété visuelle dépendant des données ;
  propriété fixe → hors aes() ; propriété variable → dans aes() ;
  coord_flip() retourne le graphique — vline/hline se définissent
  par rapport aux données, pas au visuel ;
  reorder() remplace la variable dans aes(x=), ne s'y ajoute pas ;
  backticks obligatoires sur tout nom de colonne à caractères spéciaux
- **Ce qui reste flou** : néant
- **Prochaine étape** : Session 7.2 — Bar charts

#### Session 7.2 — Bar charts pour comparer des FS

**Date** : 08/05/2026  **Durée** : __ min  **Horaire** : 20h45 — __h__

**Prévu** : produire un bar chart professionnel comparant les FS sur la couverture CPN4.

**Fait** :
- Distinction `geom_bar()` (compte les occurrences) vs `geom_col()` (utilise une valeur déjà calculée). Application au cas des indicateurs agrégés en santé publique.
- Bar chart complet (40 CSPS) avec tri par `reorder()`, `coord_flip()`, ligne de seuil à 80% (`geom_hline()`).
- Bar chart filtré FS en alerte (< 50% sur CPN4) : 20 CSPS sur 40, soit la moitié du district.
- Approfondissement de `geom_text()` (label calculé avec `round()`, `hjust = -0.2` pour décalage à droite) et `ylim()` (couche d'échelle avec piège de suppression silencieuse).
- Erreur d'inattention rattrapée : `rename()` qui pointait initialement sur la colonne accouchement et non CPN4 → leçon : vérifier la valeur source avant tout rename sur des noms longs.

**Acquis** :
- Logique en couches de ggplot2 : géométriques (`geom_*`), d'échelle (`ylim`), d'habillage (`labs`), de transformation (`coord_flip`). La relation `data → aes() → geom_*()` est la base.
- Le choix du graphique dépend du destinataire et de la décision : 40 barres pour une présentation aux ICP, top 10 pour la planification des supervisions, FS en alerte pour un rapport DRS.
- `hjust` est un alignement (proportion du texte à gauche du point d'ancrage), pas un déplacement du point lui-même.

**Flou** :
- Mécanique exacte de `hjust` avec `coord_flip()` — j'ai retenu la règle pratique mais la justification théorique reste partiellement abstraite.
- Quand préférer `coord_cartesian(ylim = ...)` à `ylim(...)` en dehors du cas "étiquettes coupées" ?

**Prochaine étape** : session 7.3 — line chart pour le suivi temporel d'un indicateur.

**Indicateur métier observé** : 20 CSPS sur 40 du DS-BMG sont sous 50% de couverture CPN4 en 2025 — problème district, pas problème de quelques FS isolées.

#### Session 7.3 — Line charts
- **Date et durée** :
- **Ce qui était prévu** : Line charts pour suivre des indicateurs dans le temps
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 7.4 — Heatmaps
- **Date et durée** :
- **Ce qui était prévu** : Heatmaps (tableaux FS × mois)
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 7.5 — Personnalisation et export
- **Date et durée** :
- **Ce qui était prévu** : Personnalisation : titres, légendes, thèmes, couleurs, export PNG/PDF
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 7

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Comprendre la grammaire `data + aes + geom` | | |
| Produire un bar chart comparatif de FS | | |
| Produire un line chart temporel | | |
| Produire une heatmap FS × mois | | |
| Exporter un graphique en PNG/PDF | | |

**Décision** : **Points à réviser** :

---

### Semaine 8 — `lubridate` et qualité des données

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 8.1 — `lubridate` : dates françaises
- **Date et durée** :
- **Ce qui était prévu** : `lubridate` : parsing de dates françaises, extraction (mois, année), différences
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 8.2 — `stringr` avancé : regex
- **Date et durée** :
- **Ce qui était prévu** : `stringr` avancé : regex pour normaliser des noms
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 8.3 — Concepts qualité des données
- **Date et durée** :
- **Ce qui était prévu** : Concepts qualité des données : complétude, promptitude, cohérence interne
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 8.4 — Détection des valeurs aberrantes
- **Date et durée** :
- **Ce qui était prévu** : Détection des valeurs aberrantes : règle des 3 écarts-types, IQR, méthode de Tukey
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 8.5 — Score de qualité par FS
- **Date et durée** :
- **Ce qui était prévu** : Construction d'un score de qualité par FS
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 8

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Parser et manipuler des dates avec `lubridate` | | |
| Utiliser des regex simples avec `stringr` | | |
| Calculer un indicateur de complétude | | |
| Détecter des valeurs aberrantes (IQR, 3 ET) | | |
| Construire un score de qualité par FS | | |

**Décision** : **Points à réviser** :

---

### BILAN MOIS 2

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h **Heures prévues** : 20-28 h

#### Validation des indicateurs de progression du mois 2

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|---|---|---|
| Manipuler un dataset avec `dplyr` sans copier-coller | | |
| Produire 5 types de graphiques différents | | |
| Pivoter des données entre format long et large | | |
| Détecter les valeurs aberrantes d'une série | | |

#### Mini-projet de fin de mois (rapport visuel CPN4 49 FS)

- **Statut** :
- **Lien GitHub** :
- **Difficultés rencontrées** :
- **Améliorations possibles** :

#### Réflexion personnelle

- **Ce qui a marché dans ma méthode** :
- **Ce qui n'a pas marché** :
- **Ajustements pour le mois 3** :

#### Décision

- [ ] Passer au mois 3
- [ ] Consolider avant de continuer (préciser quoi : \_\_\_)
- [ ] Étaler le rythme (préciser : \_\_\_)

------------------------------------------------------------------------

## SUIVI HEBDOMADAIRE — MOIS 3

### Semaine 9 — Statistique descriptive professionnelle

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 9.1 — Tendance centrale et dispersion
- **Date et durée** :
- **Ce qui était prévu** : Tendance centrale et dispersion : choisir le bon résumé selon la distribution
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 9.2 — Distribution : histogramme, boxplot, densité, QQ-plot
- **Date et durée** :
- **Ce qui était prévu** : Distribution : histogramme, boxplot, densité, QQ-plot
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 9.3 — Tableaux 1 publiables avec `gtsummary`
- **Date et durée** :
- **Ce qui était prévu** : Tableaux 1 publiables avec `gtsummary`
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 9.4 — Mise en forme avec `flextable`
- **Date et durée** :
- **Ce qui était prévu** : Mise en forme avec `flextable` pour Word
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 9.5 — Cas pratique : tableau 1 d'une cohorte
- **Date et durée** :
- **Ce qui était prévu** : Cas pratique : tableau 1 d'une cohorte hypothétique de 200 patients
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 9

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Choisir le bon résumé selon la distribution | | |
| Produire histogramme, boxplot, QQ-plot | | |
| Construire un tableau 1 avec `gtsummary` | | |
| Mettre en forme un tableau pour Word avec `flextable` | | |

**Décision** : **Points à réviser** :

---

### Semaine 10 — Tests d'hypothèses

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 10.1 — Logique d'un test : H0/H1, p-value
- **Date et durée** :
- **Ce qui était prévu** : Logique d'un test : H0/H1, p-value, erreur de type I et II
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 10.2 — Comparaison de moyennes
- **Date et durée** :
- **Ce qui était prévu** : Comparaison de moyennes : t-test (Student, Welch), Mann-Whitney
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 10.3 — Comparaison de proportions
- **Date et durée** :
- **Ce qui était prévu** : Comparaison de proportions : chi², Fisher exact
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 10.4 — ANOVA et alternatives non paramétriques
- **Date et durée** :
- **Ce qui était prévu** : ANOVA et alternatives non paramétriques
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 10.5 — Arbre de décision : quel test pour quelle question
- **Date et durée** :
- **Ce qui était prévu** : Arbre de décision : quel test pour quelle question
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 10

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Interpréter une p-value correctement | | |
| Choisir entre t-test et Mann-Whitney | | |
| Appliquer un chi² ou Fisher exact | | |
| Utiliser l'arbre de décision des tests | | |

**Décision** : **Points à réviser** :

---

### Semaine 11 — Intervalles de confiance et taux standardisés

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 11.1 — Intervalles de confiance
- **Date et durée** :
- **Ce qui était prévu** : Intervalles de confiance : interprétation correcte, calcul pour proportions et moyennes
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 11.2 — Pourquoi standardiser
- **Date et durée** :
- **Ce qui était prévu** : Pourquoi standardiser : effet d'âge, effet de structure
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 11.3 — Standardisation directe et indirecte
- **Date et durée** :
- **Ce qui était prévu** : Standardisation directe et indirecte
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 11.4 — Taux pour 1 000 / 100 000
- **Date et durée** :
- **Ce qui était prévu** : Taux pour 1 000 / 100 000 — calculs et présentation
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 11.5 — Cas pratique : mortalité maternelle standardisée
- **Date et durée** :
- **Ce qui était prévu** : Cas pratique : taux de mortalité maternelle standardisé par âge
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 11

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Calculer et interpréter un IC 95 % | | |
| Expliquer pourquoi standardiser | | |
| Appliquer la standardisation directe | | |
| Calculer un taux pour 100 000 | | |

**Décision** : **Points à réviser** :

---

### Semaine 12 — Régression linéaire et logistique

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 12.1 — Régression linéaire simple
- **Date et durée** :
- **Ce qui était prévu** : Régression linéaire simple : équation, interprétation, hypothèses
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 12.2 — Régression linéaire multiple
- **Date et durée** :
- **Ce qui était prévu** : Régression linéaire multiple : variables catégorielles, interactions
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 12.3 — Régression logistique
- **Date et durée** :
- **Ce qui était prévu** : Régression logistique : odds ratio, interprétation
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 12.4 — Diagnostics de modèle
- **Date et durée** :
- **Ce qui était prévu** : Diagnostics de modèle : résidus, leverage, ajustement
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 12.5 — `gtsummary::tbl_regression`
- **Date et durée** :
- **Ce qui était prévu** : `gtsummary::tbl_regression` pour publier des tableaux de résultats
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 12

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Interpréter les coefficients d'une régression linéaire | | |
| Interpréter un odds ratio | | |
| Diagnostiquer un modèle (résidus) | | |
| Publier un tableau de régression avec `gtsummary` | | |

**Décision** : **Points à réviser** :

---

### BILAN MOIS 3

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h **Heures prévues** : 20-28 h

#### Validation des indicateurs de progression du mois 3

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|---|---|---|
| Choisir et exécuter le bon test selon la question | | |
| Produire un tableau 1 propre exportable en Word | | |
| Faire et interpréter une régression linéaire et logistique | | |
| Calculer un IC 95 % et un taux standardisé | | |

#### Mini-projet (reproduction analyse Stata UMC en R)

- **Statut** :
- **Lien GitHub** :
- **Comparaison avec Stata** :
- **Difficultés rencontrées** :
- **Améliorations possibles** :

#### Réflexion personnelle

- **Ce qui a marché dans ma méthode** :
- **Ce qui n'a pas marché** :
- **Ajustements pour le mois 4** :

#### Décision sur Stata

- [ ] Bascule complète vers R
- [ ] Maintien de Stata pour la recherche, R pour le quotidien
- [ ] Indécis (à trancher en mois 4)

#### Décision de progression

- [ ] Passer au mois 4
- [ ] Consolider avant de continuer (préciser quoi : \_\_\_)
- [ ] Étaler le rythme (préciser : \_\_\_)

------------------------------------------------------------------------

## SUIVI HEBDOMADAIRE — MOIS 4

### Semaine 13 — Introduction aux API REST

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 13.1 — Concepts : client/serveur, verbes HTTP
- **Date et durée** :
- **Ce qui était prévu** : Concepts : client/serveur, verbes HTTP (GET, POST), codes de statut
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 13.2 — Le format JSON et `jsonlite`
- **Date et durée** :
- **Ce qui était prévu** : Le format JSON : structure, parsing avec `jsonlite`
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 13.3 — `httr2` : premier appel API
- **Date et durée** :
- **Ce qui était prévu** : `httr2` : premier appel à une API publique (météo, REST Countries)
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 13.4 — Authentification : basique vs token
- **Date et durée** :
- **Ce qui était prévu** : Authentification : basique vs token
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 13.5 — Sécurité : `.Renviron`
- **Date et durée** :
- **Ce qui était prévu** : Sécurité : `.Renviron`, ne jamais commiter ses identifiants
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 13

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Expliquer la logique client/serveur | | |
| Parser un JSON avec `jsonlite` | | |
| Faire un appel GET avec `httr2` | | |
| Stocker des credentials dans `.Renviron` | | |

**Décision** : **Points à réviser** :

---

### Semaine 14 — API DHIS2 / ENDOS-BF (1) : métadonnées

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 14.1 — Architecture DHIS2 : endpoints clés
- **Date et durée** :
- **Ce qui était prévu** : Architecture DHIS2 : endpoints clés (`/me`, `/indicators`, `/dataElements`, `/organisationUnits`, `/analytics`)
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 14.2 — Récupérer la liste des indicateurs
- **Date et durée** :
- **Ce qui était prévu** : Récupérer la liste des indicateurs avec leurs métadonnées
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 14.3 — Hiérarchie des unités d'organisation
- **Date et durée** :
- **Ce qui était prévu** : Récupérer la hiérarchie des unités d'organisation
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 14.4 — Résoudre les UID en noms lisibles
- **Date et durée** :
- **Ce qui était prévu** : Résoudre les UID (identifiants) en noms lisibles
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 14.5 — Dictionnaire d'indicateurs ENDOS-BF en Excel
- **Date et durée** :
- **Ce qui était prévu** : Construire le dictionnaire d'indicateurs ENDOS-BF en Excel
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 14

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Naviguer dans les endpoints DHIS2 | | |
| Récupérer les métadonnées d'un indicateur | | |
| Résoudre un UID en nom lisible | | |
| Produire un dictionnaire d'indicateurs | | |

**Décision** : **Points à réviser** :

---

### Semaine 15 — API DHIS2 / ENDOS-BF (2) : données analytiques

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 15.1 — L'API Analytics : structure de la requête
- **Date et durée** :
- **Ce qui était prévu** : L'API Analytics : structure de la requête (dx, pe, ou)
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 15.2 — Récupérer les valeurs d'un indicateur
- **Date et durée** :
- **Ce qui était prévu** : Récupérer les valeurs d'un indicateur sur une période, pour une liste de FS
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 15.3 — Transformer la réponse JSON en data frame
- **Date et durée** :
- **Ce qui était prévu** : Transformer la réponse JSON en data frame exploitable
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 15.4 — Pagination et grandes requêtes
- **Date et durée** :
- **Ce qui était prévu** : Pagination, gestion des grandes requêtes
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 15.5 — Cas pratique : CPN4 mensuelle 49 FS sur 24 mois
- **Date et durée** :
- **Ce qui était prévu** : Cas pratique : couverture CPN4 mensuelle de tes 49 FS sur 24 mois
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 15

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Construire une requête Analytics DHIS2 | | |
| Transformer une réponse JSON en data frame | | |
| Gérer la pagination d'une API | | |
| Extraire 24 mois de données pour 49 FS | | |

**Décision** : **Points à réviser** :

---

### Semaine 16 — Automatisation et robustesse

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 16.1 — Refactoring : script → fonctions
- **Date et durée** :
- **Ce qui était prévu** : Refactoring : transformer un script en fonctions réutilisables
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 16.2 — Paramétrage du pipeline
- **Date et durée** :
- **Ce qui était prévu** : Paramétrage : un script qui prend en entrée la période, la FS, l'indicateur
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 16.3 — Gestion d'erreurs : `tryCatch`
- **Date et durée** :
- **Ce qui était prévu** : Gestion d'erreurs : `tryCatch`, retry automatique en cas de timeout
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 16.4 — Logs : tracer l'exécution
- **Date et durée** :
- **Ce qui était prévu** : Logs : tracer l'exécution dans un fichier daté
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 16.5 — Cache : éviter les re-téléchargements
- **Date et durée** :
- **Ce qui était prévu** : Cache : éviter de re-télécharger ce qui a déjà été demandé
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 16

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Transformer un script en fonctions réutilisables | | |
| Paramétrer un pipeline (période, FS, indicateur) | | |
| Gérer une erreur réseau avec `tryCatch` | | |
| Produire un fichier de log daté | | |

**Décision** : **Points à réviser** :

---

### BILAN MOIS 4

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h **Heures prévues** : 20-28 h

#### Validation des indicateurs de progression du mois 4

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|---|---|---|
| Faire un appel API authentifié sans tutoriel | | |
| Récupérer une donnée ENDOS-BF et la transformer en data frame | | |
| Construire un pipeline rejouable mensuellement | | |

#### Mini-projet (pipeline ENDOS-BF mensuel)

- **Statut** :
- **Lien GitHub** :
- **Difficultés rencontrées** :
- **Améliorations possibles** :

#### Réflexion personnelle

- **Ce qui a marché dans ma méthode** :
- **Ce qui n'a pas marché** :
- **Ajustements pour le mois 5** :

#### Décision

- [ ] Passer au mois 5
- [ ] Consolider avant de continuer (préciser quoi : \_\_\_)
- [ ] Étaler le rythme (préciser : \_\_\_)

------------------------------------------------------------------------

## SUIVI HEBDOMADAIRE — MOIS 5

### Semaine 17 — Surveillance épidémiologique

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 17.1 — Concepts : courbe épidémique, taux d'incidence
- **Date et durée** :
- **Ce qui était prévu** : Concepts : courbe épidémique, taux d'incidence, taux d'attaque
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 17.2 — Package `incidence2`
- **Date et durée** :
- **Ce qui était prévu** : Le package `incidence2` : courbes épidémiques par jour/semaine/mois
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 17.3 — Seuils d'alerte
- **Date et durée** :
- **Ce qui était prévu** : Seuils d'alerte : moyenne mobile, méthode CDC, méthode des moyennes ± 2 ET
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 17.4 — Détection automatique de dépassements
- **Date et durée** :
- **Ce qui était prévu** : Détection automatique de dépassements
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 17.5 — Cas pratique : surveillance paludisme 49 FS
- **Date et durée** :
- **Ce qui était prévu** : Cas pratique : surveillance paludisme dans tes 49 FS, alerte automatique
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 17

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Construire une courbe épidémique avec `incidence2` | | |
| Calculer un seuil d'alerte (moyenne mobile) | | |
| Détecter automatiquement un dépassement | | |
| Interpréter une courbe épidémique opérationnellement | | |

**Décision** : **Points à réviser** :

---

### Semaine 18 — Analyse de mortalité

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 18.1 — Indicateurs de mortalité
- **Date et durée** :
- **Ce qui était prévu** : Indicateurs : létalité, mortalité proportionnelle, taux brut, taux spécifique
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 18.2 — Pyramide des âges
- **Date et durée** :
- **Ce qui était prévu** : Pyramide des âges, structure par sexe
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 18.3 — Package `epitools` : OR, RR
- **Date et durée** :
- **Ce qui était prévu** : Le package `epitools` : OR, RR, IC associés
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 18.4 — Tables de mortalité simples
- **Date et durée** :
- **Ce qui était prévu** : Tables de mortalité simples
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 18.5 — Cas pratique : analyse exploratoire données UMC
- **Date et durée** :
- **Ce qui était prévu** : Cas pratique : analyse exploratoire de tes données UMC
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 18

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Calculer létalité, mortalité proportionnelle | | |
| Produire une pyramide des âges | | |
| Calculer OR et RR avec IC avec `epitools` | | |
| Analyser des données de mortalité réelles | | |

**Décision** : **Points à réviser** :

---

### Semaine 19 — Cartographie (1) : fondations spatiales

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 19.1 — Concepts spatiaux : CRS, shapefiles, GeoJSON
- **Date et durée** :
- **Ce qui était prévu** : Concepts : système de coordonnées (CRS), shapefiles, GeoJSON
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 19.2 — Package `sf` : objets spatiaux
- **Date et durée** :
- **Ce qui était prévu** : Le package `sf` : importer un shapefile, manipuler des objets spatiaux
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 19.3 — Shapefiles du Burkina Faso
- **Date et durée** :
- **Ce qui était prévu** : Trouver/utiliser les shapefiles du Burkina Faso (régions, districts, communes)
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 19.4 — Jointure : indicateurs + shapefile
- **Date et durée** :
- **Ce qui était prévu** : Jointure : associer un data frame d'indicateurs à un shapefile
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 19.5 — Première carte choroplèthe avec `ggplot2 + geom_sf`
- **Date et durée** :
- **Ce qui était prévu** : Première carte choroplèthe avec `ggplot2 + geom_sf`
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 19

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Expliquer ce qu'est un CRS | | |
| Importer un shapefile avec `sf` | | |
| Joindre un data frame à un shapefile | | |
| Produire une carte choroplèthe basique | | |

**Décision** : **Points à réviser** :

---

### Semaine 20 — Cartographie (2) : cartes professionnelles

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 20.1 — `tmap` : cartes thématiques
- **Date et durée** :
- **Ce qui était prévu** : `tmap` : alternative spécialisée pour cartes thématiques
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 20.2 — Choroplèthes par classes et palettes
- **Date et durée** :
- **Ce qui était prévu** : Cartes choroplèthes par classes (Jenks, quantiles), palettes de couleur
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 20.3 — Cartes interactives avec `leaflet`
- **Date et durée** :
- **Ce qui était prévu** : Cartes interactives avec `leaflet`
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 20.4 — Cartes de hotspots et proportionnelles
- **Date et durée** :
- **Ce qui était prévu** : Cartes de hotspots, cartes proportionnelles
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 20.5 — Export pour rapports DRS
- **Date et durée** :
- **Ce qui était prévu** : Export pour rapports DRS et présentations
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 20

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Produire une carte thématique avec `tmap` | | |
| Choisir une discrétisation (Jenks, quantiles) | | |
| Produire une carte interactive avec `leaflet` | | |
| Exporter une carte en PNG pour un rapport | | |

**Décision** : **Points à réviser** :

---

### BILAN MOIS 5

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h **Heures prévues** : 20-28 h

#### Validation des indicateurs de progression du mois 5

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|---|---|---|
| Détecter automatiquement un dépassement de seuil épidémique | | |
| Produire une carte choroplèthe avec légende propre | | |
| Calculer un OR, un RR avec leur IC 95 % | | |
| Construire une courbe épidémique paramétrable | | |

#### Mini-projet (bulletin épidémiologique mensuel)

- **Statut** :
- **Lien GitHub** :
- **Difficultés rencontrées** :
- **Améliorations possibles** :

#### Réflexion personnelle

- **Ce qui a marché dans ma méthode** :
- **Ce qui n'a pas marché** :
- **Ajustements pour le mois 6** :

#### Décision

- [ ] Passer au mois 6
- [ ] Consolider avant de continuer (préciser quoi : \_\_\_)
- [ ] Étaler le rythme (préciser : \_\_\_)

------------------------------------------------------------------------

## SUIVI HEBDOMADAIRE — MOIS 6

### Semaine 21 — Quarto : fondations

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 21.1 — Installer Quarto, premier document `.qmd`
- **Date et durée** :
- **Ce qui était prévu** : Installer Quarto, premier document `.qmd`
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 21.2 — Structure : YAML, prose, blocs de code
- **Date et durée** :
- **Ce qui était prévu** : Structure : YAML, prose Markdown, blocs de code
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 21.3 — Options de blocs
- **Date et durée** :
- **Ce qui était prévu** : Options de blocs : `echo`, `eval`, `include`, `fig.width`, etc.
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 21.4 — Tableaux : `knitr::kable`, `gt`, `flextable`
- **Date et durée** :
- **Ce qui était prévu** : Tableaux : `knitr::kable`, `gt`, `flextable`
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 21.5 — Rendu en HTML, PDF, Word
- **Date et durée** :
- **Ce qui était prévu** : Rendu en HTML, PDF, Word
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 21

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Créer un document `.qmd` fonctionnel | | |
| Maîtriser le YAML et les options de blocs | | |
| Intégrer un tableau formaté dans un document | | |
| Rendre en HTML, PDF et Word | | |

**Décision** : **Points à réviser** :

---

### Semaine 22 — Quarto avancé : rapports institutionnels

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 22.1 — Paramètres : N rapports depuis un seul document
- **Date et durée** :
- **Ce qui était prévu** : Paramètres : un même document qui produit N rapports (un par FS, par mois)
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 22.2 — Templates Word personnalisés
- **Date et durée** :
- **Ce qui était prévu** : Templates Word personnalisés (logo DS-BMG, polices, en-têtes)
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 22.3 — Pieds de page, numérotation, table des matières
- **Date et durée** :
- **Ce qui était prévu** : Pieds de page, numérotation, table des matières
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 22.4 — Conditional content
- **Date et durée** :
- **Ce qui était prévu** : Conditional content : sections qui apparaissent seulement si données pertinentes
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 22.5 — Cas pratique : rapport mensuel paramétrable pour la DRS
- **Date et durée** :
- **Ce qui était prévu** : Cas pratique : modèle de rapport mensuel paramétrable pour la DRS
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 22

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Paramétrer un document Quarto | | |
| Appliquer un template Word personnalisé | | |
| Utiliser le conditional content | | |
| Produire un rapport mensuel paramétrable | | |

**Décision** : **Points à réviser** :

---

### Semaine 23 — Tableaux de bord

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 23.1 — `quarto dashboard` : philosophie et structure
- **Date et durée** :
- **Ce qui était prévu** : `quarto dashboard` : philosophie et structure
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 23.2 — Layouts : rangées, colonnes, value boxes
- **Date et durée** :
- **Ce qui était prévu** : Layouts : rangées, colonnes, value boxes
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 23.3 — Graphiques interactifs avec `plotly`
- **Date et durée** :
- **Ce qui était prévu** : Graphiques interactifs avec `plotly`
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 23.4 — Tables interactives avec `DT`
- **Date et durée** :
- **Ce qui était prévu** : Tables interactives avec `DT`
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Session 23.5 — Mini-dashboard MCD
- **Date et durée** :
- **Ce qui était prévu** : Mini-dashboard MCD : indicateurs clés du jour, alertes, tendances
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 23

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Structurer un dashboard Quarto | | |
| Intégrer un graphique `plotly` | | |
| Intégrer une table interactive `DT` | | |
| Produire un dashboard MCD fonctionnel | | |

**Décision** : **Points à réviser** :

---

### Semaine 24 — Projet final

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h

#### Session 24 — Système intégré district
- **Date et durée** :
- **Ce qui était prévu** : Système intégré : API ENDOS-BF → indicateurs 49 FS → rapport Word + carte + dashboard HTML, en une commande
- **Ce qui a été fait** :
- **Ce qui est acquis** :
- **Ce qui reste flou** :
- **Prochaine étape** :

---

### BILAN MOIS 6 / FINAL

**Période réelle** : du \_\_\_\_\_ au \_\_\_\_\_ **Heures totales investies** : \_\_\_ h **Heures prévues** : 20-28 h

#### Validation des indicateurs de progression du mois 6

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|---|---|---|
| Générer un rapport Quarto paramétré qui se met à jour mensuellement | | |
| Produire un dashboard HTML fonctionnel | | |
| Exécuter le projet final en une commande, sans intervention manuelle | | |

#### Projet final intégré

- **Statut** :
- **Lien GitHub** :
- **Lien dashboard** :
- **Date de première exécution réelle au district** :
- **Difficultés rencontrées** :

#### Bilan global des 6 mois

**Compétences acquises** :

**Compétences à approfondir** :

**Usage réel dans le travail quotidien** (cas concrets) :

#### Décision pour la suite

- [ ] Programme avancé (Mois 7-9 : Shiny, modélisation, recherche)
- [ ] Consolidation par projets concrets seulement
- [ ] Formation d'autres MCD à R
- [ ] Autre :
|> 
------------------------------------------------------------------------

## NOTES LIBRES

(Espace pour réflexions, idées, questions à poser plus tard, ressources à explorer, etc.)

#1er mai 2026 — Première application du cadre renforcé (7 dispositifs).
Retrieval practice de 3 questions. 6 concepts consolidés à J+30. 
Capacité de reformulation post-séance fonctionnelle, à entretenir.

#05 mai 2026 — Session technique : connexion Claude → GitHub opérationnelle.

- URL de lecture directe configurée :
  https://raw.githubusercontent.com/bereniceharo/R-apprentissage-DSBMG/refs/heads/main/02_Carnet_progression.md
- Dépôt rendu public pour permettre le fetch sans authentification
- Algorithme de la TABLE DE RAPPEL corrigé : suppression de la date figée 
  "1er mai 2026" — Claude calcule désormais les statuts à partir de la date 
  réelle du jour, annoncée explicitement en début de session
- Leçon Git apprise : toujours vérifier avec grep + git diff avant de commiter ;
  un commit vide ne modifie pas le fichier sur GitHub
- Commande de vérification à retenir :
