add_graphical_slide <- function(presentation, plot, title) {
  
  presentation <- officer::add_slide(presentation, layout = "Title and Content", master = "Office Theme") %>% 
    officer::ph_with(rvg::dml(ggobj = plot), location = officer::ph_location_type(type = "body")) %>% 
    officer::ph_with(title, location = officer::ph_location_type(type="title"))
  
}
