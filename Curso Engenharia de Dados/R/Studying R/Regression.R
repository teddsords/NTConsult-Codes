pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr)

library(datasets)

# Getting info about dataset
?USJudgeRatings
head(USJudgeRatings)
data <- USJudgeRatings

# Define variable groups
x <- as.matrix(data[-12])  # Use al columns execept 12
y <- data[, 12]


# Regression with simultaneous entry

# Using variable groups
reg1 <- lm(y ~ x)


# Results
reg1
summary(reg1)


# More summaries
anova(reg1)
coef(reg1)
confint(reg1)
resid(reg1)
hist(residuals(reg1))


# Additional models
p_load(lars, caret)

stepwise <- lars(x, y, type = 'stepwise')

forward <- lars(x, y, type = 'forward.stagewise')

# LAR: Least Angle Regression
lar <- lars(x,y, type = 'lar')


# LASSO
lasso <- lars(x, y, type = 'lasso')


r2compt <- c(stepwise$R2[6], forward$R2[6],
             lar$R2[6], lasso$R2[6]) %>% round(2)

names(r2compt) <- c('stepwise', 'forward', 'LAR', 'Lasso')

r2compt
