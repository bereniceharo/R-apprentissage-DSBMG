# Carnet de synthèse — Concepts clés R
**Apprenant** : Dr Emmanuel — DS-BMG, Burkina Faso
**Dernière mise à jour** : 12/05/2026

---

## SESSION 8.1 — lubridate : dates

---

### `parse_date_time()`
- **Définition simple et claire** : parse (lit et interprète) un vecteur character contenant des dates dans un ou plusieurs formats hétérogènes, et retourne un vecteur POSIXct (datetime).
- **Exemple minimal** :
   ```r
   library(lubridate)
   dates <- c("12/01/2026", "2026-01-15", "January 20, 2026")
   parse_date_time(dates, orders = c("dmy", "ymd", "mdy"))
   # → [1] "2026-01-12" "2026-01-15" "2026-01-20"
   ```
- **À ne pas confondre avec** : `as.Date()` qui ne gère qu'un seul format fixe. `parse_date_time()` est pour les formats multiples ou hétérogènes.
- **Quand l'utiliser dans mon métier** : à l'import d'une line liste (méningite, choléra, paludisme) où les agents de santé ont saisi les dates dans des formats différents.
- **Piège majeur** : les formats ambigus comme `"01-12-2026"` sont interprétés selon le premier ordre dans `orders` — sans warning. Toujours vérifier `sum(is.na())` après parsing.
- **Tags** : #dates #lubridate #import #line_liste

---

### `as.Date()`
- **Définition simple et claire** : convertit un vecteur POSIXct (ou character format fixe) en vecteur Date pur (sans heure). Nécessaire après `parse_date_time()` pour obtenir un type Date.
- **Exemple minimal** :
   ```r
   as.Date(parse_date_time("12/01/2026", orders = "dmy"))
   # → "2026-01-12"  (type Date, pas POSIXct)
   ```
- **À ne pas confondre avec** : `as.date()` en minuscule — cette fonction n'existe pas. R retourne une erreur.
- **Quand l'utiliser dans mon métier** : systématiquement après `parse_date_time()` pour travailler avec des dates sans composante horaire.
- **Tags** : #dates #lubridate #conversion

---

### `epiweek()`
- **Définition simple et claire** : extrait le numéro de semaine épidémiologique (norme CDC, commence le dimanche) à partir d'un vecteur Date. Retourne un vecteur integer.
- **Exemple minimal** :
   ```r
   epiweek(as.Date("2026-01-12"))
   # → 3  (semaine épidémiologique 3)
   ```
- **À ne pas confondre avec** : `week()` qui retourne la semaine calendaire (commence le lundi). En épidémiologie de terrain, toujours utiliser `epiweek()`.
- **Quand l'utiliser dans mon métier** : pour agréger les cas par semaine épidémiologique et tracer une courbe épidémique (paludisme, méningite, choléra).
- **Tags** : #dates #lubridate #surveillance #courbe_epidemique

---

### Soustraction de deux `Date` + `as.numeric()`
- **Définition simple et claire** : soustraire deux vecteurs Date donne un vecteur difftime (délai). `as.numeric()` convertit ce délai en nombre de jours.
- **Exemple minimal** :
   ```r
   date_consultation <- as.Date("2026-01-14")
   date_symptomes    <- as.Date("2026-01-12")
   as.numeric(date_consultation - date_symptomes)
   # → 2  (2 jours de délai)
   ```
- **À ne pas confondre avec** : la soustraction de deux vecteurs character — R retourne une erreur. Les deux objets doivent être de type Date.
- **Quand l'utiliser dans mon métier** : calcul du délai de consultation (onset-to-consultation), délai d'hospitalisation, durée de séjour. Indicateurs clés de promptitude de prise en charge.
- **Tags** : #dates #lubridate #delai #line_liste #qualite_soins

---

## SESSION 8.2 — stringr avancé : regex

---

### Briques fondamentales des regex

- **Définition simple et claire** : une regex (expression régulière) décrit un pattern de caractères — pas une valeur fixe, mais une structure. Elle est utilisée dans toutes les fonctions `str_*()` de `stringr`.

| Brique | Signification | Exemple |
|--------|--------------|---------|
| `^` | Début de chaîne | `^CSPS` matche "CSPS Tampouy" mais pas "Mon CSPS" |
| `[A-Z]` | Une lettre majuscule | matche "C" dans "CSPS" |
| `[A-Z]+` | Une ou plusieurs majuscules | matche "CSPS" entier |
| `\\s` | Un espace | matche l'espace dans "CSPS Tampouy" |
| `(de )?` | Groupe optionnel | présent ou absent |

- **Piège majeur** : une regex mal construite ne génère pas d'erreur — elle produit silencieusement des résultats incorrects ou des NA. Toujours vérifier le résultat avec `unique()` ou `head()`.
- **Tags** : #regex #stringr #nettoyage

---

### `str_remove()`
- **Définition simple et claire** : supprime la première occurrence d'un pattern dans chaque élément d'un vecteur character. Raccourci de `str_replace(x, pattern, "")`.
- **Exemple minimal** :
   ```r
   library(stringr)
   fs <- c("CSPS Tampouy", "CMA de Pissy", "CSPS Boassa")
   str_remove(fs, "^[A-Z]+(\\s)(de )?")
   # → "Tampouy"  "Pissy"  "Boassa"
   ```
- **À ne pas confondre avec** : `str_remove_all()` qui supprime toutes les occurrences dans chaque chaîne.
- **Quand l'utiliser dans mon métier** : supprimer les préfixes répétitifs (`CSPS`, `CMA de`, `CM`) des noms de FS sur les axes de graphiques ggplot2 pour améliorer la lisibilité.
- **Tags** : #stringr #regex #nettoyage #noms_fs #ggplot2

---

### `str_trunc()`
- **Définition simple et claire** : tronque chaque chaîne d'un vecteur à une largeur maximale en caractères, en ajoutant un suffixe (par défaut `"..."`).
- **Exemple minimal** :
   ```r
   str_trunc("Bonheur Ville", width = 10)
   # → "Bonheur..."
   str_trunc("Bonheur Ville", width = 10, ellipsis = "")
   # → "Bonheur Vi"
   ```
- **À ne pas confondre avec** : `str_sub()` qui extrait une sous-chaîne sans ajouter de suffixe.
- **Quand l'utiliser dans mon métier** : tronquer les noms de FS trop longs sur les axes des graphiques ggplot2 pour éviter le chevauchement des étiquettes. Largeur recommandée : 10-15 caractères selon la taille du graphique.
- **Tags** : #stringr #nettoyage #ggplot2 #lisibilite

---

### `str_detect()` + `regex(ignore_case = TRUE)`
- **Définition simple et claire** : détecte si un pattern est présent dans chaque élément d'un vecteur character. Retourne un vecteur logique. `regex(ignore_case = TRUE)` ignore la casse lors de la recherche.
- **Exemple minimal** :
   ```r
   fs <- c("CSPS Tanghin", "CSPS Tampouy", "csps tanghin")
   str_detect(fs, regex("tanghin", ignore_case = TRUE))
   # → TRUE  FALSE  TRUE
   ```
- **À ne pas confondre avec** : `grepl()` (base R) — équivalent mais syntaxe différente. `str_detect()` s'intègre mieux dans un pipeline dplyr.
- **Quand l'utiliser dans mon métier** : détecter les variantes d'orthographe d'un même nom de FS avant une jointure entre fichiers (ex. "CSPS Tanghin" vs "tanghin" vs "TANGHIN"). Utilisable directement dans `filter()`.
- **Tags** : #stringr #regex #jointure #noms_fs #qualite_donnees

---

## SESSION 8.3 — Qualité des données

---

### `across()` + `where()`
- **Définition simple et claire** :
  - `across()` applique une fonction à plusieurs colonnes sélectionnées, à l'intérieur de `mutate()` ou `summarise()`.
  - `where()` sélectionne les colonnes pour lesquelles un prédicat (fonction TRUE/FALSE) est vérifié. S'utilise à l'intérieur de `across()` ou `select()`.
- **Exemple minimal** :
   ```r
   library(dplyr)
   # Moyenne de toutes les colonnes numériques par type de FS
   csps_2025 |>
     group_by(type_fs) |>
     summarise(across(where(is.numeric), \(x) mean(x, na.rm = TRUE)))
   ```
- **À ne pas confondre avec** : l'ancienne syntaxe `across(where(is.numeric), mean, na.rm = TRUE)` — dépréciée depuis dplyr 1.1.0. Utiliser la fonction anonyme `\(x) mean(x, na.rm = TRUE)`.
- **Prédicats courants** : `is.numeric`, `is.character`, `is.logical`.
- **Quand l'utiliser dans mon métier** : calculer une statistique (moyenne, complétude, max) sur tous les indicateurs numériques en une seule ligne, sans nommer chaque colonne. Indispensable quand tu as 33 indicateurs.
- **Tags** : #dplyr #across #where #summarise #select #multi_indicateurs

---

### Complétude des données
- **Définition simple et claire** : pourcentage de valeurs attendues effectivement saisies (non manquantes) dans un fichier de données.
- **Formule** : `(sum(!is.na(valeurs)) / valeurs_attendues_totales) × 100`
- **Exemple minimal** :
   ```r
   # Complétude globale
   (sum(!is.na(csps_2025)) / (nrow(csps_2025) * (ncol(csps_2025) - 1))) * 100

   # Complétude par FS
   csps_2025 |>
     group_by(organisationunitname) |>
     summarise(completude = (sum(!is.na(across(where(is.numeric)))) /
                            (ncol(csps_2025) - 1)) * 100)
   ```
- **À ne pas confondre avec** : `sum(is.na())` qui calcule le taux d'**in**complétude (valeurs manquantes).
- **Seuil de référence DRS** : 80% minimum.
- **Quand l'utiliser dans mon métier** : évaluation mensuelle de la qualité des données SNIS, identification des FS nécessitant une supervision ciblée.
- **Tags** : #qualite_donnees #completude #supervision #SNIS

---

### Promptitude des données
- **Définition simple et claire** : pourcentage de rapports reçus dans le délai imparti (au plus tard le 5 du mois suivant au Burkina Faso).
- **Formule** : `(sum(date_transmission <= date_limite) / total_fs) × 100`
- **Exemple minimal** :
   ```r
   # Promptitude janvier 2025 (délai : 5 février 2025)
   (sum(csps_2025$date_transmis <= as.Date("2025-02-05"), na.rm = TRUE) / 40) * 100

   # Identifier les FS en retard
   csps_2025 |>
     filter(date_transmis > as.Date("2025-02-05")) |>
     select(organisationunitname, date_transmis)
   ```
- **À ne pas confondre avec** : la complétude — la promptitude mesure le **délai** de transmission, pas la présence des valeurs.
- **Seuil de référence national** : 80% minimum.
- **Quand l'utiliser dans mon métier** : évaluation mensuelle de la transmission des rapports, identification des FS chroniquement en retard pour supervision ciblée.
- **Tags** : #qualite_donnees #promptitude #supervision #SNIS

---

### `sample()` + `set.seed()`
- **Définition simple et claire** :
  - `sample()` tire aléatoirement des valeurs dans un vecteur.
  - `set.seed()` fixe le point de départ du générateur aléatoire pour garantir la reproductibilité.
- **Exemple minimal** :
   ```r
   set.seed(2025)  # toujours avant sample()
   sample(1:10, size = 3, replace = FALSE)
   # → toujours le même résultat à chaque exécution
   ```
- **Arguments clés de `sample()`** :
  - `size` : nombre de valeurs à tirer
  - `replace = TRUE` : tirage avec remise (une valeur peut être tirée plusieurs fois)
  - `replace = FALSE` : tirage sans remise (défaut)
- **Quand l'utiliser dans mon métier** : simuler des données de test (dates de transmission, valeurs d'indicateurs) pour valider un pipeline avant d'avoir les vraies données.
- **Tags** : #simulation #reproductibilite #qualite_donnees

---

### Cohérence interne des données
- **Définition simple et claire** : vérification que les valeurs d'un fichier sont logiquement possibles et non contradictoires entre elles.
- **Trois types de problèmes** :

| Type | Exemple | Détection R |
|------|---------|-------------|
| Valeur impossible | Taux CPN4 = 219% | `filter(taux > 100)` |
| Valeur contradictoire | Accouchements assistés > total accouchements | `filter(col_A > col_B)` |
| Valeur aberrante statistique | Valeur à +3 écarts-types | Session 8.4 |

- **Exemple minimal** :
   ```r
   # Détecter les taux CPN4 impossibles (> 100%)
   csps_2025 |>
     filter(`CibleFS-Couverture en CPN4 2025 FS Public` > 100) |>
     select(organisationunitname, `CibleFS-Couverture en CPN4 2025 FS Public`)
   ```
- **À retenir** : un taux > 100% n'est pas automatiquement une erreur — causes possibles : sous-estimation de la cible, débordement d'aire sanitaire, erreur de saisie. Toujours investiguer avant de corriger.
- **Quand l'utiliser dans mon métier** : avant toute analyse ou rapport DRS — c'est la première étape de vérification des données SNIS.
- **Tags** : #qualite_donnees #coherence #SNIS #valeurs_aberrantes

---

*Carnet généré le 12/05/2026 — Sessions 8.1, 8.2, 8.3*
