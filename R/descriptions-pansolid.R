descriptions_pansolid <- function(){
  
  dnadb_pcr_new <- connect_to_lazy_tbl(table = "PCR_New") |> 
    dplyr::select(description) |> 
    dplyr::collect()
  
  pansolid_regex <- paste(c("pansolid",
                            "pan-solid", 
                            "pan_solid", 
                            "pan\\ssolid", 
                            "PnaSolid", 
                            "Pandolid", 
                            "PamSolid"),
                          collapse = "|")
  
  not_pansolid_regex <- paste(c("Limit\\sof\\sdetection",
                                "cobas",
                                "ddpcr",
                                "confs",
                                "RNA"),
                              collapse = "|")
  
  pansolid_descriptions <- dnadb_pcr_new |> 
    dplyr::filter(grepl(pattern = pansolid_regex, 
                        x = description,
                        ignore.case = TRUE)) |> 
    dplyr::filter(!grepl(pattern = not_pansolid_regex,
                         x = description,
                         ignore.case = TRUE))
  
  output <- unique(pansolid_descriptions$description)

  return(output)
  
}




