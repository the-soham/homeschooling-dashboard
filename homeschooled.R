library(flexdashboard)
library(lubridate)
library(dplyr)
library(ggplot2)
library(ggstance)
library(ggalt)
library(plotly)
#library(scales)

# Read the dataset
schools <- read.csv('https://raw.githubusercontent.com/washingtonpost/data_home_schooling/main/home_school_district.csv')

# Remove the second column (you mentioned -2)
schools <- schools[, -2]

# Function to extract the first year from the academic year
extract_first_year <- function(academic_year) {
  first_year <- as.numeric(strsplit(academic_year, "-")[[1]][1])
  return(first_year)
}

# Apply the extraction function to the 'year' column
schools$year <- sapply(schools$year, extract_first_year)
schools$homeschool_students[is.na(schools$homeschool_students)] <- 0

str(schools)
# Group by year and calculate the sum of homeschool_students
schools_summarized <- schools %>%
  group_by(year) %>%
  summarise(total_homeschool_students = sum(homeschool_students, na.rm = TRUE))


str(schools_summarized)

p <- ggplot(schools_summarized, aes(x = year, y = total_homeschool_students)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  labs(title = "Trend Chart of Homeschooled Children Over the Years",
       x = "Year",
       y = "Total Homeschooled Children (in k)") +
  scale_y_continuous(labels = scales::label_number_si(scale = 1e-3)) +
  theme_minimal()

# Convert ggplot to interactive plot using plotly
p <- ggplotly(p)

p


library(dplyr)

# Assuming your data frame is named 'schools'
top_states <- schools %>%
  group_by(state) %>%
  summarise(total_homeschool_students = sum(homeschool_students, na.rm = TRUE)) %>%
  arrange(desc(total_homeschool_students)) %>%
  head(5)

# Print the top ten states
print(top_states)
bar_chart <- ggplot(top_states, aes(x = reorder(state, -total_homeschool_students), y = total_homeschool_students)) +
  geom_bar(stat = "identity", fill = "#3498db", color = "black") +
  labs(x = "State",
       y = "Total Homeschooled Children") +
  scale_y_continuous(labels = scales::label_number(scale = 1e-3, suffix = "k")) + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability

bar_chart = ggplotly(bar_chart)

bar_chart


all_districts <- unique(schools$lea_name)
all_districts

str(all_districts)
str(schools)