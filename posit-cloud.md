# Posit Cloud setup options

## Best option for the workshop: GitHub import

Use one shared GitHub repository. Students import it into Posit Cloud using **New Project -> New Project from Git Repository** and the HTTPS repository URL.

Why this is best:

- Students start with the same files and folder structure.
- The instructor can update the repository before class.
- Students learn a real reproducible workflow: project folder, scripts, Quarto, Git/GitHub.

## Instructor setup checklist

1. Create or choose a GitHub organization/repository.
2. Upload this full project folder.
3. Confirm the repository opens in a fresh Posit Cloud project.
4. Run `scripts/00_setup.R`.
5. Open `analysis/01_start_here.qmd`.
6. Render the Quarto document once to confirm package installation.
7. Put the GitHub HTTPS URL on the setup slide and in Canvas/email.

## Student setup checklist

1. Open Posit Cloud.
2. Click **New Project**.
3. Choose **New Project from Git Repository**.
4. Paste the GitHub HTTPS URL.
5. Open `analysis/01_start_here.qmd`.
6. Run the first setup chunk.
