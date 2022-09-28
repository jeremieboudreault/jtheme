# to_lower.R

#' `to_lower` is a wrapper for [base::tolower()] that allows also to
#' capitalize first letter of the sentence or all words.
#'
#' @param cap : Do you want to capitalize the first letter (`first`) or all first (`allfirst`).
#' @param pol : Do you want to capitalize pollutant names (e.g. O3, PM2.5, etc.)
#'
#' @export
#'
# A wrapper function of tolower() with extra options.
to_lower <- function(x, cap = "first", pol = TRUE) {

    # First option : Only first letter to cap.
    if (cap == "first") {
        x_low <- tolower(x)
        x_high <- toupper(substr(x, 1L, 1L))
        s <- paste0(x_high, substr(x_low, 2L, stop = 1000))
    # Second option : All first letter to cap.
    } else if (cap == "allfirst") {
        s <- sapply(x, function(w) {
            s <- tolower(w)
            for (chr in c(" ", "-", "/", "'")) {
                split <- strsplit(s, chr)[[1]]
                s <- paste(
                    toupper(substring(split, 1,1)), substring(split, 2),
                    sep = "", collapse = chr
                )
            }
            return(s)
        })
    } else {
        s <- tolower(x)
    }

    # Update all pollutant to uppercase.
    if (pol) {
        s <- gsub("No2", "NO2", s)
        s <- gsub("So2", "SO2", s)
        s <- gsub("Pm25", "PM25", s)
        s <- gsub("Pm10", "PM10", s)
        s <- gsub("Co_", "CO_", s)
    }

    # Return s.
    return(s)

}

