import pandas as pd
from statsmodels.tsa.arima.model import ARIMA
import matplotlib.pyplot as plt

# Load dataset
df = pd.read_csv("data.csv")

# Convert date column
df["date"] = pd.to_datetime(df["date"])
df.set_index("date", inplace=True)

# Fit ARIMA model (p,d,q)
model = ARIMA(df["value"], order=(1,1,1))
model_fit = model.fit()

# Forecast next values
forecast = model_fit.forecast(steps=5)

# Plot
plt.plot(df["value"], label="Original")
plt.plot(forecast, label="Forecast")
plt.legend()
plt.show()