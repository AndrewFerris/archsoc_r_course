### Session 2 - Data and Functions

# 2.1 FOR Loops
# Write a FOR loop to print out the site names
for(i in 1:nrow(data)){
  print(data[i,2])
}

# 2.2 IF Statements
# Write an IF statement to test whether the site_area is less than 5000 m^2 FOR each site

data$site_area_5000 <- NA
for(i in 1:nrow(data)){
  if(data$site_area[i] < 5000){
    data$site_area_5000[i] <- TRUE
  } else {
    data$site_area_5000[i] <- FALSE
  }
  print(data$site_area[i])
  print(data$site_area_5000[i])
}

# 2.3 FOR Loops
# Using the class() function from Session 1 write a for loop to test the class of each variable along with the variable name

for(i in 1:ncol(data)){
  print(names(data[i]))
  print(class(data[,i])) 
}

# 2.4 FOR Loops
# For the site_height and distance_to_nearest_river, use a FOR loop and IF statement to replace the "-" with an NA

for(i in 1:nrow(data)){
  if(data$site_height[i] == "-"){
    data$site_height[i] <- NA
  }
  if(data$distance_to_nearest_river[i] == "-"){
    data$distance_to_nearest_river[i] <- NA
  }
}

# 2.6 Downloading Packages
# Use the install.packages() function to download a package called "ggplot2"

install.packages("car")

# 2.7 Update Packages
# Use the update.packages() funnction to update the "ggplot2" package

update.packages("ggplot2")

# 2.8 Loading Packages
# Load the "ggplot2" package that you downloaded into the library

library(car)

# 2.9 Functions
# Write a function to display the summary, class and table of a column

details <- function(data_variable){
  print(summary(data_variable))
  print(class(data_variable))
  print(table(data_variable))
}

details(data$site_type)

# 2.10 Functions
# Using the IF statement and the install.packages(), update.packages() and library functions, create a function that tests whether a package is installed, if it is the update and load the package, otherwise install and load the package

package_check <- function(package_name){
  if(package_name %in% installed.packages()){
    update.packages(package_name)
    library(package_name)
  } else
    install.packages(package_name)
    library(package_name)
}
