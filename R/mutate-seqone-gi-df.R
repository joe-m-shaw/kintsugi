mutate_seqone_gi_df <- function(df,
                                    non_patient_strings = c("Seraseq", "GenQA"),
                                    name_col = surname,
                                    worksheet_col = worksheet,
                                    labno_col = labno,
                                    validation_ws = c(
                                      # DOC6192
                                      "WS133557", "WS134687", "WS134928", 
                                      "WS135001", "WS135498",
                                      # DOC6255
                                      "WS136827", "WS138201", "WS138439", 
                                      "WS138627",
                                      # DOC6588
                                      "WS147582", "WS149085", "WS149086")) {
  
  #' Annotate genomic instability data from the SeqOne service
  #'
  #' @param df Dataframe of collated SeqOne genomic instability data
  #' @param non_patient_strings Character vector of names to identify non
  #' patient samples (External Quality Assessment samples, controls etc)
  #' @param name_col The column to search within for non patient strings
  #' @param worksheet_col The column in the dataframe containing worksheet number
  #' @param labno_col The column in the dataframe with DNA laboratory number
  #' @param validation_ws Character vector of worksheets used for validation of
  #' the SeqOne genomic instability service.
  #'
  #' @returns The original dataframe with additional columns
  #' @export

  output <- df |> 
    dplyr::mutate(service_validation = dplyr::case_when(
      {{ worksheet_col }} %in% validation_ws ~"validation",
      # 2 validation samples were on WS138061. The other samples on this
      # worksheet were live clinical samples
      ({{ worksheet_col }} == "WS138061" & 
         {{ labno_col }} %in% c("23047082", "23053359")) ~"validation",
      TRUE ~"service"
    ),
    patient_non_patient = dplyr::case_when(
      {{ name_col }} %in% {{ non_patient_strings }} ~"non-patient",
      TRUE ~"patient"
    ),
    full_name = paste0(firstname, " ", surname))
  
  if(anyNA(output$service_validation) == TRUE){
    warning("Not all samples have been categorised as service or validation")
  }
  if(anyNA(output$patient_non_patient) == TRUE){
    warning("Not all samples have been categorised as patient or non patient")
  }
  if(length(grep(pattern = "[[:digit:]]",
                        output$full_name)) != 0){
    warning("Some patient names contain numbers")
  }

  return(output)
  
}