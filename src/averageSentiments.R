library(data.table)
library(ggplot2)
library(dplyr)
library(plyr)
path <- "/Users/labibchowdhury/Projects/ASA-DataFest-2020/covid-tweets/"
files <- list.files(path=path, pattern="corona_tweets_*", full.names=TRUE, recursive=FALSE)
sentiments <- list()
for (f in files){
  df <- fread(f)
  avg <- mean(df$V2)
  sentiments <- append(avg, sentiments)
}
df <- ldply (sentiments, data.frame) 
names(df)[names(df) == "X..i.."] <- "avg_sentiment"
avg_plot <- ggplot(data=df, aes(x=seq(1,length(files)), y=avg_sentiment, group=1)) +
  geom_line()+
  geom_point()+
  labs(y = "Average Sentiment", x = "Days") 

data <- fread("/Users/labibchowdhury/Projects/ASA-DataFest-2020/covid-tweets/new_cases.csv")
# Sum daily cases for all countries.
d <- data.frame(date=data$date, dailycount=data$World)
d$date <- as.Date(d$date)
days = d$date >= as.Date('2020-03-20') & d$date <= as.Date('2020-06-07')
d <- d[days,]

df$date = d$date
ggplot() +
  geom_line(data=d, aes(x=date, y=dailycount, group=1), color = "red") +
  labs(y = "New Cases", x = "Date") 

ggplot() +
  geom_line(data = df, aes(x = date, y=avg_sentiment, group=1), color = "blue") +
  labs(y = "Average Sentiment", x = "Date")
