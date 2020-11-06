### Decision Tree Example ###
###
### Author: Will Russ
###
### This script demonstrates how to run a basic decision tree analysis
###


# load the data
segments <- readxl::read_xlsx("data/consumer_segments.xlsx")
demographic_data <- readxl::read_xlsx("data/demographic_data.xlsx")

# build the tree
basic_tree <- rpart::rpart(data = left_join(segments, demographic_data), 
             formula = Segment ~ Gender + Region + Coffee + Tea + Chocolate + Raisin + `Watching sugar` + + `Watching fat`)

# visualize the tree
rpart.plot::prp(basic_tree)

# a more detailed visualization
rpart.plot::rpart.plot(basic_tree, cex = 0.6)
