# loading datasets
library(datasets)


# taking a sneak peek at what Iris datset has to offer
head(iris)


plot(iris$Species)  # Categorical variable
plot(iris$Petal.Length) # Quantitative variable
plot(iris$Species, iris$Petal.Width)  # Categorical x quantitative
plot(iris$Petal.Length, iris$Petal.Width) # Both quantitative
plot(iris)  # Whole dataframe


# Plot with options
plot(iris$Petal.Length, iris$Petal.Width,
     col= '#cc0000',  # Hex code for datalab.cc red
     pch = 19,  # Use solid circles for points
     main = 'Iris: Petal Length vs Petal Width',
     xlab = 'Petal Length',
     ylab = 'Petal Width')


# Plot formulas
plot(cos, 0, 2*pi)
plot(exp, 1, 5)
plot(dnorm, -3, +3)

# Plot formulas with options
plot(dnorm, -3, +3,
     col = '#cc0000',
     lwd = 4, 
     main = 'Standard Normal Distribution',
     xlab = 'z-scores',
     ylab = 'Density')


detach('package:datasets', unload = TRUE)
