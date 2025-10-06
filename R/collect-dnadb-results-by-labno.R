
collect_dnadb_results_by_labno <- function(labno_vector,
                                           cols = c("labno", 
                                                    "genodate", 
                                                    "resultsid", 
                                                    "test", 
                                                    "genotype", 
                                                    "genotype2",
                                                    "genocomm")) {
  
  #' Collect results from DNA Database by DNA lab number
  #'
  #' @param labno_vector A character vector of DNA Database lab numbers
  #' @param cols The columns to include from the DNA Database "ResultsAccess" table
  #'
  #' @returns A dataframe of sample results
  #' @export
  #'
  #' @examples collect_dnadb_results_by_labno("24024388")
  
  results_access_tbl <- connect_to_lazy_tbl("ResultsAccess")
  
  results_df <- results_access_tbl |> 
    dplyr::filter(labno %in% labno_vector) |> 
    dplyr::select({{ cols }}) |> 
    dplyr::collect()
  
  return(results_df)
  
}