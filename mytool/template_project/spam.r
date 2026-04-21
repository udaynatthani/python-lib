data <- read.csv("data.csv")

library(tm)
library(e1071)

corpus <- Corpus(VectorSource(data$text))
dtm <- DocumentTermMatrix(corpus)

model <- naiveBayes(as.matrix(dtm), data$label)

pred <- predict(model, as.matrix(dtm))