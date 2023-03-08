source("src/input_functions.R")

#Install/load packages
packages<-c("dplyr", "readr", "stringr", "sbtools", "whisker")
check.packages(packages)

#Fetch the ScienceBase file and save as CSV
get.SBfile('5d925066e4b0c4f70d0d0599')
