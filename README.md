# UM Biostatistics Intro to R Bootcamp 2026

This project is designed for incoming graduate students to use during the two-day Intro to R bootcamp. It keeps all data, scripts, outputs, and reference materials in one reproducible project folder.

## Recommended delivery: GitHub -> Posit Cloud

The simplest workshop flow is:

1. Instructor creates a GitHub repository from this folder, for example `umbiostat-r-bootcamp-2026`.
2. Students open Posit Cloud.
3. Students choose **New Project** -> **New Project from Git Repository**.
4. Students paste the repository HTTPS URL.
5. Students open `analysis/01_start_here.qmd` and work through the lab.

A public GitHub repository is easiest for first-day logistics. A private U-M GitHub repository can also work, but students may need GitHub authentication and access before the workshop.

## If GitHub is not ready

Create a new RStudio project in Posit Cloud and upload the project ZIP file. Then unzip it in the Files pane or Terminal, open `bootcamp-2026.Rproj`, and start with `analysis/01_start_here.qmd`.

## Project map

- `analysis/01_start_here.qmd`: starter Quarto lab for the workshop.
- `analysis/01_completed_analysis.qmd`: completed version for instructor reference and post-workshop release.
- `scripts/00_setup.R`: package setup.
- `scripts/01_import_inspect.R`: import and data inspection examples.
- `scripts/02_wrangling_plotting.R`: dplyr and ggplot examples.
- `scripts/03_broken_code_lab.R`: broken-code debugging lab.
- `scripts/03_broken_code_lab_solutions.R`: debugging solutions.
- `scripts/04_functions_lab.R`: starter function lab.
- `scripts/04_functions_lab_solutions.R`: function lab solutions.
- `scripts/05_mini_analysis.R`: end-to-end mini-analysis.
- `data/bootcamp_health.csv`: simulated practice dataset. These are not real people.
- `data/codebook.md`: variable descriptions.
- `references/`: short reference sheets for debugging, AI prompting, and core R verbs.

## AI use in this project

Students should use AI to explain code, diagnose errors, suggest minimal examples, and refactor working code. Students should not paste protected health information, credentials, or unpublished sensitive research data into third-party AI tools. For U-M data, use U-M-approved tools and follow the Sensitive Data Guide and course instructions.
