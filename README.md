<sup>*Data analysis code and documentation for Cyclistic's bike share data is contained in this repository.
There are several phases to the project, from data analysis to data visualization to recommendations, and this README summarizes each phase.*</sup>

# Data Analytics Capstone Project: Cyclistic Bike Sharing Analysis
**Case Study: How Does a Bike-Share Navigate Speedy Success?** <br>
<sub>*by Vesna M. Brekalo*</sub> <br>
<sub>*February, 23 2024*</sub>

## :white_large_square: FOREWORD
I completed a case study on **Cyclistic** bike-share for my Google Data Analytics certification, inspired by my passion for cycling. This project, my first in analytics, explores the differences between casual and member riders following Google's framework: **Ask**, **Prepare**, **Process**, **Analyze**, **Share**, **Act**. Check out [my data visualizations here](https://www.linkedin.com/in/vesna-marija-brekalo).

> **Table of Contents:**
> * [**INTRODUCTION**](https://github.com/Brekalo/Google-Capstone-Project-Analyzing-Cyclistic-Bike-Share-Data-with-Data-Analytics/blob/main/README.md#white_large_square-introduction)
>   * Project Overview and Context 
> * [**ASK**](https://github.com/Brekalo/Google-Capstone-Project-Analyzing-Cyclistic-Bike-Share-Data-with-Data-Analytics/blob/main/README.md#white_large_square-ask)
>   * Business Goals and Objectives 
>   * Defining the Analytical Task 
>   * Identifying Key Stakeholders 
> * [**PREPARE**](https://github.com/Brekalo/Google-Capstone-Project-Analyzing-Cyclistic-Bike-Share-Data-with-Data-Analytics/blob/main/README.md#white_large_square-prepare)
>   * Data Sourcing and Initial Exploration 
> * [**PROCESS**](https://github.com/Brekalo/Google-Capstone-Project-Analyzing-Cyclistic-Bike-Share-Data-with-Data-Analytics/blob/main/README.md#white_large_square-process)
>   * Data Cleaning and Preprocessin 
> * [**ANALYZE & SHARE**](https://github.com/Brekalo/Google-Capstone-Project-Analyzing-Cyclistic-Bike-Share-Data-with-Data-Analytics/blob/main/README.md#white_large_square-analyze--share)
>   * Ride Volume Analysis 
>   * Average Ride Duration Insights 
>   * Bike Type Preferences 
>   * Temporal Usage Patterns 
>   * Station Popularity Metrics
> * [**ACT**](https://github.com/Brekalo/Google-Capstone-Project-Analyzing-Cyclistic-Bike-Share-Data-with-Data-Analytics/blob/main/README.md#white_large_square-act)
>   * Strategic Recommendations for Action

## :white_large_square: INTRODUCTION
**Cyclistic**, founded in 2016, operates a vast fleet of over 16,500 bicycles covering 190 square miles in Chicago. The bikes, strategically located across 800 stations in the city, cater to urban riders with diverse heights and abilities, boasting a design focused on comfort and stability. Users can unlock bikes at any station and return them to any other station at their convenience.

Initially, Cyclistic's marketing aimed at raising general awareness and appealing to a diverse audience with various pricing plans: single-ride passes, full-day passes, and annual memberships. Casual riders are those opting for short-term passes, whereas annual memberships are purchased by Cyclistic members.

Financial analysis indicates annual members generate more profit than casual riders. To capitalize on this, Moreno, Cyclistic's director of marketing, prioritizes converting casual riders into members rather than attracting new customers. The strategy revolves around understanding the differences between these groups, why casual riders might switch to memberships, and the role of digital media in marketing.

Maximizing annual memberships is key to Cyclistic's future success, prompting Moreno's team to analyze historical trip data to uncover trends. As their recommendations necessitate executive approval, they must provide compelling data insights and professional visualizations.

## :white_large_square: ASK
**Business Objective:**
Develop effective marketing strategies to convert casual riders into annual members.

To **achieve** this **objective**, the future marketing program will address the following three pivotal **questions**:
> 1. How do annual members and casual riders use Cyclistic bikes differently?
> 2. Why would casual riders buy Cyclistic annual memberships?
> 3. How can Cyclistic leverage digital media to encourage casual riders to transition into annual members?

**Key Stakeholders:**
- Lily Moreno: Director of the marketing team and my supervisor.
- Cyclistic executive team.

## :white_large_square: PREPARE
### Data Collection and Sources

For this case study, we utilize data from Divvy, a real bike share company operating in Chicago, as a proxy for the fictional company Cyclistic.

These datasets are publicly available through Motivate International Inc. [under a specified license](https://divvybikes.com/data-license-agreement) and can be accessed for [download here](https://divvy-tripdata.s3.amazonaws.com/index.html).<br>
The data is released monthly and is characterized by being anonymized, reliable, original, comprehensive, up-to-date, and properly cited.

<details><summary>"Divvy-tripdata" bucket information</summary>
   <img src="img_divvy/Screenshot 2024-01-04 at 12.17.27.png" width="750" align="center">
</details>

In this study, we have analyzed historical travel data from 12 separate CSV files, each corresponding to a month within the period from December 2022 to November 2023. The collective dataset encompasses a total of 5,676,710 recorded trips.<br>

The dataset is structured into 13 distinct columns, or variables, which include:
   
| No. | Description                            | Column Name      | Type           |
|----:|:----------------------------------------|:------------------|:-------------|
|   1 | Unique identifier for each trip:        | `ride_id`         | String       |
|   2 | Type of bicycle:                        | `rideable_type`   | String       |
|   3 | Start timestamp of the ride:            | `started_at`      | Date & Time  |
|   4 | End timestamp of the ride:              | `ended_at`        | Date & Time  |
|   5 | Name of the starting station:           | `start_station_name` | String    |
|   6 | Identifier for the starting station:    | `start_station_id`   | String    |
|   7 | Name of the ending station:             | `end_station_name`   | String    |
|   8 | Identifier for the ending station:      | `end_station_id`     | String    |
|   9 | The latitude of the starting station:   | `start_lat`          | Numeric   |
|  10 | The longitude of starting station:      | `start_lng`          | Numeric   |
|  11 | The end station's latitude:             | `end_lat`            | Numeric   |
|  12 | The longitude of the end station:       | `end_lng`            | Numeric   |
|  13 | Indicates whether the rider is a casual or a member: | `member_casual` | String   |

While the dataset did not come with an accompanying metadata file, the variables are intuitively named and can be understood without additional context.

The data categorizes riders into two main groups: 
- Casual riders, who typically utilize single rides or day passes 
- Cyclistic members, who are characterized by their annual memberships

This categorization is pivotal for understanding different usage patterns and guiding business strategies.

#### Divvy [Pricing](https://divvybikes.com/pricing) Summary

<img src="img_divvy/divvy_plans.jpg" width="550" align="center">

- **Single Ride**: \$3.30 for up to 30 minutes, with a \$0.15 per minute overage charge.
- **Daily Pass**: \$15 for 24-hour access with unlimited classic bike rides up to 3 hours each; overage cost is \$0.15 per minute for rides over 3 hours.
- **E-Bike Single Ride**: \$3.30 with an additional \$0.20 per minute while in use.
- **Annual Membership**: \$9 monthly for unlimited 45-minute rides; rides exceeding this duration incur a \$0.16 per minute overage fee.
- **Lost/Stolen Bike Fee**: A penalty of \$1200.
- **Cycling for Everyone (C4E)**: A program for eligible residents offering a \$5 annual membership with specific rates and credits for e-bike use.
- **Miscellaneous Fees**: E-bikes can be parked at public racks within the service area for \$1, with a \$25 fine for parking violations or if parked outside the service area.

### Tools Utilized for Defining Objectives and Analysis
- Excel: Employed for the initial data cleaning and review process.
- RStudio Desktop: Used for in-depth data analysis and scripting in R.
- Tableau: Leveraged for creating interactive and informative data visualizations.

The analysis commenced with the meticulous cleaning and scrutiny of the dataset in Excel. Subsequently, RStudio Desktop was utilized to conduct detailed data analysis through R scripting. For the visual representation of the insights, Tableau served as the primary tool, enabling the creation of clear and engaging visualizations.

## :white_large_square: PROCESS
The data preparation phase was crucial for ensuring the integrity of the subsequent analysis. This phase involved:

1. **Data Cleaning**: Errors, duplicates, blanks, null values, and outliers were meticulously removed to maintain data quality.

2. **Feature Engineering**: New columns were generated for in-depth temporal analysis. These included `starting_at_date`, `starting_at_time`, `ending_at_date`, and `ending_at_time`, extracted from the `started_at` and `ended_at` timestamps. The `ride_length` was recorded in both minutes and seconds, and `day_of_week` was cataloged to map the ride's start day.

3. **Handling Missing Information**: Blanks in `start_station_name` and `end_station_name` were standardized to 'UNKNOWN START STATION NAME' and 'UNKNOWN END STATION NAME', accounting for **2.425%** of the dataset. 

4. **Standardizing Station Names**: Anomalies such as additional characters in station names were present in **1.7339%** of rows. These were rectified by removing non-essential characters like asterisks and designations (e.g., '(Temp)', 'Test', city or public rack indicators).

5. **Data Validation**: Rides with illogical durations were excluded, along with those under 2 minutes, which constituted **3.5085%** of the total data.

6. **Reconciling Unknown Stations**: The dataset contained **1791716** cells with 'UNKNOWN' station identifiers, equivalent to **2.4275%** of the data. Utilizing latitude and longitude details, a `list_unique_stations.csv` document facilitated the accurate attribution of station names.

The comprehensive analysis revealed that **5.2533%** of the dataset was incomplete, with **3.5113%** necessitating removal to ensure analytical accuracy.

### Setting up the programming environment

Installing essential packages and libraries for data cleaning and analysis included installing the `tidyverse` package and the `data.table` package, and subsequently, their libraries were also loaded *(details given below)*.

<details><summary>Check out the Loaded Libraries</summary>
   
| Load Packages         | Description     |
|:-----------------------|:-------------------------------------------------------------------------------------------------------------------|
| `library(tidyverse)`  | A collection of R packages that provide versatile tools for data manipulation, visualization, and analysis.         |
| `library(dplyr)`      | Specialized in data manipulation, providing a set of functions for efficiently modifying and analyzing data frames. |
| `library(tidyr)`      | Focuses on transforming data to a tidy format, making it more suitable for analysis.    |
| `library(readr)`      | Optimized for reading data from various file types, facilitating easy data import.      |
| `library(tibble)`     | Enhances data frames, offering a user-friendly approach to data frame creation and manipulation. |
| `library(lubridate)`  | Simplifies working with dates and times, providing functions that make it easier to parse, manipulate, and do calculations with date-time objects. |
| `library(hms)`        | Designed for easy handling and formatting of time data, complementing the `lubridate` package.  |
| `library(purrr)`      | Enhances functional programming in R, offering tools for iterating over data and simplifying complex operations with lists and vectors. It is particularly useful for executing the same function across multiple elements or datasets and working with list-columns in data frames.  |
| `library(data.table)` | Offers high-performance data manipulation and analysis, suitable for large datasets. Also, it's highly efficient for exporting data frames to various formats. |
   
</details>

### Combined all 12 spreadsheets (months) into a single file, all_rides_df_clean.csv
<img src="img_details/tidyverse.png" width="850" align="center">

```
# Load necessary libraries
library(purrr)   # For map_df()
library(readr)   # For read_csv()

# Creating a single dataframe 'all_rides_df_clean.csv' from twelve cleaned CSV files ('YYYY_MM_df_update_clean.csv')

# Merging all cleaned files
# List all files matching the pattern of cleaned CSV files
all_cleaned_files <- list.files(pattern = "^[0-9]{4}_[0-9]{2}_df_update_clean\\.csv$", full.names = TRUE)

# Use map_df to read each file and combine them into one dataframe
all_rides_df_clean <- map_df(all_cleaned_files, read_csv)

# Save the aggregated data to a CSV file without row names
write.csv(all_rides_df_clean, "all_rides_df_clean.csv", row.names = FALSE)

```
<img src="img_details/specificationa.png" width="850" align="center">

**An essential step in data analysis is ensuring the data's cleanliness and readiness for further analysis. The following procedures are applied to the `all_rides_df_clean.csv` data frame, each accompanied by a screenshot for visual reference:**

1. **Overview of `all_rides_df_clean.csv`**: Obtain an overview of the data frame, including the total number of rows, columns, and cells.
   <details>
      <img src="img_details/overview_of_all_rides_df_clean.png" width="500" align="center">
   </details>

2. **Previewing Data**: Use the `head()` function to display the first few rows of the data frame, providing an initial glimpse into the dataset.
   <details>
      <img src="img_details/previewing_data.png" width="900" align="center">
   </details>

3. **Understanding Data Structure**: Examine the data structure and its characteristics, including data types of each column.
   <details>
      <img src="img_details/data_structure.png" width="900" align="center">
   </details>

4. **Identifying Outliers**: Apply the `summary()` function to summarize each column, aiding in the identification of unusual or outlier values.
   <details>
      <img src="img_details/identifying_outliers.png" width="900" align="center">
   </details>

5. **Missing Values in Data Frame**: Check the entire data frame for any missing values to ensure data completeness.
   <details>
      <img src="img_details/missing_values.png" width="470" align="center">
   </details>

6. **Column-wise Missing Values**: Investigate missing values by each column to pinpoint areas requiring data imputation or removal.
   <details>
      <img src="img_details/column_wise_missing _values.png" width="380" align="center">
   </details>

7. **Duplicate Rows Check**: Verify the presence of duplicate rows within the data frame to maintain data integrity.
   <details>
      <img src="img_details/duplicate_rows.png" width="460" align="center">
   </details>

*By systematically addressing each of these points, we can assure the data's quality and prepare it for insightful analysis.*

## :white_large_square: ANALYZE & SHARE
**Guiding Questions for Enhanced Data Analysis**

At this phase of our study, we seek to explore the dynamics of bike usage among Cyclistic's annual members versus casual riders. Our analysis will dissect the following key dimensions to uncover distinct patterns of utilization:

- **Ride Volume**: Assessing the total number of rides undertaken by each group.
- **Average Ride Duration**: Calculating the typical length of rides to identify usage intensity.
- **Bike Type Preferences**: Evaluating the preference for different types of bikes between the two groups.
- **Usage Patterns Over Time**: Analyzing how usage varies across different times of day, days of the week, months, and seasons.
- **Popular Stations**: Identifying the most frequented stations to understand spatial preferences.

Through this detailed analysis, we aim to provide insights into the differing behaviors and preferences between annual members and casual riders, contributing to targeted strategy development for Cyclistic.

### Counts and Percentages of Bike Types Used
<details><summary>View Code</summary>
   
   ```
   # Calculate the number of rides by bike type
   ride_counts_by_rideable_type <- table(all_rides_df_clean$rideable_type)
   
   # Calculate the total number of rides
   total_rides <- sum(ride_counts_by_rideable_type)
   
   # Calculate the percentage share of each bike type
   ride_percentages_rideable_type <- (ride_counts_by_rideable_type / total_rides) * 100
   
   # Create a data frame to display the results
   rideable_type_usage <- data.frame(
     Rideable_Type = names(ride_counts_by_rideable_type),
     Ride_Count = as.vector(ride_counts_by_rideable_type),
     Percentage = as.vector(ride_percentages_rideable_type)
   )
   
   # Display the results
   print(rideable_type_usage)
   ```
</details>

|  Bike Type |  Total Rides  | Percentage distribution  |
|:----------------|---------------:|---------------:|
|  classic_bike      | 2605010  | 47.55184 % | 
|   docked_bike      |  79284   | 1.44725 %  |
| electric_bike      |  2793959 | 51.00091 % |  

<img src="/img_tableau/Number of bike types used.png" width="950" align="center">

The number of rides on electric bikes is the highest among the categories, with electric bikes accounting for 2,793,959 rides. Classic bikes are slightly less popular with 2,605,010 rides, while docked bikes have been used significantly less, with only 79,284 rides. This distribution highlights the growing trend towards electric and classic bikes for urban mobility solutions, possibly due to their convenience, ease of access, and efficiency compared to the more stationary docked bikes.

<img src="/img_tableau/Percentage distribution of bike rides.png" width="950" align="center">

Using Cyclistic's historical data on the distribution of bike ride types, the share of electric bikes, classic bikes, and docked bikes is divided into 51.00% for electric bikes, 47.55% for classic bikes, and 1.45% for docked bikes. This data indicates that electric bikes are marginally more popular than classic bikes, with over half of the riders opting for electric bikes.

### Counts and Percentage Distribution of Member and Casual Rides
<details><summary>View Code</summary>

   ```
   # Count rides for 'Member' and 'Casual' in the 'member_casual' column
   count_member_casual <- table(all_rides_df_clean$member_casual)
   
   # Display counts of 'Member' and 'Casual'
   print("Counts of Member and Casual Rides:")
   print(count_member_casual)
   
   # Calculate the percentages for 'Member' and 'Casual'
   percentage_member_casual <- prop.table(count_member_casual) * 100
   
   # Display percentages of 'Member' and 'Casual'
   print("Percentage of Member and Casual Rides:")
   print(percentage_member_casual)
   ```
</details>

| Biker Status | Total Rides  |  Percentage distribution  |
|:---------------|--------------:|--------------:|
| member    |  3494248   |  63.78398  |    
| casual    |  1984005   |  36.21602  | 

<img src="/img_tableau/Number of Member and Casual Rides.png" width="950" align="center">

The dataset reveals a significant distinction in usage patterns between annual members and occasional riders within the Cyclistic bike share system.
Members make up the majority of bike rides according to the dataset, with approximately 3,494,248 rides taken by annual members, compared to casual riders who have taken nearly 1,984,005 rides. This suggests that annual members tend to cycle more frequently than casual riders.

<img src="/img_tableau/Percentage distribution of Member and Casual Rides.png" width="950" align="center">

Cyclistic's historical data reveals a clear pattern in rider types' usage. Annual members account for the majority of rides at 63.78%, equating to 3,494,248 rides. Casual riders, on the other hand, represent 36.22% of rides, totaling 1,984,005. This data indicates a strong preference for membership-based usage within the Cyclistic bike-sharing community.

### Count of Bike Types Usage by Members and Casual Riders
<details><summary>View Code</summary>
   
```
# Analyze the use of bike types between members and casual users
usage_by_type_member <- table(all_rides_df_clean$rideable_type[all_rides_df_clean$member_casual == "member"])
usage_by_type_casual <- table(all_rides_df_clean$rideable_type[all_rides_df_clean$member_casual == "casual"])

# Display usage of rideable type by Members
cat("Rideable type usage by Members:\n")
print(usage_by_type_member)

# Display usage of rideable type by Casual riders
cat("Rideable type usage by Casual riders:\n")
print(usage_by_type_casual)
```
</details>

|  Bike Type |  Usage by CASUAL riders  | Usage by MAMBER riders  |
|:----------------|---------------:|---------------:|
|  classic_bike      | 852217   | 1752793 |
|   docked_bike      |  79284   | 0 |
| electric_bike      |  1052504 | 1741455 | 

<img src="/img_tableau/Number of Bike Types Usage by Members and Casual Riders.png" width="950" align="center">

The graph shows that Cyclistic members predominantly use classic bikes (1,752,793 rides) and electric bikes (1,741,455 rides). Casual riders prefer electric bikes (1,052,504 rides) over classic bikes (852,217 rides) and docked bikes (79,284 rides). Docked bikes are the least utilized type, and their use is exclusive to casual riders within this dataset. Members do not use docked bikes at all.

```
# Determine the most commonly used type of bike
most_common_ride_type <- names(sort(table(all_rides_df_clean$rideable_type), decreasing = TRUE)[1])

# Display the most popular ride type
cat("The most popular ride type is:", most_common_ride_type, "\n")
```
<img src="/img_divvy/Bike_DARK_BAYWHEELMASTER.png" width="150" align="center">

The **unique** rideable types include electric bikes, classic bikes, docked bikes, and **electric bikes** are the most **popular**.

### Average Ride Length by Users 
On average, **members** take shorter rides at **12 minutes** and **29 seconds**, while **casual** riders tend to ride longer, averaging **21 minutes** and **53 seconds**, against an **overall** average ride length of **15 minutes** and **54 seconds** for the year.

<details><summary>View Code</summary>
   
   ```
   # Required library for time conversion
   library(lubridate)
   
   # Direct calculation and formatting of the overall average ride length
   mean_ride_length_seconds <- mean(all_rides_df_clean$ride_length_seconds, na.rm = TRUE)
   mean_ride_length_hms <- seconds_to_period(mean_ride_length_seconds)
   mean_ride_length_formatted <- sprintf("%02d:%02d:%02d", 
                                         hour(mean_ride_length_hms), 
                                         minute(mean_ride_length_hms), 
                                         second(mean_ride_length_hms)
                                        )
   
   # Display the overall average ride length
   cat("The overall average length of rides:", mean_ride_length_formatted, "\n")

   # Calculation of the average ride length in seconds for members and casual users
   average_ride_length_member_seconds <- mean(
       all_rides_df_clean$ride_length_seconds[all_rides_df_clean$member_casual == "member"], na.rm = TRUE)
   average_ride_length_casual_seconds <- mean(
       all_rides_df_clean$ride_length_seconds[all_rides_df_clean$member_casual == "casual"], na.rm = TRUE)
   
   # Convert the averages to HH:MM:SS format
   average_ride_length_member_hms <- seconds_to_period(average_ride_length_member_seconds)
   average_ride_length_member_formatted <- sprintf("%02d:%02d:%02d", 
                                                   hour(average_ride_length_member_hms), 
                                                   minute(average_ride_length_member_hms), 
                                                   second(average_ride_length_member_hms)
                                                  )

   average_ride_length_casual_hms <- seconds_to_period(average_ride_length_casual_seconds)
   average_ride_length_casual_formatted <- sprintf("%02d:%02d:%02d", 
                                                   hour(average_ride_length_casual_hms), 
                                                   minute(average_ride_length_casual_hms), 
                                                   second(average_ride_length_casual_hms)
                                                  )
   
   # Display the formatted average ride lengths for member and casual riders
   cat("The average ride length for member riders:", average_ride_length_member_formatted, "\n")
   cat("The average ride length for casual riders:", average_ride_length_casual_formatted, "\n")
   ```

</details>

### The most frequent day of the week for rides 
**Saturday** is the most popular day for rides **overall** and for **casual** users, while **members** ride most frequently on **Thursdays**.

<details><summary>View Code</summary>

   ```
   # Calculate the mode of the day of the week for all rides
   day_of_week_mode <- names(which.max(table(all_rides_df_clean$day_of_week)))
   
   # Display the most common day for all rides
   cat("The most frequent day of the week for rides is: ", day_of_week_mode, "\n")
   
   # Calculate the mode of the day of the week specifically for member rides
   member_day_of_week_mode <- names(
     which.max(table(all_rides_df_clean$day_of_week[all_rides_df_clean$member_casual == "member"]))
   )

   # Calculate the mode of the day of the week specifically for casual user rides
   casual_day_of_week_mode <- names(
     which.max(table(all_rides_df_clean$day_of_week[all_rides_df_clean$member_casual == "casual"]))
   )
   
   # Display the most common day of the week for member rides
   cat("The most frequent day of the week for rides for Members: ", member_day_of_week_mode, "\n")
   
   # Display the most common day of the week for casual user rides
   cat("The most frequent day of the week for rides for Casual users: ", casual_day_of_week_mode, "\n")
   ```

</details>

### Calculation of the number of rides by users and bike type usage per day of the week 

<details><summary>View Code</summary>
   
   ```
   library(tidyverse)
   library(lubridate)
   library(hms)
   
   # Calculation of the number of rides for all users, members, and casual users by day of the week
   num_rides_by_day_of_week <- table(all_rides_df_clean$day_of_week)
   num_rides_member_by_day_of_week <- table(
       all_rides_df_clean$day_of_week[all_rides_df_clean$member_casual == "member"])
   num_rides_casual_by_day_of_week <- table(
       all_rides_df_clean$day_of_week[all_rides_df_clean$member_casual == "casual"])

   # Display results to the console
   cat("Number of rides by day of the week for All users:\n")
   print(num_rides_by_day_of_week)
   cat("Number of rides by day of the week for Members:\n")
   print(num_rides_member_by_day_of_week)
   cat("Number of rides by day of the week for Casual users:\n")
   print(num_rides_casual_by_day_of_week)
   
   # Creating a tibble with the appropriate number of rows (7 for each day of the week)
   all_rides_day_week_tibble <- tibble(
     day_of_week = factor(names(num_rides_by_day_of_week), levels = names(num_rides_by_day_of_week)),
     num_rides_users = as.numeric(num_rides_by_day_of_week),
     num_rides_casual = as.numeric(num_rides_casual_by_day_of_week),
     num_rides_member = as.numeric(num_rides_member_by_day_of_week)
   )

   # Display the created tibble
   print(all_rides_day_week_tibble)
   
   # Count of the bike types by day of the week
   ride_type_usage_by_day <- table(all_rides_df_clean$day_of_week, all_rides_df_clean$rideable_type)
   cat("Ride type usage by Day of the Week:\n")
   print(ride_type_usage_by_day)
   ```

</details>

| Day of Week | Number of Ride ID  |  CASUAL  | MEMBER  | Number of Bike Types: classic_bike | docked_bike | electric_bike  |
|:---------------|:--------------|:--------------|:--------------|--------------:|--------------:|--------------:|
| 1 Sunday    |  710157   |  322216  |  387941   |    349490   |    15109    |    345558    |
| 2 Monday    |  701348   |  227078  |  474270   |    337358   |     9163    |    354827    |
| 3 Tuesday   |  793759   |  238690  |  555069   |   379416    |     8755    |    40558     |
| 4 Wednesday |  798350   |  239727  |  558623   |    373575   |     7985    |    416790    |
| 5 Thursday  |  828872   |  262266  |  566606   |    385285   |     9140    |    434447    |
| 6 Friday    |  801693   |  299248  |  502445   |    369367   |    11651    |    420675    |
| 7 Saturday  |  844074   |  394780  |  449294   |    410519   |    17481    |    416074     |

<img src="/img_tableau/Number of User Rides per Day of the Week.png" width="750" align="center">

The graph indicates that Saturday is the most popular day for Cyclistic bike rides, with Thursday being a close second. Conversely, Monday has the lowest number of rides, suggesting it is the least favored day for cycling among Cyclistic's users. 

<div>
<img src="/img_tableau/Percentage Distribution of User Rides per Day of the Week.png" width="750" align="center">
</div>
Based on the graph, Thursday is the peak day for member rides, while Saturday is the most popular for casual users, with these days accounting for 15.13% and 15.41% of weekly rides respectively. Conversely, the least favored days are Sunday for members and Monday for casual users.

<div>
<img src="/img_tableau/Number of Bike Type Usages per Day of the Week.png" width="750" align="center">
</div>
The graph demonstrates that casual riders primarily use bikes during weekends with a noticeable dip in usage at the start of the week, whereas members' bike usage is more evenly distributed throughout the week with a slight decrease on weekends. Members tend to favor classic and electric bikes consistently across weekdays, while casual riders show a preference for electric bikes. 

<div>
<img src="/img_tableau/Number of rides in percentage by bike type by day of the week.png" width="900" align="center">
</div>
Saturday leads as the most popular day for bike rides with 15.41% of the weekly total, with Thursday trailing closely behind at 15.13%, underscoring a trend towards increased cycling activity towards the end of the week. 

<div>
<img src="/img_tableau/Count Bike type - Members and casual riders' total percentage of rides each weekday.png" width="750" align="center">
</div>
The bar graph depicts the percentage distribution of bike rides by members and casual riders across each day of the week, differentiated by bike type. Classic bikes are predominantly used by members, especially mid-week, while casual riders show a marked preference for electric bikes, particularly on weekends. Docked bikes, represented by the smallest proportion, are used the least by both groups.

### Average Ride Length by Day of the Week for All Users, Members, and Casual Riders

<details><summary>View Code</summary>

   ```
   # Necessary libraries
   library(tidyverse)
   library(lubridate)
   library(hms)
   
   # Calculate the average ride length for all users by day of the week
   average_ride_length_by_day <- all_rides_df_clean %>%
     group_by(day_of_week) %>%
     summarise(ride_length_minutes = mean(ride_length_minutes, na.rm = TRUE))
   
   # Calculate the average ride length for members by day of the week
   average_ride_length_member_by_day <- all_rides_df_clean %>%
     filter(member_casual == "member") %>%
     group_by(day_of_week) %>%
     summarise(ride_length_minutes = mean(ride_length_minutes, na.rm = TRUE))

   # Calculate the average ride length for casual users by day of the week
   average_ride_length_casual_by_day <- all_rides_df_clean %>%
     filter(member_casual == "casual") %>%
     group_by(day_of_week) %>%
     summarise(ride_length_minutes = mean(ride_length_minutes, na.rm = TRUE))
   
   # Create a unified data frame for each user type with an additional column for user type
   df_all_users <- average_ride_length_by_day %>% mutate(user_type = "All Users")
   df_members <- average_ride_length_member_by_day %>% mutate(user_type = "Member")
   df_casual <- average_ride_length_casual_by_day %>% mutate(user_type = "Casual")
   
   # Combine all data frames into one
   all_rides_df_final_avg_ride_length_by_day <- bind_rows(df_all_users, df_members, df_casual)

   # Display the calculated averages to the console with clear separation
   cat("Average Ride Length for All Users by Day of the Week:\n")
   print(df_all_users)
   cat("Average Ride Length for Member Riders by Day of the Week:\n")
   print(df_members)
   cat("Average Ride Length for Casual Riders by Day of the Week:\n")
   print(df_casual)
   ```

</details>

| Day of Week | ALL USERS  |  MEMBER  | CASUAL  | 
|:---------------|--------------:|--------------:|--------------:|
| 1 Sunday    |  00:19:13   |  00:13:57  |  00:25:34   |   
| 2 Monday    |  00:14:58   |  00:11:52  |  00:21:28   |  
| 3 Tuesday   |  00:14:16   |  00:11:50  |  00:19:32   |   
| 4 Wednesday |  00:13:57   |  00:11:56  |  00:18:39   |   
| 5 Thursday  |  00:14:13   |  00:11:58  |  00:19:05   |    
| 6 Friday    |  00:15:45   |  00:12:27  |  00:21:18   |    
| 7 Saturday  |  00:19:01   |  00:13:56  |  00:24:49   | 

<img src="/img_tableau/Average Ride Length by Day of the Week for Members and Casual Riders.png" width="750" align="center">
The graph illustrates that while members consistently ride for shorter durations across the week, casual riders take longer rides, especially on weekends, which may suggest leisure or tourist activities. Casual riders' trips peak on Sundays, averaging 25.57 minutes, in contrast to members, who average around 12 minutes daily.

### Total Number of Trips for Each User Group during Different Parts of the Day 

<details><summary>View Code</summary>
   
   ```
   # Load the dplyr package for data manipulation
   library(dplyr)
   
   # Calculate the total number of rides for each part of the day for all users
   total_usage_all <- all_rides_df_clean %>%
     group_by(part_of_day) %>%
     summarize(total_rides = n(), .groups = 'drop') 
   
   # Calculate the total number of rides for each part of the day for members
   total_usage_member <- all_rides_df_clean %>%
     filter(member_casual == "member") %>%
     group_by(part_of_day) %>%
     summarize(total_rides = n(), .groups = 'drop')
   
   # Calculate the total number of rides for each part of the day for casual riders
   total_usage_casual <- all_rides_df_clean %>%
     filter(member_casual == "casual") %>%
     group_by(part_of_day) %>%
     summarize(total_rides = n(), .groups = 'drop') 
   
   # Display the results
   cat("Total Usage by Part of the Day for All Riders:\n")
   print(total_usage_all)
   cat("Total Usage by Part of the Day for Members:\n")
   print(total_usage_member)
   cat("Total Usage by Part of the Day for Casual Riders:\n")
   print(total_usage_casual)
   ```

</details>

| Users | Morning | Afternoon | Evening | Night |
|:------|----------:|--------:|--------:|------:|
|	Overall	|	1438083	|	1844813	|	1591156	|	604201	|
|	Member	|	1020506	|	1120551	|	1021235	|	331956	|
|	Casual	|	417577	|	724262	|	569921	|	272245	|

<img src="/img_tableau/Total Number of Trips during Different Parts of the Day.png" width="750" align="center">
The chart shows that the afternoon is the most popular time for bike rides, with member trips evenly distributed throughout morning, afternoon, and evening, while casual riders exhibit a peak in the afternoon.

### Top 10 Most Popular Riding Hours

<details><summary>View Code</summary>
   
   ```
   # Load the dplyr package for data manipulation
   library(dplyr)
   
   # Calculate the hour from the 'started_at_time' column, which is in the HH:MM:SS string format
   all_rides_df_clean <- all_rides_df_clean %>%
     mutate(hour_of_day = as.integer(substr(started_at_time, 1, 2))) 
   
   # Calculate the number of rides per hour for all users
   hour_of_day_usage_all <- all_rides_df_clean %>%
     group_by(hour_of_day) %>%
     summarize(total_rides = n(), .groups = 'drop') 
   
   # Calculate the number of rides per hour for members
   hour_of_day_usage_member <- all_rides_df_clean %>%
     filter(member_casual == "member") %>%
     group_by(hour_of_day) %>%
     summarize(total_rides = n(), .groups = 'drop') 
   
   # Calculate the number of rides per hour for casual riders
   hour_of_day_usage_casual <- all_rides_df_clean %>%
     filter(member_casual == "casual") %>%
     group_by(hour_of_day) %>%
     summarize(total_rides = n(), .groups = 'drop') 

   # Print the top 10 most popular riding hours for all users
   cat("Top 10 Most Popular Riding Hours for All Users:\n")
   print(hour_of_day_usage_all %>% arrange(desc(total_rides)) %>% slice_head(n = 10))
   
   # Print the top 10 most popular riding hours for members
   cat("Top 10 Most Popular Riding Hours for Members:\n")
   print(hour_of_day_usage_member %>% arrange(desc(total_rides)) %>% slice_head(n = 10))
   
   # Print the top 10 most popular riding hours for casual riders
   cat("Top 10 Most Popular Riding Hours for Casual Riders:\n")
   print(hour_of_day_usage_casual %>% arrange(desc(total_rides)) %>% slice_head(n = 10))
   ```

</details>

|Hour of Day | Total rides: OVERALL | Hour of Day | Total rides: MEMBER | Hour of Day | Total rides: CASUAL |
|------:|:----------|--------:|:--------|------:|:------|
|	5 PM	|	564221	|	5 PM	|	371825	|	5 PM	|	192396	|
|	4 PM	|	492214	|	4 PM	|	316178	|	4 PM	|	176036	|
|	6 PM	|	461164	|	6 PM	|	295084	|	6 PM	|	166080	|
|	3 PM	|	387929	|	3 PM	|	234498	|	3 PM	|	153431	|
|	7 PM	|	331927	|	8 AM	|	234207	|	2 PM	|	137225	|
|	2 PM	|	328500	|	7 PM	|	209074	|	1 PM	|	131486	|
|	1 PM	|	319933	|	2 PM	|	191275	|	12 PM	|	126084	|
|	12 PM	|	316237	|	12 PM	|	190153	|	7 PM	|	122853	|
|	8 AM	|	302704	|	1 PM	|	188447	|	11 AM	|	106625	|
|	11 AM	|	274612	|	7 AM	|	186859	|	8 PM	|	88592	   |

<img src="/img_tableau/Top 10 Most Popular Riding Hours Overall.png" width="650" align="center">
The data from the chart indicates that the late afternoon, specifically around 5 PM, is the most popular time for cycling, with 564,221 rides occurring during this time. Furthermore, the time span from 3 PM to 6 PM is the preferred window for cycling, accounting for 1,905,528 rides, which represents 34.7835% of total rides. 
<p>&nbsp;</p>
<details><summary>View Code</summary>

   ```
   library(dplyr)
   
   # Calculate the popularity of rides between 3 PM and 6 PM to determine
   # the number of rides in this time frame in both absolute and relative terms compared to all rides.
   
   all_rides_df_clean <- all_rides_df_clean %>%
     mutate(hour_of_day = as.integer(substr(started_at_time, 1, 2))) 
   
   # Filter rides between 3 PM and 6 PM
   hourly_usage_peak <- all_rides_df_clean %>%
     filter(hour_of_day >= 15 & hour_of_day <= 18)
   
   # Calculate the total number of rides in this time period
   total_rides_peak <- nrow(hourly_usage_peak)
   
   # Calculate the total number of rides in the entire dataset for comparison
   total_rides_all <- nrow(all_rides_df_clean)
   
   # Calculate the share of rides in this time period compared to all rides
   percentage_peak <- (total_rides_peak / total_rides_all) * 100
   
   # Display the results
   cat("Total Rides between 3 PM and 6 PM:", total_rides_peak, "\n")
   cat("Percentage of Total Rides:", format(percentage_peak, nsmall = 2), "%\n")
   ```

</details>

In comparison with the previous graph, the following analysis is performed:

- The peak cycling hours are between **3 PM** and **6 PM**, with **1,905,528** total rides, comprising 34.78% of all rides.
- Evening rides, from **6 PM** to **11 PM**, total **1,464,636**, making up 26.74% of rides, indicating a significant preference for post-work cycling.
- Late-night to early morning hours, from **12 AM** to **5 AM**, have the fewest rides at **210,012**, accounting for only 3.83% of the total, reflecting the least popular time for cycling.
- Early to mid-morning rides, from **5 AM** to **8 AM**, total **714,303**, which is 13.04% of rides, showing a moderate uptake for early risers or commuters.
- Late morning to midday, from **8 AM** to **12 PM**, sees **1,342,721** rides, comprising 24.51% of the total, indicating a preference for mid-morning cycling.
- Combining early and late morning periods, from **5 AM** to **12 PM**, yields a total of 1,754,320 rides, or 32.02% of total rides, suggesting morning hours are fairly popular for cycling.
- From noon to **3 PM**, there are **1,352,599** total rides, amounting to 24.69% of the total, which suggests a steady use of bikes into the early afternoon.
- Extending from early morning through to the afternoon, from **5 AM** to **3 PM**, there are a total of **2,790,682** rides, representing a substantial 50.94% of all rides, indicating that the daytime hours up until mid-afternoon are the most popular for cycling.

### Calculation of the Number of Rides During Different Times of the Day
<details><summary>View Code</summary>

   ```
   # Load necessary libraries
   library(dplyr)
   library(lubridate) # Required for the hour() function
   
   # Calculate the hour from the timestamp
   all_rides_df_clean <- all_rides_df_clean %>%
     mutate(hour_of_day = hour(hms::as_hms(started_at_time))) 
   
   # Calculate the number of rides per hour for all users
   hour_of_day_usage_all <- all_rides_df_clean %>%
     group_by(hour_of_day) %>%
     summarize(total_rides = n(), .groups = 'drop')

   # Calculate the number of rides per hour for members
   hour_of_day_usage_member <- all_rides_df_clean %>%
     filter(member_casual == "member") %>%
     group_by(hour_of_day) %>%
     summarize(total_rides = n(), .groups = 'drop') 
   
   # Calculate the number of rides per hour for casual riders
   hour_of_day_usage_casual <- all_rides_df_clean %>%
     filter(member_casual == "casual") %>%
     group_by(hour_of_day) %>%
     summarize(total_rides = n(), .groups = 'drop') 
   
   # Display the results
   cat("Hourly Usage for All Riders:\n")
   print(hour_of_day_usage_all)
   cat("Hourly Usage for Members:\n")
   print(hour_of_day_usage_member)
   cat("Hourly Usage for Casual Riders:\n")
   print(hour_of_day_usage_casual)
   ```

</details>

<details><summary>View Table: Number of Rides During Different Times of the Day</summary>
   
| Hour of Day | Total trips: Overall | Total trips: Member | Total trips: Casual |
|------:|----------:|--------:|--------:|
|	12 AM	|	68815	|	33708	|	35107	|
|	1 AM	|	42852	|	20062	|	22790	|
|	2 AM	|	25454	|	11692	|	13762	|
|	3 AM	|	15230	|	7585	|	7645	|
|	4 AM	|	14149	|	8355	|	5794	|
|	5 AM	|	43512	|	32529	|	10983	|
|	6 AM	|	129879	|	100650	|	29229	|
|	7 AM	|	238208	|	186859	|	51349	|
|	8 AM	|	302704	|	234207	|	68497	|
|	9 AM	|	224441	|	156985	|	67456	|
|	10 AM	|	224727	|	141289	|	83438	|
|	11 AM	|	274612	|	167987	|	106625	|
|	12 PM	|	316237	|	190153	|	126084	|
|	1 PM	|	319933	|	188447	|	131486	|
|	2 PM	|	328500	|	191275	|	137225	|
|	3 PM	|	387929	|	234498	|	153431	|
|	4 PM	|	492214	|	316178	|	176036	|
|	5 PM	|	564221	|	371825	|	192396	|
|	6 PM	|	461164	|	295084	|	166080	|
|	7 PM	|	331927	|	209074	|	122853	|
|	8 PM	|	233844	|	145252	|	88592	|
|	9 PM	|	186929	|	112741	|	74188	|
|	10 PM	|	149925	|	84147	|	65778	|
|	11 PM	|	100847	|	53666	|	47181	|
   
</details>

<img src="/img_tableau/Number of Rides During Different Times of the Day.png" width="750" align="center">
The graph highlights that the period from afternoon to evening is the most favored for cycling, with the hours between 3 PM and 6 PM alone accounting for 34.78% of daily rides, signifying that over a third of the day's rides occur in this 3-hour window. Morning hours show the least activity, and there is a noticeable decline in rides from 6 PM to 11 PM, which constitutes 26.74% of the daily rides.

### Percentage Distribution of Total Ride Counts by Hour of Day 
The graph's percentage distribution indicates that 5 PM is the peak time for rides, accounting for 10.30% of the total. There is a significant drop in activity from 11 PM to 5 AM, marking these as the least popular hours. Cyclistic users clearly favor the time span between 3 PM and 6 PM for their rides.
<p>&nbsp;</p>
<img src="/img_tableau/Percentage Distribution of Total Ride Counts by Hour of Day.png" width="750" align="center">
<p>&nbsp;</p>
The graph compares the hourly ride counts of casual riders and members, showing that members tend to ride mostly during morning peak hours, with a significant spike around 8 AM, and again in the late afternoon, peaking at 5 PM. Casual riders, on the other hand, have their highest counts later in the day, with their peak also at 5 PM but sustaining higher ride counts into the evening compared to members.
<p>&nbsp;</p>
<img src="/img_tableau/Total Ride Counts by Hour of Day for Casual Riders and Members.png" width="950" align="center">
<p>&nbsp;</p>
The graph displays the hourly ride counts for both members and casual riders across different days of the week. Consistent with previous findings, the peak usage for both groups is around 5 PM. During weekdays, the highest frequency of rides occurs between 3 PM and 6 PM, with 3 PM being particularly popular. On weekends, the peak shifts to between 1 PM and 3 PM. Casual riders start their trips frequently in the early afternoon on weekdays, while members tend to begin their journeys around 7 AM and 8 AM. This pattern suggests that members are likely commuting during rush hours on weekdays, whereas casual riders are more inclined to use bikes for leisure activities, especially in the afternoons and on weekends.

<p>&nbsp;</p>
<img src="/img_tableau/Ride Counts by Hours Across Each Day for Casual Riders and Members.png" width="950" align="center">

### Number of Bike Rides and Percentage Distribution Across Seasons

<details><summary>View Code</summary>
   
   ```
   library(dplyr)
   
   # Convert 'started_at_date' and 'ended_at_date' columns to date format
   all_rides_df_clean <- all_rides_df_clean %>%
     mutate(
       started_at_date = as.Date(started_at_date),
       ended_at_date = as.Date(ended_at_date)
     )
   
   # Create a new 'season' column to label the seasons
   all_rides_df_clean <- all_rides_df_clean %>%
     mutate(
       season = case_when(
         between(started_at_date, as.Date("2023-03-21"), as.Date("2023-06-20")) ~ "Spring",
         between(started_at_date, as.Date("2023-06-21"), as.Date("2023-09-22")) ~ "Summer",
         between(started_at_date, as.Date("2023-09-23"), as.Date("2023-12-20")) ~ "Autumn",
         TRUE ~ "Winter"  
       )
     )

   # Calculate the number of rides for each season
   rides_by_season <- all_rides_df_clean %>%
     group_by(season) %>%
     summarize(Count_of_ride_id = n(), .groups = 'drop') 
   
   # Print the results for rides by season
   cat("Number of rides per season:\n")
   print(rides_by_season)
   
   # Calculate the number of rides for each season, segmented by 'member_casual' column
   rides_by_season_member_casual <- all_rides_df_clean %>%
     group_by(season, member_casual) %>%
     summarize(Count_of_ride_id = n(), .groups = 'drop') 

   # Print the results for rides by season and user type
   cat("Number of rides per season and user type:\n")
   print(rides_by_season_member_casual)
   ```

</details>

| season | Count_of_ride_id  |  CASUAL  | MEMBER  |
|:---------|-----------:|---------:|----------:|
| Autumn   |  1048806   |  335170  |  713636   |
| Spring   |  1547735   |  584526  |  963209   |
| Summer   |  2192634   |  904759  |  1287875  |
| Winter   |  689078    |  159550  |  529528   |

<img src="/img_tableau/Number of Bike Rides per Season.png" width="750" align="center">
The bar chart shows the number of bike rides per season, indicating that summer is the most popular season for biking with a total of 2,192,634 rides. Spring follows with 1,547,735 rides, then autumn with 1,048,806 rides, and winter has the least with 689,078 rides. This suggests that warmer weather significantly increases the frequency of bike usage.
<p>&nbsp;</p>
<div>
   <img src="/img_tableau/Percentage Distribution of Bike Rides Across Seasons.png" width="750" align="center">
</div>
<div style="clear: both;"></div>
<p>The pie chart clearly demonstrates that summer is the most popular season for cycling, with a total of 2,192,634 rides, accounting for 40.02% of the season's total rides. Following summer, spring is the next favored season with 1,547,735 rides, making up 28.25% of the rides. These figures indicate a strong seasonal trend in cycling habits, with riders significantly preferring the warmer months, which can be clearly seen in the calculation below.</p>

### Bike Ride Count and Percentage Distribution per Month for Member and Casual Riders
<details><summary>View Code</summary>
   
```
   library(dplyr)
   library(lubridate)
   
   # The `month()` function was used for extract the month from a date or datetime column
   all_rides_df_clean <- all_rides_df_clean %>%
     mutate(month = month(started_at, label = TRUE))

   # Calculate the number of rides per month for all users
   ride_counts_by_month_all <- all_rides_df_clean %>%
     group_by(month) %>%
     summarize(total_rides = n(), .groups = 'drop') 
   
   # Calculate the number of rides per month for members
   ride_counts_by_month_member <- all_rides_df_clean %>%
     filter(member_casual == "member") %>%
     group_by(month) %>%
     summarize(total_rides = n(), .groups = 'drop') 
   
   # Calculate the number of rides per month for casual riders
   ride_counts_by_month_casual <- all_rides_df_clean %>%
     filter(member_casual == "casual") %>%
     group_by(month) %>%
     summarize(total_rides = n(), .groups = 'drop') 
   
   # Display the results
   cat("Ride Counts by Month for All Riders:\n")
   print(ride_counts_by_month_all)
   cat("Ride Counts by Month for Members:\n")
   print(ride_counts_by_month_member)
   cat("Ride Counts by Month for Casual Riders:\n")
   print(ride_counts_by_month_casual)
   ```

</details>

|	Month  | Overall | Total Rides: Member | Total Rides: Casual |
|---------:|-----------:|---------:|----------:|
|	Jan	|	181981	|	143470	|	38511	|
|	Feb	|	182350	|	140825	|	41525	|
|	Mar	|	246775	|	186953	|	59822	|
|	Apr	|	407549	|	266138	|	141411	|
|	May	|	581526	|	356001	|	225525	|
|	Jun	|	694898	|	404043	|	290855	|
|	Jul	|	741043	|	420948	|	320095	|
|	Aug	|	747151	|	445628	|	301523	|
|	Sep	|	647030	|	393015	|	254015	|
|	Oct	|	521006	|	349276	|	171730	|
|	Nov	|	351760	|	256144	|	95616	|
|	Dec	|	175184	|	131807	|	43377	|

<div>
   <img src="/img_tableau/Number of Bike Rides by Month for Member and Casual Riders.png" width="750" align="center">
</div>
<div style="clear: both;"></div>

<p>The bar chart confirms that August is the month with the highest number of bike rides, followed closely by July, and then June, indicating a peak in cycling activity during the summer months. Conversely, the winter months of December, January, and February have the fewest recorded rides, reflecting a seasonal decline in cycling frequency.</p>

### Percentage Distribution of Bike Rides by Month for Member and Casual Riders
The bar chart visualizes the percentage distribution of bike rides by month for both members and casual riders. It aligns with the inference that summer is the peak season for cycling, potentially influenced by seasonality, which is a common factor affecting such trends. From December to March, only 14.35% of rides are recorded, while a significant 39.85% occur from June through August.<br>
This pattern suggests that Cyclistic experiences a low season in winter and peak activity in summer. Marketing strategies could be developed to boost ride numbers in the colder months, possibly through promotions or events tailored to winter cycling. <br />

<img src="/img_tableau/Percentage Distribution of Bike Rides by Month for Member and Casual Riders.png" width="750" align="center">

### Average Monthly Ride Durations in Minutes for Members and Casual Riders
The line chart corroborates earlier observations, showing that casual riders consistently have longer ride durations throughout the year compared to members. The trend peaks during the warmer months, aligning with the seasonal increase in ride counts previously noted.

<img src="/img_tableau/Average Monthly Ride Durations in Minutes.png" width="800" align="center">

### Number of Unique Starting and End Stations
<details><summary>View Code</summary>
   
   ```
   # Load the tidyverse package
   library(tidyverse)
   
   # Calculate the number of unique starting stations in the dataset
   num_start_stations <- length(unique(all_rides_df_clean$start_station_name))
   # Print the result for the number of unique starting stations
   cat("Number of unique starting stations:", num_start_stations, "\n")
   ```

</details>

Number of unique starting stations: **1542**

### Most common used Start station by day of the week
<details><summary>View Code</summary>

   ```
   library(tidyverse)
   
   # Identifying the most commonly used starting station
   most_common_start_station <- names(sort(table(all_rides_df_clean$start_station_name), decreasing = TRUE)[1])
   cat("Most common Start station:", most_common_start_station, "\n")
   
   # Filtering data for stations named "Old Hastings Charging Stx"
   old_hastings_stations_all <- all_rides_df_clean %>%
     filter(start_station_name == "Old Hastings Charging Stx") %>%
     select(start_lng, start_lat)
   
   # Selecting unique combinations of geographical latitudes and longitudes for stations named "Old Hastings Charging Stx"
   old_hastings_stations_unique <- all_rides_df_clean %>%
     filter(start_station_name == "Old Hastings Charging Stx") %>%
     distinct(start_lng, start_lat)

   # Counting all occurrences of "Old Hastings Charging Stx" stations
   total_all_old_hastings_stations <- nrow(old_hastings_stations_all)
   
   # Counting all unique "Old Hastings Charging Stx" stations based on their latitudes and longitudes
   total_unique_old_hastings_stations <- nrow(old_hastings_stations_unique)
   
   # Displaying the total number of all and unique "Old Hastings Charging Stx" stations
   cat("Total number of all entries for 'Old Hastings Charging Stx' stations:", total_all_old_hastings_stations, "\n")
   cat("Number of unique entries for 'Old Hastings Charging Stx' stations based on latitudes and longitudes:", total_unique_old_hastings_stations, "\n")
   
   # Displaying the first few rows of both datasets
   cat("First few entries of all 'Old Hastings Charging Stx' stations:\n")
   print(old_hastings_stations_all)
   cat("Unique latitude and longitude entries for 'Old Hastings Charging Stx' stations:\n")
   print(old_hastings_stations_unique)
   
   # Exporting to CSV files
   write_csv(old_hastings_stations_all, "old_hastings_stations_all.csv")
   write_csv(old_hastings_stations_unique, "old_hastings_stations_unique.csv")
   ```

</details>

* The most common Start station: **Old Hastings Charging Stx**
* The **total** number of all latitudes and longitudes for **'Old Hastings Charging Stx'** stations: **810968**
* The **total** number of **unique** latitudes and longitudes for 'Old Hastings Charging Stx' stations: **731**

### "Old Hastings Charging Station" and the rest of the stations
The map visualization indicates that 'Old Hastings Charging Stx' appears as the most common starting station according to the R analysis, with this name associated with a vast number of distinct geographic coordinates across the city of Chicago. With 'Old Hastings Charging Stx' accounting for a total of 810,968 instances and corresponding to 731 unique station locations by latitude and longitude, it suggests a potential error in the dataset where multiple stations have been incorrectly labeled under this single name. Despite the apparent data inconsistency, there is no immediate requirement to remove these entries. Retaining them in the dataset will continue to show 'Old Hastings Charging Stx' as a widespread station due to the variety of geographic locations associated with this name throughout Chicago.

<img src="/img_tableau/'Old Hastings Charging Station' and the rest of the stations.png" width="750" align="center">

### The Count of Bikes Taken by Members and Casual Riders from Starting Stations
The visual data presented in the previous two maps clearly shows a pattern of bike usage among both casual riders and members within the city of Chicago. For casual riders, there is a high concentration of bikes taken from what appears to be the central downtown area, indicating a preference for starting rides in the heart of the city. Similarly, the second map shows that members also frequently start their rides in central Chicago, with the highest density of rides originating from this area. These patterns highlight the city center as a hub for bike-sharing activity, reflecting its likely role as a focal point for both commuting and leisure trips.

<img src="/img_tableau/Count of Bikes Taken by Members from Start Stations.png" width="950" align="center">

<img src="/img_tableau/Count of Bikes Taken by Casual Riders from Start Stations.png" width="950" align="center">

### Top 20 Start Stations for Members, Casual Riders, and All Users
<details><summary>View Code</summary>

   ```
   library(tidyverse)
   
   # Identify the top 20 most frequently used start stations for members
   top_stations_member <- all_rides_df_clean %>%
     filter(member_casual == "member") %>%
     group_by(start_station_name) %>%
     summarise(count = n()) %>%
     arrange(desc(count)) %>%
     slice_head(n = 20)

   # Display the top 20 start stations for members
   cat("Top 20 Start Stations for Members:\n")
   print(top_stations_member)
   
   # Identify the top 20 most frequently used start stations for casual riders
   top_stations_casual <- all_rides_df_clean %>%
     filter(member_casual == "casual") %>%
     group_by(start_station_name) %>%
     summarise(count = n()) %>%
     arrange(desc(count)) %>%
     slice_head(n = 20)
   
   # Display the top 20 start stations for casual riders
   cat("Top 20 Start Stations for Casual Riders:\n")
   print(top_stations_casual)
   
   # Identify the top 20 most frequently used start stations regardless of user type
   top_stations_all <- all_rides_df_clean %>%
     group_by(start_station_name) %>%
     summarise(count = n()) %>%
     arrange(desc(count)) %>%
     slice_head(n = 20)
   
   # Display the top 20 start stations overall
   cat("Top 20 Start Stations Overall:\n")
   print(top_stations_all)
```

</details>

<details><summary>View Table: Top 20 Start Stations</summary>

| No. | Start Stations Used by All Users | Total | Start Stations Used by MEMBER Riders | Total | Start Stations Used by CASUAL Riders | Total |
|-----:|------:|------:|------:|------:|------:|------:|
| 1 | Old Hastings Charging Stx | 810968 | Old Hastings Charging Stx | 511202 | Old Hastings Charging Stx | 299766 |
| 2 | Streeter Dr & Grand Ave | 61243 |	Kingsbury St & Kinzie St | 25098 | Streeter Dr & Grand Ave | 44685 |
| 3 | DuSable Lake Shore Dr & Monroe St | 38893 | Clinton St & Washington Blvd | 24866 | DuSable Lake Shore Dr & Monroe St | 29515 |
| 4 | Michigan Ave & Oak St | 36152 | Clark St & Elm St | 24091 | Michigan Ave & Oak St | 21980 |
| 5 | DuSable Lake Shore Dr & North Blvd | 34816 | Wells St & Concord Ln | 20651 | DuSable Lake Shore Dr & North Blvd | 19745 |
| 6 | Clark St & Elm St	| 34688 | Wells St & Elm St | 19648	| Millennium Park |	19550 |
| 7 | Kingsbury St & Kinzie St | 33655 | Clinton St & Madison St | 19384 | Shedd Aquarium | 17259 |
| 8 | Wells St & Concord Ln | 32543 | University Ave & 57th St | 19300 | Theater on the Lake | 15915 |
| 9 | Clinton St & Washington Blvd | 31157 | Broadway & Barry Ave | 18380 | Dusable Harbor | 14897 |
| 10 | Wells St & Elm St | 29383 | Loomis St & Lexington St | 18215 | Wells St & Concord Ln	| 11892	|
| 11 | Theater on the Lake | 29165 | Ellis Ave & 60th St | 17759 | Adler Planetarium | 11540 |
| 12 | Millennium Park | 29091 | State St & Chicago Ave	| 17377	| Montrose Harbor |	11474 |
| 13 | Broadway & Barry Ave | 27733	| Canal St & Adams St |	16845 | Indiana Ave & Roosevelt Rd	| 11322	|
| 14 | Wilton Ave & Belmont Ave | 26609	| Streeter Dr & Grand Ave | 16558 |	Clark St & Armitage Ave	| 10852	|
| 15 | Clark St & Armitage Ave | 25756 | Wells St & Huron St | 16424 | Clark St & Lincoln Ave | 10630 |
| 16 | University Ave & 57th St	| 25722	| Clinton St & Jackson Blvd | 16271	| Michigan Ave & 8th St	| 10607	|
| 17 | Clinton St & Madison St | 25395 | Wilton Ave & Belmont Ave | 16227 |	Clark St & Elm St |	10597 |
| 18 | Indiana Ave & Roosevelt Rd |	25298 |	Morgan St & Polk St	| 16208	| Wilton Ave & Belmont Ave | 10382 |
| 19 | Ellis Ave & 60th St | 24646 | Dearborn St & Erie St | 16138 | Wells St & Elm St | 9735 |
| 20 | Clark St & Lincoln Ave | 24558 | Larrabee St & Kingsbury St | 16137 | Wabash Ave & Grand Ave | 9543 |

</details>

<img src="/img_tableau/Top 20 Starting Stations for All Users.png" width="950" align="center">
The map highlights the top 20 most popular starting stations for bike rides, marked in red, showcasing that these high-traffic locations are primarily concentrated in specific areas. This clustering could inform strategic decisions for bike station placement, maintenance, and potential promotional activities to enhance user engagement. <br />

<div>
<img src="/img_tableau/Top 20 Starting Stations.png" width="950" align="center">
</div>
<div style="clear: both;"></div>
The chart showcases the top 20 starting stations for bike rides, with Old Hastings Charging Stx standing out due to its exceptionally high number of rides, totaling 810,968. This station appears to be an outlier, as its usage significantly exceeds that of other stations. However, this may be due to the station's name being associated with multiple locations across the city. Therefore, while it appears prominently in the dataset, its data might be misleading and should be interpreted with caution when considering station popularity and usage patterns.

### Most Popular Stations by Time of Day: Members, Casual Riders, and All Users
<details><summary>View Code</summary>

   ```
   library(tidyverse)
   library(lubridate)
   
   # Function to determine the part of the day
   part_of_day <- function(time) {
     hour <- hour(as.POSIXct(time, format = "%H:%M:%S"))
     if (hour >= 5 & hour < 12) {
       return("Morning")
     } else if (hour >= 12 & hour < 17) {
       return("Afternoon")
     } else if (hour >= 17 & hour < 21) {
       return("Evening")
     } else {
       return("Night")
     }
   }

   # Calculate the part of the day for each ride using sapply
   all_rides_df_clean <- all_rides_df_clean %>%
     mutate(part_of_day = sapply(started_at_time, part_of_day))

   # Function for analysis by part of the day
   analyse_usage <- function(data, top_stations) {
     data %>%
       filter(start_station_name %in% top_stations) %>%
       count(start_station_name, part_of_day) %>%
       arrange(start_station_name, part_of_day)
   }
   
   # Identify the top 20 stations for all users
   top_stations_all <- all_rides_df_clean %>%
     count(start_station_name) %>%
     arrange(desc(n)) %>%
     slice_head(n = 20) %>%
     pull(start_station_name)
   
   # Identify the top 20 stations for members
   top_stations_member <- all_rides_df_clean %>%
     filter(member_casual == "member") %>%
     count(start_station_name) %>%
     arrange(desc(n)) %>%
     slice_head(n = 20) %>%
     pull(start_station_name)
   
   # Identify the top 20 stations for casual riders
   top_stations_casual <- all_rides_df_clean %>%
     filter(member_casual == "casual") %>%
     count(start_station_name) %>%
     arrange(desc(n)) %>%
     slice_head(n = 20) %>%
     pull(start_station_name)
   
   # Use the analyse_usage function for each user group
   hourly_usage_all <- analyse_usage(all_rides_df_clean, top_stations_all)
   hourly_usage_member <- analyse_usage(all_rides_df_clean %>% filter(member_casual == "member"), top_stations_member)
   hourly_usage_casual <- analyse_usage(all_rides_df_clean %>% filter(member_casual == "casual"), top_stations_casual)
   
   # Display and save the data
   cat("Usage by Part of the Day for Top 20 Stations for All Users:\n")
   print(hourly_usage_all)
   cat("Usage by Part of the Day for Top 20 Stations for Members:\n")
   print(hourly_usage_member)
   cat("Usage by Part of the Day for Top 20 Stations for Casual Riders:\n")
   print(hourly_usage_casual)
   ```

</details>

| Riders | Start Station Name | Morning | Afternoon | Evening | Night |
|:------|:-------------------|----------:|--------:|--------:|------:|
|	All Users	|	Broadway & Barry Ave	|	7404	|	8008	|	8967	|	3354	|
|		|	Clark St & Armitage Ave	|	6513	|	8699	|	7696	|	2848	|
|		|	Clark St & Elm St	|	11124	|	8871	|	10506	|	4187	|
|		|	Clark St & Lincoln Ave	|	7071	|	7399	|	7325	|	2763	|
|		|	Clinton St & Madison St	|	10242	|	6849	|	7051	|	1253	|
|		|	Clinton St & Washington Blvd	|	12282	|	8436	|	9771	|	668	|
|		|	DuSable Lake Shore Dr & Monroe St	|	7265	|	18263	|	11051	|	2314	|
|		|	DuSable Lake Shore Dr & North Blvd	|	6105	|	13555	|	13079	|	2077	|
|		|	Ellis Ave & 60th St	|	6819	|	8856	|	6891	|	2080	|
|		|	Indiana Ave & Roosevelt Rd	|	8435	|	7619	|	7026	|	2218	|
|		|	Kingsbury St & Kinzie St	|	11411	|	11231	|	9398	|	1615	|
|		|	Michigan Ave & Oak St	|	7883	|	15423	|	10886	|	1960	|
|		|	Millennium Park	|	4698	|	11736	|	9516	|	3141	|
|		|	Old Hastings Charging Stx	|	193148	|	268964	|	230850	|	118006	|
|		|	Streeter Dr & Grand Ave	|	10229	|	29397	|	18029	|	3588	|
|		|	Theater on the Lake	|	4896	|	13369	|	9539	|	1361	|
|		|	University Ave & 57th St	|	3280	|	12150	|	8065	|	2227	|
|		|	Wells St & Concord Ln	|	7506	|	9452	|	10437	|	5148	|
|		|	Wells St & Elm St	|	8526	|	8202	|	9534	|	3121	|
|		|	Wilton Ave & Belmont Ave	|	4396	|	7893	|	9245	|	5075	|

<details><summary>Continue Viewing the Table</summary>   
   
   | Riders | Start Station Name | Morning | Afternoon | Evening | Night |
   |:------|:-------------------|----------:|--------:|--------:|------:|
   |	Members	|	Broadway & Barry Ave	|	5281	|	5097	|	5882	|	2120	|
   |		|	Canal St & Adams St	|	6046	|	4204	|	5985	|	610	|
   |		|	Clark St & Elm St	|	8440	|	5891	|	7271	|	2489	|
   |		|	Clinton St & Jackson Blvd	|	6417	|	3742	|	5510	|	602	|
   |		|	Clinton St & Madison St	|	8375	|	4904	|	5324	|	781	|
   |		|	Clinton St & Washington Blvd	|	10532	|	6358	|	7604	|	372	|
   |		|	Dearborn St & Erie St	|	5248	|	4639	|	4483	|	1768	|
   |		|	Ellis Ave & 60th St	|	5076	|	6304	|	4857	|	1522	|
   |		|	Kingsbury St & Kinzie St	|	8767	|	8198	|	7150	|	983	|
   |		|	Larrabee St & Kingsbury St	|	4685	|	6937	|	3904	|	611	|
   |		|	Loomis St & Lexington St	|	5664	|	6002	|	5267	|	1282	|
   |		|	Morgan St & Polk St	|	3356	|	7187	|	4370	|	1295	|
   |		|	Old Hastings Charging Stx	|	134834	|	165115	|	145315	|	65938	|
   |		|	State St & Chicago Ave	|	4617	|	5391	|	5675	|	1694	|
   |		|	Streeter Dr & Grand Ave	|	3881	|	6325	|	5374	|	978	|
   |		|	University Ave & 57th St	|	2362	|	8799	|	6404	|	1735	|
   |		|	Wells St & Concord Ln	|	5521	|	5770	|	6527	|	2833	|
   |		|	Wells St & Elm St	|	6304	|	5289	|	6253	|	1802	|
   |		|	Wells St & Huron St	|	5418	|	4507	|	4846	|	1653	|
   |		|	Wilton Ave & Belmont Ave	|	2725	|	4702	|	5990	|	2810	|
   |	Casuals	|	Adler Planetarium	|	1214	|	6412	|	2759	|	1155	|
   |		|	Clark St & Armitage Ave	|	1823	|	4286	|	3308	|	1435	|
   |		|	Clark St & Elm St	|	2684	|	2980	|	3235	|	1698	|
   |		|	Clark St & Lincoln Ave	|	2434	|	3695	|	3154	|	1347	|
   |		|	Dusable Harbor	|	2677	|	7407	|	3890	|	923	|
   |		|	DuSable Lake Shore Dr & Monroe St	|	5420	|	15050	|	7465	|	1580	|
   |		|	DuSable Lake Shore Dr & North Blvd	|	2646	|	8936	|	7039	|	1124	|
   |		|	Indiana Ave & Roosevelt Rd	|	2320	|	4134	|	3544	|	1324	|
   |		|	Michigan Ave & 8th St	|	2883	|	3471	|	2735	|	1518	|
   |		|	Michigan Ave & Oak St	|	4522	|	10281	|	5939	|	1238	|
   |		|	Millennium Park	|	3183	|	8630	|	5513	|	2224	|
   |		|	Montrose Harbor	|	1758	|	5285	|	3911	|	520	|
   |		|	Old Hastings Charging Stx	|	58314	|	103849	|	85535	|	52068	|
   |		|	Shedd Aquarium	|	2066	|	11704	|	2329	|	1160	|
   |		|	Streeter Dr & Grand Ave	|	6348	|	23072	|	12655	|	2610	|
   |		|	Theater on the Lake	|	2084	|	8198	|	4845	|	788	|
   |		|	Wabash Ave & Grand Ave	|	2230	|	3426	|	2442	|	1445	|
   |		|	Wells St & Concord Ln	|	1985	|	3682	|	3910	|	2315	|
   |		|	Wells St & Elm St	|	2222	|	2913	|	3281	|	1319	|
   |		|	Wilton Ave & Belmont Ave	|	1671	|	3191	|	3255	|	2265	|
</details>

<img src="/img_tableau/Most Popular Stations by Time of Day.png" width="950" align="center">
The graph presents the most popular bike rental stations segmented by time of day and user type. It reveals that Old Hastings Charging Stx is the top station across all times of day for both casual riders and members, indicating its central role in the network. Notably, there's a trend showing that certain stations are favored during specific times, such as Streeter Dr & Grand Ave during both morning and night, suggesting these locations may be hubs of activity at the beginning and end of the day. This data can inform decisions on station maintenance, bike supply allocation, and targeted marketing strategies to balance demand throughout the day.

### Summary Revision:

**Members:**
- Members' cycling peaks during commuting hours on weekdays, with a surge from 7 am to 9 am and another from 3 pm to 6 pm, aligning with work-related travel patterns. This trend is most pronounced during the warmer seasons of summer and early fall, as well as spring.
- The data shows members have a higher frequency of rides but with shorter average durations, typically half that of casual riders' journeys.
- Common starting and ending points for members are closely linked to universities, residential neighborhoods, and business districts, suggesting a correlation with daily routines and work or academic commitments.

**Casual Riders:**
- Casual riders demonstrate a preference for midday to early evening rides, peaking from 11 am to 7 pm, with weekends being particularly popular. This pattern is prevalent during leisure-friendly warmer months, such as summer and early fall.
- Their rides are generally longer in duration, about twice as long as those of members, indicating a leisurely or exploratory approach to cycling.
- Preferred locations for casual riders to pick up and drop off bikes include scenic parks, tourist hotspots, museums, waterfront areas, and other places of leisure, underscoring their recreational use of the bike-share system.

## :white_large_square: ACT
### Revised Recommendations

Based on data insights, here are refined strategies for Cyclistic to convert casual riders into annual members:

#### Understanding User Dynamics:

1. **Usage Pattern Analysis**:
   - Investigate the duration, frequency, and timing of bike usage by casual riders compared to members, focusing on peak usage times for targeted promotions.

2. **Membership Value Proposition**:
   - Research what drives casual riders to rent bikes and craft a compelling value proposition for the annual membership that addresses their specific needs and motivations.

3. **Digital Engagement**:
   - Analyze the digital touchpoints where casual riders interact with Cyclistic and develop a digital engagement strategy to nurture their journey towards membership.

### Tactical Steps for Membership Growth:

1. **Tailored Promotions**:
   - Launch special weekday pricing and loyalty rewards aimed at casual riders to incentivize regular usage and familiarity with the service.

2. **Subscription Flexibility**:
   - Offer a range of subscription plans including weekly or monthly passes to serve as stepping stones to full annual membership.

3. **Focused Marketing Efforts**:
   - Target marketing efforts in areas with high casual rider traffic and on platforms popular with tourists, emphasizing the benefits of membership over single-use passes.

### Engagement and Pricing Strategies:

1. **Incentive-Based Pricing**:
   - Introduce a tiered pricing model that encourages longer-term commitments, with clear cost benefits over casual usage.

2. **Membership Perks**:
   - Provide exclusive benefits for members, such as priority bike access during high demand periods or flexible pass options for varying rider needs.

3. **Smart Ad Placement**:
   - Deploy targeted ads in high-traffic locations and during peak seasonal periods to maximize exposure to potential members.

4. **Cost-Savings Messaging**:
   - Highlight the long-term savings and convenience of an annual membership, particularly in comparison to the cumulative cost of multiple casual rentals.

### Strategic Analysis and Market Adaptation:

- **Early Data Utilization**:
  - Prioritize the analysis of emerging trends and the exploration of new data analysis tools to capture nuanced user behaviors.

- **Data-Driven Model Adaptation**:
  - Collect more granular data to understand the preferences of local, occasional riders and adapt the membership model accordingly.

- **Membership Model Innovation**:
  - Re-evaluate the membership offerings to align with the lifestyle and cycling patterns of Chicago's occasional riders, ensuring the model remains competitive and appealing.

<p>&nbsp;</p>

> *Thank you for taking the time to review my project. <br>
> I sincerely appreciate your attention and am eagerly looking forward to your feedback, critiques, or suggestions.*
