### Plot descriptive data and output to PowerPoint
###
### Author: Will Russ
###
### This script demonstrates how to plot descriptive data and then export the plots to PowerPoint
###

# load libraries
library(tidyverse)

# load local functions
source("functions/make_descriptive_plot.R")
source("functions/add_graphical_slide.R")

# load data
protein_bar_descriptive_data <- readxl::read_xlsx("data/protein_bar_descriptive_data.xlsx")

# create the plots
protein_bar_descriptive_plots <- protein_bar_descriptive_data %>% 
  gather(key = "attribute", value = "value", -Product) %>% 
  group_by(Product) %>% 
  nest() %>% 
  mutate(plot = map(data, make_descriptive_plot, flip_axes = TRUE, polar = FALSE)) %>% 
  select(Product, plot) %>% 
  deframe()

# create the PowerPoint presentation
presentation <- officer::read_pptx()
iwalk(protein_bar_descriptive_plots, function(plot, name) {
  presentation <- presentation %>% 
    add_graphical_slide(plot, name)
})

# output/save the presentation
print(presentation, target = "output/visualization.pptx")
