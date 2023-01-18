# annotate_coord.R

#' @title A custom annotation function based on coordinates.
#'
#' @description Annotate a plot at the N, NE, NW, E, W, S, SE, SW
#' without having to worry about the positioning. Also
#' handles naturally the custom font of [jtheme()].
#'
#' @param pos `N`, `NE`, `E`, `SE`, `S`, `SW`, `W` and `NW`.
#' @param label Text to be annotated.
#'
#' @return Same as [grid::textGrob()].
#'
#' @author https://stackoverflow.com/questions/47916307/
#          specify-pos-of-geom-text-by-keywords-like-top-bottom-left-right
#'
#' @export
annotate_coord <- function(
        pos     = c('N','NE','E','SE','S','SW','W','NW'),
        label   = "",
        padding = grid::unit(c(0.5,0.5),"line"),
        ...
){

    # Match pos.
    pos <- match.arg(pos)

    x <- switch (pos,
                 N = 0.5,
                 NE = 1,
                 E = 1,
                 SE = 1,
                 S = 0.5,
                 SW = 0,
                 W = 0,
                 NW = 0
    )
    y <- switch (pos,
                 N = 1,
                 NE = 1,
                 E = 0.5,
                 SE = 0,
                 S = 0,
                 SW = 0,
                 W = 0.5,
                 NW = 1
    )
    hjust <- switch (pos,
                     N = 0.5,
                     NE = 1,
                     E = 1,
                     SE = 1,
                     S = 0.5,
                     SW = 0,
                     W = 0,
                     NW = 0
    )
    vjust <- switch (pos,
                     N = 1,
                     NE = 1,
                     E = 0.5,
                     SE = 0,
                     S = 0,
                     SW = 0,
                     W = 0.5,
                     NW = 1
    )
    f1 <- switch (pos,
                  N = 0,
                  NE = -1,
                  E = -1,
                  SE = -1,
                  S = 0,
                  SW = 1,
                  W = 1,
                  NW = 1
    )
    f2 <- switch (pos,
                  N = -1,
                  NE = -1,
                  E = 0,
                  SE = 1,
                  S = 1,
                  SW = 1,
                  W = 0,
                  NW = -1
    )
    annotation_custom(
        grid::textGrob(label,
                       x      = grid::unit(x,"npc") + f1*padding[1] ,
                       y      = grid::unit(y,"npc") + f2*padding[2],
                       hjust  = hjust,
                       vjust  = vjust,
                       ...
        )
    )

}
