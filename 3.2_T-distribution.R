# Consider an example of t distributions with 4, 9, and 19 degrees of freedom with the standard normal
# distribution as a point of reference. The R code to produce the graphic is shown below. The normal curve is black, the t distribution with 19 df is purple, the t distribution with 9
# df is blue, and the t distribution with 4 df is red. We use the points() function to place multiple lines on
# the same graph.
# The graph makes it obvious that the t distribution quickly becomes more ?normal? as the sample size increases.
xaxis <- seq(-3.5, 3.5, .1)
y1 <- dnorm(xaxis)
y2 <- dt(xaxis, 4)
y3 <- dt(xaxis, 9)
y4 <- dt(xaxis, 19)
plot(xaxis, y1, type = "l", main = "Comparing z and t Distributions")
points(xaxis, y2, type = "l", col = "red")
points(xaxis, y3, type = "l", col = "blue")
points(xaxis, y4, type = "l", col = "purple")

# As an example, let us generate a simple random sample of 50 observations from a normal distribution with a mean of 500 and a standard deviation of 100.
rnorm1 <- rnorm(50, 500, 100)
rnorm
summary(rnorm1)

# To perform one sample t-test with inference that population mean is 500, which, although we contrived in this case, rarely could be known.
t.test(rnorm1, mu = 500)

# To perform one sample t-test with the data we use prepost dataset in data subdirectory.
prepost <- read.csv("./data/prepost.csv", header = T)

t.test(prepost$Pretest) 

# To break the data for grouping into classing and analyzing them,
with(prepost, t.test(Posttest[Posttest > 50]))

# alternative hypothesis testing arguments are: "two.sided", "greater" and "less"
# to perform a two sample paired t-test

t.test(prepost$Pretest, prepost$Posttest, paired=TRUE)
