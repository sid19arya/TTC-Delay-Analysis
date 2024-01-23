#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####

raw_data_2021 <- show_package("https://open.toronto.ca/dataset/ttc-streetcar-delay-data/") %>%
  list_package_resources() %>%
  filter(name == "ttc-streetcar-delay-data-2021") %>%
  get_resource()
raw_data_2021 <- do.call(rbind, raw_data_2021)
# it in necessary to add this line here, since just downloading the packages gets an array of 12 tibbles which need to be binded together before beign turned into a csv! 

raw_data_2022 <- show_package("https://open.toronto.ca/dataset/ttc-streetcar-delay-data/") %>%
  list_package_resources() %>%
  filter(name == "ttc-streetcar-delay-data-2022") %>%
  get_resource()

raw_data_2023 <- show_package("https://open.toronto.ca/dataset/ttc-streetcar-delay-data/") %>%
  list_package_resources() %>%
  filter(name == "ttc-streetcar-delay-data-2023") %>%
  get_resource()



#### Save data ####

write_csv(raw_data_2021, "inputs/data/raw_data_2021.csv") 
write_csv(raw_data_2022, "inputs/data/raw_data_2022.csv") 
write_csv(raw_data_2023, "inputs/data/raw_data_2023.csv") 
         
