collect_seqone_gi_worksheets <- function(seqone_strings  = c("seqone",
                                                         "seq\\sone",
                                                         "seq_one",
                                                         "SSXT\\ssWGS\\sHRD")) {
  
  ws_info <- collect_worksheets_by_description(ws_strings = seqone_strings)
  
  return(ws_info)
  
}