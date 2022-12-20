# install packages

pacman::p_load(rio)


# CSV
rio_csv <- import('./ImportingData_Datasets/mbb.csv')
head(rio_csv)


# txt
rio_txt <- import('./ImportingData_Datasets/mbb.txt')
head(rio_txt)


# xlsx
rio_xlsx <- import('./ImportingData_Datasets/mbb.xlsx')
head(rio_xlsx)


# Data Viewer
View(rio_csv)


# Reading withou rio
r_txt2 <- read.table('./ImportingData_Datasets/mbb.txt',
                     header = TRUE,
                     sep = '\t')

trends.csv <- read.csv('./ImportingData_Datasets/mbb.csv', header = TRUE)


# clean up
rm(list = ls())
