install.packages("tidyverse")
library(tidyverse)
library(purrr)

# Created a list of all CSV files in the working directory
all_rides_data_files <- list.files(pattern = "^[0-9]{4}_[0-9]{2}_df\\.csv$", full.names = TRUE)

# Checking which files were found
print(all_rides_data_files)

# Read each CSV file and merge into a single data frame
# The error checking step is also added, and the appropriate error message is displayed
# head(all_rides_df) function checked the first few rows of the aggregated data 
all_rides_df <- map(datoteke, ~tryCatch(read_csv(.x), 
                                        error = function(e) {
                                          message("During file reading, an error occurred: ", .x)
                                          message("Description of the error: ", e)
                                          return(NULL)
                                        })) %>%
  bind_rows()

head(all_rides_df)
