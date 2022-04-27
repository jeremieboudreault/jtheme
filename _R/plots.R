# plots.R


#' @include ul.R


#' @title `ggplot2` helper functions
#'
#' @description Various functions to help the creation of nice plots with `ggplot2`.
#'
#' @author Jeremie Boudreault (<jeremie_boudreault@cooperators.ca>)
#'
#' @name ggplot2_helpers
#'
#' @usage rotate_x_labels
#'
#' @format NULL
#'
#' @export
# rotate_x_labels : Rotate the x-axis labels.
rotate_x_labels <- ggplot2::theme(
    axis.text.x = ggplot2::element_text(
        angle = 90,
        vjust = 0.5,
        hjust = 1L
    )
)

#' @name ggplot2_helpers
#'
#' @usage set_legend_bottom
#'
#' @format NULL
#'
#' @export
# set_legend_bottom : Move legend to the botton.
set_legend_bottom <- ggplot2::theme(
    legend.position = "bottom"
)

#' @name ggplot2_helpers
#'
#' @usage charm_color_fill
#'
#' @format NULL
#'
#' @export
# charm_color_fill : Add CHARM color fill to a ggplot.
charm_color_fill <- ggplot2::scale_fill_manual(
    values = paste0(ul(charm_colors), "DD")
)

#' @name ggplot2_helpers
#'
#' @usage scale_x_days
#'
#' @format NULL
#'
#' @export
# scale_x_days : Scale day of year (1:366) to days.
scale_x_days <- ggplot2::scale_x_continuous(
    breaks = c(1L, 61L, 120L, 182L, 243L, 303L),
    labels = c("Jan.", "Mar.", "May", "Jul.", "Sep.", "Nov.")
)

#' @name ggplot2_helpers
#'
#' @usage scale_x_years(years)
#'
#' @format NULL
#'
#' @export
# scale_x_years : Render full years as labels for the x-axis.
scale_x_years <- function(years) {
    return(
        ggplot2::scale_x_continuous(
            breaks = seq.int(
                from = min(years, na.rm = TRUE),
                to   = max(years, na.rm = TRUE)
            )
        )
    )
}

#' @name ggplot2_helpers
#'
#' @format NULL
#'
#' @usage scale_y_percent
#'
#' @export
# scale_y_percent : Render the y-axis with percentage.
scale_y_percent <- ggplot2::scale_y_continuous(
    labels = function(x) paste0(x * 100, "%")
)

#' @name ggplot2_helpers
#'
#' @export
# geom_sp() : A function to plot spatial object by converting them to sf.
geom_sp <- function(x, ...) {
    return(ggplot2::geom_sf(data = sf::st_as_sf(x), ...))
}

#' @name ggplot2_helpers
#'
#' @export
# geom_raster_obj() : A function to plot a raster::raster object.
geom_raster_obj <- function(x, ...) {
    df <- raster::rasterToPoints(x, spatial = TRUE)
    df <- data.frame(df)
    names(df)[seq.int(1L, 3L)] <- c("z", "x", "y")
    return(ggplot2::geom_raster(data = df, aes(x = x, y = y, fill = z), ...))
}
