import pandas as pd
from textblob import TextBlob

# Load dataset
df = pd.read_csv("data.csv")

# Apply sentiment
df["sentiment"] = df["text"].apply(lambda x: TextBlob(x).sentiment.polarity)

print(df["sentiment"])