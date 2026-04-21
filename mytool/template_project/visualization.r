data <- read.csv("data.csv")
if (nrow(data) == 0) {
  data <- data.frame(x = 1:10, y = 11:20)
}

# 1. ggplot2
suppressMessages(library(ggplot2))
# Functions: ggplot, aes, geom_point, geom_line, theme_minimal
g <- ggplot(data, aes(x=x, y=y))
g_pt <- g + geom_point()
g_line <- g + geom_line()
g_bar <- ggplot(data, aes(x=x, y=y)) + geom_bar(stat="identity")
g_final <- g_pt + theme_minimal()

# 2. plotly
suppressMessages(library(plotly))
# Functions: plot_ly, add_trace, add_markers, add_lines, layout
p <- plot_ly(data, x = ~x, y = ~y)
p <- add_trace(p, y = ~y, mode = 'lines', type='scatter')
p <- add_markers(p)
p <- add_lines(p)
p <- layout(p, title = "Plotly Chart")

# 3. lattice
suppressMessages(library(lattice))
# Functions: xyplot, bwplot, histogram, densityplot, stripplot
p_xy <- xyplot(y ~ x, data = data)
p_bw <- bwplot(~ y, data = data)
p_hist <- histogram(~ x, data = data)
p_dens <- densityplot(~ y, data = data)
p_strip <- stripplot(~ x, data = data)

# 4. ggthemes
suppressMessages(library(ggthemes))
# Functions: theme_economist, theme_wsj, theme_tufte, theme_fivethirtyeight, theme_stata
t1 <- g_final + theme_economist()
t2 <- g_final + theme_wsj()
t3 <- g_final + theme_tufte()
t4 <- g_final + theme_fivethirtyeight()
t5 <- g_final + theme_stata()

# 5. gridExtra
suppressMessages(library(gridExtra))
# Functions: grid.arrange, arrangeGrob, tableGrob, marrangeGrob, ttheme_default
g1 <- ggplot(data, aes(x)) + geom_histogram(bins=5)
g2 <- ggplot(data, aes(y)) + geom_histogram(bins=5)
arr_grob <- arrangeGrob(g1, g2)
tbl_grob <- tableGrob(head(data))
m_grob <- marrangeGrob(list(g1, g2), nrow=1, ncol=2)
t_theme <- ttheme_default()

print("Visualization (R) executed successfully.")