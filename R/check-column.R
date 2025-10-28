check_column <- function(query_col,
                         output_cols,
                         query_tbl) {
  
  #' Check column input for collect_*_by_vector functions
  #'
  #' @param query_col The query_col argument of the collect_*_by_vector function
  #' @param output_cols The output_cols argument of the collect_*_by_vector function
  #' @param query_tbl The DNA Database table queried by the collect_*_by_vector function
  #'
  #' @returns Error if column input is incorrect
  #'
  #' @examples collect_results_by_vector(query_col = "labno", query_vector = c("24024388"))
  
  if(!{{ query_col }} %in% {{ output_cols }}){
    stop(paste0("Query column ",
                query_col,
                " is not in output columns: ",
                paste(output_cols, collapse = ", ")))
  }
  
  if(!{{ query_col }} %in% colnames({{ query_tbl }})){
    stop(paste0("Query column ",
                query_col,
                " is not in the query table"))
  }
  
}
