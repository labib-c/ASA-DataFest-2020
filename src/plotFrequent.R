library(data.table)
library(ggplot2)
terms <- fread('/Users/labibchowdhury/Projects/ASA-DataFest-2020/covid-tweets/frequent_terms.csv')
sorted_terms <- terms[order(terms$count, decreasing = TRUE),]
options(scipen=7)
p<-ggplot(data=sorted_terms[1:20], aes(reorder(term, count, sum), count)) +
  geom_bar(stat="identity", width=0.5,position=position_dodge(0.6)) +
  labs(y= "Count", x = "Terms") +
  theme_minimal()
p

# Horizontal bar plot
p + coord_flip()