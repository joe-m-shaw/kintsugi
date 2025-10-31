list_seqone_gi_csv <- function(gi_csv_regex = "hrd-results.*csv") {
  
  #' Find all filepaths for SeqOne genomic instability csv files
  #'
  #' @param gi_csv_regex The naming pattern for SeqOne GI files. Defaults 
  #' to "hrd-results.*csv"
  #'
  #' @returns A list containing: a list of all full filepaths to SeqOne GI files; 
  #' and a dataframe of worksheet information collected from DNA Database
  #' @export
  #'
  #' @examples gi_ws_filepaths <- list_seqone_gi_csv()[[1]]
  
  gi_ws_info <- collect_worksheets_by_vector(query_col = "description",
                                           query_vector = descriptions_seqone_gi())

  gi_ws_list <- list(gi_ws_info$worksheet)
  
  gi_ws_filepaths <- gi_ws_list |> 
    purrr::map(\(gi_ws_list) list_worksheet_filepaths(worksheet = gi_ws_list,
                                               pattern = gi_csv_regex)) |> 
    purrr::flatten()
  
  return(list(gi_ws_filepaths, gi_ws_info))
  
}
