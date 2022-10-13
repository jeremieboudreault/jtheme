History
================================================================================

v0.0.2
--------------------------------------------------------------------------------

### Options added to `jtheme()` :

* `legend_alpha` option : 
* `tight_facets` option : 
* `title_size` option :
* `title_face` option : 

### Function added to the package :

* `to_lower()` function  : ....
* `to_factor()`  function  : ....

### Changes : 

* Fixed `legend_pos` value for right and left that were reversed.
Known bugs and to-do list
* Fixed color and linetype that splitted because of the order in the legend
* Fixed the spacing for tight faceting where all lines connect now

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
