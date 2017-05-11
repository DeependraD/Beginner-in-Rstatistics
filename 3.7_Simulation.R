nreps <- 100
ll <- numeric(nreps)
ul <- numeric(nreps)
n <- 100
mu <- 500
sigma <- 100
for(i in 1:nreps) {
  print(i)
  set.seed(i)
  x <- rnorm(n, mu, sigma)
  ll[i] <- mean(x)- qnorm(0.975)*sqrt(sigma^2/n)
  ul[i] <- mean(x) + qnorm(0.975)*sqrt(sigma^2/n)
}

#Conditional to check if the lower and upper limits are above or below 500, respectively.
which(ul <= 500)

#Alternatively use
table(ll >= 500)
table(ul <= 500)

#This gives the proportion that contains the interval range without including 500.
mean((ll <= 500) & (500 <= ul))

#If simulation is repeated 10000 times...
nreps <- 10000
ll <- numeric(nreps)
ul <- numeric(nreps)
n <- 100
mu <- 500
sigma <- 100
for(i in 1:nreps) {
  set.seed(i)
  x <- rnorm(n, mu, sigma)
  ll[i] <- mean(x)- qnorm(0.975)*sqrt(sigma^2/n)
  ul[i] <- mean(x) + qnorm(0.975)*sqrt(sigma^2/n)
}

#Look for the distribution of lower limits
hist(ll)

#t test simulation
mu <- 500
sigma <- 100
n <- 100
nreps <- 1000
pv <- rep(NA, nreps)
inout <- rep(NA, nreps)
for(i in 1:nreps){
  print(i)
  set.seed(i)
  x <- rnorm(n, mu, sigma)
  pv[i] <- t.test(x, mu = 500)$p.value
  lower <- t.test(x, mu = 500)$conf.int[1]
  upper <- t.test(x, mu = 500)$conf.int[2]
  inout[i] <- ifelse(500 > = lower & 500 < = upper,1,0)
}