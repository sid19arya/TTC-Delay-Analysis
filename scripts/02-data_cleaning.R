#### Preamble ####
# Purpose: Cleans the raw TTC delay data from OpenDataToronto
# Author: Siddharth Arya
# Date: 25 January 2024
# Contact: sid.arya@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R


#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data_2021 <- read_csv("inputs/data/raw_data_2021.csv")
raw_data_2022 <- read_csv("inputs/data/raw_data_2022.csv")
raw_data_2023 <- read_csv("inputs/data/raw_data_2023.csv")

# We clean each dataset independantly and add the date column (which adds the month in a readable string format), 
# counts and accumulates incidents, and sums total delay tines

clean_2021 <- raw_data_2021 %>% drop_na() %>% 
  mutate(Date = format(Date,"%m/21")) %>% 
  group_by(Date) %>%
  summarize(incidents = n(), total_delay = sum(`Min Delay`))

clean_2022 <- raw_data_2022 %>% drop_na() %>% 
  mutate(Date = format(Date,"%m/22")) %>% 
  group_by(Date) %>%
  summarize(incidents = n(), total_delay = sum(`Min Delay`))

clean_2023 <- raw_data_2023 %>% drop_na() %>% 
  mutate(Date = format(Date,"%m/23")) %>% 
  group_by(Date) %>%
  summarize(incidents = n(), total_delay = sum(`Min Delay`)) 

# We now concatonate the tables for the three years together
final_data <- rbind(clean_2021, clean_2022, clean_2023)

# This numeric months elasped column (specifically, months elapsed since Jan/21) helps us display 
# our data in a scatterplot and conduct a test correlation
# It contains the smae info as the Date column in a different format.
final_data <- final_data %>%
  mutate(months_elapsed = 1:nrow(final_data))

#### Save data ####
write_csv(final_data, "outputs/data/analysis_data.csv")
