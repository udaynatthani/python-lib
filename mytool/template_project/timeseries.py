#replace value with actual column names

import pandas as pd
import matplotlib.pyplot as plt

# Load dataset
df = pd.read_csv("data.csv")

# Convert date column
df["date"] = pd.to_datetime(df["date"])
df.set_index("date", inplace=True)

# 1. Trend (rolling mean)
df["trend"] = df["value"].rolling(window=5).mean()

# 2. Exponential smoothing
df["smooth"] = df["value"].ewm(span=5).mean()

# 3. Simple forecasting (shift)
df["forecast"] = df["value"].shift(1)

# Plot
plt.plot(df["value"], label="Original")
plt.plot(df["trend"], label="Trend")
plt.plot(df["smooth"], label="Smoothed")
plt.legend()
plt.show()