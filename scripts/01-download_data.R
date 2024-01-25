#### Preamble ####
# Purpose: Downloads and saves the data from OpenDataToront
# Author: Siddharth Arya
# Date: 25 January 2024
# Contact: sid.arya@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####

# Using the Opendatatoronto package, we can dowload the dataset and select the appropriate resource as shown below

raw_data_2021 <- show_package("https://open.toronto.ca/dataset/ttc-streetcar-delay-data/") %>%
  list_package_resources() %>%
  filter(name == "ttc-streetcar-delay-data-2021") %>%
  get_resource()

raw_data_2021 <- do.call(rbind, raw_data_2021)
# it in necessary to add this line here, since just downloading the packages gets an array of 12 tibbles (one for each month)
# which need to be binded together before beign turned into a csv! 

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
         
