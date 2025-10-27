descriptions_seqone_gi <- function() {
  
  #' Descriptions of SeqOne Genomic Instability worksheets
  #'
  #' @returns A vector of unique descriptions of SeqOne GI worksheets
  #' @export
  #'
  #' @examples seqone_strings <- descriptions_seqone_gi()
  
  dnadb_pcr_new <- connect_to_lazy_tbl(table = "PCR_New") |> 
    dplyr::select(description) |> 
    dplyr::collect()
  
  seqone_strings  = c("seqone",
                      "seq\\sone",
                      "seq_one",
                      "SSXT\\ssWGS\\sHRD")
  
  return(unique(grep(pattern = paste(seqone_strings, collapse = "|"), 
                     x = dnadb_pcr_new$description, 
                     ignore.case = TRUE, 
                     value = TRUE)))
  
}
