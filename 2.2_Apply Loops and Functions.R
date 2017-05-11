
# elementary example of apply function
# define matrix mymat by replicating the sequence 1:5 for 4 times and transforming into a matrix
mymat<-matrix(rep(seq(5), 4), ncol = 5)

# mymat sum on rows
apply(mymat, 1, sum)

# mymat sum on columns
apply(mymat, 2, sum)

# with user defined function within the apply
# that adds any number y to the sum of the row
# here chosen as 4.5
apply(mymat, 1, function(x, y) sum(x) + y, y=4.5) 

# or produce a summary column wise (for each column)
apply(mymat, 2, function(x, y) summary(mymat))

#Uncoment the following data and copy the following dataset 
#..and import using read it.
# State Yr_2000 Yr_2001 Yr_2002 Yr_2003 Yr_2005 Yr_2006 Yr_2009 Yr_2010
# Alabama 23,521 24,477 25,128 26,338 29,136 30,894 33,096 33,945
# Alaska 29,642 31,027 32,151 33,568 35,612 38,138 42,603 44,174
# Arizona 24,988 25,878 26,183 26,838 30,267 31,936 32,935 34,999
# Arkansas 21,995 22,750 23,512 24,289 26,874 28,473 31,946 33,150
# California 32,149 32,655 32,996 33,749 37,036 39,626 42,325 43,104
# Colorado 32,434 33,455 33,276 34,283 37,946 39,491 41,344 42,802

percapita <- read.delim2("clipboard", header = T, sep = "")

percapita1 <- sapply(percapita, function(v)
  {as.numeric(gsub("\\.","", as.character(v)))})

#This data frame is in good shape, so let's keep only one that is refined.
percapita2 <- data.frame(percapita[1], percapita1[,2:9])
percapita <- percapita2
rm(percapita2, percapita1)

#Applying median to the dataframe
#..this produces a list class output
lapply(percapita[2:9], median)

#This is a more clear-looking output
apply(percapita[2:9], 2, median)

#Use of lapply and sapply
class1 <- c(17,18,12,13,15,14,20,11,16,17)
class2 <- c(18,15,16,19,20,20,19,17,14)
class3 <- c(17,16,15,18,11,10)
classes <- list(class1, class2, class3)

lapply(classes, length)
sapply(classes, length)
sapply(classes, mean)
sapply(classes, summary)

#This binds number '3' as to column x1 and numbers of x2 to column x2, 
#..the length of x1 is determinded by length of x2.
x <- cbind(x1 = 3, x2 = c(4:1, 2:5))

#This assigns name letters a to h to 8 rows
dimnames (x)[[1]] <- letters[1:8]

#This gives the mean for two columns x1 and x2, because "2" refers to the column.
#..see the margin argument of apply function.
apply(x, 2, mean, trim = .2)

#To store sum of two columns
col.sums <- apply(x, 2, sum)

#To store sum of eight rows
row.sums <- apply(x, 1, sum)

#This is fairly complex
rbind(cbind(x, Rtot = row.sums), Ctot = c(col.sums, sum(col.sums)))

#...?Need to study the function more.
stopifnot( apply(x, 2, is.vector))

#This sorts the column of a matrix
apply(x, 2, sort)

#This produces x3 object of class array that is numeric with 3 dimensions (row, col, C)
#.. = assessed as [1:8, 1:2, 1:3] with dimnames attribute (List of 3).
names(dimnames(x)) <- c("row", "col")
x3 <- array(x, dim = c(dim(x),3),
            dimnames = c(dimnames(x), list(C = paste0("cop.",1:3))))

#Logical
identical(x,  apply( x,  2,  identity))
identical(x3, apply(x3, 2:3, identity))

#Function with extra arguments
cave <- function(x, c1, c2) c(mean(x[c1]), mean(x[c2]))
apply(x, 1, cave,  c1 = "x1", c2 = c("x1","x2"))

ma <- matrix(c(1:4, 1, 6:8), nrow = 2)
ma
apply(ma, 1, table)  #--> a list of length 2
apply(ma, 1, stats::quantile) # 5 x n matrix with rownames

stopifnot(dim(ma) == dim(apply(ma, 1:2, sum)))

#Example with different lengths for each call
z <- array(1:24, dim = 2:4)
zseq <- apply(z, 1:2, function(x) seq_len(max(x)))
zseq         ## a 2 x 3 matrix
typeof(zseq) ## list
dim(zseq) ## 2 3
zseq[1,]
# To produce a list without dim attribute
apply(z, 3, function(x) seq_len(max(x)))


#Program for calculation of pythagorean triples
#..first simple function
s <- 2
t <- 1
a <- s^2 - t^2
b <- 2*s*t
c <- s^2 + t^2
a
b
c

#Creating a function to do the operation
pythag <- function(x){
  s <- x[1]
  t <- x[2]
  a <-t^2 - s^2
  b <- 2 * s * t
  c <- s^2 + t^2
  cat("The Pythagorean triple is: ",a,b,c,"\n")
}
#Asks for the input, enter any two numbers
input <- scan()

#Run code blocks separately
pythag(input)


#Using R to solve quadratic equation
#Find the real root(s) of a quadratic equation
quadratic <- function(coeff)
  {
  a <- coeff[1]
  b <- coeff[2]
  c <- coeff[3]
  d <- b^2 - (4*a*c)
  cat("The discriminant is: ",d,"\n")
  if (d < 0) cat("There is no real roots. ","\n")
  if (d > 0){
          root1 <- (-b+sqrt(d))/(2*a)
          root2 <- (-b-sqrt(d))/(2*a)
          cat("root1: ",root1,"\n")
          cat("root2: ",root2,"\n")
  }
}

abc <- scan()
#Run code block seperately after asking for three coefficients.
quadratic(abc)

