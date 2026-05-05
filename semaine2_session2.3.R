bazoule <- list(
  icp           = "NIKIEMA François",
  contact       = 67511187,
  nb_agents     = 9,
  distance      = 34,
  a_assistes    = c(49, 58, 69, 84)
)
bazoule[["icp"]] # Pour afficher le nom, prendre la liste correspondant au nom suffit
mean(bazoule[["a_assistes"]], na.rm = TRUE) # On fait les opération sur le vecteur a_assisté dont extraire une liste ne marcherait pas
bazoule[["a_assistes"]][2] # on extrait à partir du vecteur la valeur à sa position 2

district <- data.frame(
  fs          = c("CSPS Boassa", "CSPS Bazoulé", "CMA Sig-Noghin", "CSPS Kilwin"),
  couverture  = c(0.72, 0.58, 0.91, 0.45),
  population  = c(3200, 1850, 12400, 4100),
  actif       = c(TRUE, TRUE, TRUE, FALSE)
)
district[2, ]

couv<-district$couverture
couv>=0.8
district$objectif <- couv>=0.8
district


fs_data <- data.frame(
  nom        = c("CSPS Boassa", "CSPS Bazoulé", "CMA Sig-Noghin", 
                 "CSPS Kilwin", "CSPS Pissy", "CSPS Tampouy"),
  secteur    = c("rural", "rural", "urbain", "urbain", "urbain", "rural"),
  couverture = c(0.72, 0.58, 0.91, 0.45, 0.83, 0.67),
  population = c(3200, 1850, 12400, 4100, 8900, 2750),
  personnel  = c(3, 2, 8, 2, 5, 3)
)
dim(fs_data)

> fs_data <- data.frame(
  +   nom        = c("CSPS Boassa", "CSPS Bazoulé", "CMA Sig-Noghin", 
                     +                  "CSPS Kilwin", "CSPS Pissy", "CSPS Tampouy"),
  +   secteur    = c("rural", "rural", "urbain", "urbain", "urbain", "rural"),
  +   couverture = c(0.72, 0.58, 0.91, 0.45, 0.83, 0.67),
  +   population = c(3200, 1850, 12400, 4100, 8900, 2750),
  +   personnel  = c(3, 2, 8, 2, 5, 3)
  + )
> dim(fs_data)
[1] 6 5
> str(fs_data)
'data.frame':	6 obs. of  5 variables:
  $ nom       : chr  "CSPS Boassa" "CSPS Bazoulé" "CMA Sig-Noghin" "CSPS Kilwin" ...
$ secteur   : chr  "rural" "rural" "urbain" "urbain" ...
$ couverture: num  0.72 0.58 0.91 0.45 0.83 0.67
$ population: num  3200 1850 12400 4100 8900 2750
$ personnel : num  3 2 8 2 5 3
> summary(fs_data)
nom              secteur            couverture    
Length:6           Length:6           Min.   :0.4500  
Class :character   Class :character   1st Qu.:0.6025  
Mode  :character   Mode  :character   Median :0.6950  
Mean   :0.6933  
3rd Qu.:0.8025  
Max.   :0.9100  
population      personnel    
Min.   : 1850   Min.   :2.000  
1st Qu.: 2862   1st Qu.:2.250  
Median : 3650   Median :3.000  
Mean   : 5533   Mean   :3.833  
3rd Qu.: 7700   3rd Qu.:4.500  
Max.   :12400   Max.   :8.000  
> head(fs_data)
nom secteur couverture population
1    CSPS Boassa   rural       0.72       3200
2   CSPS Bazoulé   rural       0.58       1850
3 CMA Sig-Noghin  urbain       0.91      12400
4    CSPS Kilwin  urbain       0.45       4100
5     CSPS Pissy  urbain       0.83       8900
6   CSPS Tampouy   rural       0.67       2750
personnel
1         3
2         2
3         8
4         2
5         5
6         3
> fs_data$nom[4]
[1] "CSPS Kilwin"
> fs_data$couverture[5]
[1] 0.83
> fs_data[5, 3]
[1] 0.83
> f_data$population > 4000
Error: object 'f_data' not found

> fs_data$population > 4000
[1] FALSE FALSE  TRUE  TRUE  TRUE FALSE
> fs_data[fs_data$population > 4000, 1]
[1] "CMA Sig-Noghin" "CSPS Kilwin"    "CSPS Pissy"    
> fs_data[3, "personnel"]
[1] 8
> fs_data$secteur[secteur == "rural"]
Error: object 'secteur' not found

> fs_data[fs_data$secteur =="rural", "nom"]
[1] "CSPS Boassa"  "CSPS Bazoulé" "CSPS Tampouy"
> fs_data[fs_data$secteur =="urbain", "nom"]
[1] "CMA Sig-Noghin" "CSPS Kilwin"    "CSPS Pissy"  

fs_data$couverture_pct <- fs_data$couverture*100
fs_data
fs_data$alerte <- fs_data$couverture<0.6
fs_data[ , "nom"]
fs_data[fs_data$alerte == TRUE, "nom"]

tapply(fs_data$couverture, fs_data$secteur, mean)

fs_data[order(fs_data$couverture), ]
fs_data[order(-fs_data$couverture), ]


