library(tidyverse)
library(gutenbergr)
library(tidytext)

# Search for "Pride and Prejudice" in the gutenberg_metadata dataset
pride_and_prejudice_ids <- gutenberg_metadata %>%
  filter(str_detect(title, "Pride and Prejudice"))

# Get the number of different ID numbers returned
num_ids <- n_distinct(pride_and_prejudice_ids$gutenberg_id)

print(num_ids)

library(tidyverse)
library(gutenbergr)

# Filter the gutenberg_works table for English language works
english_works <- gutenberg_works() %>%
  filter(language == "en")

# Search for "Pride and Prejudice" in the filtered table
pride_and_prejudice <- english_works %>%
  filter(str_detect(title, "Pride and Prejudice"))

# Get the ID number for "Pride and Prejudice"
id_number <- pride_and_prejudice$gutenberg_id

print(id_number)

# Download the text for "Pride and Prejudice"
book <- gutenberg_download(1342)

# Create a tidy table with all the words in the text
words <- book %>%
  unnest_tokens(word, text)

# Count the number of words in the book
num_words <- nrow(words)
print(num_words)


# Remove stop words from the words object
words_without_stopwords <- words %>%
  anti_join(stop_words, by = c("word" = "word"))

# Count the number of remaining words
num_remaining_words <- nrow(words_without_stopwords)

print(num_remaining_words)

# Remove stop words from the words object
words_without_stopwords <- words %>%    
  anti_join(stop_words, by = c("word" = "word"))

# Filter out tokens containing a digit
filtered_words <- words_without_stopwords %>%
  filter(!str_detect(word, "\\d"))

# Count the number of remaining words
num_remaining_words2 <- nrow(filtered_words)
print(num_remaining_words2)


# Remove stop words from the words object
words_without_stopwords <- words %>%
  anti_join(stop_words, by = c("word" = "word"))

# Filter out tokens containing a digit
filtered_words <- words_without_stopwords %>%
  filter(!str_detect(word, "\\d"))

# Count the frequency of each word
word_frequency <- filtered_words %>%
  count(word, sort = TRUE)

# Find the number of words that appear more than 100 times
num_words_over_100 <- word_frequency %>%
  filter(n > 100) %>%
  nrow()

# Find the most common word and its frequency
most_common_word <- word_frequency$word[1]
most_common_word_frequency <- word_frequency$n[1]

print(num_words_over_100)
print(most_common_word)
print(most_common_word_frequency)

