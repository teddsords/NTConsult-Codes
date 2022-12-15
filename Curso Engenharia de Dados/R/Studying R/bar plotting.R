# Load dataset
library(datasets)


?mtcars  # documentation for mtcars

head(mtcars)  # First 6 lines of the dataset


# bar charts

barplot(mtcars$cyl)  # Not the result we were expecting

# Need a table with frequencies for each category
cylinders <- table(mtcars$cyl)  # Creating table
barplot(cylinders)  # Bar chart
plot(cylinders)

# clean up
detach('package:datasets', unload = TRUE)

rm(list = ls()) # Removing lists from environment

dev.off() # Clearing plots
