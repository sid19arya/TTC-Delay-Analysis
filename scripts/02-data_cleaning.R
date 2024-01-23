#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data_2021 <- read_csv("inputs/data/raw_data_2021.csv")
raw_data_2022 <- read_csv("inputs/data/raw_data_2022.csv")
raw_data_2023 <- read_csv("inputs/data/raw_data_2023.csv")

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


final_data <- rbind(clean_2021, clean_2022, clean_2023)

#### Save data ####
write_csv(final_data, "outputs/data/analysis_data.csv")
