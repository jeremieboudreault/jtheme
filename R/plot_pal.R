# plot_pal()

#' A function to plot a palette of color.
#'
#' `plot_pal` takes a palette of colors of values and plot it.
#'
#' @param pal : A vector of colors.
#'
#' @export

plot_pal <- function(pal) {

    plot(
        x   = seq_along(pal),
        y   = rep(1, length(pal)),
        col = pal,
        pch = 19,
        cex = 5
    )

}
