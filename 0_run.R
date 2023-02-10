#Set the working directory to the path where this script is stored.
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

###################### 1_fetch
source("1_fetch/src/input_functions.R")

#Install/load packages
packages<-c("dplyr", "readr", "stringr", "sbtools", "whisker")
check.packages(packages)

outPath1 <- "C://Projects/ds-pipelines-targets-1-course-static/1_fetch/out"
#Fetch the ScienceBase file and save as CSV
get.SBfile(outPath1, '5d925066e4b0c4f70d0d0599')

############## 2_process
source("2_process/src/format_functions.R")

inPath2 <- "C://Projects/ds-pipelines-targets-1-course-static/1_fetch/out"
infile2 <- file.path(inPath2,"model_RMSEs.csv")

#use function to reformat the input file and prep it for visualization
out.prepped <- read.format.infile(infile2)

outPath2 <- "C://Projects/ds-pipelines-targets-1-course-static/2_process/out"
outfile2 <- file.path(outPath,"RMSE_prepped.csv")

#Write the prepped file
out.csv(out.prepped,outfile2)

########### 3_visualize
source("3_visualize/src/graph_functions.R")

outPath3 <- "C://Projects/ds-pipelines-targets-1-course-static/3_visualize/out"
plot_data(outPath3,eval_data)




