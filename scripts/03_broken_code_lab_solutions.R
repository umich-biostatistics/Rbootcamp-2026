# 03 Broken-code lab solutions

library(tidyverse)

# Fix 1: close the parenthesis
health_raw <- read_csv("data/bootcamp_health.csv")

# Fix 2: use the object that exists
health <- read_csv("data/bootcamp_health.csv")
glimpse(health)

# Fix 3: R uses >= for greater than or equal to
health |>
  filter(age >= 50)

# Fix 4: R column names are case-sensitive; the column is bmi, not BMI
health |>
  group_by(sex) |>
  summarize(mean_bmi = mean(bmi, na.rm = TRUE), .groups = "drop")

# Fix 5: the column is sex, not gender
health |>
  ggplot(aes(x = bmi, y = systolic_bp, color = sex)) +
  geom_point()

# Fix 6: remove missing values before calculating the mean
health |>
  summarize(mean_sbp = mean(systolic_bp, na.rm = TRUE))

# Fix 7: use the real column name, smoking_status
lm(systolic_bp ~ age + bmi + smoking_status, data = health)
