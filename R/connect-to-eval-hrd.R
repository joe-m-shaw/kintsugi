connect_to_eval_hrd <- function(
    catalog = "MolecularDB",
    schema = "GenExport",
    table = "Eval_HRD",
    col_vector = c("test_order_date", 
                   "test_name", 
                   "test_identifier", 
                   "referral_number", 
                   "nhsn_umber", 
                   "test_name", 
                   "field", 
                   "data_value", 
                   "box")) {
  
  #' Connect to the Eval_HRD table
  #'
  #' This is a wrapper function to connect to test results for the HRD 
  #' (Homologous Recombination Deficiency) service which are exported from 
  #' iGene in the "Eval_HRD" table.
  #'
  #' @param catalog The catalog to select the lazy table from
  #' @param schema The schema to select the lazy table from
  #' @param table The name of the table containing iGene HRD test results.
  #'
  #' @param col_vector Character vector of columns to select. This defaults to an
  #' order which seems to work. For some reason test_order_date should be 
  #' selected first to avoid an "Invalid Descriptor Index" error
  #'
  #' @returns The Eval_HRD table as a dataframe
  #' @export
  #'
  #' @examples eval_hrd <- connect_to_eval_hrd()
  
  lazy_tbl <- connect_to_lazy_tbl(catalog = {{ catalog }},
                                  schema = {{ schema }},
                                  table = {{ table }})
  
  output <- lazy_tbl |> 
    dplyr::select({{ col_vector }}) |> 
    dplyr::collect()
  
  return(output)
  
}