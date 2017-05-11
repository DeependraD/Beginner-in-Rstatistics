# Assuming data of P(probability values) and V(observation values) for a discrete probability distribution
# Calculation of its measures can be done as follows...
P <- c(0.301, 0.176, 0.125, 0.097, 0.079, 0.067, 0.058, 0.051, 0.046)
P
V <- seq(1:9)
V
sum(V*P) # This gives the mean of a discrete probability distribution
sum(P*(V-mean(V))^2) # This gives the variance of a discrete probability distribution
sqrt(sum(P*(V-mean(V))^2)) # This gives the sd of discrete probability distribution


# Let's make use of dataset about sales of car on a saturday by a car-salesman.
saturday_sales <- read.csv("./data/carsold.csv", header = T)
attach(saturday_sales)
mu <- sum(numsold * prob)
mu
variance <- sum((numsold-mu)^2 * prob)
variance

cbind(dbinom(numsold, size = 5, prob = .5))# individual probabilities for successes

dbinom(8, size = 10, prob = 0.76)# probability of exactly 8 successes out of 10 times

sum(dbinom(c(1:6), size = 10, prob = 0.76))# probability of successes 6 times or less(why???==>because individual probability of success is high i.e., 0.76)

pbinom(6, 10, 0.76)# probability of successes exactly six out of 10 times

randombinom <- rbinom(100, 10, 0.76)# generate 100 sample of successes in times out of 10 trials with given probability of success

#Having confidence limits below, we can say with 95% confidence that out of 10 trials between "lower confidence limit" successes and "uper confidence limit" successes will occur.
quantile(randombinom, 0.025)# lower limit
quantile(randombinom, 0.975)# upper limit
