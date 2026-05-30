# ====================================================================
# Session 10.3 
#appliqué httr2 sur un JSON d'exemple.
#
# Auteur: HARO Emmanuel
# ====================================================================
library(httr2)

# req_perfom() ramene un objet de type httr2_response. contient le code statut, et le body en bytes.
# code 200
# Après decodage resp_body_json ramene un objet de type liste R avec des champs $headers$username, $headers$password

my_profile <- request("https://play.im.dhis2.org/stable-2-43-0/api") |> 
  req_url_path_append("me") |> 
  req_auth_basic(username = "admin",
                 password = "district") |> 
  req_perform() |> 
  resp_body_json()
  
my_profile$id
length(my_profile$username)





