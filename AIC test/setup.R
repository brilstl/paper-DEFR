## Package installation ----
packages <- c("tidyverse", "tidymodels", "lme4", "broom.mixed", "GGally")
## Install.packages ----
new.packages <- packages[!(packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
## load libraries ----
lapply(packages, require, character.only = TRUE)

rm(new.packages, packages)