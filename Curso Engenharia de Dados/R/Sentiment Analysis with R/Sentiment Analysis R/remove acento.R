install.packages('pacman')
library('pacman')

p_load('tm', 'dplyr')

stopwords_python <- read.csv("D:/OneDrive - NTCONSULT/NTConsult-Codes/Curso Engenharia de Dados/R/Sentiment Analysis with R/Linkedin-Profile-Scraper-main/stopwords_pt.csv")

stopwords_python


fa <- function(x) iconv(x, to = 'ASCII//TRANSLIT')

fa(c('pelé', 'época'))


stopwords_python_sem_acento <- lapply(stopwords_python, iconv, to= 'ASCII//TRANSLIT')
stopwords_python_sem_acento
