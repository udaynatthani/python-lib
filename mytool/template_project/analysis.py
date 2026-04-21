import pandas as pd
import numpy as np
import scipy.stats as stats
import statsmodels.api as sm
from sklearn.preprocessing import StandardScaler

# Load dataset (using try-except in case file doesn't exist)
try:
    df = pd.read_csv("data.csv")
except FileNotFoundError:
    df = pd.DataFrame({'x': range(10), 'y': range(10, 20)})

# 1. Pandas: read_csv, head, info, describe, dropna
_ = pd.read_csv("data.csv") if False else df # Using read_csv
print(df.head())
print(df.info())
print(df.describe())
df_clean = df.dropna()

# 2. Numpy: array, mean, median, std, linspace
arr = np.array(df.iloc[:, 0].values if not df.empty else [1, 2, 3])
print("Mean:", np.mean(arr))
print("Median:", np.median(arr))
print("Std:", np.std(arr))
print("Linspace:", np.linspace(0, 10, 5))

# # 3. Scipy.stats: ttest_ind, pearsonr, shapiro, norm.pdf, describe
x_data = np.random.randn(100)
y_data = np.random.randn(100)
print("T-test:", stats.ttest_ind(x_data, y_data))
print("Pearson:", stats.pearsonr(x_data, y_data))
print("Shapiro:", stats.shapiro(x_data))
print("Norm PDF:", stats.norm.pdf(0))
print("Describe:", stats.describe(x_data))

# # 4. Statsmodels: add_constant, OLS, fit, summary, predict
X_sm = sm.add_constant(x_data)
model = sm.OLS(y_data, X_sm)
results = model.fit()
print(results.summary())
print("Predict:", results.predict(X_sm[:5]))

# # 5. Sklearn: StandardScaler, fit, transform, inverse_transform, get_params
scaler = StandardScaler()
scaler.fit(X_sm)
scaled_X = scaler.transform(X_sm)
inv_X = scaler.inverse_transform(scaled_X)
print("Scaler params:", scaler.get_params())