#' @title Triggers a re-install of the packahge URL to ensure latest data
#'
#' @description
#' Update Package
#'
#' @details
#' This function can be used to do some things
#'
#' @param dataframes_list list of data to send
#'
#' @return output
#'
#' @export

updatePackage <- function() {
  install.packages(Sys.getenv("PACKAGE_URL"), repos=NULL, type="source")
  return(TRUE)
}
