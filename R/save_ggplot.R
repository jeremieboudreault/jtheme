#' A custom function to save ggplot into predefined sizes.
#'
#' `save_ggplot` is a wrapper for [ggplot2::ggsave()] that allows the user
#' to save plots in predefined sizes.
#'
#' This function is very convinient for scientific articles or presentations
#' when you need all your figures to have the same aspect ratio.
#'
#' @param file : Filename to save the plot.
#' @param size : One of either `rect`, `rectbig`, `squared`, `squaredbig`.
#' @param ... : Other arguments passed to [ggplot2::ggsave()].
#'
#' @export
save_ggplot <- function(file, size, ...) {
    if (size == "rect") {
        w <- 7
        h <- 5
    } else if (size == "rectbig") {
        w <- 8
        h <- 6
    } else if (size == "squared") {
        w <- 6
        h <- 5
    } else if (size == "squaredbig") {
        w <- 8
        h <- 7
    }
    ggplot2::ggsave(
        filename = file,
        width    = w,
        height   = h,
        ...      = ...
    )
}
