# 04 Functions lab solutions

library(tidyverse)

health <- read_csv("data/bootcamp_health.csv")

summarize_numeric_by_group <- function(data, group_col, value_col) {
  data |>
    group_by({{ group_col }}) |>
    summarize(
      n = n(),
      mean = mean({{ value_col }}, na.rm = TRUE),
      sd = sd({{ value_col }}, na.rm = TRUE),
      missing = sum(is.na({{ value_col }})),
      .groups = "drop"
    )
}

summarize_numeric_by_group(health, sex, bmi)
summarize_numeric_by_group(health, diabetes, systolic_bp)
summarize_numeric_by_group(health, smoking_status, total_cholesterol)
