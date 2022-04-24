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
    x = 201:300,
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
    "", "", "", "", "Mai", "Juin", "Juillet", "Août", "Septembre"
)[airquality$Month]


# Simple histogram -------------------------------------------------------------


# Classical.
ggplot() + geom_histogram(data = data.frame(x = rnorm(100)), aes(x = x)) +
ggtitle("Classical histogram", "ggplot2")

# With jtheme.
library("jtheme")
ggplot() + geom_histogram(data = data.frame(x = rnorm(100)), aes(x = x)) +
ggtitle("Classical histogram", "jtheme") +
jtheme(expand.y = FALSE)


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
ggtitle("Températures quotidiennes de l'air", "Deux villes du Québec") +
labs(x = "Mesures quotidiennes (ºC)", y = "Fréquence") +
jtheme(
    legend.pos   = "topleft",
    expand.y     = FALSE,
    legend.title = FALSE
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
ggtitle("Évolution des GES", "Niveau mondial") +
labs(y = "Concentration (ppm)", x = "Années") +
jtheme(legend.pos = "topright", expand = FALSE, legend.title = FALSE)

# Save.
jtheme::save_ggplot("_plots/fig_2_squared.jpg", size = "squared")


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
ggtitle("Concentration de quatre polluants") +
labs(y = "Concentration (ppm)", x = "Jour de l'année") +
jtheme(expand.x = FALSE, legend.title = FALSE, legend.pos = "topleft")

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
ggtitle("Relation entre la pollution et la température", "New York") +
labs(
    col = "Mois de l'année :",
    x   = "Concentration d'ozone (ppm)",
    y   = "Température (ºC)"
) +
jtheme(show.grid = TRUE)

# Save.
jtheme::save_ggplot("_plots/fig_4_rect.jpg", size = "rect")


# Facets -----------------------------------------------------------------------


# Point by facets.
ggplot(
    data    = airquality,
    mapping = aes(x = Ozone, y = Temp, color = MonthName)) +
geom_point() +
scale_color_brewer(palette = "Accent") +
ggtitle("Relation entre la pollution et la température") +
labs(
    col = "Mois de l'année :",
    x  = "Concentration d'ozone (ppm)",
    y  = "Température (ºC)"
) +
facet_wrap(facets = "MonthName") +
jtheme(show.grid = TRUE, facets = TRUE)

# Save.
jtheme::save_ggplot("_plots/fig_5_rectbig.jpg", size = "rectbig")
