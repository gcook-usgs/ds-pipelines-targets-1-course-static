
#' @description install and load required packages
#' @param pkg - a list of R packages required to run the code


check.packages <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

#' @description download ScienceBase file by item number
#' @param SB_item_file - the USGS ScienceBase item number that corresponds to a file
#' @return a file pulled from ScienceBase and saved locally as CSV
#' 
get.SBfile <- function(outpath,SBFileNames, SB_item_ID){
  mendota_file <- file.path(outpath, 'model_RMSEs.csv')
  return(item_file_download(SB_item_ID, names = SBFileNames, destinations = mendota_file, overwrite_file = TRUE))
}



