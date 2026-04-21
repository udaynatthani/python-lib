# Load data
data <- read.csv("data.csv")
if (nrow(data) == 0) {
  data <- data.frame(x = 1:10, y = 11:20)
}

# 1. dplyr
suppressMessages(library(dplyr))
# Functions: select, filter, mutate, arrange, summarise
d1 <- select(data, everything())
d2 <- filter(d1, !is.na(d1[[1]]))
d3 <- mutate(d2, new_col = 1)
d4 <- arrange(d3, new_col)
d5 <- summarise(d4, n = n())

print("DPLYR OUTPUT:")
print(d5)

# 2. tidyr
suppressMessages(library(tidyr))
# Functions: drop_na, replace_na, pivot_longer, pivot_wider, separate
toy_df <- data.frame(id = "1_a", val_1 = 1, val_2 = 2)
t1 <- drop_na(toy_df)
t2 <- replace_na(toy_df, list(val_1 = 0))
t3 <- pivot_longer(toy_df, cols = starts_with("val"))
t4 <- pivot_wider(t3, names_from = name, values_from = value)
t5 <- separate(toy_df, col = "id", into = c("id_num", "id_char"), sep = "_")

print("TIDYR OUTPUT:")
print(t3)


# 3. stringr
suppressMessages(library(stringr))
# Functions: str_length, str_to_lower, str_to_upper, str_detect, str_replace
s1 <- str_length("hello")
s2 <- str_to_lower("HELLO")
s3 <- str_to_upper("hello")
s4 <- str_detect("hello", "e")
s5 <- str_replace("hello", "e", "A")


print("STRINGR OUTPUT:")
print(s1)

# 4. lubridate
suppressMessages(library(lubridate))
# Functions: ymd, month, year, day, today
l1 <- ymd("2020-01-01")
l2 <- month(l1)
l3 <- year(l1)
l4 <- day(l1)
l5 <- today()

print("LUBRIDATE OUTPUT:")
print(l1)

# 5. purrr
suppressMessages(library(purrr))
# Functions: map, map_dbl, map_chr, map_lgl, keep
p1 <- map(1:3, ~ .x * 2)
p2 <- map_dbl(1:3, ~ as.numeric(.x))
p3 <- map_chr(1:3, ~ as.character(.x))
p4 <- map_lgl(1:3, ~ .x > 1)
p5 <- keep(1:5, ~ .x > 3)

print("PURRR OUTPUT:")
print(p1)

print("Analysis executed successfully.")