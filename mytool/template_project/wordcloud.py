import pandas as pd
from wordcloud import WordCloud
import matplotlib.pyplot as plt

df = pd.read_csv("data.csv")

text = " ".join(df["text"])

wc = WordCloud().generate(text)

plt.imshow(wc)
plt.axis("off")
plt.show()