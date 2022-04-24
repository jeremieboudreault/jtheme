#' A custom theme for ggplot2 graphs.
#'
#' `jtheme()` is a customized theme for ggplot2 in order to make the graphs
#' ready-to-use for scientific publications, reports, presentation, etc.
#'
#' In addition to a custom theme, `jtheme()` allows the user to have different
#' add-on to graph that are explained below.
#'
#' @param show.grid : Toggle on/off the grid on ggplot2.
#' @param legend.pos : Legend position. `bottomright`, `topleft`, `topright`
#' refers to inner legend while `bottom`, `left` refers to legend outside of the plot.
#' @param legend.title : Show legend title or not.
#' @param facets : Do you graph include facets or not (style will slightly change)
#' @param expand : Should an extra spacing be added `x`/`y` values and axes
#' @param expand.x : Should an extras spacing be added between `x` value and y-axis
#' @param expand.y : Should an extra spacing be added between `y` values and x-axis
#'
#' @export
jtheme <- function(
    show.grid    = FALSE,
    legend.pos   = "bottom",
    legend.title = TRUE,
    facets       = FALSE,
    expand       = TRUE,
    expand.x     = TRUE,
    expand.y     = TRUE) {

    # Check for grid.
    grid.color <- if (show.grid) "grey70" else "white"

    # Panel color.
    panel.color <- if (facets) "black" else NA
    axis.color <- if (facets) NA else "black"

    # Replace legend position when set to topleft, topright and bottomright.
    if (legend.pos == "topleft") {
        legend.pos <- c(0.9, 0.9)
    } else if (legend.pos == "topright") {
        legend.pos <- c(0.15, 0.9)
    } else if (legend.pos == "bottomright") {
        legend.pos <- c(0.9, .1)
    }

    # Cretate custom theme.
    th <- theme(

        # Title
        plot.title = element_text(
            size   = 14,
            face   = "bold",
            hjust  = 0.5,
            vjust  = 0.8,
            margin = margin(b = 10, t = 5)
        ),

        # Subtitle
        plot.subtitle = element_text(
            size = 12,
            hjust = 0.5,
            vjust = 1,
            margin = margin(b = 10, t = -5)
        ),

        # Axis title.
        axis.title = element_text(size = 11L),

        # Axis text (labels)
        axis.text = element_text(size = 9.5, color = "black"),

        # Increases margins.
        axis.text.x = element_text(margin = margin(t = 5, b = 5)),
        axis.text.y = element_text(margin = margin(r = 5, l = 5)),

        # Set axis lines and ticks.
        axis.line         = element_line(size = 0.3, colour = axis.color),
        axis.ticks        = element_line(size = 0.3, colour = "black"),
        axis.ticks.length = unit(.15, "cm"),

        # Set grid.
        panel.grid.major = element_line(
            colour   = grid.color,
            size     = 0.2,
            linetype = "dotted"
        ),

        # Background panel color.
        panel.background = element_rect(fill = "white"),
        panel.border     = element_rect(size = 0.4, fill = NA, color = panel.color),

        # Legend position and filling.
        legend.background = element_blank(),
        legend.position   = legend.pos,
        legend.key        = element_rect(fill = NA),
        legend.margin     = margin(t = -5),

        # Facets.
        strip.background = element_rect(fill = "white"),
        strip.text       = element_text(face = "bold", size = 10)

    )

    # Remove legend title.
    if (!legend.title) th <- th + theme(legend.title = element_blank())

    # Set expand.
    if ((!expand.x && !expand.y) | !expand) {
        list(
            scale_x_continuous(expand = expansion(mult = c(0, 0.05))),
            scale_y_continuous(expand = expansion(mult = c(0, 0.05))),
            th
        )
    } else if (!expand.x && expand.y) {
        list(
            scale_x_continuous(expand = expansion(mult = c(0, 0.05))),
            th
        )
    } else if (expand.x && !expand.y) {
        list(
            scale_y_continuous(expand = expansion(mult = c(0, 0.05))),
            th
        )
    } else {
        th
    }

}
