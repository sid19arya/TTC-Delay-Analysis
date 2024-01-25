#### Preamble ####
# Purpose: Testscleaned Dataset based on Toronto TTC Delay data
# Author: Siddharth Arya
# Date: 25 January 2024
# Contact: sid.arya@mail.utoronto.ca
# License: MIT
# Pre-requisites: 02-data_cleaning.R


#### Workspace setup ####
library(tidyverse)


#### Test data ####

analysis_data <- read_csv("outputs/data/analysis_data.csv")

# Simple tests to ensure type and values of the columns are as desired

analysis_data$Date |> class() == "character"

analysis_data$total_delay |> class() == "numeric"

analysis_data$incidents |> class() == "numeric"

analysis_data$total_delay |> min() >= 0

analysis_data$incidents |> min() >= 0
