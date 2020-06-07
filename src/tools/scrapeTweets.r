#install.packages("rtweet")
#install.packages("tidytext")
#install.packages("dplyr")
#install.packages("ggplot2")

library(rtweet)
library(plyr)
if (!requireNamespace("httpuv", quietly = TRUE)) {
  install.packages("httpuv")
}

twitterAuth <- function(){
  api_key <- "API KEY"
  api_secret_key <- "API SECRET KEYß"
  
  ## authenticate via web browser
  token <- create_token(
    app = "ASADataFest",
    consumer_key = api_key,
    consumer_secret = api_secret_key)
  
  get_token()  
}

tweets <- search_tweets("pandemic",
                        n = 100000,
                        include_rts = FALSE, 
                        token = bearer_token(),
                        retryonratelimit = TRUE,
                        lang = "en")

df <- as.data.frame(tweets, row.names = TRUE)
df2 = data.frame(lapply(df, as.character), stringsAsFactors=FALSE)

write.csv(df2,"~/Projects/ASA-DataFest-2020/data/pandemic_tweets.csv")


