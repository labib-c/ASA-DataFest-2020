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
ggplot(data=df, aes(x=seq(1,length(files)), y=avg_sentiment, group=1)) +
  geom_line()+
  geom_point()+
  labs(y = "Average Sentiment", x = "Days") 