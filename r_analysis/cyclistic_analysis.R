# -----------------------------------------------------
# PHASE 1: LOAD REQUIRED PACKAGES
# -----------------------------------------------------

library(tidyverse)   # data wrangling + import
library(lubridate)   # date-time handling
library(janitor)     # clean column names


# -----------------------------------------------------
# PHASE 2: IMPORT RAW DATA
# -----------------------------------------------------

# Folder containing all 12 CSV files
data_path <- "Raw_CSVs/"

# List CSV files inside the folder
files <- list.files(data_path, pattern = "\\.csv$", full.names = TRUE)

# Read all CSVs and combine
raw_list <- lapply(files, read_csv)
df <- bind_rows(raw_list)


# -----------------------------------------------------
# PHASE 3: CLEANING THE DATA
# -----------------------------------------------------

df <- df %>%
  clean_names() %>%       # standardize column names
  
  # Create ride_length (in minutes)
  mutate(
    ride_length = as.numeric(difftime(ended_at, started_at, units = "mins"))
  ) %>%
  
  # Remove rows with invalid ride_length values (rare in new datasets)
  filter(!is.na(ride_length)) %>%
  
  # Remove exact duplicate rows (safe)
  distinct() %>%
  
  # Add weekday labels
  mutate(
    day_of_week = wday(started_at, label = TRUE)
  )


# -----------------------------------------------------
# PHASE 4: ANALYSIS + VISUALIZATION (ALL-IN-ONE BLOCK)
# -----------------------------------------------------

# Formatting / display helpers
options(scipen = 999)          # disable scientific notation globally
library(scales)                # for comma() label formatting

# ---------- 4.1 Total rides by user type ----------
ride_counts <- df %>%
  count(member_casual) %>%
  arrange(desc(n))

# Plot: total rides (readable y-axis)
ride_counts %>%
  ggplot(aes(x = member_casual, y = n, fill = member_casual)) +
  geom_col(show.legend = FALSE) +
  scale_y_continuous(labels = comma) +
  labs(title = "Total Rides: Members vs Casual Riders",
       x = "User Type",
       y = "Number of Rides") +
  theme_minimal(base_size = 14)

# ---------- 4.2 Average ride length by user type ----------
ride_length_summary <- df %>%
  group_by(member_casual) %>%
  summarise(
    avg_ride = mean(ride_length, na.rm = TRUE),
    median_ride = median(ride_length, na.rm = TRUE),
    max_ride = max(ride_length, na.rm = TRUE),
    .groups = "drop"
  )

ride_length_summary

# Plot: average ride length
ride_length_summary %>%
  ggplot(aes(x = member_casual, y = avg_ride, fill = member_casual)) +
  geom_col(show.legend = FALSE) +
  scale_y_continuous(labels = comma) +
  labs(title = "Average Ride Length by User Type",
       x = "User Type",
       y = "Average Ride Length (mins)") +
  theme_minimal(base_size = 14)

# ---------- 4.3 Ride length distribution (0-60 mins for readability) ----------
df %>%
  filter(!is.na(ride_length), ride_length <= 60) %>%
  ggplot(aes(x = ride_length, fill = member_casual)) +
  geom_histogram(bins = 50, alpha = 0.6, position = "identity") +
  scale_y_continuous(labels = comma) +
  labs(title = "Ride Length Distribution (0–60 mins)",
       x = "Ride Length (minutes)",
       y = "Count") +
  theme_minimal(base_size = 13)

# ---------- 4.4 Rides by day of week ----------
# ensure day_of_week exists and is ordered Mon-Sun
if (!"day_of_week" %in% names(df)) {
  df <- df %>% mutate(day_of_week = wday(started_at, label = TRUE, abbr = TRUE))
}

df %>%
  count(member_casual, day_of_week) %>%
  ggplot(aes(x = day_of_week, y = n, fill = member_casual)) +
  geom_col(position = "dodge") +
  scale_y_continuous(labels = comma) +
  labs(title = "Rides by Day of Week",
       x = "Day of Week",
       y = "Number of Rides") +
  theme_minimal(base_size = 13)

# ---------- 4.5 Monthly trends (ordered months) ----------
# create ordered month factor (Jan..Dec)
df <- df %>%
  mutate(month = factor(format(started_at, "%b"),
                        levels = month.abb,
                        ordered = TRUE))

df %>%
  count(member_casual, month) %>%
  ggplot(aes(x = month, y = n, fill = member_casual)) +
  geom_col(position = "dodge") +
  scale_y_continuous(labels = comma) +
  labs(title = "Rides by Month",
       x = "Month",
       y = "Ride Count") +
  theme_minimal(base_size = 13)

# ---------- 4.6 Top 10 start stations (remove NA rows) ----------
top_stations <- df %>%
  filter(!is.na(start_station_name) & start_station_name != "") %>%
  count(start_station_name, sort = TRUE) %>%
  slice_head(n = 10)

top_stations %>%
  ggplot(aes(x = reorder(start_station_name, n), y = n)) +
  geom_col(fill = "#69b3a2") +
  scale_y_continuous(labels = comma) +
  coord_flip() +
  labs(title = "Top 10 Most Popular Start Stations",
       x = "Station Name",
       y = "Number of Rides") +
  theme_minimal(base_size = 13)





