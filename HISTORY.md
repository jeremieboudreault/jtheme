History
================================================================================

v0.0.3
--------------------------------------------------------------------------------

### Functions added to the package :

* `annotate_coord()` : Annotate a plot based on coordinates position (N, S, E, W)
* `jarrange()` : A wrapper for `ggpubr::ggarrange` that is easier to use
* `plot_pal()` : A function to easily plot a palette of colors.
* `round_trim()` : A function to round and trim numbers at the same time.

### Changes : 

* Updated `save_ggplot()` to use the mapping of size in `sizes_map`

v0.0.2
--------------------------------------------------------------------------------

### Options added to `jtheme()` :

* `legend_alpha` option : Override legend alpha.
* `tight_facets` option : Options for tight facet when using facets in ggplot2.
* `title_size` option : Option to override default title size.
* `title_face` option : Option to override default title face.

### Function added to the package :

* `to_lower()` : Function to convert to lower case, while keeping first letter capitalize
* `to_factor()` : Function to convert to factor in an intelligent order.

### Changes : 

* Fixed `legend_pos` value for right and left that were reversed.
Known bugs and to-do list
* Fixed color and linetype that splitted because of the order in the legend
* Fixed the spacing for tight faceting where all lines connect now

---

Backlog : 
--------------------------------------------------------------------------------

+ Change default histogram position to "dodge2" (tested using "formals()")
+ Change default number of bins to 12L
+ Change default font in geom_text()
+ Mettre à jour les couleurs de `colors` avec des palettes.
+ Translate plots to English
+ Fix expand that does not allow to have a new scale_x or scale_y
+ Tight options for facets
+ Fix bug with `show_leg_title` that shit the legend to the top compared to "color = """ or fill = ""
+ Adjust annotate_pos with the length of the text 
