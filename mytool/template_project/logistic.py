import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


def sigmoid(z):
    z = np.clip(z, -500, 500)
    return 1.0 / (1.0 + np.exp(-z))


# Load dataset with schema:
# User ID, Gender, Age, EstimatedSalary, Purchased
df = pd.read_csv("dataset_logi.csv")

required_columns = {"User ID", "Gender", "Age", "EstimatedSalary", "Purchased"}
missing = required_columns - set(df.columns)
if missing:
    raise ValueError(f"Missing required columns: {sorted(missing)}")

# y is Purchased (0/1), X is every other column
y = df["Purchased"].to_numpy(dtype=float)
X_df = df.drop(columns=["Purchased"]).copy()

# Convert categorical feature(s) such as Gender to numeric
categorical_cols = X_df.select_dtypes(include=["object", "category"]).columns
if len(categorical_cols) > 0:
    X_df = pd.get_dummies(X_df, columns=list(categorical_cols), drop_first=True)

X = X_df.to_numpy(dtype=float)

# Standardize features for stable gradient descent
mu = X.mean(axis=0)
sigma = X.std(axis=0)
sigma[sigma == 0] = 1.0
X_scaled = (X - mu) / sigma

# Train logistic regression from scratch (multivariate)
n_samples, n_features = X_scaled.shape
w = np.zeros(n_features, dtype=float)
b = 0.0
lr = 0.1
epochs = 4000

for _ in range(epochs):
    z = X_scaled @ w + b
    y_pred = sigmoid(z)

    error = y_pred - y
    dw = (X_scaled.T @ error) / n_samples
    db = error.mean()

    w -= lr * dw
    b -= lr * db

z_all = X_scaled @ w + b
proba_all = sigmoid(z_all)
pred_all = (proba_all >= 0.5).astype(float)
acc = (pred_all == y).mean()

print("Accuracy:", round(float(acc), 4))

# Plot sigmoid against model score z = wX + b
sample_size = min(3000, n_samples)
rng = np.random.default_rng(42)
sample_idx = rng.choice(n_samples, size=sample_size, replace=False)

z_min, z_max = float(z_all.min()), float(z_all.max())
z_line = np.linspace(z_min, z_max, 400)
p_line = sigmoid(z_line)

plt.figure(figsize=(10, 6))
plt.scatter(
    z_all[sample_idx],
    y[sample_idx],
    alpha=0.15,
    s=12,
    label="Sampled Data (Purchased)",
)
plt.plot(z_line, p_line, color="red", linewidth=2.5, label="Sigmoid Curve")
plt.xlabel("Linear Score (wX + b)")
plt.ylabel("Probability of Purchase")
plt.title("Logistic Regression Sigmoid Curve")
plt.legend()
plt.grid(alpha=0.2)
plt.show()