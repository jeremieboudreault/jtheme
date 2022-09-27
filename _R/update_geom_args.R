#'@export
update_geom_args <- function(x) {

    # Set default position to "dodge2" for histogram.
    formals(geom_histogram)$position <- ggplot2::position_dodge2(preserve = "single")

    # Default number to bins.
    formals(geom_histogram)$bins <- 12L

    # Change family of ggplot2 and base plot.
    formals(geom_text)$family <- "Source Sans Pro"

}
