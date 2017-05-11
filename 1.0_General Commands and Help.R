
# For finding from packages in Library:
help.search("any_keyword")

# To start html help window
help.start()

# To access help file for a command
help("nameofcommand")
# or
?nameofcommand

# To open a window with information about a package
library(help="datasets")

# For finding the functions searching all over the CRAN:
library(sos) # sos package provides the following function:

findFn("any_keyword")

#For using R-site search:
RSiteSearch("any_keyword") # this is a wider search, looks in the help files too, unlike findFn

#For general search engine search:
#rseek.org

# Online help resource community
# For programming questions:
# stackoverflow.com

# For statistical questions:
# crossvalidated.com

# R-help mailing lists:
# stat.ethz.ch/mailman/listinfor-help

# Blogs about R( and other things)
# robjhyndman.com/researchtips

# CRAN task views
# https://cran.r-project.org/web/views/
# They are the curated reviews of packages by subject, by expert persons.
# To install all the packages with curated reviews, use:

install.views() # and
update.views() # in the ctv package, optionally in the same install function, only core packages may be selected to install.

# Digging into function
# For example, in knowing, how a function works?
forecast # Typing the name of function gives it's definition
# In order to view the hidden function in a given function:
package_name:::hiddenfunction_name
# Be aware of classes and methods
# for example, in forecast.ets, ets is the class name.

# Reproducibility

# Tables generated via xtable or texreg packages.
# Graphics in pdf format
# R with Makefile. A makefile provides information about how to make compile a project.
# Use rmarkdown and knitr packages for reproducibe report generation.
# Use bookdown for writing a book.
# Use blogdown package for blogging.
# Use LaTeX distribution for formatting

# Installing a LaTeX distribution on windows:
# MiKTeX: http://miktex.org/2.9/setup
# Install Tex Live in Linux

# Identification of type of a data/function
str(typeof)
typeof("dnsgfdg")
typeof(13534534)
demotype<-1:23
typeof(demotype)
mode(demotype)
storage.mode(demotype); rm(demotype)

# Debugging
traceback() # and
debug() # for codes with long structures
undebug() # to end the debugging mode
options(error=recover)
browser()
trace()

# To import a dataset and assign it to a variable
examplevar<-read.table(file.choose(), header=T, sep="\t") # If the fields are tab separated
