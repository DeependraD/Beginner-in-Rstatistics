# Creation of a vector with labels with the use of "for" loop.
multiples <- c()
i <- c(1:10)
for (n in i) {
    print (n * 10)
    multiples[n] <- n * 10
    names(multiples)[n] <- sprintf("number%d", n)
}
multiples

# nested for: multiplication table
mymat = matrix(nrow=30, ncol=30) # create a 30 x 30 matrix (of 30 rows and 30 columns)

for(i in 1:dim(mymat)[1])  # for each row
{
  for(j in 1:dim(mymat)[2]) # for each column
  {
    mymat[i,j] = i*j     # assign values based on position: product of two indexes
  }
}
mymat[1:10,1:10]

# Alternatively a function may be used to ask for user input in providing number of rows or columns or both.
readinteger <- function()
{
  n <- readline(prompt="Please, enter an integer: ")
  # return(as.integer(n))
}
nr<-as.integer(readinteger())

# Create a matrix
mymat = matrix(0,nr,nr) # create a n x n matrix with zeroes (n rows and n columns)

for(i in 1:dim(mymat)[1])  # for each row
{
  for(j in 1:dim(mymat)[2]) # for each column
  {
    mymat[i,j] = i*j     # assign values based on position: product of two indexes
  }
}

if (nr>10)
  {
  mymat[1:10,1:10]  # for space reasons, we just show the first 10x10 chunk
} else mymat[1:nr,1:nr]  # ...or the first nr x nr chunk

readinteger <- function()
{
  n <- readline(prompt="Please, enter your ANSWER: ")
}
response<-as.integer(readinteger())

#Using of vectorless and vectorized if else/ifelse function with random data.

## The standard if else
p.test <- function(p){
if (p <= 0.05) print ("yeah!!! you've found significant")
else if (p >= 0.9) print ("high!!!")
else print ("somewhere in the middle")
}

## Also the ifelse(test, yes, no) function. ifelse() is far more useful as it is vectorized.
p.test.2 <- function(p){
ifelse(p <= 0.05, print("yippee"), print("bummer, man"))
}

## Test the above functions with the following sequence.
x <- runif(10, 0, 1)# Generates 10 random numbers between 0 and 1(pretend that these are the probability values)
p.test(0)
p.test(1)
p.test(0.5)
p.test.2(0)
p.test.2(1)
p.test.2(0.5)
p.test(x)# see what it gets?
p.test.2(x)# and what about this?

## There are many times that you may think you need to use an if with (iterating with a for loop...see below),
## ...or ifelse, but there may be far better ways.
## For instance, say you are doing some simulations for a power analysis, and you want to know how often your simulation gives a p-value less than 0.05.
p.1000 <- runif(n = 1000, min = 0 , max = 1)


# Excellent example of use of if, else, break and for statements.
# make a lower triangular matrix (zeroes in upper right corner)
m=10; n=10;
ctr=0;   # used to count the assignment
mymat = matrix(0,m,n) # create a 10 x 10 matrix with zeroes
for(i in 1:m) {
  for(j in 1:n)
  {
    if(i==j)
    {
      break;
    } else
      {
      mymat[i,j] = i*j   # we assign the values only when i<>j
      ctr=ctr+1
      }
  }
  print(i*j)
}
print(ctr)  # print how many matrix cells were assigned

#Use of "next" statement
m=20;
for (k in 1:m)
{
  if (!k %% 2) #except the ones with non zero remainder when divided by 2
    next
    print(k)
}

#Comparison of non-vectorized loop vs. vectorized loops
#Firstly, non-vectorized
set.seed(42);
m=10; n=10;
mymat<-replicate(m, rnorm(n)) # create matrix of normal random numbers
mydframe=data.frame(mymat)    # transform into data frame
for (i in 1:m) {
  for (j in 1:n) {
    mydframe[i,j]<-mydframe[i,j] + 10*sin(0.75*pi)
    print(mydframe)
  }
}

#Secondly, vectorized
set.seed(42);
m=10; n=10;
mymat<-replicate(m, rnorm(n))
mydframe=data.frame(mymat)
mydframe<-mydframe + 10*sin(0.75*pi)

# measure loop execution
system.time(
  for (i in 1:m) {
    for (j in 1:n) {
      mydframe[i,j]<-mydframe[i,j] + 10*sin(0.75*pi)
    }
  }
)

# measure vectorized execution
system.time(
  mydframe<-mydframe + 10*sin(0.75*pi)
)