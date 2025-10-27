descriptions_pansolid <- function(){
  
  #' Descriptions of PanSolid next generation sequencing worksheets
  #' 
  #' The "descriptions" column on DNA Database is free-type, which means that 
  #' there are many different ways that PanSolid next generation sequencing
  #' worksheets have been described. 
  #'
  #' @returns A vector of unique descriptions for PanSolid worksheets
  #' @export
  #'
  #' @examples pansolid_strings <- descriptions_pansolid()
  
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