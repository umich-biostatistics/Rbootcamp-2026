# UM Biostatistics Intro to R Bootcamp 2026
# Setup script

packages <- c("tidyverse", "broom")

missing_packages <- setdiff(packages, rownames(installed.packages()))

if (length(missing_packages) > 0) {
  install.packages(missing_packages)
}

library(tidyverse)
library(broom)

message("Setup complete. Open analysis/01_start_here.qmd next.")
