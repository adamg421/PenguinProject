
#change colors
species_colours = c("Adelie" = "darkorange" ,
                    "Chinstrap" = "purple" ,
                    "Gentoo" = "cyan4")

plot_boxplot = function(data, x_column, y_column, x_label, y_label, colour_mapping){
  data = data %>% drop_na({{ y_column }}) #need curly brackets didn't explain why
  
  #now plot
  flipper_boxplot = ggplot(
    data = data,
    aes(x = {{ x_column}}, y = {{y_column}}, color = {{x_column}})) + 
    geom_boxplot(show.legend = FALSE,
                 width = 0.3) +
    geom_jitter(show.legend = FALSE,
                alpha = 0.3,
                position = position_jitter(width = .2, seed = 0)) +
    scale_color_manual(values = colour_mapping) +
    labs(x = x_label,
         y = y_label)
  theme_bw()
  flipper_boxplot
  
}

# Change colors
species_colours = c("Adelie" = "darkorange",
                    "Chinstrap" = "purple",
                    "Gentoo" = "cyan4")

plot_boxplot = function(data, x_column, y_column, x_label, y_label, colour_mapping) {
  data = data %>% drop_na({{ y_column }})  # Keeps only rows with non-NA y_column values
  
  # Now plot
  flipper_boxplot = ggplot(
    data = data,
    aes(x = {{ x_column }}, y = {{ y_column }}, color = {{ x_column }})) +
    geom_boxplot(show.legend = FALSE, width = 0.3) +
    geom_jitter(show.legend = FALSE, alpha = 0.3,
                position = position_jitter(width = .2, seed = 0)) +
    scale_color_manual(values = colour_mapping) +
    labs(x = x_label, y = y_label) +
    theme_bw()  # Add theme here with +
  
  return(flipper_boxplot)  # Return the plot object
}

# Example function call (remove quotes around variable names)
#plot_boxplot(penguins_clean, species, flipper_length_mm, "Penguin Species", "Flipper Length (mm)", species_colours)
