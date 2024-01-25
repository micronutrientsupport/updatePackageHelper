
send_data <- function() {
  sendmailR::sendmail_options(smtpServer=Sys.getenv("SMTP_SERVER"),verbose=TRUE)
  sendmailR::sendmail('noreply@micronutrient.support', 'github@micronutrient.support', 'Test', msg=list(sendmailR::mime_part("Here it is")))
}
