list_worksheet_filepaths <- function(worksheet,
                                     path = "S:/central shared/Genetics/Repository/WorksheetAnalysedData/",
                                     pattern,
                                     recursive = TRUE,
                                     full_names = TRUE) {
  
  #' List filepaths for files within worksheet folders 
  #'
  #' @param worksheet Worksheet. Format "WS123456"
  #' @param path The filepath to the S drive "WorksheetAnalysedData" repository
  #' @param pattern Regular expression of filename pattern
  #' @param recursive To be used by `list.files`. `TRUE` or `FALSE.` 
  #' @param full_names To be used by `list.files`. `TRUE` or `FALSE.` 
  #'
  #' @returns A list of worksheet filepaths
  #' @export
  #'
  #' @examples list_worksheet_filepaths(worksheet = "WS157517", pattern = "hrd-results.*csv")
  
  output <- list.files(paste0(path, worksheet, "/"),
                       full.names = full_names,
                       recursive = recursive,
                       pattern = pattern)
  
  return(output)
  
}
