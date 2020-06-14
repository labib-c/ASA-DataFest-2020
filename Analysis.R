## ASA DataFest 2020
## Analysis on the societal impact of COVID-19 on tweets.
## Authors:
## Date: June 14, 2020

library(utils)

# Load COVID-19 daily cases data.
data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM")
