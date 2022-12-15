library(datasets) # Loading datasets available in R

head(iris)  # Printing the top 6 lines in console
summary(iris) # Printing a summary of the dataset, created automatically by R
plot(iris)  # Plotting the dataset

# Cleaning up
detach('package:datasets', unload = TRUE)

# Clear plots
dev.off()
