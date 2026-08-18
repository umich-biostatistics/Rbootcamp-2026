# Snippets designed to be copied into slides or live demos.

library(tidyverse)

health <- read_csv("data/bootcamp_health.csv")

glimpse(health)

health |>
  mutate(hypertension_flag = systolic_bp >= 130 | diastolic_bp >= 80) |>
  group_by(sex) |>
  summarize(
    n = n(),
    mean_bmi = mean(bmi, na.rm = TRUE),
    percent_hypertension = mean(hypertension_flag, na.rm = TRUE) * 100,
    .groups = "drop"
  )

health |>
  ggplot(aes(x = bmi, y = systolic_bp, color = sex)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal()

# AI prompt for this snippet:
# "Explain what each pipe step does, then suggest one small diagnostic check before trusting the summary."
