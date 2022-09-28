# to_factor.R

#' A small wrapper for factor function.
#'
#' `to_factor` is a wrapper for [base::factor()] that allows to easily convert
#' a string character to some factors for plotting purpose.
#'
#'
#' @param rev : Do you want to reverse the levels.
#'
#' @export
to_factor <- function(x, rev = FALSE) {
    levels <- if (rev) rev(unique(x)) else unique(x)
    return(factor(x, levels))
}
