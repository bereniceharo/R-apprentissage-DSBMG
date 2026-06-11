library(tidyr)
library(dplyr)

# Table 1 : activités mensuelles — 3 CSPS × 6 mois
df_activites <- data.frame(
  uid  = c(rep("UID_001", 6), rep("UID_002", 6), rep("UID_003", 6)),
  mois = rep(c("Jan", "Fév", "Mar", "Avr", "Mai", "Jun"), 3),
  cpn4 = c(45, 48, 52, 50, 47, 53,
           30, 28, 35, 32, 29, 33,
           60, 65, 70, 68, 72, 69)
)

# Table 2 : dictionnaire — 5 CSPS (UID_004 et UID_005 sans données)
df_dict <- data.frame(
  uid  = c("UID_001","UID_002","UID_003","UID_004","UID_005"),
  nom  = c("CSPS Cissin","CSPS Karpala","CSPS Samandin",
           "CSPS Tampouy","CSPS Yimdi"),
  zone = c("Nord","Sud","Centre","Nord","Sud")
)

# Identifie quels UIDs de df_dict ont des données dans df_activites. Retourne un vecteur logique, puis les noms correspondants.

#Etape 1
# predit: retourne un vecteur char avec les noms des csps
df_dict$nom[which(df_dict$uid %in% df_activites$uid)]

#Étape 2 
#Joins les deux tables pour ajouter nom et zone aux activités.

#La table maitre est df_dict par ce que c'est elle qui contient l'ensemble des uids des formations sanitaires
#Predit: df 20x5, 
df_complete <- left_join(y = df_activites, 
                         x = df_dict, 
                         by = "uid")
print(df_complete)

# Étape 3/4Filtre uniquement CSPS Cissin, puis trace l'évolution mensuelle de CPN4 avec geom_line()
#Predict: Une courbe à l'alure en dent de scie
line_cissin <- df_complete |> 
  filter(nom == "CSPS Cissin") |> 
  mutate(mois = factor(mois, levels = c("Jan", "Fév", 
                                      "Mar", "Avr","Mai", "Jun" )) 
         ) |> 
  ggplot(aes(x= mois, y = cpn4, group = 1))+
  geom_line()+
  geom_point()+
  theme_minimal()+
  theme(
    axis.text.x = element_text(angle = 45)
  )

line_cissin |> 
  distinct(mois)

#etape 5
line_cissin |> 
  ggsave( 
    filename = here("output", "cpn4_cissin.png"),
    width = 25,
    height = 15,
    units = "cm",
    dpi = 300,
    bg = "white"
    )

#Etape 6

# Écris — sans exécuter — la requête httr2 qui interrogerait ENDOS-BF pour récupérer les FS appartenant au groupe "Public" ou au groupe "CSPS". Un seul appel req_url_query()

#predit obtient objet de type list R
endos.bf <- "https://endos.minsante.bf/api"
resp <- request(endos.bf) |> 
  req_url_path_append("organisationUnits") |> 
  req_url_query(
    pageSize = 100,
    filter = c(
      paste0("organisationUnits.id:eq:", uid_public),
      paste0("organisationUnits.id:eq:", uid_csps)
  ),
  RootJunction = "OR",
  .multi = "explode"
  ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()







