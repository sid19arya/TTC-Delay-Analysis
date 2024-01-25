#### Preamble ####
# Purpose: Simulates Toronto TTC Delay Data
# Author: Siddharth Arya
# Date: 25 January 2024
# Contact: sid.arya@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####

set.seed(149)

# Here we simply generate our 3 columns, 1 with date in string for, the other 2 as integers ranging in value.

Date <- c("01/21","02/21","03/21","04/21","05/21","06/21","07/21","08/21","09/21","10/21","11/21","12/21",
          "01/22","02/22","03/22","04/22","05/22","06/22","07/22","08/22","09/22","10/22","11/22","12/22",
          "01/23","02/23","03/23","04/23","05/23","06/23","07/23","08/23","09/23","10/23","11/23","12/23")


Incidents <- sample(seq(200, 1000), 36, replace = TRUE)
  

Total_delay <- sample(seq(200, 1000), 36, replace = TRUE)


sim_data <- tibble(Date, Incidents, Total_delay)
