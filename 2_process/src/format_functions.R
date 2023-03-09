#' @description read csv file and assign formatting
#' @param RMSE_file the local csv file to read and format
#' @return RMSE.out: a dataframe of reformatted data

process.infile <- function(RMSE_file){
  RMSE.out <- readr::read_csv(RMSE_file, col_types = 'iccd') %>%
    filter(str_detect(exper_id, 'similar_[0-9]+')) %>%
    mutate(col = case_when(
      model_type == 'pb' ~ '#1b9e77',
      model_type == 'dl' ~'#d95f02',
      model_type == 'pgdl' ~ '#7570b3'
    ), pch = case_when(
      model_type == 'pb' ~ 21,
      model_type == 'dl' ~ 22,
      model_type == 'pgdl' ~ 23
    ), n_prof = as.numeric(str_extract(exper_id, '[0-9]+')))
  return(RMSE.out)
}



