
library(lubridate)
options(digits = 3)    # 3 significant digits


library(dslabs)
data(brexit_polls)

# Filter polls with a start date in April
april_polls <- subset(brexit_polls, lubridate::month(startdate) == 4)

# Count the number of April polls
num_april_polls <- nrow(april_polls)

# Display the number of April polls
print(num_april_polls)


# Convert enddate to Date format
brexit_polls$enddate <- as.Date(brexit_polls$enddate)

# Round enddate to the nearest week
rounded_enddate <- lubridate::round_date(brexit_polls$enddate, unit = "week")

# Count the number of polls ending in the week of 2016-06-12
num_polls_20160612 <- sum(rounded_enddate == as.Date("2016-06-12"))

print(num_polls_20160612)



# Convert enddate to Date format
brexit_polls$enddate <- as.Date(brexit_polls$enddate)

# Get the weekdays of the enddate
poll_weekdays <- weekdays(brexit_polls$enddate)

# Count the occurrences of each weekday
weekday_counts <- table(poll_weekdays)

# Find the weekday with the greatest number of polls ending
max_weekday <- names(weekday_counts)[which.max(weekday_counts)]

print(max_weekday)

data(movielens)

# Convert timestamp column to dates
movielens$date <- as_datetime(movielens$timestamp, origin = "1970-01-01")

# Extract the hour of the day
movielens$hour <- hour(movielens$date)

# Count the occurrences of each hour
hour_counts <- table(movielens$hour)

# Find the hour with the most movie reviews
max_hour <- names(hour_counts)[which.max(hour_counts)]

print(max_hour)

# Extract the year
movielens$year <- year(movielens$date)

# Count the occurrences of each year
year_counts <- table(movielens$year)

# Find the year with the most movie reviews
max_year <- names(year_counts)[which.max(year_counts)]

print(max_year)
