import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import plotly.express as px
import plotly.graph_objects as go
import altair as alt

try:
    df = pd.read_csv("data.csv")
    if df.empty or 'x' not in df.columns or 'y' not in df.columns:
        df = pd.DataFrame({'x': range(10), 'y': range(10, 20)})
except Exception:
    df = pd.DataFrame({'x': range(10), 'y': range(10, 20)})

# 1. Matplotlib
plt.figure()
plt.plot(df["x"], df["y"])
plt.title("Line Plot Matplotlib")
plt.xlabel("X")
plt.show()

# 2. Seaborn
sns.set_theme()

plt.figure()
sns.scatterplot(data=df, x="x", y="y")
plt.title("Seaborn Scatterplot")
plt.show()

plt.figure()
sns.histplot(data=df, x="y")
plt.title("Seaborn Histplot")
plt.show()

# 3. Plotly Express
fig1 = px.scatter(df, x="x", y="y", title="PX Scatter")
fig1.show()

# 4. Plotly.graph_objects
fig_go = go.Figure()
scatter_go = go.Scatter(x=df["x"], y=df["y"], mode='lines')
fig_go.add_trace(scatter_go)
fig_go.update_layout(title="GO Plot")
fig_go.show()

# 5. Altair
chart = alt.Chart(df).mark_point().encode(x='x', y='y')
# Saving Altair to html to avoid IPython crash on terminal
chart.save("altair_chart.html")
print("Saved Altair chart to 'altair_chart.html' (open it in your browser).")

print("Visualization tests completed.")