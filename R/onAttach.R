#'@export
.onAttach <- function(...){

    message("Welcome to jtheme v0.0.1. Updating ggplot2 default aesthetics.")

    # Update the color of the points.
    ggplot2::update_geom_defaults(
        geom = "point",
        new  = list(colour = "black")
    )

    # Update the color of the line.
    ggplot2::update_geom_defaults(
        geom = "line",
        new  = list(
            colour = "black",
            size   = 0.75
        )
    )

    # Update the color of the histogram.
    ggplot2::update_geom_defaults(
        geom = "bar",
        new  = list(
            colour = "black",
            fill   = colors$light_blue,
            lwd    = 0.3
        )
    )

}
