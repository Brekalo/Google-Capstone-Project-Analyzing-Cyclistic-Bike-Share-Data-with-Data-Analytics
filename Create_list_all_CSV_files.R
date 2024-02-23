library(tidyverse)
library(purrr)
library(data.table)

# This script identifies unique stations, processes monthly data to update unknown station names based on proximity, and involves a number of data manipulation tasks

# Create a list of all CSV files in the working directory matching the pattern
all_rides_data_files <- list.files(pattern = "^[0-9]{4}_[0-9]{2}_df\\.csv$", full.names = TRUE)

# Check which files were found
print(all_rides_data_files)

# Read each CSV file and merge into a single dataframe
# Adding error checking to display an appropriate error message
all_rides_df <- map(all_rides_data_files, ~tryCatch(
  read_csv(.x), 
  error = function(e) {
    message("An error occurred while reading the file: ", .x)
    message("Error description: ", e)
    return(NULL)  # Return NULL to avoid stopping the process
  })) %>%
  bind_rows()

# Check the first few rows of the aggregated data
head(all_rides_df)

# Create lists for unique start and end stations, then combine and remove duplicates

# Create a list for start stations
unique_start_stations <- all_rides_df %>%
  select(station_name = start_station_name, 
         station_id = start_station_id, 
         latitude = start_lat, 
         longitude = start_lng) %>%
  distinct()

# Create a list for end stations
unique_end_stations <- all_rides_df %>%
  select(station_name = end_station_name, 
         station_id = end_station_id, 
         latitude = end_lat, 
         longitude = end_lng) %>%
  distinct()

# Merge lists of start and end stations, removing duplicate entries
list_unique_stations <- unique_start_stations %>%
  bind_rows(unique_end_stations) %>%
  distinct()

# Display the first few lines of unique stations and the number of unique stations
head(list_unique_stations)
print(nrow(list_unique_stations), "unique stations found.")

# Save the list of unique stations to a CSV file
write.csv(list_unique_stations, "list_unique_stations.csv", row.names = FALSE)

# Load the list of unique stations
stations_df <- fread('list_unique_stations.csv')

# Function to find the closest station based on latitude and longitude
find_closest_station <- function(lat, lng, stations_df) {
  distances <- sqrt((stations_df$latitude - lat)^2 + (stations_df$longitude - lng)^2)
  closest_idx <- which.min(distances)
  return(stations_df[closest_idx, ])
}

# Function to process a single monthly file
process_monthly_data <- function(file_path, stations_df) {
  rides_df <- fread(file_path)

  # Update unknown start and end station names with the closest station
  for (index in 1:nrow(rides_df)) {
    # Print progress every 1000 rows
    if (index %% 1000 == 0) {
      cat("Processing row", index, "in", file_path, "...\n")
    }

    if (rides_df$start_station_name[index] == 'UNKNOWN START STATION NAME') {
      closest_station <- find_closest_station(rides_df$start_lat[index], rides_df$start_lng[index], stations_df)
      rides_df[start_station_name := closest_station$station_name, on = .I[index]]
      rides_df[start_station_id := closest_station$station_id, on = .I[index]]
    }

    if (rides_df$end_station_name[index] == 'UNKNOWN END STATION NAME') {
      closest_station <- find_closest_station(rides_df$end_lat[index], rides_df$end_lng[index], stations_df)
      rides_df[end_station_name := closest_station$station_name, on = .I[index]]
      rides_df[end_station_id := closest_station$station_id, on = .I[index]]
    }
  }

  # Save the updated DataFrame
  updated_file_path <- sub('.csv', '_update.csv', file_path)
  fwrite(rides_df, updated_file_path)
  cat("Completed processing for", file_path, "\n")
}

# Process each monthly file
monthly_files <- list.files(pattern = "^[0-9]{4}_[0-9]{2}_df\\.csv$")

# Processing each monthly document
walk(monthly_files, ~process_monthly_data(.x, stations_df))
