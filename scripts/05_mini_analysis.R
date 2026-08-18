# 05 End-to-end mini-analysis
# This can be used as the final competency check.

library(tidyverse)
library(broom)

health <- read_csv("data/bootcamp_health.csv")

analysis_data <- health |>
  mutate(
    hypertension_flag = systolic_bp >= 130 | diastolic_bp >= 80,
    activity_group = if_else(physical_activity_min_week >= 150,
                             "150+ min/week", "<150 min/week")
  ) |>
  filter(!is.na(bmi), !is.na(systolic_bp), !is.na(activity_group))

analysis_data |>
  group_by(activity_group) |>
  summarize(
    n = n(),
    mean_sbp = mean(systolic_bp),
    percent_hypertension = mean(hypertension_flag) * 100,
    .groups = "drop"
  )

analysis_data |>
  ggplot(aes(x = bmi, y = systolic_bp, color = activity_group)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "BMI and systolic blood pressure by activity group",
    x = "Body mass index",
    y = "Systolic blood pressure",
    color = "Activity group"
  ) +
  theme_minimal()

fit <- lm(systolic_bp ~ age + bmi + activity_group, data = analysis_data)

tidy(fit)
glance(fit)

# Final AI checkpoint:
# Ask AI to explain the model output in plain language.
# Then verify: Which coefficient names appear in tidy(fit)? What is the sample size? What variables were excluded by filter()?
