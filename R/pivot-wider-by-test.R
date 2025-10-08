pivot_wider_by_test <- function(df, 
                          test_vector,
                          names_prefix,
                          id_cols = c(referral_number, 
                                      nhsn_umber,
                                      test_order_date, 
                                      test_identifier),
                          names_from = box,
                          values_from = data_value){
  
  #' Pivot a dataframe by the test column
  #'
  #' @param df The dataframe to pivot. This function is designed to be used with
  #' the "Eval_*" series of tables exported from iGene to the SQL server.
  #' @param test_vector A character vector of test names to pivot by.
  #' @param names_prefix The prefix to use for naming columns
  #' @param id_cols Supplied to the `id_cols` argument of `pivot_wider`
  #' @param names_from Supplied to the `names_from` argument of `pivot_wider`
  #' @param values_from Supplied to the `values_from` argument of `pivot_wider`
  #'
  #' @returns A dataframe of test results
  #' @export
  #'
  #' @examples 
  #'
  #' eval_hrd <- connect_to_eval_hrd()
  #' 
  #' pivot_wider_by_test(df = eval_hrd,
  #' test_vector = c("PANEL: R207.1 - Inherited ovarian cancer (without breast cancer) v4.0 (ICP)"), 
  #' names_prefix = "glvar")
  
  output <- df |> 
    dplyr::filter(test_name %in% {{ test_vector }}) |> 
    tidyr::pivot_wider(id_cols = {{ id_cols }},
                names_from = {{ names_from }},
                values_from = {{ values_from }},
                names_prefix = {{ names_prefix }} ) |> 
    janitor::clean_names()
  
  if("nhsn_umber" %in% colnames(output)) {
    
    output <- output |> 
      dplyr::rename(nhsno = nhsn_umber)
    
  }
  
  if(nrow(output) == 0){
    stop("Output dataframe is empty")
  }
  
  return(output)
  
}