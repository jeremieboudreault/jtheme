# jarrange.R

#' A wrapper for [ggpubr::ggarrange()].
#'
#' `jarrange` allows to arrange multiple ggplots into a unique plot. It also
#' handles annotation and legend combinations.
#'
#'
#' @param plist : List of the plots to be combined. Should be a [list()].
#' @param title : Title of the plot.
#' @param subtitle : Subtitle of the plot.
#' @param hjust_title : Horizontal adjusting of the title (default to center).
#' @param hjust_subtitle : Horizontal adjusting of the sub-title (default to center).
#' @param left : Left text.
#' @param right : Right text.
#' @param bottom : Bottom text.
#' @param legend_pos : Legend position `bottom`, `top` or `right`. If `NULL`, individual legends are kept.
#' @param ... : Other arguments passed to [ggpubr::ggarrange()].
#'
#' @export

jarrange <- function(
        plist,
        title           = NULL,
        subtitle        = NULL,
        hjust_title     = 0.5,
        hjust_subtitle  = 0.5,
        left            = NULL,
        right           = NULL,
        bottom          = NULL,
        legend_pos      = "bottom",
        ...
) {

    # Convert to list if the plist is not a list.
    if (!is.list(plist)) {
        warning("'plist' is not a list. Make sure it is an appropriate object for plotting.")
        plist <- list(plist)
    }

    # Set common legend.
    common.legend <- ifelse(is.null(legend_pos), FALSE, TRUE)

    # Create plot.
    p <- ggpubr::ggarrange(
        plotlist      = plist,
        common.legend = common.legend,
        legend        = legend_pos,
        ...
    )

    # Set spacing depending on a title or a subtitle.
    if (!is.null(title) & is.null(subtitle)) {
        vjust_title <- 1.7
    } else if (!is.null(title) & !is.null(subtitle)) {
        vjust_title <- 1.6
        vjust_subtitle <- 2
    }

    # Generate text for title and left.
    if (!is.null(title)) {
        p <- ggpubr::annotate_figure(p, top = "")
        title <- ggpubr::text_grob(title,
                                   family = "Source Sans Pro",
                                   size   = 14L,
                                   face   = "bold",
                                   vjust  = vjust_title,
                                   hjust  = hjust_title
        )
    }
    if (!is.null(subtitle)) {
        subtitle <- ggpubr::text_grob(subtitle,
                                      family = "Source Sans Pro",
                                      size   = 12L,
                                      vjust  = vjust_subtitle,
                                      hjust  = hjust_subtitle

        )
    }
    if (!is.null(left)) {
        left <- ggpubr::text_grob(left,
                                  family = "Source Sans Pro",
                                  size   = 11L,
                                  rot    = 90L
        )
    }
    if (!is.null(right)) {
        right <- ggpubr::text_grob(right,
                                   family = "Source Sans Pro",
                                   size   = 11L,
                                   rot    = 270L
        )
    }
    if (!is.null(bottom)) {
        bottom <- ggpubr::text_grob(bottom,
                                    size   = 11L,
                                    family = "Source Sans Pro"
        )
    }

    # First annotate with a subtitle.
    if (!is.null(subtitle)) {
        p <- ggpubr::annotate_figure(p, top = subtitle)
    }

    # Annotate and add white background.
    ggpubr::annotate_figure(
        p      = p,
        top    = title,
        left   = left,
        right  = right,
        bottom = bottom
    ) + ggpubr::bgcolor("white") + ggpubr::border("white")

}
