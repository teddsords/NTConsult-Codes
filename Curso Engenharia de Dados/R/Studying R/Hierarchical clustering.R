# Loading packages
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr)

library(datasets)


head(mtcars)
cars <- mtcars[, c(1:4, 6:7, 9:11)]  # Selecting variables, using all rows and selecting columns
head(cars)

# Compute and plot clusters

# Save hierarchical clustering to hc. This code uses pipes from dplyr
hc <- cars %>%  # Get cars data
      dist %>%  # Compute distance/dissimilarity matrix
      hclust    # Compute hierarchical clusters

plot(hc)

# Add box to plot
rect.hclust(hc, k = 2, border = 'gray')
rect.hclust(hc, k = 3, border = 'blue')
rect.hclust(hc, k = 4, border = 'green4')
rect.hclust(hc, k = 5, border = 'darkred')

# clean up
rm(list = ls())
dev.off()
