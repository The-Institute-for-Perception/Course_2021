make_descriptive_plot <- function(descriptive_data, polar = TRUE, flip_axes = FALSE) {
  
  theme(theme_classic())
  
  the_plot <- ggplot(descriptive_data, aes(x = attribute, y = value), color = "black") +
    geom_point(stat = "identity", size = 2.5) +
    geom_segment(aes(xend = attribute, yend = 0), size = 1, stat = "identity") +
    labs(x = "Attribute",
         y = "Score")
  
  if(polar) {
    the_plot <- the_plot +
      coord_polar() +
      theme(#axis.line = element_blank(),
            #axis.text.x = element_blank(),
            axis.text.y = element_blank(),
            #axis.ticks = element_blank(),
            axis.ticks.y = element_blank(),
            axis.title.x = element_blank(),
            axis.title.y = element_blank(),
            legend.position = "none",
            panel.background = element_blank(),
            panel.border = element_blank(),
            panel.grid.major = element_line(color="gray"),
            panel.grid.minor = element_line(color="gray"),
            plot.background = element_blank())
  } else {
    the_plot <- the_plot +
      theme(legend.position = "none",
        panel.background = element_blank(),
        panel.border = element_blank(),
        panel.grid.major = element_line(color="gray"),
        panel.grid.minor = element_line(color="gray"),
        plot.background = element_blank())
  }
  
  if(flip_axes) {
    the_plot <- the_plot +
      coord_flip()
  }

  return(the_plot)
}
