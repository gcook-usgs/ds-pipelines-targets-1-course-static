#Set the working directory to the path where this script is stored.
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

source("src/format_functions.R")

inPath <- "C://Projects/ds-pipelines-targets-1-course-static/1_fetch/out"
infile <- file.path(inPath,"model_RMSEs.csv")
out.prepped <- read.format.infile(infile)
outPath <- "C://Projects/ds-pipelines-targets-1-course-static/2_process/out"
outfile <- file.path(outPath,"RMSE_prepped.csv")

#Write the prepped file
out.csv(out.prepped,outfile)
