#' @title Send Data
#'
#' @description
#' Sends data via email
#'
#' @details
#' This function can be used to do some things
#'
#' @param dataframes_list list of data to send
#'
#' @return output
#'
#' @export

sendData <- function(dataframeList) {
  sendmailR::sendmail_options(smtpServer=Sys.getenv("SMTP_SERVER"),verbose=TRUE)

  # Save named dataframes as .rda files
  for (name in names(dataframeList)) {
    df <- dataframeList[[name]]
    save(df, file=paste0(name, ".rda"))
  }
  
  # Attach .rda files to the email
  attachments <- list.files(pattern = "\\.rda$")
  
  mime <- list(sendmailR::mime_part("hello"))
  for (a in attachments) {
    mime <- append(mime, sendmailR::mime_part(a))
  }
  
  
  sendmailR::sendmail(
    'noreply@bgs.ac.uk', 
    'github@micronutrient.support', 
    'Test', 
    msg=mime)
  
  file.remove(attachments)

  
  return(attachments)
}
