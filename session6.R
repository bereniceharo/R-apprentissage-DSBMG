library(tidyr)

df_large <- data.frame(
  formation = c("CSPS Kossodo", "CSPS Tanghin"),
  janv = c(45, 67),
  fevr = c(52, 71),
  mars = c(38, 63)
)

df_long <- df_large |>
  pivot_longer(
    cols      = c(janv, fevr, mars),
    names_to  = "mois",
    values_to = "cpn4"
  )
# On retrouve une table de 4 colonnes et deux lignes
df_larges <- df_long|>
  pivot_wider( names_from = "mois",
               values_from = "cpn4"
    
  )
df_larges


install.packages("rio")
dim(csps_2025)
district_2025 <- import("district_2025.rds")
# On s'attendara à 40*34 =1360 lignes, 3 colones
csps_2025_long <- csps_2025|>
  pivot_longer(
    cols = -organisationunitname,
    names_to = "indicateur",
    values_to = "valeur"
  )
dim(csps_2025_long)

ncol(csps_2025)
names(csps_2025)
sum(is.na(csps_2025_long$valeur))

saveRDS(csps_2025, "csps_2025.rds")
saveRDS(csps_2025_long, "csps_2025_long.rds")

library(readxl)
tloh_2026 <- read_excel("SYNTHESE_TLOH_2026_DS_BLMG.xlsx", sheet = "Base TLOH 2026")
excel_sheets("SYNTHESE_TLOH_2026_DS_BLMG.xlsx")
synthese_tloh_2025 <- read_excel("SYNTHESE_TLOH_2026_DS_BLMG.xlsx", sheet = "TLOH_2025_SYNTHESE")
dim(tloh_2026)
dim(synthese_tloh_2025)
str(tloh_2026))

noms_2025 <- c("Méningite", "Rougeole", "Diarrhée sanguinolente",
               "Choléra", "Ictère fébrile", "PFA", "TNN",
               "SG", "IRAS", "Dengue", "Charbon")

noms_2026 <- c("Méningite", "Rougeole", 
               "Diarrhée sanguinolente (Shigellose)",
               "Choléra", "Ictère Fébrile (fièvre jaune)",
               "Paralysie flasque aigue (PFA)",
               "Tétanos Neo natal (TNN)",
               "Syndromes Grippaux (SG)",
               "Infection Respiratoire Aigüe Sévère (IRAS)",
               "Dengue", "Charbon ")


# prédit : vecteur de 11 éléments, tout en majuscules, 
# sans espaces parasites, abréviations remplacées par formes complètes
#Tous les éléments de noms_2025_clean seront en majustcule
noms_2025_clean <- noms_2025 |>
  str_to_upper() |>
  str_squish() |>
  str_replace("ICTÈRE FÉBRILE", "ICTÈRE FÉBRILE (FIÈVRE JAUNE)") |>  
  str_replace("DIARRHÉE SANGUINOLENTE","DIARRHÉE SANGUINOLENTE (SHIGELLOSE)" ) |>  
  str_replace("PFA","PARALYSIE FLASQUE AIGUE (PFA)") |>   
  str_replace("TNN","TÉTANOS NEO NATAL (TNN)") |>   
  str_replace("SG","SYNDROMES GRIPPAUX (SG)") |>   
  str_replace("IRAS","INFECTION RESPIRATOIRE AIGÜE SÉVÈRE (IRAS)")     

print(noms_2025_clean)

noms_2025_clean

str_to_upper("Paralysie flasque aigue (PFA)")

noms_2026_clean <- noms_2026 |> 
  str_to_upper() |> 
  str_squish()
print(noms_2026_clean)
identical(noms_2025_clean, noms_2026_clean)

