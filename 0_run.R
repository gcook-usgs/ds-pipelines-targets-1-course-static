source("1_fetch/src/input_functions.R")
source("2_process/src/format_functions.R")
source("3_visualize/src/graph_functions.R")

###################### 1_fetch
#Install/load packages
packages<-c("dplyr", "readr", "stringr", "sbtools", "whisker")
check.packages(packages)

outPath <- "1_fetch/out"
SBFileName <- "me_RMSE.csv"
SB_itemID <- '5d925066e4b0c4f70d0d0599'
#Fetch the ScienceBase file and save as CSV
get.SBfile(outPath, SBFileName, SB_itemID)

############## 2_process
inFile <- file.path(outPath,"model_RMSEs.csv")

#use function to reformat the input file and prep it for visualization
out.prepped <- read.format.infile(inFile)

outPath2 <- "2_process/out"
outfile2 <- file.path(outPath2,"RMSE_prepped.csv")

#Write the prepped file
readr::write_csv(out.prepped,outfile2)

########### 3_visualize
outPath3 <- "3_visualize/out"
plot_data(outPath3,out.prepped)
write_output(outPath3, out.prepped)




