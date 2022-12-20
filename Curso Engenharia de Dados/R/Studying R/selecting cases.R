library(datasets) # Loading datasets

head(iris)  # Visualizing first rows

hist(iris$Petal.Length) # Creating a historgram for Petal length
summary(iris$Petal.Length)  # Printing out the summary for Petal Length

summary(iris$Species)


# Select by category
hist(iris$Petal.Length[iris$Species == 'versicolor'],
     main = 'Petal Length: Versicolor')

hist(iris$Petal.Length[iris$Species == 'virginica'],
     main = 'Petal Length: Virginica')

hist(iris$Petal.Length[iris$Species == 'Setosa'],
     main = 'Petal Length: Setosa')


# Select by value
hist(iris$Petal.Length[iris$Petal.Length < 2], 
     main = 'Petal Length < 2')

hist(iris$Petal.Length[iris$Species == 'virginica' & iris$Petal.Length < 5.5],
     main = 'Petal Length: Short Virginica')


# Creating subsample
# Format: data[rowx, columns]
# Leave rows of coluimns blank to select all

i.setosa <- iris[iris$Species == 'setosa', ]

head(i.setosa)
summary(i.setosa$Petal.Length)
hist(i.setosa$Petal.Length)

# Clean up
detach('package:datasets', unload = TRUE)
dev.off()
rm(list = ls())
