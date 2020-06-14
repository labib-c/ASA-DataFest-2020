## ASA DataFest 2020
## Analysis on the societal impact of COVID-19 on tweets.
## Authors:
## Date: June 14, 2020

library(dplyr)
library(ggplot2)
library(utils)

# Load COVID-19 daily cases data.
data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM")

# Sum daily cases for all countries.
d <- data.frame(date=data$dateRep, dailycount=data$cases)
df <- d %>% group_by(date) %>% summarize(dailycount = sum(dailycount))

plot(df$dailycount ~ df$date)
