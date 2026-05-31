#==============================================================================
#Session 11 — Architecture DHIS2 : endpoints fondamentaux
#L'objectif de la session 11.1 est de comprendre la carte des endpoints DHIS2 
#— les cinq portes d'entrée principales — avant d'écrire une seule ligne de code.
#==============================================================================
library(httr2)
library(jsonlite)
# prédit : Un objet R de type liste, fourchette estimée: 100
indicators_demo <- request("https://play.im.dhis2.org/stable-2-43-0/api")|>
  req_url_path_append("indicators")|>
  req_url_query(pageSize = 150)|>
  req_auth_basic("admin", "district")|> 
  req_perform()|>
  resp_body_json()

indicators_demo$pager
length(indicators_demo$indicators)
#Tu as 77 indicateurs dans indicators_demo$indicators. C'est une liste de 77 éléments — chaque élément
#décrit un indicateur.
#Explore le premier indicateur
indicators_demo$indicators[[1]]
#Transformer cette liste en data frame.
#predict: obtient une dataframe de 77 lignes et deux colonnes
id <- sapply(indicators_demo$indicators, 
                    \(x) x$id)
displayName <- sapply(indicators_demo$indicators,
                         \(x) x$displayName)

df_indicators <- data.frame(id, displayName)

tail(df_indicators)


#==============================================================================

#À la prochaine session : 11.2 — récupérer les métadonnées des unités d'organisation
#(/organisationUnits)

#==============================================================================
# prédit : Un objet R de type liste, fourchette estimée: 45
orgUnit_demo <- request("https://play.im.dhis2.org/stable-2-43-0/api")|>
  req_url_path_append("organisationUnits")|>
  req_url_query(pageSize = 50, filter = "name:ilike:Boulmiougou")|>
  req_auth_basic("admin", "district")|> 
  req_perform()|>
  resp_body_json()

length(orgUnit_demo)
names(orgUnit_demo)
orgUnit_demo$pager






