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
                              sample = readr::col_character(),
                              analysis_date = readr::col_character(),
                              somahrd_version = readr::col_character(),
                              LGA = readr::col_integer(),
                              LPC = readr::col_integer(),
                              score = readr::col_number(),
                              status = readr::col_character(),
                              brca_status = readr::col_logical(),
                              brca_mutation = readr::col_logical(),
                              ccne1_cn = readr::col_number(),
                              rad51b_cn = readr::col_number(),
                              coverage = readr::col_number(),
                              pct_mapped_reads = readr::col_number(),
                              pct_tum_cell = readr::col_number(),
                              gi_confidence = readr::col_number(),
                              low_tumor_fraction = readr::col_number()
                            )) |> 
    janitor::clean_names() |> 
    dplyr::mutate(filepath = filepath)
  
  return(output)
  
}