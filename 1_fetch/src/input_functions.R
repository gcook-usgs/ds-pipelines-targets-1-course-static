
#' @description download ScienceBase file by item number
#' @param SB_item_ID - the USGS ScienceBase item number that corresponds to a file
#' @param SBFileNames - the csv file corresponding to the item ID
#' @return a file pulled from ScienceBase and saved locally as CSV
#' 
get.SBfile <- function(SB_item_ID, SBFileNames, outFile){
  return(item_file_download(SB_item_ID, names = SBFileNames, destinations = outFile, overwrite_file = TRUE))
}



