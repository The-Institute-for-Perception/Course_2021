# Comments are notes that help describe scripts or parts of scripts
#   In R, they are indicated by the "#" symbol
#   The interpreter will ignore them


# A variable holds values
# We assign a value to a variable
var_name <- "value"

# To see the contents of a variable, just use its name
var_name

# The values may be numbers, vectors, matrices, strings (text), or 
#  even collections of other variables
number_Var <- 23
vector_var <- c(1, 2, 3)
text_var <- "Hello World!"


# R was designed for Statistics and has many useful functions built-in

# Functions transform variables, often yielding output
# Functions may require arguments (input)
rnorm(n = 1) # <- This function produces a random sample from a standard normal distribution
             #     n is the number of samples we want

# Variables and functions allow us to work with many values efficiently

many_random_samples <- rnorm(1000)

x <- seq(1, 10) # <- store the sequence of integers from 1 to 10
x
x_squared <- x ** 2 # <- calculate the squares of every value in x

# Some functions produce graphical output
hist(many_random_samples)

# There are functions to run statistical tests
binom.test(33, 50, alternative = "two.sided")


# And other functions to generate models
# Here we simulate a linear effect and try to recapture it
x <- seq(from = 0, to = 10, by = 0.1) # <- create a sequence of x values
y <- x + rnorm(n = length(x))         # <- add random normal noise to each value of x and store in y

plot(x, y) # <- visualize the data

lm(y ~ x) # <- run a linear regression with y depending on x
summary(lm(y ~ x))
