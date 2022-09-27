#'@export
.onAttach <- function(...){

    # Welcome message.
    message("Welcome to jtheme v0.0.2.")

    # Load extrafont and load appropriately fonts.
    suppressMessages(library("extrafont", quietly = TRUE))
    extrafont::loadfonts(quiet = TRUE)

    #  Message.
    message("\U2713 Fonts loaded using extrafont")

    # Load ggplot2 package.
    suppressMessages(library("ggplot2", quietly = TRUE))

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
            size   = 0.8
        )
    )

    # Update the color of the histogram.
    ggplot2::update_geom_defaults(
        geom = "bar",
        new  = list(
            colour = "black",
            fill   = "grey90",
            lwd    = 0.3
        )
    )

    # Change family of base plot.
    par(family = "Source Sans Pro")

    # Message.
    message("\U2713 Plots default aesthetics updated")


}
