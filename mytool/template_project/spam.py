#replace "text" with you text column
#replace label with spam/ham column name

import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import MultinomialNB

# Load dataset
df = pd.read_csv("data.csv")

# X = text, y = label (spam/ham)
X = df["text"]
y = df["label"]

# Convert text to numbers
cv = CountVectorizer()
X = cv.fit_transform(X)

# Train model
model = MultinomialNB()
model.fit(X, y)

# Predict
y_pred = model.predict(X)