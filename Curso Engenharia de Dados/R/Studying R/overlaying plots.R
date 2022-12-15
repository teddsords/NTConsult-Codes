# Loaed datasets
library(datasets)

# documentation
?lynx

# Sneak peek at the first rows
head(lynx)

# Default histogram
hist(lynx)

# Tweaking plot
hist(lynx, 
     breaks = 14,  # Suggests 14 bins
     freq = FALSE, # Axis shows density, not freq
     col = 'thistle1',  # Color for Histogram
     main = paste('Histogram of Anual Canadian Lynx', 
                  'Trappings, 1821-1934'),
     xlab = 'Number of Lynx Trapped')

# Add normal distribution
curve(dnorm(x, mean = mean(lynx), sd = sd(lynx)),  # Calculating the mean and standard deviation of Lynx dataset
      col = 'thistle4',  # Color of curve
      lwd = 2,  # Line width of 2 pixels
      add = TRUE)  # Superimpose on previous graph


# Add two kernel density estimators
lines(density(lynx), col = 'blue', lwd = 2)
lines(density(lynx, adjust = 3), col = 'purple', lwd = 2)

# Clean up
detach('package:datasets', unload = TRUE)
dev.off()
