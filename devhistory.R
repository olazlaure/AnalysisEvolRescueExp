# Create project on Github

## Create compendium
rrtools::use_compendium("/Users/laure/Documents/RESEARCH/Experiments/DATA/AnalysisEvolRescueExp/", open = FALSE)

## Add to .gitignore
usethis::use_git_ignore(".DS_Store")
usethis::use_build_ignore(".DS_Store")
usethis::use_git(message = ":see_no_evil: Ban .DS_Store files")

## Modify DESCRIPTION file
usethis::edit_file("DESCRIPTION")
usethis::use_git(message = ":bulb: Update documentation")

## Create directories
dir.create("data")
dir.create("reports")
dir.create("figures")

## Update NAMESPACE file
devtools::document()

## Load all required packages
devtools::load_all()

