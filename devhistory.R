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

## Create a R directory and a file for functions
usethis::use_r("theme_LO")

## Update DESCRIPTION file
usethis::use_package("ggplot2")
usethis::use_package("car")
usethis::use_package("itsadug")
usethis::use_package("gather")
usethis::use_package("mgcv")
usethis::use_package("tidymv")
usethis::use_package("nnet")
usethis::use_package("fitdistrplus")
usethis::use_package("survminer")
usethis::use_package("stats")
usethis::use_package("DescTools")
usethis::use_package("AER")
usethis::use_package("mgcv")
usethis::use_package("survival")
usethis::use_package("gtsummary")
usethis::use_package("ggsurvfit")
usethis::use_package("dplyr")

## Update NAMESPACE file
devtools::document()

## Load all required packages
devtools::load_all()

