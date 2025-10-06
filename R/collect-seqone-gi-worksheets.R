
collect_seqone_gi_worksheets <- function(seqone_strings  = c("seqone",
                                                         "seq\\sone",
                                                         "seq_one",
                                                         "SSXT\\ssWGS\\sHRD")) {
  
  #' Collect worksheets for SeqOne Genomic Instability testing from DNA Database
  #'
  #' @param seqone_strings A character vector of common strings used to describe 
  #' SeqOne Genomic Instability worksheets
  #'
  #' @returns A dataframe returned from `collect_worksheets_by_description`.
  #' @export
  #'
  #' @examples gi_ws_info <- collect_seqone_gi_worksheets()
  
  ws_info <- collect_worksheets_by_description(ws_strings = seqone_strings)
  
  return(ws_info)
  
}