# Carnet de progression — Apprentissage R sur 6 mois

**Apprenant** : Dr Emmanuel
**Démarrage** : _____ 19 avril 2026
**Cible de fin** : _____ 18 octobre 2026

---

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

---

## SUIVI HEBDOMADAIRE

---

### Semaine 1 — Installation et logique R

**Période réelle** : du _____ au _____
**Heures totales investies** : ___ h

#### Session 1.1 — Installation
- **Date** :19 avril 2026 (2 heures)
- **Durée** : 02 heures
- **Prévu** : Installation R officiel CRAN, RStudio, premier projet
- **Fait** : installation, création de script, création de projet, calcul arithmetiques, assignation d'objet
- **Acquis** : Tous les éléments prévus ont été acquis
- **Flou** : Quand est ce que la console est silencieuse? Confusion calcul et assignation d'objet
- **Prochaine étape** : session 1.2: concepts objet/fonction/<-/ console vs script

#### Session 1.2 — Concepts fondamentaux
- **Date** : 21 avril 2026
- **Durée** : 1h30
- **Prévu** : objet, fonction, `<-`, console vs script
- **Fait** : objets, arguments nommés, arguments positionnels, syntax d'appel
console et script
- **Acquis** : différence entre objet, noms et valeurs, fonctions
comment rediger les commentaires, règle de redaction des commentaires, distinction
paranetre et argument
- **Flou** : néant
- **Prochaine étape** : session suivante

#### Session 1.3 — Types de données
- **Date** : 22 avril 2026
- **Durée** : 3 heures avec pauses
- **Prévu** : numeric, character, logical, NA
- **Fait** :Bloc 1: Les quatre types fondamentaux : numeric, character, logical, NA
            Bloc 2: La coercition automatique et la hiérarchie L-N-C
            Bloc 3: Le comportement de NA : propagation, incomparabilité, détection, exclusion
            Bloc 4: Mini-cas couverture CPN4 : application concrète de tout ce qui précède

- **Acquis** : la maitrise des types de données, l'ordre de coercition entre les types de données,
              character gagne sur tout, logical perd sur tout,
              la coercition silencieuse, calculs avec NA, distinction entre = et ==
- **Flou** : néant
- **Prochaine étape** : session 1.4 — vecteurs (création, indexation, opérations vectorielles)

#### Session 1.4 — Vecteurs
- **Date** : 23 avril 2026
- **Durée** : 1h30
- **Prévu** : création, indexation, opérations vectorielles
- **Fait** : indexation par position, indexation logique, opération vectorielle

- **Acquis** : vecteur[i], vecteur[i,j], vecteur[i:j], vecteur [-i]
              selection par condition
- **Flou** : néant
- **Prochaine étape** :session 1.5 — mini-exercice statistiques descriptives sur un vecteur CPN4

#### Session 1.5 — Mini-exercice CPN4 fictif
- **Date** : 23 avril 2026
- **Durée** : 01h30
- **Prévu** : statistiques descriptives sur un vecteur
- **Fait** : calcul de moyenne, utilisation de which, max, min, sd et étendue
- **Acquis** : maitrise de which.max(), which.min() et which()
              application de ce que j'ai appris jusque là pour faire
              quelques statistiques descriptives.
- **Flou** : l'interpretation metier qui ne va ps jusqu'a la conclusion
          opérationnelle sans s'arrêter juste à la description des chiffres
- **Prochaine étape** : entamer la semaine 2

#### Récapitulatif semaine 1

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Créer un vecteur, l'indexer, opérer dessus |4 | |
| Comprendre `=`, `<-`, `==` | 4.5| |
| Comprendre la propagation des `NA` | 4.5| |

**Décision** : passer à la semaine 2 / consolider / autre :
**Points à réviser dans la semaine qui vient** :

---

### Semaine 2 — Structures de données + Git

**Période réelle** : du _____ au _____
**Heures totales investies** : ___ h

#### Session 2.1 — Listes
- **Date** : 23 avril 2026
- **Durée** : ~1h30
- **Prévu** : listes, différence entre vecteur et liste, opérateurs `[ ]` vs `[[ ]]` vs `$`
- **Fait** : création avec `list()`, accès par les trois opérateurs, 
  pièges syntaxe (guillemets dans `[[ ]]`), cas CSPS Boassa et Bazoulé
- **Acquis** : distinction `[ ]` (retourne liste) vs `[[ ]]` et `$` 
  (retournent contenu brut) ; `length()` d'une liste = nombre d'éléments 
  de premier niveau
- **Flou** : lecture rapide de l'affichage console d'une liste 
  (hiérarchie `$nom` puis `[position]`)
- **Prochaine étape** : session 2.2 — Data frames (structure, colonnes 
  comme vecteurs)

#### Session 2.2 — Data frames
- **Date** : 24 avril 2025
- **Durée** :1h30
- **Prévu** :data frame
- **Fait** : 
- **Acquis** :structure du data frame, syntaxe [ligne, colonne], ajout de colonne, filtrage conditionnel
- **Flou** : le filtre et la selection des données dans une table surtout avec le vide avant et après dans les crochets
- **Prochaine étape** : session 2.3 -facteurs
#### Session 2.3 — Facteurs
- **Date** : 24/04/2026
- **Durée** :30 minutes
- **Prévu** :Facteurs
- **Fait** : transformer vecteur character en facteur, levels, classement des categories avec le parametre
            levels, summary
- **Acquis** :
  Un facteur est un vecteur character avec une liste fixe de catégories appelées niveaux (levels)
factor() convertit un character en facteur
summary() affiche les fréquences sur un facteur — pas sur un character
Un facteur refuse toute valeur hors de ses niveaux — remplace par NA avec avertissement
Tu contrôles l'ordre des niveaux avec l'argument levels
- **Flou** : 
- **Prochaine étape** : Session 2.4 — Git + GitHub

#### Session 2.4 — Git + GitHub
- **Date** :
- **Durée** :
- **Prévu** :
- **Fait** :
- **Acquis** :
- **Flou** :
- **Prochaine étape** :

#### Session 2.5 — Data frame des indicateurs prioritaires
- **Date** :
- **Durée** :
- **Prévu** :
- **Fait** :
- **Acquis** :
- **Flou** :
- **Prochaine étape** :

#### Récapitulatif semaine 2

| Compétence attendue | Auto-éval (1-5) | Commentaire |
|---|---|---|
| Créer un data frame manuellement | | |
| Premier `git commit` et `git push` réussis | | |
| Comprendre l'utilité d'un facteur | | |

**Décision** :
**Points à réviser** :

---

### Semaine 3 — Lire et écrire des fichiers

**Période réelle** : du _____ au _____
**Heures totales investies** : ___ h

#### Session 3.1 — Lire un CSV
#### Session 3.2 — Lire un Excel
#### Session 3.3 — Sauvegarder
#### Session 3.4 — Chemins relatifs / projets RStudio
#### Session 3.5 — Cas réel ENDOS-BF

#### Récapitulatif semaine 3

| Compétence attendue | Auto-éval (1-5) |
|---|---|
| Importer un fichier français (`;`, `,`) | |
| Inspecter avec `str()`, `summary()`, `head()` | |
| Sauvegarder dans 3 formats | |

---

### Semaine 4 — Conditions, boucles, fonctions

**Période réelle** : du _____ au _____
**Heures totales investies** : ___ h

#### Session 4.1 — `if/else`
#### Session 4.2 — Boucles `for`
#### Session 4.3 — Vectorisation et `apply`
#### Session 4.4 — Fonctions personnalisées
#### Session 4.5 — Fonctions avec arguments par défaut

#### Récapitulatif semaine 4

| Compétence attendue | Auto-éval (1-5) |
|---|---|
| Écrire une fonction simple | |
| Comprendre quand utiliser une boucle vs vectorisation | |

---

### BILAN MOIS 1

**Période réelle** : du _____ au _____
**Heures totales investies** : ___ h
**Heures prévues** : 20-28 h

#### Validation des indicateurs de progression du mois 1

| Indicateur | Validé (Oui/Partiel/Non) | Commentaire |
|---|---|---|
| Importer un Excel, filtrer, résumer, exporter sans aide | | |
| Écrire une fonction qui prend des arguments et retourne un résultat | | |
| Avoir un dépôt GitHub avec au moins 4 commits documentés | | |

#### Mini-projet de fin de mois (`resumer_indicateur()`)
- **Statut** :
- **Lien GitHub** :
- **Difficultés rencontrées** :
- **Améliorations possibles** :

#### Réflexion personnelle
- **Ce qui a marché dans ma méthode** :
- **Ce qui n'a pas marché** :
- **Ajustements pour le mois 2** :

#### Décision
- [ ] Passer au mois 2
- [ ] Consolider avant de continuer (préciser quoi : ___)
- [ ] Étaler le rythme (préciser : ___)

---

## SUIVI HEBDOMADAIRE — MOIS 2

### Semaine 5 — `dplyr`
### Semaine 6 — `tidyr` et nettoyage
### Semaine 7 — `ggplot2`
### Semaine 8 — `lubridate` et qualité des données

### BILAN MOIS 2

#### Validation des indicateurs de progression du mois 2

| Indicateur | Validé | Commentaire |
|---|---|---|
| Manipuler un dataset avec `dplyr` sans copier-coller | | |
| Produire 5 types de graphiques différents | | |
| Pivoter des données entre format long et large | | |
| Détecter les valeurs aberrantes d'une série | | |

#### Mini-projet de fin de mois (rapport visuel CPN4 49 FS)
- **Statut** :
- **Lien GitHub** :

---

## SUIVI HEBDOMADAIRE — MOIS 3

### Semaine 9 — Statistique descriptive
### Semaine 10 — Tests d'hypothèses
### Semaine 11 — IC et taux standardisés
### Semaine 12 — Régression

### BILAN MOIS 3

| Indicateur | Validé | Commentaire |
|---|---|---|
| Choisir et exécuter le bon test selon la question | | |
| Produire un tableau 1 propre exportable en Word | | |
| Faire et interpréter une régression linéaire et logistique | | |
| Calculer un IC 95 % et un taux standardisé | | |

#### Mini-projet (reproduction analyse Stata UMC en R)
- **Statut** :
- **Lien GitHub** :
- **Comparaison avec Stata** :

#### Décision sur Stata
- [ ] Bascule complète vers R
- [ ] Maintien de Stata pour la recherche, R pour le quotidien
- [ ] Indécis (à trancher en mois 4)

---

## SUIVI HEBDOMADAIRE — MOIS 4

### Semaine 13 — Introduction API REST
### Semaine 14 — API DHIS2 (1) métadonnées
### Semaine 15 — API DHIS2 (2) données analytiques
### Semaine 16 — Automatisation

### BILAN MOIS 4

| Indicateur | Validé | Commentaire |
|---|---|---|
| Faire un appel API authentifié sans tutoriel | | |
| Récupérer une donnée ENDOS-BF et la transformer en data frame | | |
| Construire un pipeline rejouable mensuellement | | |

#### Mini-projet (pipeline ENDOS-BF mensuel)
- **Statut** :
- **Lien GitHub** :

---

## SUIVI HEBDOMADAIRE — MOIS 5

### Semaine 17 — Surveillance épidémiologique
### Semaine 18 — Analyse de mortalité
### Semaine 19 — Cartographie (1) fondations
### Semaine 20 — Cartographie (2) cartes professionnelles

### BILAN MOIS 5

| Indicateur | Validé | Commentaire |
|---|---|---|
| Détecter automatiquement un dépassement de seuil épidémique | | |
| Produire une carte choroplèthe avec légende propre | | |
| Calculer un OR, un RR avec leur IC 95 % | | |
| Construire une courbe épidémique paramétrable | | |

#### Mini-projet (bulletin épidémiologique mensuel)
- **Statut** :
- **Lien GitHub** :

---

## SUIVI HEBDOMADAIRE — MOIS 6

### Semaine 21 — Quarto fondations
### Semaine 22 — Quarto institutionnel
### Semaine 23 — Tableaux de bord
### Semaine 24 — Projet final

### BILAN MOIS 6 / FINAL

| Indicateur | Validé | Commentaire |
|---|---|---|
| Générer un rapport Quarto paramétré mensuel | | |
| Produire un dashboard HTML fonctionnel | | |
| Exécuter le projet final en une commande | | |

#### Projet final intégré
- **Statut** :
- **Lien GitHub** :
- **Lien dashboard** :
- **Date de première exécution réelle au district** :

#### Bilan global des 6 mois

**Compétences acquises** :

**Compétences à approfondir** :

**Usage réel dans le travail quotidien** (cas concrets) :

**Décision pour la suite** :
- [ ] Programme avancé (Mois 7-9 : Shiny, modélisation, recherche)
- [ ] Consolidation par projets concrets seulement
- [ ] Formation d'autres MCD à R
- [ ] Autre :

---

## NOTES LIBRES

(Espace pour réflexions, idées, questions à poser plus tard, ressources à explorer, etc.)
