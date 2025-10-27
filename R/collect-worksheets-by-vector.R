collect_worksheets_by_vector <- function(query_col,
                                        query_vector,
                                        output_cols = c("pcrid", 
                                                        "date", 
                                                        "description")) {
  
  #' Collect DNA Database worksheet information using a vector of search terms
  #'
  #' @param query_col The column in the PCR_New table to search by
  #' @param query_vector A vector of search terms
  #' @param output_cols The columns from the PCR_New table to return
  #'
  #' @returns A dataframe of search results from the PCR_New table
  #' @export
  #'
  #' @examples collect_worksheets_by_vector(query_col = "pcrid", query_vector = c(146462))
  
  dnadb_pcr_new <- connect_to_lazy_tbl("PCR_New")
  
  check_column(query_col, output_cols, dnadb_pcr_new)
  
  all_worksheets <- dnadb_pcr_new |> 
    dplyr::select({{ output_cols }}) |> 
    dplyr::collect() |> 
    dplyr::mutate(worksheet = paste0("WS", pcrid))
  
  output <- all_worksheets |> 
    dplyr::filter(.data[[query_col]] %in% query_vector)
  
  check_output(output)
  
  return(output)
}
