library(data.table)
library(ggplot2)
library(dplyr)
library(plyr)
path <- "/Users/labibchowdhury/Projects/ASA-DataFest-2020/covid-tweets/"
files <- list.files(path=path, pattern="corona_tweets_*", full.names=TRUE, recursive=FALSE)
sentiments <- list()
total_tweets <- list()
for (f in files){
  df <- fread(f)
  avg <- mean(df$V2)
  sentiments <- append(avg, sentiments)
  total_tweets <- append(nrow(df), total_tweets)
}
df <- ldply (sentiments, data.frame) 
total_tweets_df <- ldply(total_tweets, data.frame)
names(df)[names(df) == "X..i.."] <- "avg_sentiment"
names(total_tweets_df)[names(total_tweets_df) == "X..i.."] <- "total_tweets"

data <- fread("/Users/labibchowdhury/Projects/ASA-DataFest-2020/covid-tweets/new_cases.csv")
# Sum daily cases for all countries.
d <- data.frame(date=data$date, dailycount=data$World)
d$date <- as.Date(d$date)
days = d$date >= as.Date('2020-03-20') & d$date <= as.Date('2020-06-07')
d <- d[days,]

df$date <- rev(d$date)
total_tweets_df$date <- rev(d$date)
ggplot() +
  geom_line(data=d, aes(x=date, y=dailycount, group=1), color = "red") +
  labs(y = "New Cases", x = "Date") 

ggplot() +
  geom_line(data = df, aes(x = date, y=avg_sentiment, group=1), color = "blue") +
  labs(y = "Average Sentiment", x = "Date")

ggplot() +
  geom_line(data = total_tweets_df, aes(x = date, y=total_tweets, group=1), color = "green") +
  labs(y = "Tweets", x = "Date")
  
  