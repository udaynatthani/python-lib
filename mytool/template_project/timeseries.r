#replace "value" with the actual column name
# Load dataset
data <- read.csv("data.csv")

# Convert to time series
ts_data <- ts(data$value, frequency = 12)

# 1. Trend (moving average)
trend <- filter(ts_data, rep(1/5, 5), sides = 2)

# 2. Exponential smoothing
smooth <- HoltWinters(ts_data, beta=FALSE, gamma=FALSE)

# 3. Forecast
forecast <- predict(smooth, n.ahead = 5)

# Plot
plot(ts_data)
lines(trend, col="red")
lines(smooth$fitted[,1], col="blue")