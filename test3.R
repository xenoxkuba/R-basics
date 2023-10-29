# Load the required libraries
library(rvest)

# Define the URL
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"

# Read the HTML from the Wikipedia page
page <- read_html(url)

# Extract all the tables from the page
tables <- html_nodes(page, "table")

# Find the first table that has 9 columns where the first column is named "Date(s) conducted"
table_number <- NA
for (i in 1:length(tables)) {
  table <- html_table(tables[[i]], fill = TRUE)
  if (!is.null(table) && ncol(table) >= 9 && "Date(s) conducted" %in% colnames(table)[1:9]) {
    table_number <- i
    break
  }
}

# Print the table number
print(table_number)