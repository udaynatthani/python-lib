import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Load dataset
df = pd.read_csv("data.csv")

# Convert date column
if "date" in df.columns:
    df["date"] = pd.to_datetime(df["date"])
    df.set_index("date", inplace=True)

values = df["value"].values

# ------------- MANUAL ARIMA (p, d, q) -------------
def fit_forecast_arima(series, p=1, d=1, q=1, steps=5):
    # 1. Differencing (I = d)
    diff_history = [series.copy()]
    diff = series.copy()
    for _ in range(d):
        diff = diff[1:] - diff[:-1]
        diff_history.append(diff.copy())
        
    # Helper to create lagged features
    def create_lags(data, lags):
        if lags == 0 or len(data) <= lags:
            return np.empty((0, 0)), np.empty((0,))
        X, y = [], []
        for i in range(lags, len(data)):
            X.append(data[i-lags:i][::-1])  # [t-1, t-2, ..., t-lags]
            y.append(data[i])
        return np.array(X), np.array(y)
    
    # 2. AR(p) calculation
    if p > 0:
        X_ar, y_ar = create_lags(diff, p)
        if len(X_ar) > 0:
            X_ar_b = np.c_[np.ones((len(X_ar), 1)), X_ar]
            ar_coeffs = np.linalg.lstsq(X_ar_b, y_ar, rcond=None)[0]
            c = ar_coeffs[0]
            phi = ar_coeffs[1:]
            residuals_full = y_ar - X_ar_b.dot(ar_coeffs)
            residuals = np.concatenate([np.zeros(p), residuals_full])
        else:
            c, phi, residuals = 0, np.zeros(p), diff
    else:
        c = np.mean(diff) if len(diff) > 0 else 0
        phi = np.array([])
        residuals = diff - c
        
    # 3. MA(q) calculation
    if q > 0:
        X_ma, y_ma = create_lags(residuals, q)
        if len(X_ma) > 0:
            theta = np.linalg.lstsq(X_ma, y_ma, rcond=None)[0]
        else:
            theta = np.zeros(q)
    else:
        theta = np.array([])
        
    # 4. Forecasting & Undifferencing
    forecasts = []
    history = [list(h) for h in diff_history]
    current_resid = list(residuals)
    
    for _ in range(steps):
        next_val_at_d = c
        
        # AR part (phi)
        if p > 0:
            for i in range(p):
                if len(history[d]) > i:
                    next_val_at_d += phi[i] * history[d][-(i+1)]
                    
        # MA part (theta)
        if q > 0:
            for i in range(q):
                if len(current_resid) > i:
                    next_val_at_d += theta[i] * current_resid[-(i+1)]
                    
        current_resid.append(0)  # Future error is theoretically 0
        history[d].append(next_val_at_d)
        
        # Undifferencing loop (restore to actual original scale)
        for level in range(d-1, -1, -1):
            next_un_diff = history[level][-1] + history[level+1][-1]
            history[level].append(next_un_diff)
            
        forecasts.append(history[0][-1])
        
    return forecasts

# You can dynamically adjust p, d, q here
forecast = fit_forecast_arima(values, p=1, d=1, q=1, steps=5)

# Create index for forecast plotting
if isinstance(df.index, pd.DatetimeIndex):
    # Try to infer freq, or default to generic days
    freq = pd.infer_freq(df.index) or 'D'
    future_dates = pd.date_range(start=df.index[-1], periods=6, freq=freq)[1:]
    forecast_series = pd.Series(forecast, index=future_dates)
else:
    forecast_series = pd.Series(forecast, index=range(len(values), len(values)+5))

# Plot
plt.plot(df.index, df["value"], label="Original")
plt.plot(forecast_series.index, forecast_series, label="Forecast", marker='o')
plt.legend()
plt.show()