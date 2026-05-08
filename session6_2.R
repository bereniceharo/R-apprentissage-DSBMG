library(lintr)
library(tidyr)
df_long <- pivot_longer(
  df_large,
  cols = c("CPN4", "penta3", "Acc_assist"),
  names_to = "indicateur",
  values_to = "valeur"
)
# Pour produire des clés de jointure propres — tout en majuscules, 
# sans espaces parasites — dans quel ordre enchaînes-tu str_to_upper() 
# et str_squish(), et pourquoi l'ordre est-il indifférent ici ?
library(stringr)
noms_tloh <- c("Méningite", "Ictère Fébrile (fièvre jaune)",
               "Charbon ", "Paludisme Simple",
               "Infection Respiratoire Aigüe Sévère (IRAS)")
# Toute les chaines de caractère du vecteur en majuscule comprenant les acccents. 
#Absence d'espace parasite sur la chaine "Charbon"
noms_propre <- noms_tloh |> 
  str_to_upper() |> 
  str_squish()
