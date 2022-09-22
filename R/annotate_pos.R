# annotate_pos.R

#' @title A [ggplot2::annotate()] wrapper with default positioning
#'
#' @description Annotate a plot at the top-left, top-right bottom-right
#' or bottom-left without having to worry about the positioning. Also
#' handles naturally the custom font of [jtheme()].
#'
#' @param pos `topright`, `topleft`, `bottomright` or `bottomleft`
#' @param label Text to be annotated. Passed directly to [ggplot2::annotate()] label argument.
#' @param ... Other parameters passed to [ggplot2::annotate()].
#'
#' @return Same as [ggplot2::annotate()].
#'
#' @author Jeremie Boudreault
#'
#' @export
annotate_pos <- function(pos, label, ...) {

    # Define x, y, hjust and vjust
    if (pos == "bottomright") {
        x     <- Inf
        y     <- -Inf
        hjust <- 1.15
        vjust <- -0.8
    } else if (pos == "topright") {
        x       <- Inf
        y       <- Inf
        hjust   <-  1.15
        vjust   <-  1.6
    } else if (pos == "bottomleft") {
        x       <- -Inf
        y       <- -Inf
        hjust   <-  -0.15
        vjust   <-  -0.8
    } else if (pos == "topleft") {
        x       <- -Inf
        y       <- Inf
        hjust   <-  -0.15
        vjust   <-  1.6
    } else {
        stop(
            "'pos' argument is not valid. \n",
            "> Should be either 'topright', 'topleft"
        )
    }

    # Return.
    return(
        ggplot2::annotate(
            geom   = "text",
            label  = label,
            family = "Source Sans Pro",
            x      = x,
            y      = y,
            vjust  = vjust,
            hjust  = hjust,
            ...
        )
    )
}
