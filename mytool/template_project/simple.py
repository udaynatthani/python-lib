import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Load dataset
df = pd.read_csv("dataset_slr.csv")

# Select independent and dependent variables as 1D arrays
x = df["YearsExperience"].to_numpy(dtype=float)
y = df["Salary"].to_numpy(dtype=float)

# Train model from scratch using least squares for y = m*x + b
x_mean = np.mean(x)
y_mean = np.mean(y)

numerator = np.sum((x - x_mean) * (y - y_mean))
denominator = np.sum((x - x_mean) ** 2)

if denominator == 0:
	raise ValueError("Cannot fit regression: all YearsExperience values are identical.")

m = numerator / denominator
b = y_mean - m * x_mean

# Predict values
y_pred = m * x + b

# Plot graph
plt.scatter(x, y)

plt.plot(x, y_pred, color="red")

plt.xlabel("Years of Experience")
plt.ylabel("Salary")
plt.title("Linear Regression")
plt.show()