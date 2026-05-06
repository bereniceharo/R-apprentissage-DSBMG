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
str(tloh_2026)











