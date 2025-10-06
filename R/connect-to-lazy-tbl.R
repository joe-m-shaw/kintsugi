
connect_to_lazy_tbl <- function(
    table,
    catalog = "MolecularDB",
    schema = "dbo") {
  
  #' Connect to a lazy table in the Molecular DB database
  #'
  #' @param table The name of the table to load
  #' @param catalog The catalog. Defaults to "MolecularDB"
  #' @param schema The schema. Defaults to "dbo"
  #'
  #' @returns A lazy table
  #' @export
  #'
  #' @examples dnadb_pcr_new <- connect_to_lazy_tbl("PCR_New")
  
  connection <- connect_to_sql_server()
  
  output <- dplyr::tbl(connection, 
             dbplyr::in_catalog(catalog = {{ catalog }},
                                schema = {{ schema }},
                                table = "PCR_New"))|> 
    janitor::clean_names()
  
  return(output)
  
}

