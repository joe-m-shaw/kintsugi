collect_results_by_vector <- function(query_col,
                                      query_vector,
                                      output_cols = c("labno", 
                                                      "genodate", 
                                                      "resultsid", 
                                                      "test", 
                                                      "genotype", 
                                                      "genotype2",
                                                      "genocomm")){
  
  #' Collect DNA Database result information using a vector of search terms
  #'
  #' @param query_col The column of the ResultsAccess table to search by
  #' @param query_vector A vector of search terms
  #' @param output_cols The columns of the ResultsAccess table to return
  #'
  #' @returns A dataframe of search results from the ResultsAccess table 
  #' @export
  #'
  #' @examples collect_results_by_vector(query_col = "labno", query_vector = c("24024388"))

  results_access_tbl <- connect_to_lazy_tbl("ResultsAccess")
  
  if(!{{ query_col }} %in% {{ output_cols }}){
    stop(paste0("Query column ",
                query_col,
                " is not in output columns: ",
                paste(output_cols, collapse = ", ")))
  }
  
  if(!{{ query_col }} %in% colnames(results_access_tbl)){
    stop(paste0("Query column ",
                query_col,
                " is not in the ResultsAccess table"))
  }
  
  output <- results_access_tbl |> 
    dplyr::select({{ output_cols }}) |> 
    dplyr::filter(.data[[query_col]] %in% query_vector) |> 
    dplyr::collect() 

  return(output)
    
}




