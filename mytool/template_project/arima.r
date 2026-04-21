# Load dataset
data <- read.csv("data.csv")

# Convert to time series
ts_data <- ts(data$value, frequency = 12)

# Fit ARIMA model
model <- arima(ts_data, order = c(1,1,1))

# Forecast
forecast <- predict(model, n.ahead = 5)

# Plot
plot(ts_data)
lines(forecast$pred, col="red")