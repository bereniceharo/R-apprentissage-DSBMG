# --- Créer un fichier CSV francophone de test ---
lignes <- c(
  "formation_sanitaire;cpn4;accouchements;penta3",
  "CSPS Boassa;78,5;120;85,2",
  "CSPS Bazoulé;45,3;98;62,1",
  "CSPS Koubri;92,0;145;91,7",
  "CMA Pissy;67,8;210;73,4"
)
writeLines(lignes, "test_csv_francophone.csv")
read.csv("test_csv_francophone.csv")
read.csv2("test_csv_francophone.csv")
df <- read.csv2("test_csv_francophone.csv")
str(df)
summary(df)
install.packages("readxl")
library(readxl)
fs <- read_excel("/Users/Haro/Documents_offline/BOULMIOUGOU/LISTE DES FORMATIONS SANITAIRE ET LEURS RESPONSABLES  DS BOULMIOUGOU.xlsx")
str(fs)
fs<-read_excel("LISTE DES FORMATIONS SANITAIRE ET LEURS RESPONSABLES  DS BOULMIOUGOU.xlsx")
str(fs)

indic25 <- read_excel("Indicateurs  DS BLMG_CMA_FS_2025.xlsx")
str(indic25)
lignes
df
write.csv(df, "test_csv_francophone1.csv", row.names = FALSE)

write.csv2(df, "test_csv_francophone1f.csv", row.names = FALSE)
install.packages("writexl")

writexl::write_xlsx(df,"test_csv_francophone.xlsx")
saveRDS(df, "test_csv_francophone1.rds")

df1 <- read.csv2("test_csv_francophone1.csv")
df1
df2 <- readRDS("test_csv_francophone1.rds")
print()










