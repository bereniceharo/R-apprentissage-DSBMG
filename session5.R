saveRDS(indicateurs_2025, "district_2025.RDS")

district_2025 <- readRDS("district_2025.RDS")
head(district_2025, 10)
dim(district_2025)
colnames(district_2025)
library(dplyr)

noms <- c("DS Boulmiougou", "CMA Pissy", "CSPS Kilwin", "CM Nagrin")
grepl("CM", noms)
# prédit : ???

# Prédit : ???
unique(district_2025$organisationunitname)
# 40
fs_seulement <- district_2025 |>
  filter(
    !grepl("CM", organisationunitname),
    !grepl("DS", organisationunitname),
    !grepl("Dispensaire", organisationunitname),
    !grepl("Infirm", organisationunitname)
  )
dim(fs_seulement)
unique(fs_seulement$organisationunitname)

fs_seulement1 <- district_2025 |>
  filter(
    !grepl("CMA", organisationunitname),
    !grepl("DS", organisationunitname),
    !grepl("Dispensaire", organisationunitname),
    !grepl("Infirm", organisationunitname)
  )
#"Affiche-moi un tableau avec les FS du district, trié de bas en haut par 
#couverture CPN4, pour identifier lesquelles sont en retard."

#retourne:
# - [1] 40 2
# - tibble de deux colonnes avec 5 lignes
fs_cpn4 <- fs_seulement |>
  select(organisationunitname,
         `CibleFS-Couverture en CPN4 2025 FS Public`)
dim(fs_cpn4)
head(fs_cpn4, 5)

#La formation sanitaire avec la couverture la plus faible: CSPS Gueswende
library(dplyr)
fs_cpn4_trie <- fs_cpn4 |>
  arrange(`CibleFS-Couverture en CPN4 2025 FS Public`)

head(fs_cpn4_trie, 10)

fs_cpn4_alerte <- fs_cpn4|>
  mutate(alerte = ifelse(`CibleFS-Couverture en CPN4 2025 FS Public`<50, "Alerte", "OK"))
dim(fs_cpn4_alerte)
table(fs_cpn4_alerte$alerte)
sum(is.na(fs_cpn4_alerte$alerte))
sum(is.na(fs_cpn4_alerte$`CibleFS-Couverture en CPN4 2025 FS Public`))
# retourne le nom de la formation sanitaire avec NA comme valeur de la colonne alerte
fs_cpn4_alerte |>
  filter(is.na(alerte))|>
  select(organisationunitname)



