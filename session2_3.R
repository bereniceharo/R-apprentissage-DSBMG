fs_data
fs_data$secteur <- factor(fs_data$secteur)
summary(fs_data)
str(fs_data)
levels(fs_data$secteur)
nlevels(fs_data$secteur)
fs_data$secteur[1] <- "periurbain"
fs_data$secteur <- factor(fs_data$secteur, levels = c("rural", "urbain"))
fs_data$secteur
fs_data$secteur[6] <- "rural"

fs_data$performance <- c("moyen", "faible", "élevé", 
                         "faible", "élevé", "moyen")

fs_data$performance <- factor(fs_data$performance,
                              levels = c("faible", "moyen", "élevé"))
summary(fs_data$performance)
