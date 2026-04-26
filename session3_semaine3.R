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
