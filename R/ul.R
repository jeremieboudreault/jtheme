#' A small wrapper for unlist.
#'
#' `ul` is a wrapper for [base::unlist()].
#'
#'
#' @param recursive : `FALSE`
#' @param use.names : `FALSE`
#'
#' @export
ul <- function(x, recursive = FALSE, use.names = FALSE) {
    unlist(x, recursive, use.names)
}
