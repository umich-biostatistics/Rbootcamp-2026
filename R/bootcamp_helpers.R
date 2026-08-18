# Helper functions used in the completed examples.

summarize_numeric_by_group <- function(data, group_col, value_col) {
  data |>
    dplyr::group_by({{ group_col }}) |>
    dplyr::summarize(
      n = dplyr::n(),
      mean = mean({{ value_col }}, na.rm = TRUE),
      sd = sd({{ value_col }}, na.rm = TRUE),
      missing = sum(is.na({{ value_col }})),
      .groups = "drop"
    )
}

flag_blood_pressure <- function(systolic, diastolic) {
  dplyr::case_when(
    is.na(systolic) | is.na(diastolic) ~ NA_character_,
    systolic >= 130 | diastolic >= 80 ~ "Elevated / high",
    TRUE ~ "Not elevated"
  )
}
