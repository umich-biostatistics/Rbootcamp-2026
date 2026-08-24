# dplyr and ggplot2 quick reference

## dplyr verbs

- `filter()`: keep rows.
- `select()`: keep or reorder columns.
- `mutate()`: create or change columns.
- `arrange()`: sort rows.
- `group_by()`: define groups for later operations.
- `summarize()`: collapse many rows into summary rows.

## ggplot2 pattern

```r
ggplot(data, aes(x = x_variable, y = y_variable)) +
  geom_point() +
  labs(title = "Clear title", x = "X label", y = "Y label") +
  theme_minimal()
```

## Mental model

- Data: What rows and columns are being plotted?
- Aesthetics: Which variables map to x, y, color, shape, or size?
- Geometry: What kind of plot layer do we need?
- Labels/theme: How do we make it readable?
