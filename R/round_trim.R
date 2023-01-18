# round_trim.R

#' `round_trim` is a wrapper for [base::round()] and [base::format()].
#'
#'
#' @param x : The number of the rounded.
#' @param nsmall : The number of digits.
#'
#' @export
round_trim <- function(x, nsmall) {
    format(
        x      = round(x, nsmall),
        nsmall = nsmall
    )
}
