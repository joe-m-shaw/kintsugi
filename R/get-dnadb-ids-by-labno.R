
get_dnadb_ids_by_labno <- function(labno_vector,
                                   id_cols = c("labno", 
                                               "i_gene_r_no", 
                                               "i_gene_s_no", 
                                               "firstname", 
                                               "surname", 
                                               "nhsno", 
                                               "pathno")) {
  
  #' Get identifiers for samples from DNA Database by DNA lab number
  #'
  #' @param labno_vector A character vector of DNA Database lab numbers
  #' @param id_cols The columns to include from the DNA Database "Samples" table
  #'
  #' @returns A dataframe of sample identifiers
  #' @export
  #'
  #' @examples get_dnadb_ids_by_labno(labno_vector = c("24039973"))
  
  samples_tbl <- connect_to_lazy_tbl("Samples")
  
  id_df <- samples_tbl |> 
    dplyr::filter(labno %in% labno_vector) |> 
    dplyr::select( {{ id_cols }}) |> 
    dplyr::collect()
  
  return(id_df)
  
}
