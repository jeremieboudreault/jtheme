# save_ggplot.R

#' A custom function to save ggplot into predefined sizes.
#'
#' `save_ggplot` is a wrapper for [ggplot2::ggsave()] that allows the user
#' to save plots in predefined sizes.
#'
#' This function is very convinient for scientific articles or presentations
#' when you need all your figures to have the same aspect ratio.
#'
#' @param file : Filename to save the plot.
#' @param size : One of the predefined sizes given in 'sizes_map'.
#' @param ... : Other arguments passed to [ggplot2::ggsave()].
#'
#' @include globals.R
#'
#' @export
save_ggplot <- function(file, size = "rect", w = NULL, h = NULL, ...) {

    # Extract size from the mapping.
    sizewh <- sizes_map[[size]]

    # Check if it is null.
    if (is.null(sizewh)) {
        warning("'size' invalid. Using default value 'rect'.")
        sizewh <- sizes_map[["rect"]]
    }

    # Custom size.
    if (!is.null(w) & !is.null(h)) {
        sizewh <- c(w, h)
    }

    # Save plot.
    ggplot2::ggsave(
        filename = file,
        width    = sizewh[1L],
        height   = sizewh[2L],
        ...      = ...
    )
}
