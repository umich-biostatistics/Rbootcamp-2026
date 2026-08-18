# 02 Wrangling and plotting

library(tidyverse)

health_raw <- read_csv("data/bootcamp_health.csv")

health_clean <- health_raw |>
  mutate(
    visit_date = as.Date(visit_date),
    hypertension_flag = systolic_bp >= 130 | diastolic_bp >= 80,
    bmi_group = case_when(
      is.na(bmi) ~ NA_character_,
      bmi < 18.5 ~ "Underweight",
      bmi < 25 ~ "Healthy range",
      bmi < 30 ~ "Overweight",
      TRUE ~ "Obesity range"
    )
  ) |>
  filter(!is.na(age), !is.na(bmi), !is.na(systolic_bp))

# Cohort table
health_clean |>
  group_by(sex) |>
  summarize(
    n = n(),
    mean_age = mean(age),
    mean_bmi = mean(bmi),
    percent_hypertension = mean(hypertension_flag) * 100,
    .groups = "drop"
  )

# Plot 1: continuous relationship
health_clean |>
  ggplot(aes(x = bmi, y = systolic_bp, color = sex)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Systolic blood pressure tends to increase with BMI",
    x = "Body mass index",
    y = "Systolic blood pressure",
    color = "Sex"
  ) +
  theme_minimal()

# Plot 2: categorical comparison
health_clean |>
  count(bmi_group) |>
  ggplot(aes(x = bmi_group, y = n)) +
  geom_col() +
  labs(
    title = "Participants by BMI group",
    x = "BMI group",
    y = "Number of participants"
  ) +
  theme_minimal()
