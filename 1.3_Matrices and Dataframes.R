# Creation of a matrix from a vector
x <- c(1:10)
x <- matrix(x, 2, 5)
x
matrix(0, 5, 2)
matrix(NA, 5, 2)
length(x)
mode(x)
typeof(x)
class(x)
attributes(x)
y <- c(1:10)
length(y)
mode(y)
typeof(y)
class(y)
attributes(y)

# Referring to Matrix Rows and Columns
colnames(x) <- c("A", "B", "C", "D", "E")
x
x[1, "C"]
x[1,2]
x[,1]
x[1,]
x[2, "E"]

# To just pry through your data
head(dataset_name)
tail(dataset_name)

# To view the dimension of a dataset or (datamatrix)
dim(datamatrix_name)

# To view the length of vector
length(vector_name)

# To return a description of structure of the dataset, including data type, dimension, and others
str(dataset_name)

# To return subset data without structuring, i.e returns values only without rows and column ordering, serially.
datamatrix_name[1:5, 4]# or,
datamatrix_name[c(1:5), 4]# or,
datamatrix_name[c(1:5), c(4)]# or,
datamatrix_name[c(2), c(1:3)]# similarly other formats
datamatrix_name[c(1:5), c(1:4)]

# To subset the given data set and to selectively choose rows and columns
datamatrix_name[c(1:5), c(1:4)[-2]]#this returns all the values available for rows (one to five) and columns (one to four) except for column number two.

# Similarly, the code below returns selectively subsetted data in structured format
datamatrix_name[c(1:10)[-c(3:5,7)], c(2,4)]

# Data structure can be assessed for columns only in following way:
str(dataset_name[NULL,])

# Matrix Manipulation
# Matrix operations such as transposition, inversion, multiplication.
acctdata <- c(1, 132, 86.7,
2, 50, 50.7,
3, 32, 36.0,
4, 20, 27.9,
5, 19, 22.8,
6, 11, 19.3,
7, 10, 16.7,
8, 9, 14.7,
9, 5, 13.2)

head(acctdata)

# note that acctdata is a vector
acctdata <-matrix(acctdata,9,3, byrow = TRUE)
colnames(acctdata) <- c("digit","actual","expected")
acctdata

# now that the data is in shape, let's calculate the chi-squared test statistic for the data
chisquare <- sum((acctdata[,2]-acctdata[,3])^2/acctdata[,3])
chisquare

A <- matrix(c( 6, 1, 0, -3, -1, 2),3, 2, byrow = TRUE)
B <- matrix(c( 4, 2, 0, 1, -5, -1),3, 2, byrow = TRUE)

A + B
A - B
A * B # This is component-by-component multiplication, not matrix multiplication
t(A)

A <- matrix(c(4, 0, 5, 0, 1,-6, 3, 0, 4),3,3,byrow = TRUE)
B <- solve(A) # This finds the inverse of A.
A %*% B # Matrix multiplication
B %*% A

# One row/column matrix
A
A[,1]
A[1,]
A[1,,drop = FALSE]
A[,1,drop = FALSE]

# Lists
address <- list("Larry Pace","102 San Mateo Dr.","Anderson","SC",29625)
address

# Data frames
people <-c("Kim","Bob","Ted","Sue","Liz","Amanada","Tricia","Johnathan","Luis","Isabel")
scores <-c(17,19,24,25,16,15,23,24,29,17)
people
scores
quiz_scores <- data.frame(people, scores)
quiz_scores
rm(people,scores)
quiz_scores
quiz_scores[2]
quiz_scores$scores
attach(quiz_scores)
scores
detach(quiz_scores)

# Creating a Data frame using the R Data Editor
Min_Wage <- data.frame(Year = numeric(), Value = numeric())
Min_Wage <- edit(Min_Wage)

# To create a percapita dataframe lets use percapita.* files in data subdirectory
percapita <- read.delim("./data/percapita.txt", header = T, sep = " ")
percapita <- read.csv("./data/percapita.csv", header = T) # if the fields are comma separated.
colMeans(percapita[2:9])
summary(percapita[2:9])

#Dealing with Missing Data in R
x <- c(1,2,3,4,5,6,NA,8,9,10)
mean(x)
mean(x, na.rm = TRUE)
