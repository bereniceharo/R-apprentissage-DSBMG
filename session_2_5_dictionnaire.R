
sante_2025 <- data.frame(
  nom = c("taux_accouchement", 
          "prop_partogramme", 
          "prop_cpn1_t1", 
          "taux_cpn4",
          "couv_milda",
          "couv_tpi3",
          "prop_pcime", 
          "contact_enfant",
          "couv_penta3", 
          "couv_rr2"),
  numerateur = c("nombre total accouchement",
                 "accouchement avec partogramme",
                 "femmes vues en cpn1 à t1 de la grossesse",
                 "femmes vues en cpn4 et plus", 
                 "femmes enceintes ayant bénéficié d’une milda",
                 "femmes enceintes ayant bénéficié de tpi3 au cours des cpn",
                 "nombre enfants vue selon pcime", 
                 "nombre de nouveaux consultants moins de 5 ans auto-orientés",
                 "0 à 11 mois ayant reçu penta3 periode",
                 "12 à 23 mois ayant reçu rr2"
                 ),
  denominateur = c("accouchements attendus",
                   "total accouchements fs",
                   "femmes enceintes vues en cpn1",
                   "nombre de grossesses attendues",
                   "nombre de femmes enceintes vues en cpn1",
                   "nombre total de femmes enceintes ayant fait la cpn1",
                   "nombre de nouveaux consultants de moins de 5 ans",
                   "population des moins de 5 ans",
                   "enfants de 0 à 11 mois",
                   "enfants de 12 à 23 mois"
                   ),
  periodicite = c("mensuel", "mensuel", "mensuel", "mensuel", "trimestriel",
                "trimestriel", "mensuel", "semestriel", "mensuel", "mensuel"),
  seuil       = c(NA, 0.9, 0.5, 0.5, NA, NA, 0.6, 0.5, NA, NA),
  objectif    = c(0.9, 1, 1, 1, 1, 0.9, 1, 2, 1, 1),
  domaine     = c("smi", "smi", "smi", "smi", "paludisme", "paludisme", "smi", 
                  "utilisation services", "vaccination", "vaccination"
                  )
) 
sante_2025
str(sante_2025)
sante_2025[sante_2025$domaine == "paludisme", ]

sante_2025[7, c("nom", "objectif")]
sum(is.na(sante_2025$seuil))








head(sante_2025)
