library(data.table)
library(ggplot2)
library(dplyr)
hashtags_path <- "/Users/labibchowdhury/Projects/ASA-DataFest-2020/covid-tweets/hashtags"
files <- list.files(path=hashtags_path, pattern="*.tsv", full.names=TRUE, recursive=FALSE)
temp <- lapply(files, fread, sep="\t") 
data <- rbindlist( temp ) %>% group_by(V1)
data <- aggregate(data['V2'], by=data['V1'], sum)
sorted <- data[order(data$V2, decreasing = TRUE),]
p<-ggplot(data=sorted[1:50,], aes(reorder(V1, V2, sum), V2)) +
  geom_bar(stat="identity", width=0.5,position=position_dodge(0.6)) +
  labs(y= "Count", x = "Hashtag") +
  theme_minimal()
p

# Horizontal bar plot
p + coord_flip()

