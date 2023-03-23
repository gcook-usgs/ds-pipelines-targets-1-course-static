library(targets)

tar_option_set(
  packages = c("dplyr", "readr", "stringr", "sbtools", "whisker"), 
  error = "stop"
)

# Could also simplify all the functions to one source file, but following DSP guidelines
source("1_fetch/src/input_functions.R")
source("2_process/src/format_functions.R")
source("3_visualize/src/graph_functions.R")

#exposed parameters
SBitem <- '5d925066e4b0c4f70d0d0599'
SBname <- 'me_RMSE.csv'
outFile1 <- file.path('1_fetch/out',"model_RMSEs.csv")


list(
  #fetch data from ScienceBase
  tar_target(
    getData, 
    get.SBfile(SBitem, SBname, outFile1), 
    format = "file"
  ),
  #process
  tar_target(
    eval_data, 
    process.infile(getData)
  ),
  #plot
  tar_target(
    VizPlot, 
    plot_data('3_visualize/out/figure_1.png',eval_data), 
    format = "file"
  ),
  # Save the processed data
  tar_target(
    model_summary_results_csv,
    {
      readr::write_csv(eval_data, file = "2_process/out/model_summary_results.csv")
      return("2_process/out/model_summary_results.csv") 
    }, 
    format = "file"
  ),
  # Save the model diagnostics
  tar_target(
    model_diagnostic_text_txt,
    write_output("3_visualize/out", eval_data), 
    format = "file"
  )
)
