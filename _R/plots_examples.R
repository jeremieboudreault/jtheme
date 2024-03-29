# plots_examples.R


# Project : jtheme
# Author  : Jeremie Boudreault
# Email   : name [dot] surname [at] inrs [dot] ca
# Depends : R (v4.1.2), jtheme (v0.0.1)
# License : None


# Note : All data all randomly generated.


# Librairies -------------------------------------------------------------------


library(ggplot2)


# Generate datasets ------------------------------------------------------------


# Generate temperature for Montreal and Quebec.
set.seed(123L)
temp_mtl_qc <- data.frame(
    x    = c(rnorm(100, 05, 5), rnorm(100, 15, 10)),
    city = c("Montréal", "Québec")[sample(c(1,2), size = 200L, replace = TRUE)]
)

# Generate CO2 emissions for 2 emissions scenarios.
co2_emissions <- data.table::data.table(
    year      = seq.int(1970, 2100),
    `RCP4.5`  = seq.int(0, 130) ^ 1.3 / 2,
    `RCP8.5`  = seq.int(0, 130) ^ 1.3
)

# Concentration of pollutants.
x <- seq(1L, 5L, length.out = 100L)
conc_pol <- data.frame(
    x = seq(1, 365, length.out = length(x)),
    y = c(
        (-cos(x) * 1.0 + 1 + rnorm(100, 0, 0.2))^2,
        (-cos(x) * 1.9 + 1 + rnorm(100, 0, 0.2))^2,
        (-cos(x) * 2.7 + 1 + rnorm(100, 0, 0.3))^2,
        (-cos(x) * 3.5 + 1 + rnorm(100, 0, 0.4))^2
    ),
    type = rep(c("a", "b", "c", "d"), each = 100)
)

# Air quality in New York city.
airquality <- datasets::airquality
airquality$MonthName <- c(
    "", "", "", "", "May", "June", "July", "August", "September"
)[airquality$Month]


# Simple histogram -------------------------------------------------------------


# Classical.
set.seed(1229L)
ggplot() + geom_histogram(data = data.frame(x = rnorm(100)), aes(x = x)) +
ggtitle("Classical histogram", "ggplot2")

# With jtheme.
library("jtheme")
set.seed(1229L)
ggplot() + geom_histogram(data = data.frame(x = rnorm(100)), aes(x = x)) +
ggtitle("Classical histogram", "jtheme") +
jtheme(expand_xy = "x_only")


# Histogram with two categories ------------------------------------------------


# Plot.
ggplot(
    data = temp_mtl_qc
) +
geom_histogram(
    mapping  = aes(x = x, fill = city),
    position = "dodge",
    bins     = 14L
) +
scale_fill_manual(
    values = ul(jtheme::colors[c("light_blue", "light_red")])
) +
ggtitle("Daily air temperature values", "Two cities of Quebec, Canada") +
labs(x = "Daily values (ºC)", y = "Frequency") +
jtheme(
    legend_pos     = "topright",
    expand_xy      = "x_only",
    show_leg_title = FALSE
)

# Save plot.
jtheme::save_ggplot("_plots/fig_1_rect.jpg",   size = "rect")


# Lines plot -------------------------------------------------------------------


# Plot.
ggplot(
    data = data.table::melt(co2_emissions, id.vars = "year")
) +
geom_line(
    mapping = aes(x = year, y = value, color = variable)
) +
scale_color_manual(
    values = ul(jtheme::colors[c("blue", "red")])
) +
ggtitle("Greenhouse Gas (GHG) evolution", "Global level") +
labs(y = "Concentration (ppm)", x = "Years") +
jtheme(legend_pos = "topleft", expand_xy = FALSE, show_leg_title = FALSE)

# Save.
jtheme::save_ggplot("_plots/fig_2_squared.jpg", size = "sqr")


# Times series -----------------------------------------------------------------


# Plot.
ggplot(
    data    = conc_pol
) +
geom_line(
    mapping = aes(
        x   = x,
        y   = y,
        col = type
    )
) +
scale_color_brewer(palette = "RdBu") +
ggtitle("Concentration of four pollutants") +
labs(y = "Concentration (ppm)", x = "Date") +
jtheme(expand_xy = FALSE, show_leg_title = FALSE,
       legend_pos = "topright", x_labs_to_months = TRUE)

# Save.
jtheme::save_ggplot("_plots/fig_3_rect.jpg", size = "rect")


# Scatter plot -----------------------------------------------------------------


# Plot
ggplot(
    data = airquality
) +
geom_point(
    mapping = aes(x = Ozone, y = Temp, col = as.factor(Month))
) +
scale_color_brewer(palette = "Blues") +
ggtitle("Relation between air temperature and pollution", "New York") +
labs(
    col = "Month :",
    x   = "Ozone concentration (ppm)",
    y   = "Air temperature (ºC)"
) +
jtheme(show_grid = TRUE)

# Save.
jtheme::save_ggplot("_plots/fig_4_rect.jpg", size = "rect")


# Facets -----------------------------------------------------------------------


# Point by facets.
ggplot(
    data    = airquality,
    mapping = aes(x = Ozone, y = Temp, color = MonthName)) +
geom_point() +
scale_color_brewer(palette = "Accent") +
ggtitle("Relation between pollution and air temperature") +
labs(
    col = "Month :",
    x  = "Ozone concentration (ppm)",
    y  = "Air temperature (ºC)"
) +
facet_wrap(facets = "MonthName") +
jtheme(show_grid = TRUE, borders = "all")

# Save.
jtheme::save_ggplot("_plots/fig_5_rectbig.jpg", size = "rectbig")

