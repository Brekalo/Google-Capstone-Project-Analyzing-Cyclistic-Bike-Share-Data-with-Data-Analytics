<sub>*Data analysis code and documentation for Cyclistic's bike share data is contained in this repository.
There are several phases to the project, from data analysis to data visualization to recommendations, and this README summarizes each phase.*</sub>

# Data Analytics Capstone Project: Cyclistic Bike Sharing Analysis
**Case Study: How Does a Bike-Share Navigate Speedy Success?** <br>
<sub>*by Vesna Marija Brekalo*</sub><br>
<sub>*February, 23 2024*</sub>

## :white_large_square: FOREWORD
I completed a case study on **Cyclistic** bike-share for my Google Data Analytics certification, inspired by my passion for cycling. This project, my first in analytics, explores the differences between casual and member riders following Google's framework: **Ask**, **Prepare**, **Process**, **Analyze**, **Share**, **Act**. Check out [my data visualizations here](https://www.linkedin.com/in/vesna-marija-brekalo).

> **Table of Contents:**
> * **INTRODUCTION** <a href="#[user-content-some-heading](https://github.com/Brekalo/Google-Capstone-Project-Analyzing-Cyclistic-Bike-Share-Data-with-Data-Analytics/blob/main/README.md#white_large_square-introduction)" id="INTRODUCTION">#</a>
>   * Project Overview and Context 
> * **ASK**
>   * Business Goals and Objectives 
>   * Defining the Analytical Task 
>   * Identifying Key Stakeholders 
> * **PREPARE**
>   * Data Sourcing and Initial Exploration 
> * **PROCESS**
>   * Data Cleaning and Preprocessin 
> * **ANALYZE & SHARE**
>   * Ride Volume Analysis 
>   * Average Ride Duration Insights 
>   * Bike Type Preferences 
>   * Temporal Usage Patterns 
>   * Station Popularity Metrics 
> * **ACT**
>   * Strategic Recommendations for Action

## :white_large_square: INTRODUCTION
**Cyclistic**, founded in 2016, operates a vast fleet of over 16,500 bicycles covering 190 square miles in Chicago. The bikes, strategically located across 800 stations in the city, cater to urban riders with diverse heights and abilities, boasting a design focused on comfort and stability. Users can unlock bikes at any station and return them to any other station at their convenience.

Initially, Cyclistic's marketing aimed at raising general awareness and appealing to a diverse audience with various pricing plans: single-ride passes, full-day passes, and annual memberships. Casual riders are those opting for short-term passes, whereas annual memberships are purchased by Cyclistic members.

Financial analysis indicates annual members generate more profit than casual riders. To capitalize on this, Moreno, Cyclistic's director of marketing, prioritizes converting casual riders into members rather than attracting new customers. The strategy revolves around understanding the differences between these groups, why casual riders might switch to memberships, and the role of digital media in marketing.

Maximizing annual memberships is key to Cyclistic's future success, prompting Moreno's team to analyze historical trip data to uncover trends. As their recommendations necessitate executive approval, they must provide compelling data insights and professional visualizations.

## :white_large_square: ASK
**Business Objective:**<br>
Develop effective marketing strategies to convert casual riders into annual members. <br>

To **achieve** this **objective**, the future marketing program will address the following three pivotal **questions**:
> 1. How do annual members and casual riders use Cyclistic bikes differently?
> 2. Why would casual riders buy Cyclistic annual memberships?
> 3. How can Cyclistic leverage digital media to encourage casual riders to transition into annual members?

**Key Stakeholders:**
- Lily Moreno: Director of the marketing team and my supervisor.
- Cyclistic executive team.

## :white_large_square: PREPARE
### Data Collection and Sources:

For this case study, we utilize data from Divvy, a real bike share company operating in Chicago, as a proxy for the fictional company Cyclistic.<br>
These datasets are publicly available through Motivate International Inc. [under a specified license](https://divvybikes.com/data-license-agreement) and can be accessed for [download here](https://divvy-tripdata.s3.amazonaws.com/index.html).<br>
The data is released monthly and is characterized by being anonymized, reliable, original, comprehensive, up-to-date, and properly cited.
<br>
<div>
   <img src="img_divvy/Screenshot 2024-01-04 at 12.17.27.png" width="400" align="center">
</div>
<br>

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

#### Divvy [Pricing](https://divvybikes.com/pricing) Summary:

<div>
   <img src="img_divvy/divvy_plans.jpg" width="600" align="center">
</div>
<br>

- **Single Ride**: \\$3.30 for up to 30 minutes, with a \\$0.15 per minute overage charge.
- **Daily Pass**: \\$15 for 24-hour access with unlimited classic bike rides up to 3 hours each; overage cost is \\$0.15 per minute for rides over 3 hours.
- **E-Bike Single Ride**: \\$3.30 with an additional \\$0.20 per minute while in use.
- **Annual Membership**: \\$9 monthly for unlimited 45-minute rides; rides exceeding this duration incur a \\$0.16 per minute overage fee.
- **Lost/Stolen Bike Fee**: A penalty of \\$1200.
- **Cycling for Everyone (C4E)**: A program for eligible residents offering a \\$5 annual membership with specific rates and credits for e-bike use.
- **Miscellaneous Fees**: E-bikes can be parked at public racks within the service area for \\$1, with a \\$25 fine for parking violations or if parked outside the service area.

#### Tools Utilized for Defining Objectives and Analysis:
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

#### Setting up the programming environment

Installing essential packages and libraries for data cleaning and analysis included installing the `tidyverse` package and the `data.table` package, and subsequently, their libraries were also loaded:

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

### Combined all 12 spreadsheets (months) into a single file, all_rides_df_clean.csv

## :white_large_square: ANALYZE & SHARE

## :white_large_square: ACT

#### It is not yet finished, the rest will be added soon :)
