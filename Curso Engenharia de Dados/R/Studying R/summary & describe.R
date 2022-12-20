# load datasets
library(datasets)

head(iris)

# Summary
summary(iris$Species)       # Categorical variable
summary(iris$Sepal.Length)  # Quantitative variable
summary(iris)               # Entire dataframe


# Describe
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis,
               httr, lubridate, plotly, rio, rmarkdown, shiny,
               stringr, tidyr)

p_load(psych)  # Load psych package (download if needed)

# Describe()

describe(iris$Sepal.Length)
describe(iris)

# clean up
detach('package:datasets', unload = TRUE)


