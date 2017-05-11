# to create a character vector of multiple files, for example, downloaded packages.
vector_name <- choose.files()

# to obtain a list of current library paths
.libPaths()

# to add a directory to the list of library:
.libPaths(new = "directory_path")# take note that path should end in directory name, not "\" or "/" whatsoever

#  to install packages from a local directory
install.packages(pkgs = vector_name_with_path_0f_zip, repos=NULL, type = "win.binary")# vector name creation is as mentioned above, other arguments useful are: lib(for specifying which library to install to
# ...the default being 1st one listed in .libPaths()), destdir(to store the downloaded packages to a destination)

# to cite the R software in written work
citation()

# When precise name of the function is not known, search can be initiated in a topic by
help.search("topic_name")

# "Find" function tells what package something is in
find(lowess)

# The following R commands will install all CRAN packages:
availablePackages <- available.packages()[,1]
# install.packages(availablePackages)

# And the following command will list all installed packages:
installedPackages <- .packages(all.available = TRUE)

# to see worked out examples of a function, use following command
example(function_name)

# to view demonstrations of some R functions
demo(persp)
demo(graphics)
demo(Hershey)
demo(plotmath)

# to see all the packages installed in the library, including external location.
library()

# to see the packages listed which are currently loaded
search()

# to load elements of library, including functions and their packages, use
library(function_name1, function_name2)

# the libraries that come pre-supplied as base packages of R are lattice, MASS, mgcv, nlme, nnet, spatial, survival

# to discover contents of library, use
library(help = package_name)

# to install packages and libraries
install.packages("package_name")

# to assess a data editor, which called by "fix" function in R.
fix(data_frame_name)

# to turn significance stars off
options(show.signif.stars=FALSE)

# In case of disappearing graphics
# to stop multiple graphs whizzing by, use
par(ask = TRUE)
# to specify the number of seconds delay that you want between action, use "sys.sleep" function

# to see what variables you have created in the current session, use
objects()

# to see which libraries and dataframes are attached, use
search()

# to get rid of everything. Or to clear the objects from the memory
rm(list=ls())

# to view or list package vignettes. vignettes refer to the help files or examples, usually pdf documents.
vignette(topic, package = NULL, lib.loc = NULL, all = TRUE)

# to list vignettes from all *installed* packages (can take a long time!).
vignette(all = TRUE)

# to view a list of all the packages installed in library location
.packages(all.available = TRUE)

# to view a list of currently attached packages
(.packages())

# to find the path to one or more packages
find.package()

# to view the list of objects saved in workspace memory.
ls()

# to view list of the datasets available in R
data()

# or alternatively, a separate package called datasets is available in r
library(help="datasets")

# to see the structure of a dataset.
str(dataset_name)

# to remove a object from the workspace memory.
rm(object_name)

# to list documentation for package
library(help=package_name)

# to list all elements, including functions, of a package after attaching it to library, for example lme4
ls("package:lme4")

# to list all the functions and their syntaxes of a package, for example lme4
lsf.str("package:lme4")