

library(tibble)
library(dplyr)
library(lubridate)

set.seed(123)

# Simulation d'une linelist d'investigation
linelist_district <- tibble(
  id_patient = 1001:1015,
  formation_sanitaire = sample(
    c("CMA de Pissy", "CSPS Cissin", "CSPS Zagtouli", "CSPS Kouritenga"),
    15,
    replace = TRUE
  ),
  diagnostic = sample(
    c("Paludisme simple", "Paludisme grave", "IRA", "GEA"),
    15,
    replace = TRUE
  ),
  
  # Défi 1 : Dates de naissance saisies dans plusieurs formats différents
  date_naissance_txt = c(
    "15/04/1990",
    "1985-12-05",
    "03-08-2018",
    "1992/07/21",
    "22-11-1988",
    "01/01/2020",
    "1999-09-09",
    "14-02-1975",
    "1980/10/30",
    "05-05-2015",
    "12/12/1995",
    "2001-03-17",
    "28-02-2010",
    "1987/06/15",
    "08-08-2022"
  ),
  
  # Défi 2 : Date et heure de la consultation (Format standard mais en texte)
  date_consultation_txt = c(
    "2026-06-01 08:15:00",
    "2026-06-02 10:30:00",
    "2026-06-02 14:45:00",
    "2026-06-03 09:00:00",
    "2026-06-04 11:20:00",
    "2026-06-05 16:10:00",
    "2026-06-06 07:55:00",
    "2026-06-07 13:40:00",
    "2026-06-08 15:25:00",
    "2026-06-09 08:50:00",
    "2026-06-10 12:15:00",
    "2026-06-11 09:35:00",
    "2026-06-12 10:05:00",
    "2026-06-13 14:55:00",
    "2026-06-14 11:11:00"
  ),
  
  # Défi 3 : Date de début des signes (Format Jour-Mois-Année constant)
  debut_signes_txt = c(
    "28-05-2026",
    "01-06-2026",
    "29-05-2026",
    "02-06-2026",
    "01-06-2026",
    "02-06-2026",
    "05-06-2026",
    "01-06-2026",
    "04-06-2026",
    "07-06-2026",
    "08-06-2026",
    "09-06-2026",
    "05-06-2026",
    "11-06-2026",
    "13-06-2026"
  )
)

# Aperçu de la base brute
glimpse(linelist_district)

# 1. Le nettoyage des formats (Parsing) : Transformer les trois colonnes _txt en véritables objets de type Date (ou POSIXct pour celle contenant l'heure). Attention : la colonne date_naissance_txt contient un mélange de formats (Année-Mois-Jour, Jour/Mois/Année, etc.).

linelist_district <- linelist_district |> 
  mutate(
    debut_signes        = dmy(debut_signes_txt),
    date_consultation   = ymd_hms (date_consultation_txt),
    date_naissance      = as.Date(parse_date_time(date_naissance_txt, orders = c("dmy","ymd","mdy")))
    )

linelist_district <- linelist_district |>
  mutate(
    heure_consultation = hour(date_consultation),
    semaine_epi        = epiweek(debut_signes),
    delai_consultation = as.numeric(as_date(date_consultation)-debut_signes),
    age_annee          = floor(time_length(
      (date_naissance %--% date_consultation  ), 
      unit = "years")
      )
  )

  
  
  

# L'extraction temporelle : Créer une nouvelle colonne pour isoler l'heure de la consultation (utile pour voir les pics d'affluence au CMA ou dans les CSPS) et une autre pour la semaine épidémiologique.
# 
# Le calcul de délai (Arithmétique) : Créer une variable delai_consultation qui calcule le nombre de jours exacts qui se sont écoulés entre le début des signes et la consultation.
# 
# Le calcul de l'âge : Créer une variable age_annees qui calcule l'âge du patient au moment précis de sa consultation.




pars













