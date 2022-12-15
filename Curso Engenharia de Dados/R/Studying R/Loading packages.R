# dplyr -> manipulating dataframes
# tidyr -> cleaning up information
# stringr -> For working with String or text information
# lubridate -> For manipulating data information
# httr -> For working with Website data
# ggvis -> Interactiver visualizations
# ggplot2 -> Creating graphics and Data Visualization
# siny -> Creaitng interactive applications for websites
# rio -> Importing and exporting data
# rmarkdown -> For creatingh interactive notebooks or rich documents for sharing informations
# pacman -> One package to load them all. Pacman stands for package manager.

# installing packages
install.packages('pacman')

# Loading packages
require(pacman)   # Confirmation message
library(pacman)   # No message


# By using the following command you can use a function within the packman package
# without actually loading it with the previous commands.
pacman::p_load(dplyr, GGally, ggplot2, ggthemes, ggvis, httr,
               lubridate, plotly, rio, rmarkdown, shiny,
               stringr, tidyr)


library(datasets) # This is a package that comes natively with R, load them this way


# Cleaning up
p_unload(dplyr, tidyr, stringr) # Clear/unload specific packages
p_unload(all) # Clear all add-on packages.
detach('package:datasets', unload = TRUE) # For base
