library(lubridate)
library(stringr)
library(dplyr)
library(tidyr)
install.packages("skimr")
library(skimr)
# 1---importation du jeu de donnée
line_list_menigite<- read.csv("line_liste_meningite_boulmiougou.csv")
# Toutes les variables seront au format character sauf pour la température
skim(line_list_menigite)

# Prédit : On aura le mêmes nombre de ligne et de colonne 347  et 12
# Aorès le parsing, les 3 colones auront le type POSIXct. Que je converti en type Date
# nombre de NA estimé : 0 par ce qu'il n'y avait pas de NA au depart et que toutes 
#les dates sont transformables
line_list_menigite <- line_list_menigite |> 
  mutate(across(
    c(date_debut_symptomes, date_consultation, date_hospitalisation),
    ~as.Date(parse_date_time(.x, orders = c("ymd", "dmy", "mdy")))))
skim(line_list_menigite)
#une centaine de lignes attendues
#Sur toutes les colonnes on aura des dates abarantes
mauvais_format <- line_list_menigite|>
  filter(if_any(
    c(date_consultation,date_debut_symptomes, date_hospitalisation),
    ~ .x>as.Date("2026-05-19")))
glimpse(mauvais_format)



quantile(x= , prob
IQR(line_list_menigite$age)



