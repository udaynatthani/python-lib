library(syuzhet)

data <- read.csv("data.csv")

sentiment <- get_sentiment(data$text)

print(sentiment)