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
  options(timeout = max(100000, getOption("timeout")))
  install.packages(Sys.getenv("PACKAGE_URL"), repos=NULL, lib="/usr/local/lib/R/site-library", type="source", INSTALL_opts = '--no-lock')
  Sys.info()
  return(Sys.getenv("PACKAGE_URL"))
}


#sudo chgrp -R www-data /usr/local/lib/R/site-library/ 
#sudo chmod -R g+w  /usr/local/lib/R/site-library/ 
