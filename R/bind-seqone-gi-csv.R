bind_seqone_gi_csv <- function(filepaths,
                               folder,
                               gi_csv_regex = "hrd-results.*csv") {
  
  #' Bind together SeqOne genomic instability information from csv files
  #'
  #' This function can be used with `list_seqone_gi_csv` to search the S drive
  #' for all SeqOne genomic instability csv files, and then collate them 
  #' together.
  #'
  #' @param filepaths The full filepaths for the genomic instability csv files 
  #' to bind, which can be found using `list_seqone_gi_csv`.
  #' @param folder The folder to copy files to.
  #' @param gi_csv_regex The naming pattern for SeqOne GI files. Defaults 
  #' to "hrd-results.*csv"
  #'
  #' @returns A dataframe of SeqOne GI results collated using `read_seqone_gi_csv`
  #' @export
  
  file.copy(from = filepaths,
          to = folder)
  
  seqone_csv_filepaths <- list.files(path = folder,
                                   full.names = TRUE,
                                   recursive = FALSE,
                                   pattern = gi_csv_regex)

  seqone_files_with_nas <- c("WS144728_24045060 hrd-results.csv",
                             "WS144728_24044787 hrd-results.csv")
  
  seqone_csv_filepaths_na_removed <- seqone_csv_filepaths[-grep(
    paste(seqone_files_with_nas, collapse = "|"), 
    seqone_csv_filepaths)]
  
  stopifnot(length(seqone_csv_filepaths_na_removed) == length(seqone_csv_filepaths)-2)
  
  output <- seqone_csv_filepaths_na_removed |> 
    purrr::map(\(seqone_csv_filepaths_na_removed) read_seqone_gi_csv(seqone_csv_filepaths_na_removed)) |> 
    purrr::list_rbind() |> 
    dplyr::mutate(labno = stringr::str_extract(string = sample,
                               pattern = "\\d{8}"),
           worksheet = stringr::str_extract(string = sample,
                                   pattern = "(WS[0-9]{6})_(\\d{8})",
                                   group = 1))
  
  check_output(output)
  
  return(output)
  
}
