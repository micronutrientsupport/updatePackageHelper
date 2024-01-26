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

sendData <- function(dataframes_list) {
  sendmailR::sendmail_options(smtpServer=Sys.getenv("SMTP_SERVER"),verbose=TRUE)
    # Save named dataframes as .rda files
    for (name in names(dataframes_list)) {
      saveRDS(dataframes_list[[name]], file = paste0(name, ".rda"))
    }

    # Attach .rda files to the email
    attachments <- list.files(pattern = "\\.rda$")

    # Compose and send the email
    sendmailR::sendmail(from = "noreply@micronutrient.support",
             to = "github@micronutrient.support",
             subject = "File",
             body = "Here it is",
             attach.files = attachments)

    # Clean up: remove temporary .rda files
    file.remove(attachments)

    res <- list("Hello")

    return(res)
}

