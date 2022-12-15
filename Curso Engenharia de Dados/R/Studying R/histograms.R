# loading dataset
library(datasets)


?iris
head(iris)


# Histograms
hist(iris$Sepal.Width)
hist(iris$Sepal.Length)
hist(iris$Petal.Length)
hist(iris$Petal.Width)

# Put 3 graphs in 3 rows and 1 column
par(mfrow = c(3,1))

hist(iris$Petal.Width [iris$Species == 'setosa'],
     xlim = c(0,3),
     breaks = 9,
     main = 'Petal width for Setosa',
     xlab = '',
     col = 'red')

hist(iris$Petal.Width [iris$Species == 'versicolor'],
     xlim = c(0,3),
     breaks = 9,
     main = 'Petal width for Versicolor',
     xlab = '',
     col = 'purple')

hist(iris$Petal.Width [iris$Species == 'virginica'],
     xlim = c(0,3),
     breaks = 9,
     main = 'Petal width for Virginica',
     xlab = '',
     col = 'blue')

# Restore graphic parameter
par(mfrow = c(1,1))


# clean up
detach('package:datasets', unload = TRUE)
