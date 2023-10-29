library(rvest)
library(tidyverse)
library(stringr)
library(conflicted)

conflict_prefer("filter", "dplyr")
conflict_prefer("guess_encoding", "readr")
conflict_prefer("lag", "dplyr")

url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054" # nolint
tab <- read_html(url) %>% html_nodes("table")
polls <- tab[[6]] %>% html_table(fill = TRUE)

colnames(polls) <- c("dates", "remain", "leave", "undecided", "lead", "samplesize", "pollster", "poll_type", "notes") # nolint

polls_filtered <- polls[str_detect(polls$remain, "%"), ]

num_rows <- nrow(polls_filtered)

print(num_rows)

polls$undecided <- str_replace(polls$undecided, "(?i)N/A", "0")
