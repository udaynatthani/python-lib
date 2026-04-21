library(wordcloud)

data <- read.csv("data.csv")

wordcloud(data$text)