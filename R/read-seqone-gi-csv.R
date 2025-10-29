read_seqone_gi_csv <- function(filepath,
                               n_rows = 1) {
  
  #' Read data from a SeqOne Genomic Instability comma separated value file
  #'
  #' @param filepath The full filepath to the csv file
  #' @param n_rows The number of rows to read, which defaults to 1.
  #'
  #' @returns The contents of the file as a dataframe
  #' @export
  #'

  output <- readr::read_csv(filepath, 
                            n_max = n_rows,
                            col_types = list(
                              "sample" = readr::col_character(),
                              "analysis_date" = readr::col_character(),
                              "somahrd_version" = readr::col_character(),
                              "LGA" = readr::col_integer(),
                              "LPC" = readr::col_integer(),
                              "score" = readr::col_number(),
                              "status" = readr::col_character(),
                              "brca_status" = readr::col_logical(),
                              "brca_mutation" = readr::col_logical(),
                              "ccne1_cn" = readr::col_number(),
                              "rad51b_cn" = readr::col_number(),
                              "coverage" = readr::col_number(),
                              "pct_mapped_reads" = readr::col_number(),
                              "pct_tum_cell" = readr::col_number(),
                              "gi_confidence" = readr::col_number(),
                              "low_tumor_fraction" = readr::col_number()
                            )) |> 
    janitor::clean_names() |> 
    dplyr::mutate(filepath = filepath,
                  date = lubridate::parse_date_time(x = analysis_date, 
                                orders = c("dmy", "ymd")),
         status = factor(status,
                         levels = c("Positive", "Negative",
                                    "Non-conclusive"))) 
  
  filename <- basename(filepath)
  
  if(anyNA.data.frame(output |> 
                      dplyr::select(-c(brca_status, brca_mutation)))){
    warning(paste0("NAs in output: ", filename))
  }
  
  if((min(output$lga, na.rm = TRUE) < 0) |
     (max(output$lga, na.rm = TRUE) > 100)){
    warning(paste0("LGA value is not in range 0-100: ", filename))
  }
  
  if((min(output$lpc, na.rm = TRUE) < 0)|
     (max(output$lpc, na.rm = TRUE) > 100)){
    warning(paste0("LPC is not in range 0-100: ", filename))
  }
  
  if((min(output$score, na.rm = TRUE) < 0)|
     (max(output$score, na.rm = TRUE) > 1)){
    warning(paste0("SeqOne score is not between between 0-1: ", filename))
  } 
  
  if(min(output$ccne1_cn, na.rm = TRUE) < 0 |
     max(output$ccne1_cn, na.rm = TRUE) > 100){
    warning(paste0("CCNE1 copy number is not between 0-100: ", filename))
  } 
  
  if(min(output$rad51b_cn, na.rm = TRUE) < 0 |
     max(output$rad51b_cn, na.rm = TRUE) > 100){
    warning(paste0("RAD51B copy number is not between 0-100: ", filename))
  }
  
  if(min(output$coverage) < 0 |
     max(output$coverage) > 7){
    warning(paste0("Coverage is not between 0-7X: ", filename))
  }
  
  if(min(output$pct_tum_cell) < 0 |
     max(output$pct_tum_cell) > 1){
    warning(paste0("Percentage tumours cells is not between 0-1: ", filename))
  }
  
  if(min(output$gi_confidence, na.rm = TRUE) < 0 |
     max(output$gi_confidence, na.rm = TRUE) > 1){
    warning(paste0("GI confidence is not between 0-1: ", filename))
  }
  
  if(!grepl(x = output$sample, pattern = "WS\\d{6}_\\d{8}")){
    warning(paste0("Sample identifier is not in expected format: ",
                   output$sample,
                   " see file - ",
                   filename))
  }

  return(output)
  
}
