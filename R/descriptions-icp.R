descriptions_icp <- function() {
  
  #' Descriptions of Inherited Cancer Panel (ICP) worksheets
  #'
  #' @returns A vector of unique descriptions for ICP worksheets.
  #' @export
  #'
  #' @examples icp_strings <- descriptions_icp()
  
  dnadb_pcr_new <- connect_to_lazy_tbl(table = "PCR_New") |> 
    dplyr::select(description) |> 
    dplyr::collect()

  icp_grep_strings <- unique(grep(pattern = "hs2(\\s|)icp", 
                                x = dnadb_pcr_new$description, 
                                ignore.case = TRUE, 
                                value = TRUE))

  icp_test_strings <- c("NGS SSXT ICP",
                      "ICP PANEL",
                      "SSXT ICP NGS",
                      "ICP SSXT NGS",
                      "Panel re-analysis of 24043064 from WS144546",
                      "NGS SSXT ICPv4",
                      "SSXTHS2 ICPv4",
                      "ICPv4 NGS SSXT HS2")
  
  return(c(icp_grep_strings, icp_test_strings))
  
}
