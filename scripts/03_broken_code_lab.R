# 03 Broken-code lab
# Run ONE block at a time. Do not source the entire file at once.
# Goal: read the error, inspect objects, fix the smallest thing, then rerun.

library(tidyverse)

# Bug 1: missing punctuation
health_raw <- read_csv("data/bootcamp_health.csv"

# Bug 2: object name mismatch
health <- read_csv("data/bootcamp_health.csv")
glimpse(health_raw)

# Bug 3: comparison operator
health |>
  filter(age => 50)

# Bug 4: column name mismatch
health |>
  group_by(sex) |>
  summarize(mean_bmi = mean(BMI, na.rm = TRUE))

# Bug 5: variable that does not exist in the plot
health |>
  ggplot(aes(x = bmi, y = systolic_bp, color = gender)) +
  geom_point()

# Bug 6: missing-value surprise
health |>
  summarize(mean_sbp = mean(systolic_bp))

# Bug 7: model formula uses a variable name that is not in the data
lm(systolic_bp ~ age + bmi + smoking, data = health)

# AI debugging prompt:
# "I am a beginning R user. This code gives the error below. Please explain the error,
# ask me what object or column names I should inspect, and suggest the smallest fix.
# Do not rewrite the entire script. Code: ... Error: ..."
