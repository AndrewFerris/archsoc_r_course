### Session 1 - Introduction to R

# 1.1 Reading In Data
# Using the dataset on the course webpage, read in the data into the working environment

data <- read.delim(file = "/Users/andrewferris/Downloads/siteinfo.txt",
                   header = FALSE,
                   sep = ",",
                   stringsAsFactors = FALSE)

# 1.2 Viewing The Data
# Use the View() data to visually look at the data

View(data)

# 1.3 Changing The Column Names
# Using the background information on the dataset, change the column names so they make sense
# Afterwards, view the data again to check the column names have been changed

names(data) <- c("site_number",
                 "site_name",
                 "period",
                 "site_type",
                 "utm_easting",
                 "utm_northing",
                 "elevation",
                 "site_area",
                 "site_height",
                 "distance_to_nearest_river")

View(data)

# 1.4 Accessing Subsets
# Return only the first 10 rows of the data set
# Return only the period column in the data set
# Return only the first 5 rows and columns 5 through 8 of the data set

data[1:10,]

data[,3]

data[1:5, 5:8]

# 1.5 Summarising The Data
# Use the summary function to return a quick summary
# Use the summary function to return a quick summary of only the third column

summary(data)

summary(data[,3])

# 1.6 Data Types
# Check the data class of the third column
# Convert the third column to factor using the factor() function
# Use the summary function to return a quick summary of only the third column, what changed?

class(data[,3])

data[,3] <- factor(data[,3])

summary(data[,3])

# 1.7 Creating Vectors
# Create a vector called "vector" with the information from the first record

vector <- data[1,]

# 1.8 Adding records
# Add vector to the data set using the rbind() function
# Add a new column called "source" to the data set, where each record is "Wankarani Settlement Dataset"
# Add a new column called "author" to the data set, where each record is "Timothy L. McAndrews"

data[136,] <- vector
data$source <- "Wankarani Settlement Dataset"
data$author <- "Timothy L. McAndrews"

# 1.9 Writing Data
# Use the write.table() function to make the datafile a text file
# Use the write.csv() function to make the datafile a csv (Excel) file

write.table(x = data,
            file = "/Users/andrewferris/Downloads/siteinfonew.txt",
            row.names = FALSE,
            col.names = TRUE,
            sep = ",")

write.csv(x = data,
          file = "/Users/andrewferris/Downloads/siteinfonew.csv",
          row.names = FALSE,
          col.names = TRUE,
          sep = ",")