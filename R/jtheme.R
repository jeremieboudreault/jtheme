#' A custom theme for ggplot2 graphs.
#'
#' `jtheme()` is a customized theme for ggplot2 in order to make the graphs
#' ready-to-use for scientific publications, reports, presentation, etc.
#'
#' In addition to a custom theme, `jtheme()` allows the user to have different
#' add-on to graph that are explained below.
#'
#' @param borders : Show "all" (all around the plot), "normal" (x and y axe) or "hide" borders.
#' @param expand_xy : Should an extra spacing be added `x`/`y` values and axes. Values are `TRUE`, `FALSE`, `"x_only"` and `"y_only"`.
#' @param legend_pos : Legend position. `bottomright`, `topleft`, `topright`
#' refers o inner legend while `bottom`, `left` refers to legend outside of the plot.
#' @param legend_nrow : Number of row the the legend.
#' @param legend_ncol : Number of cols the the legend.
#' @param legend_byrow : Should the legend be filled by row.
#' @param rotate_x_labs : Parameter to rotate the x labels.
#' @param show_grid : Toggle on/off the grid on ggplot2.
#' @param tight_facet : Toogle on/off the tight facetting
#' @param title_size : Customise title size. Default to `14L`.
#' @param title_face : Customise title face. Default to `"bold"`.
#' @param x_labs_to_months : Transformation of julian days to month (TRUE/FALSE).
#' @param language : Language of the plot ('fr' or 'eng')
#'
#' @export
jtheme <- function(
    borders          = "normal",
    expand_xy        = TRUE,
    legend_alpha     = NULL,
    legend_byrow     = FALSE,
    legend_nrow      = NULL,
    legend_ncol      = NULL,
    legend_pos       = "bottom",
    rotate_x_labs    = FALSE,
    show_grid        = FALSE,
    show_leg_title   = TRUE,
    tight_facets     = FALSE,
    title_size       = 14L,
    title_face       = "bold",
    x_labs_to_months = FALSE,
    language         = "eng") {

    # Set base values.
    axis.size <- 0.3
    ticks.color <- "black"

    # Set values for expand_xy.
    expd_x <- 0.05
    expd_y <- 0.05

    # Check for grid.
    grid.color <- if (show_grid) "grey70" else "white"

    # Panel color.
    panel.color <- if (borders == "all") "black" else NA
    axis.color <- if (borders == "all") NA else "black"

    # Hide border.
    if (borders == "hide") {
        axis.color  <- NA
        panel.color <- NA
        ticks.color <- NA
        axis.size   <- 0
    }

    # Replace legend position when set to topleft, topright and bottomright.
    if (legend_pos == "topright") {
        legend_pos <- c(0.9, 0.9)
    } else if (legend_pos == "topleft") {
        legend_pos <- c(0.15, 0.9)
    } else if (legend_pos == "bottomright") {
        legend_pos <- c(0.9, .1)
    }

    # Create custom theme.
    th <- theme(

        # Text.
        text = element_text(family = "Source Sans Pro"),

        # Title
        plot.title = element_text(
            size   = title_size,
            face   = title_face,
            hjust  = 0.5,
            vjust  = 0.8,
            margin = margin(b = 10, t = 5)
        ),

        # Subtitle
        plot.subtitle = element_text(
            size   = 12,
            hjust  = 0.5,
            vjust  = 1,
            margin = margin(b = 10, t = -5)
        ),

        # Axis title.
        axis.title = element_text(size = 11L),

        # Legend title size.
        legend.title = element_text(size = 9.5),

        # Axis text (labels)
        axis.text = element_text(size = 9.5, color = "black"),

        # Increases margins.
        axis.text.x.bottom = element_text(margin = margin(t = 5, b = 5)),
        axis.text.x.top    = element_text(margin = margin(t = 5, b = 5)),
        axis.text.y.right  = element_text(margin = margin(r = 5, l = 5)),
        axis.text.y.left   = element_text(margin = margin(r = 5, l = 5)),

        # Set axis lines and ticks.
        axis.line         = element_line(size = axis.size, colour = axis.color),
        axis.ticks        = element_line(size = axis.size, colour = ticks.color),
        axis.ticks.length = unit(ifelse(borders == "hide", 0, .15), "cm"),

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
        legend.position   = legend_pos,
        legend.key        = element_rect(fill = NA),
        legend.margin     = margin(t = -5),

        # Facets.
        strip.background = element_rect(fill = "white"),
        strip.text       = element_text(face = "bold", size = 10)

    )

    # Remove show_leg_title.
    if (!show_leg_title) th <- th + theme(legend.title = element_blank())

    # Rotate x axis label
    if (rotate_x_labs) th <- th + theme(axis.text.x = element_text(angle = 90L, vjust = 0.5))

    # Add tight setting option for facets.
    if (tight_facets)  {

        # Reduce the spacing for x-spacing.
        expd_x <- 0.01

        # Adjust theme.
        th <- th + theme(
            panel.spacing.x  = unit(-0.1, "cm"),
            panel.spacing.y  = unit(-0.1, "cm"),
            strip.background = element_rect(fill = NA),
            strip.text.x     = element_text(size = 8L, vjust = -0.2)
        )
    }

    # Set parameters for alpha in the legend.
    if (is.null(legend_alpha)) {
        override_col <- list()
        override_fill <- list(color = "white")
    } else {
        override_col <- list(alpha = legend_alpha)
        override_fill <- list(alpha = legend_alpha, color = "white")
    }

    # Transform x labels to month..
    if (x_labs_to_months) {
        if (language == "fr") {
            params_x_cont_1 <- list(
                breaks = c(1L, 60, 121L, 182L, 244L, 305L),
                labels = c("Jan", "Mar", "Mai", "Jul", "Sep", "Nov")
            )
        } else {
            params_x_cont_1 <- list(
                breaks = c(1L, 60, 121L, 182L, 244L, 305L),
                labels = c("Jan", "Mar", "May", "Jul", "Sep", "Nov")
            )
        }
    } else {
        params_x_cont_1 <- list()
    }

    # Set parameter for expand_xy.
    if (expand_xy == FALSE) {
        params_x_cont_2 <- list(expand = expansion(mult = c(0, expd_x)))
        params_y_cont_2 <- list(expand = expansion(mult = c(0, expd_y)))
    } else if (expand_xy == "y_only") {
        params_x_cont_2 <- list(expand = expansion(mult = c(0, expd_x)))
        params_y_cont_2 <- list()
    } else if (expand_xy == "x_only") {
        params_x_cont_2 <- list()
        params_y_cont_2 <- list(expand = expansion(mult = c(0, expd_y)))
    } else {
        params_x_cont_2 <- list()
        params_y_cont_2 <- list()
    }

    # Create a list for the output.
    l <- list(
        guides(
            color = guide_legend(
                nrow         = legend_nrow,
                ncol         = legend_ncol,
                byrow        = legend_byrow,
                override.aes = override_col
            ),
            fill  = guide_legend(
                nrow         = legend_nrow,
                ncol         = legend_ncol,
                byrow        = legend_byrow,
                override.aes = override_fill,
                order        = 99L
            )
        ),
        th
    )

    # Update the list
    if (expand_xy == FALSE | (x_labs_to_months & expand_xy == "x_only")) {

        l <- c(
            do.call(scale_x_continuous, c(params_x_cont_1, params_x_cont_2)),
            do.call(scale_y_continuous, c(params_y_cont_2)),
            l
        )

    } else if (expand_xy == "x_only") {

        l <- c(
               do.call(scale_y_continuous, c(params_y_cont_2)),
               l
        )

    } else if (expand_xy == "y_only" | x_labs_to_months) {

        l <- c(
            do.call(scale_x_continuous, c(params_x_cont_1, params_x_cont_2)),
            l
        )

    }

    # Return the list as the output.
    return(l)

}
