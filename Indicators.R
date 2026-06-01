#==============================================================================
#Session 11: Extraction des indicateurs et oeurs UID
#NB: hors session
#Objectif: Savoir identifier les indicateurs et leurs UID et former une liste des indicateurs
#==============================================================================
library(httr2)
library(jsonlite)
library(usethis)
library(writexl)

# 1. Quesls sont les indicateurs du ds boulmiougou-------------------
indicateurs_bmg <- request("https://endos.minsante.bf/api") |> 
  req_url_path_append("indicatorGroups") |> 
  req_url_query(pageSize = 500) |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()

indicateurs_bmg$pager
indicateurs_bmg$indicatorGroups
indic_display <- sapply(indicateurs_bmg$indicatorGroups, \(x) x$displayName)
indic_id <- sapply(indicateurs_bmg$indicatorGroups, \(x) x$id)
indicateurs_liste <- data.frame(
  displayName = indic_display,
  id = indic_id
)

# 1. Filtrer par groupe d'indicateur (extraire un groupe particulier)-------------------
indic_fs <- request("https://endos.minsante.bf/api") |> 
  req_url_path_append("indicators") |> 
  req_url_query(
    pageSize = 100,
    filter = "indicatorGroups.id:eq:KTxnMZtvWy8",
    fields = "id, displayName, numerator, denominator") |> 
  req_auth_basic(Sys.getenv("ENDOS_USER"), Sys.getenv("ENDOS_PWD")) |> 
  req_perform() |> 
  resp_body_json()
indic_fs$indicators[[2]]
