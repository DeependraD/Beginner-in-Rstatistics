grep("a+", c("abc", "def", "cba a", "aa"), perl = T, value = FALSE)
grep("a+", c("abc", "def", "cba a", "aa"), perl = T, value = TRUE)
regexpr("a+", c("abc", "def", "cba a", "aa"), perl = T)
gregexpr("a+", c("abc", "def", "cba a", "aa"), perl = T)


car.txt <- "Carl spilt his carton of orange juice on the carpet of his new car. If he had taken more care when opening the carton he wouldn’t have had this annoying and disappointing accident. Some car shampoo would, Carl hoped, make the carpet look as good as new."

grep("car", car.txt, perl = T) # returns which element in the vector matches the pattern. 
# since only one element makes the vector here, so the result is unity.

regexpr("car", car.txt, perl = T) # has length match attribute in excess.
regexpr("car", car.txt, perl = T, ignore.case = TRUE) # different result?
gregexpr("car", car.txt, perl = T, ignore.case = T) # returns exactly the positions where the pattern match starts in an elementwise manner
gregexpr("car", car.txt, perl = T)

# To remove all numbers from characters use
gsub(pattern = "([0-9])", replacement = "\\", x = ?xobject?)

sub("(a+)", "z\\1z", c("abc", "def", "cba a", "aa"), perl = T)

class(car.txt)
gregexpr("0-9", thapa_var_slinear1$x_axis, perl = T)

grep("[a-z]", letters)

gsub("([ab])", "\\1_\\1_", "abc and ABC")

gsub(pattern = "([ab])", replacement = "\\1_\\1_", "abc and d are filmy but ABC are more classic versions of AaBbCc")

gsub(pattern = "([0-9])", replacement = "\\", x = thapa_var_slinear1$x_axis)

x<-c("01.mp3","invite.mp3")
x[grep(x,pattern="[0-9]{2}.mp3")] # matches at least two elements of the digits list.

x[grep(x,pattern="[[:digit:]]")]
x[grep(x,pattern="[0-9]")]

vec <- c("012 foo", "305 bar", "other", "notIt 7", "turk")
grep(pattern="^[:digit:]", x=vec)
grep(pattern="\\d", x=vec)

#The sentence might be helpful in distinguishing various syntaxes of regex.
gsub("([fat])", "\\1_\\1_", "The fat Fart fad the food with Fat")
gsub("(fat)", "\\1_\\1_", "The fat Fart fad the food with Fat")
