#Paste letters each element separately
paste(LETTERS)
paste("A", 1, "%") #A bunch of individual character strings.
paste(1:4, letters[1:4]) #2 or more vectors pasted element for element.
paste(1:10) #One vector of sequence.
paste(1:10, collapse = "") #Generates vector smushed together.

#paste0("a", "b") == paste("a", "b", sep = "")
person <- "Grover"
action <- "flying"
message(paste0("On ", Sys.Date(), " I realized ", person, " was...\n", action, " by the street"))
#Using the sprintf function
message(sprintf("On %s I realized %s was...\n%s by the street", Sys.Date(), person, action))

#A simple way to label a vector.
#Create vector
weights <- c(169.1,144.2,179.3,175.8,152.6,166.8,135.0,201.5,175.2,139.0,156.3,186.6,
191.1,151.3,209.4,237.1,176.7,220.6,166.1,137.4,164.2,162.4,151.8,144.1,
204.6,193.8,172.9,161.9,174.8,169.8,213.3,198.0,173.3,214.5,137.1,119.5,
189.1,164.7,170.1,151.0)
#Create labels
labelw <- paste(c("a", "b"), rep(1:4, 4, each = 3), sep = "")
labelw
#Sample labels with randomization and to gain required vector length
labelw <- sample(labelw, replace = FALSE, size = 40)
labelw
#labels(weights) <- labelw # Doesn't work because vector doesn't have labels, they have names
#A vector is not a factor, can be verified by is.factor() function 
#To write names to the vector elements
names(weights)<- labelw
weights