#!/usr/bin/env Rscript
#' Analysis Function
#'
#' Takes the numeric array x and randomly adds white noise (drawn i.i.d. from unif(−1,1)) to it.
#'
#' @usage
#'
#' AnalysisFunction(x,training)
#'
#' @param x numerical array
#'
#' @param training when training = T, function takes the numeric array x and randomly adds white noise (drawn i.i.d. from unif(−1,1)) to x. When training = F, the function simply returns x.
#'
#' @return `z` the array x with noise, or simply the array x if training = F
#' @export
#'
#'
#' @examples
#'
#' #Create synthetic data
#' x <- c("1","2","3","4")
#'
#'
#' # Input the numerical array x into the function and specify a setting for training:
#' result –> AnalysisFunction(x, training= T)
#'
#' # Print the result 
#' print(AnalysisFunction )
#'
#' @export

AnalysisFunction <- function(data) {

  if ((is.vector(data))& (training=T)) {
    noise <- runif(length(data), -1,1)
    noisified <- data + noise
    print(noisified)
  } else {
    print(data)
  }

