#' A custom function to save ggplot into predefined sizes.
#'
#' `save_ggplot` is a wrapper for [ggplot2::ggsave()] that allows the user
#' to save plots in predefined sizes.
#'
#' This function is very convinient for scientific articles or presentations
#' when you need all your figures to have the same aspect ratio.
#'
#' @param file : Filename to save the plot.
#' @param size : One of either `rect`, `rectbig`, `rectsmall`, `sqr`, `sqrsmall`, `sqrbig`.
#' @param ... : Other arguments passed to [ggplot2::ggsave()].
#'
#' @export
save_ggplot <- function(file, size = "rect", ...) {
    if (size == "rectsmall") {
        w <- 5
        h <- 3.5
    } else if (size == "rect") {
        w <- 7
        h <- 5
    } else if (size == "rectbig") {
        w <- 8
        h <- 6
    else if (size == "rectxbig") {
        w <- 10
        h <- 8
    } else if (size == "sqrsmall") {
        w <- 4
        h <- 3.5
    } else if (size == "sqr") {
        w <- 6
        h <- 5
    } else if (size == "sqrbig") {
        w <- 8
        h <- 7
    } else if (size == "sqrxbig") {
        w <- 10
        h <- 9
    } else {
        warning(
            "Argument 'size' invalid. Using default value 'rect'.\n",
            "> Valid values are rect, rectsmall, rectbig, rectxbig, sqr, sqrsmall, sqrbig, sqrxbig."
        )
        w <- 7; h <- 5
    }
    ggplot2::ggsave(
        filename = file,
        width    = w,
        height   = h,
        ...      = ...
    )
}
