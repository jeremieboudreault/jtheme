# save_ggplot.R

#' @title [ggplot2::ggsave()] with default width and height parameters.
#'
#' @description Save a ggplot using [ggplot2::ggsave()] with default
#' width and height so that all plots always have the same width and height.
#'
#' @param file Same as `filename` in [ggplot2::ggsave()].
#'
#' @param size Either of the following :
#' + `square` : Small squared figure (6 x 6)
#' + `squarebig` : Big squared figure (8 x 8)
#' + `rect`  : Small horizontal rectangular figure (7 x 5)
#' + `rectbig` : Big horizontal rectangular figure (8 x 6)
#' + `rectv` : Small vertical rectangular figure (5 x 7)
#' + `rectvbig` : Big horizontal rectangular figure (7 x 8)
#'
#' @param ... Other parameters passed to [ggplot2::ggsave()].
#'
#' @return Used for its side effect of saving the plot to `file`.
#'
#' @author Jeremie Boudreault (<jeremie_boudreault@cooperators.ca>)
#'
#' @export
save_ggplot <- function(file, size, ...) {

    # Define width and height.
    if (size == "square") {
        height <- 6L
        width  <- 6L
    } else if (size == "squarebig") {
        height <- 8L
        width  <- 8L
    } else if (size == "rect") {
        height <- 5L
        width  <- 7L
    } else if (size == "rectbig") {
        height <- 6L
        width  <- 8L
    } else if (size == "rectv") {
        height <- 7L
        width  <- 5L
    } else if (size == "rectvbig") {
        height <- 8L
        width  <- 7L
    } else {
        stop("The value of 'size' if not supported.\n",
        "> Choose betwen square, squarebig, rect, rectbig, rectv or rectvbig.")
    }

    # Save plot.
    ggplot2::ggsave(
        filename = file,
        height   = height,
        width    = width,
        ...
    )

}
