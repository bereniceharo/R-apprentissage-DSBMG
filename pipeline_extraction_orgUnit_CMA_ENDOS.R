# _____________________________________________________________________________
# Ramener uniquement l'uid du CMA de Pissy
# ____________________________________________________________________________

# Packages
library(httr2)
library(jsonlite)
library(usethis)
library(writexl)
library(here)

# PARAMETRES
uid_dsBMG <- "eVFAuZOzogt"
uid_GroupCMA <- "z9rUEinX6Rn"
endos_url_base <- "https://endos.minsante.bf/api"

#  REQUETE API ENDOS
# predit: une formation sanitaire (CMA Pissy)
resp <- request(endos_url_base) |> 
  req_url_path_append("organisationUnits") |> 
  req_url_query(
    level = 5,
    filter = c(
      paste0("path:like:",uid_dsBMG),
      paste0("organisationUnitGroups.id:eq:",uid_GroupCMA)
    ),
    .multi = "explode"
  ) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
 req_perform() 

resp_cma <- resp_body_json(resp)
displayname <- sapply(resp_cma$organisationUnits, \(x) x$displayName)
uid_cma <- sapply(resp_cma$organisationUnits,\(x) x$id)
displayname
uid_cma  
#Construire un tableau tribble UID CMA/services-CMA
  
dictionnaire_cma <- tribble(
  ~nom                 , ~niveau   , ~uid,
  "cma_total"          , "cma"     , "QpXSWD8XJQ7",
  "pediatrie"          , "service" , "z4fRdCJMM5j",
  "maternite"          , "service" , "JGJaicuHHAo",
  "urgences_medicales" , "service" , "nY7vYn1wTye"
)

write_xlsx(dictionnaire_cma, here("data", "dictionnaire_endos_CMA.xlsx"))
  
  
  
  