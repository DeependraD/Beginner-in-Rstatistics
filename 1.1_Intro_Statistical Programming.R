
# A first R session
# Technically, everything a user types is an expression
2 ^ 2

2 * 2

2 / 2

2 + 2

2 - 2

# x as the label for a single value, a vector, a matrix, a list, or a data frame.
x <- 2
x
x^x
x^2
mode(x)
x <- c(1:10)
x
dim(x) <- c(2,5)
x
x^x
mode(x)
x <- c("Hello", "World", "!")
x
mode(x)
x <- c(TRUE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE)
x
mode(x)
x <- list("R","12345",FALSE)
x
mode(x)

# Moving around in R
# Viewing workspace objects in R
ls()
ls.str()

# Data types in R
# Vectors should be homogeneous. i.e. all the data types in a vector should be the same.
x <- c(1, 2, 3, 4, "Pi")
x
mode(x) # see that the element "Pi" forces the vector to be character type.

x <- c(1:10)
x
length(x)
y <- 10
length(y)
x+y

# Performing vector arithmetic
y <- c(0, 1)
y
x+y
y <- c(1,3,5)
x+y
# results in warning because in R, when one vector is shorter than the other, 
# the shorter vector is recycled when you apply mathematical operations to the two vectors.

2 + 3 * x # Note the order of operations
(2 + 3) * x

sqrt(x) # Square roots
x %% 4 # This is the integer divide (modulo) operation
y <- 3 + 2i # R does complex numbers
Re(y) # The real part of the complex number
Im(y) # The imaginary part of the complex number
x * y

# Sequence and repetitions
x <- 1:10
y <- seq(10) #Create a sequence
z <- rep(1,10) #Create a repetitive pattern
x
y
z

#Adding elements to a vector
x <- c(1:10)
x
x <- c(x, 11:15)
x

# Setting options can be quite useful when you are working with data.
# currently set values for options can be assessed by:
getOption("option_name")

# option_name can include any of the features that is shown by function:
options()

# options can be set, for example, as:
options(digit = 4)

# readline function is fun to play with.
size <- readline("How many digits do you want to display? ")
# now enter number of digits...
options(digit = size) # option has been set

# now, to verify, notice how many digits does the "pi" shows?