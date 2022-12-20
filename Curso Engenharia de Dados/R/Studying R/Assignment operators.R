# Assigment operator

# Use '<-' to assing values to a variable. this is read as 'gets'. It can go the 
# other direction '->' and you can use an equals sign '=' but those are generally
# poor form in R

# In R Studio, the shortcut alt + '-' inserts the assignment operator and a space


# Colon operator
# Assigns a number 0 through 10 to x1
x1 <- 0:10
x1

# Descending order
x2 <- 10:0
x2


# seq operator
(x3 <- seq(10))

(x4 <- seq(30, 0, by = -3))


# Enter multiple values with c
(x5 <- c(5, 4, 1, 6,7, 2, 2, 3,8 ,0))



# Scan
x6 <- scan()
x6



# Rep operator
(x7 <- rep(TRUE, 5))


(x8 <- rep(c(TRUE, FALSE), 5))

(x9 <- rep(c(TRUE, FALSE), each =5))




# Clean up
rm(list = ls())
 