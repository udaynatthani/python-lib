import pandas as pd
from sklearn.linear_model import LinearRegression

# Load dataset
df = pd.read_csv("dataset_mlr.csv")

# Convert Yes/No to 1/0 for regression
df["Extracurricular Activities"] = (
	df["Extracurricular Activities"].map({"Yes": 1, "No": 0})
)

# X = all input columns, y = Performance Index
X = df[
	[
		"Hours Studied",
		"Previous Scores",
		"Extracurricular Activities",
		"Sleep Hours",
		"Sample Question Papers Practiced",
	]
]
y = df["Performance Index"]

# Train multiple linear regression model
model = LinearRegression()
model.fit(X, y)

# Predict on same data (simple practical demo)
y_pred = model.predict(X)

print("Intercept:", model.intercept_)
print("Coefficients:")
for name, value in zip(X.columns, model.coef_):
	print(f"{name}: {value}")

print("\nFirst 5 predictions:")
for actual, pred in zip(y.head(5), y_pred[:5]):
	print(f"Actual = {actual:.2f}, Predicted = {pred:.2f}")