#!/usr/bin/env Rscript
#' GetDataAsset
#'
#' Downloads, unzips, and loads the data asset stored at the following Dropbox link:
#' https://www.dropbox.com/s/5mzc60tbh09ew49/lalonde%20nsw.csv.zip?dl=0
#'
#' @usage
#'
#' GetDataAsset()
#'
#'
#' @return `z` The downloaded data object from the URL.
#' @export
#'
#' @details `url2dt` downloads a zipped `.csv` file and loads it into memory based on the input URL.
#'
#' @examples
#'
#' # Example download
#' GetDataAsset()
#'
#' @export
#'
#' @md



GetDataAsset <- function(){
 temp_folder_name_zip <- "tmp1432351232142323196039z"
  temp_folder_zip <- tempfile(pattern = temp_folder_name_zip)

  temp_folder_name_unzip <- "tmp1432351232142323196039u"
  temp_folder_unzip <- tempfile(pattern = temp_folder_name_unzip)

  # download the data asset
download.file( https://dl.dropbox.com/s/5mzc60tbh09ew49/lalonde%20nsw.csv.zip?dl=0, destfile =  temp_folder_zip)

  # unzip into folder
  unzip(temp_folder_zip,
        junkpaths = T,
        exdir = temp_folder_unzip)

  # load unzipped file into memory as a data.table
  file_in_zip <- list.files( temp_folder_unzip )
  file_in_zip <- grep(file_in_zip,pattern="\\.csv",value = T)
  returned_dt <- data.table::fread(
        sprintf("%s/%s", temp_folder_unzip, file_in_zip) )

  # cleanup
  file.remove( temp_folder_zip )

  # return
  return( returned_dt )
}
