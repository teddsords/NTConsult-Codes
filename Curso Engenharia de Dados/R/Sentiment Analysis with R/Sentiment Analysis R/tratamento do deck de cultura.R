library(pacman)

pacman::p_load(tm, dplyr, wordcloud, stringr, tidyverse, tidytext, tibble)   # Carregando bibliotecas

a <- readLines("deck de cultura.txt", encoding = 'UTF-8') # Lendo o deck de cultura   -> function from base

deck_cultura_df <- tibble(line = 1:134, text= a)  # Creating a tibble with row number and text

deck_cultura_df$text <- deck_cultura_df$text %>%                    # Entering text as a parameter for pipe operator
                   lapply(tolower) %>%                              # Applying tolower function to all rows in tibble
                   lapply(gsub, pattern = '\\W', replace = ' ') %>% # Applying gsub for removing punctuations
                   lapply(gsub, pattern = '\\d', replace = '') %>%  # Applying gsub for removing digits
                   lapply(tm::removeWords, stopwords('pt')) %>%     # Removing stopwords using tm's removeWords function
                   lapply(iconv, to = 'ASCII//TRANSLIT') %>%        # Removing Portguese accents
                   lapply(removeWords, stopwords('pt')) %>%         # Removing stop words again due to accent removal
                   lapply(tm::stripWhitespace)                      # Removing white spaces using a tm's function
                   

corpus <- deck_cultura_df %>% tidytext::unnest_tokens(word, text)   # Creating corpus by separating each word into a new line using a tidytext function
conta <- corpus %>% dplyr::count(word, sort = T)                    # Counting word appearances to obtain most important terms using a dplyr function

wordcloud::wordcloud(deck_cultura_df, random.order = FALSE, col = rainbow(4),  
          scale = c(2, 0.6), max.words = 25)                        # Creating a word cloud using a wordcloud function

bigrams <- deck_cultura_df %>% 
           unnest_tokens(output = word, input = text, token = 'ngrams', n = 2) %>%
           separate(word, c('word1', 'word2'), sep = ' ') %>%
           filter(!word1 %in% stopwords('pt')) %>%
           filter(!word2 %in% stopwords('pt')) %>%
           unite(word, word1, word2, sep = ' ', na.rm = TRUE) %>%
           dplyr::count(word, sort = T) 


dictionary <- tibble(line = 1:25,
                     text = conta$word[1:25])
dictionary <- dictionary %>%
              tibble::add_row(line = 26:36,
                                  text = bigrams$word[1:11])
dictionary <- dictionary %>%
              filter(!row_number() %in% c(27))

dictionary <- dictionary %>% tibble::add_column(value = 0)


dictionary$value[26:35] <- 5    # Setting a value of 5 for positive sentiment

dictionary$value[1:25] <- floor(runif(25, min = 0, max = 4))    # Creating random positive sentiment





