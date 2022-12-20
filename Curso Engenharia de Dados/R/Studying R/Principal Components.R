pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr)

library(datasets)

cars <- mtcars[, c(1:4, 6:7, 9:11)]


# Compute PCA

# For entire data frame
pc <- prcomp(cars, 
             center = TRUE, # Centers means to 0 (optional)
             scale = TRUE)  # Sets unit variance (helpful)

summary(pc)

plot(pc)

# get standard deviations and rotation
pc

# See how cases load on Pcs
predict(pc) %>% round(2)


biplot(pc)


rm(list = ls())
dev.off()
