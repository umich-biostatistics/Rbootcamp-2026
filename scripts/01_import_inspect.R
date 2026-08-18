# 01 Import and inspect data
# Run this script one section at a time.

library(tidyverse)

health_raw <- read_csv("data/bootcamp_health.csv")

# What did we import?
glimpse(health_raw)
head(health_raw)
summary(health_raw)

# Quick missingness check
health_raw |>
  summarize(across(everything(), ~ sum(is.na(.x)))) |>
  pivot_longer(everything(), names_to = "variable", values_to = "missing_count") |>
  arrange(desc(missing_count))

# AI checkpoint:
# Ask: "I am learning R. Explain what across(everything(), ~ sum(is.na(.x))) does in this code."
