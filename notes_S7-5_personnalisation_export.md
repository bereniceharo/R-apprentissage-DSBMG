---
title: "Session 7.5 — Personnalisation et export de graphiques ggplot2"
author: "Dr Emmanuel HARO, MCD DS-BMG"
date: "11/05/2026"
output: html_document
editor_options:
  markdown:
    wrap: 72
---

# Session 7.5 — Personnalisation et export

**Semaine** : 7 (ggplot2 : visualiser)
**Date** : 11/05/2026
**Durée** : ~2 heures
**Statut** : terminée

## Objectifs de la session

- Maîtriser les thèmes pré-construits ggplot2 et la règle d'ordre
  des couches `theme`
- Choisir une palette professionnelle (viridis vs ColorBrewer)
  selon l'audience et la sémantique de l'indicateur
- Produire un export reproductible avec `ggsave()` pour livrables
  institutionnels (Word, impression DRS)

## Concepts clés à retenir

### 1. Ordre canonique des couches ggplot2

**Structure générique d'une chaîne complète** :

```r
ggplot(data, aes(...)) +
  geom_*() +                # données
  scale_*() +                # palettes, échelles
  labs(...) +                # titres
  theme_minimal() +          # thème de base : FOND, GRILLE, POLICE
  theme(...)                 # AJUSTEMENTS FINS sur ce thème
```

**Règle absolue** : dans une chaîne ggplot, *la dernière couche
écrite gagne sur les propriétés qu'elle touche*. Donc le
`theme_minimal()` doit toujours précéder le `theme()` d'ajustement
personnalisé. Inverser l'ordre fait perdre silencieusement la
personnalisation — aucun message d'erreur, juste un graphique
muet.

#### Fonctions abordées

**`theme_minimal()`** (et famille `theme_classic()`, `theme_bw()`,
`theme_void()`, `theme_light()`, `theme_dark()`)

- **Entrée** : aucun argument obligatoire. Optionnels :
  `base_size = X` (taille de base des polices),
  `base_family = "X"` (police).
- **Sortie** : une couche `theme` complète qui remplace le thème
  par défaut (`theme_gray()`, fond gris à grille blanche). Aspect
  minimaliste à fond blanc, adapté aux livrables institutionnels.

### 2. Choix de palette : audience > type de variable

Le choix d'une palette ne dépend pas du type R de la variable
(continu vs discret) mais de l'**audience** et de la **décision**
que le graphique doit déclencher.

| Audience / usage | Palette recommandée |
|---|---|
| Pilotage opérationnel (DRS, ICP, CCS) — signaler une alerte | ColorBrewer `RdYlGn` (codes culturels rouge/jaune/vert) |
| Annexe scientifique, publication, mesure rigoureuse | viridis (perceptuellement linéaire, daltonien-compatible) |
| Carte choroplèthe (mois 5) | ColorBrewer (conçu pour ça) |

#### Fonctions abordées

**`scale_fill_distiller()`** — palette ColorBrewer continue (pour
valeurs numériques)

- **Entrée** : `palette = "X"` où X est un nom de palette
  ColorBrewer (ex. `"RdYlGn"`, `"YlOrRd"`, `"Blues"`). Optionnels :
  `direction = 1` ou `-1` (sens d'application),
  `na.value = "X"` (couleur des cellules NA).
- **Sortie** : une couche `scale` qui remplace l'échelle de
  couleur par défaut pour la propriété `fill`. Variante jumelle
  `scale_color_distiller()` pour la propriété `color`.

**`scale_fill_viridis_c()`** — palette viridis continue

- **Entrée** : aucun argument obligatoire. Optionnels les plus
  utiles : `option = "X"` (variantes `"viridis"`, `"magma"`,
  `"plasma"`, `"inferno"`, `"cividis"`), `direction = -1`
  (inverser), `na.value = "X"`.
- **Sortie** : une couche `scale` perceptuellement linéaire et
  daltonien-compatible.

### 3. Sens d'application d'une palette : toujours vérifier la légende

Le comportement de l'argument `direction` dans
`scale_fill_distiller()` n'est pas intuitif et varie selon la
palette. **La seule discipline fiable** :

1. Produire le graphique
2. **Lire la légende** : quelle couleur correspond à la valeur
   basse ? à la valeur haute ?
3. Si le sens contredit la sémantique métier (rouge ne signale pas
   l'alerte), tester `direction = 1` ou `direction = -1` et
   observer.

**Cas pratique CPN4 (haut = bon)** : `direction = 1` met rouge en
bas (alerte) et vert en haut (OK).

**Cas symétrique abandon vaccinal (haut = mauvais)** : pas
d'argument `direction` (ou `direction = -1`) pour mettre rouge en
haut.

#### Fonction abordée

**Argument `direction` de `scale_fill_distiller()`**

- **Entrée** : un nombre, soit `1` (sens par défaut) soit `-1`
  (sens inversé).
- **Sortie** : modifie l'ordre d'application de la palette aux
  valeurs numériques. Aucune autre propriété du graphique n'est
  touchée.

### 4. Export reproductible avec `ggsave()`

Arguments à toujours expliciter pour un livrable professionnel :

```r
ggsave(filename = "figures/nom_graphique.png",
       plot = objet_ggplot,
       width = 15,
       height = 25,
       units = "cm",      # piège francophone : défaut = pouces
       dpi = 300,         # 300 pour impression, 150 pour écran
       bg = "white")      # éviter le fond transparent par défaut
```

Règle de dimensionnement empirique : **~0,5 cm par item** sur
l'axe le plus dense (ex. 46 CSPS → 23 cm minimum sur l'axe y).

| Format | Usage |
|---|---|
| PNG (300 dpi) | Insertion Word, présentations, partage email |
| PDF | Impression DRS, rapports institutionnels, qualité parfaite à toute taille |
| JPEG | **À éviter** pour graphiques (compression destructrice) |

#### Fonction abordée

**`ggsave()`**

- **Entrée** :
  - `filename` : chemin de destination avec extension (l'extension
    détermine le format).
  - `plot` : objet ggplot à exporter (toujours nommer
    explicitement, ne pas se fier au "dernier graphique affiché").
  - `width`, `height` : dimensions numériques.
  - `units` : `"cm"`, `"mm"`, ou `"in"` (défaut `"in"`).
  - `dpi` : résolution en points par pouce (300 impression, 150
    écran, 600 publication).
  - `bg` : couleur de fond (`"white"` pour éviter la transparence
    par défaut).
- **Sortie** : un fichier physique sur le disque (PNG, PDF, JPEG,
  TIFF, SVG selon l'extension). La fonction ne retourne rien
  d'exploitable en R, elle a un effet de bord (création du
  fichier).

## Convention de projet adoptée

Éviter les caractères typographiques exotiques dans les titres et
labels :

| À éviter | Remplacement |
|---|---|
| `—` (cadratin) | `-` (tiret court) ou `:` |
| `« »` (guillemets français typographiques) | `"` (guillemets droits) |
| `…` (points de suspension Unicode) | `...` (trois points séparés) |
| `²` `³` (exposants Unicode) | `^2` `^3` ou texte |

Les **accents français** (é, è, à, ç, ù, î, ô) restent
**autorisés et fonctionnels** dans le moteur PDF par défaut.
Seuls les caractères Unicode étendus posent problème.

## Pièges rencontrés en session

1. **Bug silencieux d'ordre des couches `theme`** : `theme()`
   avant `theme_minimal()` → personnalisation perdue, sans
   warning.
2. **Erreur de transcription `l` minuscule vs chiffre `1`** :
   `"RdY1Gn"` au lieu de `"RdYlGn"` → palette par défaut
   silencieuse, couleurs aléatoires. Lire les noms à voix haute
   lors de la saisie.
3. **Sens contre-intuitif de `direction`** : pour `RdYlGn`
   continu, `direction = 1` (et non `-1`) met le rouge en bas.
   Vérifier empiriquement.
4. **Warning Unicode sur PDF** :
   `mbcsToSbcs ... substituted for —` → caractère cadratin
   remplacé silencieusement par tiret court dans le fichier PDF.
   Convention adoptée : ASCII étendu uniquement.

## Livrables produits

- `figures/heatmap_cpn4_2025.png` — heatmap CPN4 mensuelle 46 FS
  × 12 mois, 300 dpi
- `figures/heatmap_cpn4_2025.pdf` — version vectorielle pour
  impression

## Prochaine étape

Semaine 8 — `lubridate` (parsing de dates françaises, extraction,
différences) et qualité des données (complétude, promptitude,
cohérence, détection de valeurs aberrantes).

---

*Fin des notes de session 7.5*
