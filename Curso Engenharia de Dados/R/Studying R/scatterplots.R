# load datasets
library(datasets)

head(mtcars)


# Plots for checking univariate distributions
hist(mtcars$wt)
hist(mtcars$mpg)


# Basic X-Y plot for two quantitative variables
plot(mtcars$wt, mtcars$mpg)

# Some options
plot(mtcars$wt, mtcars$mpg,
     pch = 19,
     cex = 1.5,
     col = 'red',
     main = 'MPG as a function of Wights of Cars',
     xlab = 'Weights (in 1000 pounds)',
     ylab = 'MPG')

# clean up
detach('package:datasets', unload = TRUE)

dev.off()
