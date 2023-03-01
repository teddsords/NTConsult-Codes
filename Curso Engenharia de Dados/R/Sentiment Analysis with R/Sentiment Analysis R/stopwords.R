install.packages('pacman')

library('pacman')

p_load('tm', 'dplyr')

stopwords_df <- data.frame(word = c(stopwords('pt')))

stopwords_df

stopwords_python <- read.csv("D:/OneDrive - NTCONSULT/NTConsult-Codes/Curso Engenharia de Dados/R/Sentiment Analysis with R/Linkedin-Profile-Scraper-main/stopwords_pt.csv")

stopwords_python

dif <- anti_join(stopwords_python, stopwords_df, by= 'word')
dif
