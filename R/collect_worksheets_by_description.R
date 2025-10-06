
collect_worksheets_by_description <- function(ws_strings,
                                              df_cols = c(pcrid, date, description)){
  
  #' Collect worksheet information by the "description" column in DNA Database
  #'
  #' @param ws_strings A comma-separated character vector of different possible 
  #' descriptions for a worksheet.
  #' 
  #' @param df_cols The columns of the PCR_New dataframe to return
  #'
  #' @returns A dataframe of worksheets including worksheet
  #' @export
  #'
  #' @examples collect_worksheets_by_description(ws_strings = c("seqone"))
  
  connection <- connect_to_sql_server()
  
  dna_db_pcr_new <- dplyr::tbl(connection, 
                               dbplyr::in_catalog(catalog = "MolecularDB",
                                                  schema = "dbo",
                                                  table = "PCR_New"))|> 
    janitor::clean_names()
  
  all_worksheets <- dna_db_pcr_new |> 
    dplyr::select({{ df_cols }}) |> 
    dplyr::collect() |> 
    dplyr::mutate(ws = paste0("WS", pcrid))
  
  ws_regex <- paste(ws_strings, collapse = "|")
  
  ws_info <- all_worksheets |> 
    dplyr::filter(grepl(pattern = ws_regex,
                        x = description,
                        ignore.case = TRUE))
  
  return(ws_info)
  
}
