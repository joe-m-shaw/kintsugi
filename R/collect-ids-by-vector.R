collect_ids_by_vector <- function(query_col,
                                  query_vector,
                                  output_cols = c("labno", 
                                                  "i_gene_r_no", 
                                                  "i_gene_s_no", 
                                                  "firstname", 
                                                  "surname", 
                                                  "nhsno", 
                                                  "pathno")) {
  
  #' Collect DNA Database sample identifier information using a vector of search terms
  #'
  #' @param query_col The column in the Samples table to search
  #' @param query_vector A vector of search terms
  #' @param output_cols The columns from the Samples table to return
  #'
  #' @returns A dataframe of search results from the Samples table
  #' @export
  #'
  #' @examples collect_ids_by_vector(query_vector = c("24039973"), query_col = "labno")

  samples_tbl <- connect_to_lazy_tbl("Samples")
  
  check_column(query_col, output_cols, samples_tbl)
  
  output <- samples_tbl |> 
    dplyr::select({{ output_cols }}) |> 
    dplyr::filter(.data[[query_col]] %in% query_vector) |> 
    dplyr::collect() 
  
  check_output(output)
  
  return(output)
  
}