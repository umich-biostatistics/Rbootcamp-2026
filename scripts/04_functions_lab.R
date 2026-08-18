# 04 Functions lab
# Goal: turn repeated analysis code into a small function.

library(tidyverse)

health <- read_csv("data/bootcamp_health.csv")

# Step 1: start with working repeated code.
health |>
  group_by(sex) |>
  summarize(
    n = n(),
    mean_bmi = mean(bmi, na.rm = TRUE),
    sd_bmi = sd(bmi, na.rm = TRUE),
    .groups = "drop"
  )

health |>
  group_by(diabetes) |>
  summarize(
    n = n(),
    mean_bmi = mean(bmi, na.rm = TRUE),
    sd_bmi = sd(bmi, na.rm = TRUE),
    .groups = "drop"
  )

# Step 2: decide what changes each time.
# The data changes? The grouping column changes? The numeric column changes?

# Step 3: fill in this function.
summarize_numeric_by_group <- function(data, group_col, value_col) {
  # replace this line with your code
}

# Step 4: test your function.
# summarize_numeric_by_group(health, sex, bmi)
# summarize_numeric_by_group(health, diabetes, systolic_bp)

# AI refactoring prompt:
# "Here is repeated R code that already works. Please help me turn it into a function.
# Explain the arguments, the return value, and how to test it. Keep the function beginner-readable."
