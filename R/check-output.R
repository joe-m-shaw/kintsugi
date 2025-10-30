check_output <- function(output) {
  
  #' Check output of collect_*_by_vector functions
  #'
  #' @param output The dataframe returned by the collect_*_by_vector function
  #'
  #' @returns Errors and warnings if output dataframe is not correct format
  #'
  #' @examples collect_results_by_vector(query_col = "labno", query_vector = c(""))
  
  if(!is.data.frame(output)){
    stop("Output must be a dataframe")
  }
  
  if(nrow(output) == 0){
    warning("Output has 0 rows")
  }
  
}
