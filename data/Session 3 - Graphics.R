### Session 3 - Graphics

# 3.0 Install Ggplot2
# Install and load ggplot2

install.packages("ggplot2")
library(ggplot2)

# 3.1 Histograms
# Make a histogram of the site_type

ggplot(data = data, aes(x = site_type)) +
  geom_bar()

# 3.2 Histograms
# Change the title of the histogram

ggplot(data = data, aes(x = site_type)) +
  geom_bar() +
  ggtitle("Histogram of Site Type")

# 3.3 Histograms
# Make the x-axis and y-axis titles nicer

ggplot(data = data, aes(x = site_type)) +
  geom_bar() +
  ggtitle("Histogram of Site Type") +
  xlab("Site Type") +
  ylab("Number of Observations")

# 3.4 Histograms
# Remove the grey background

ggplot(data = data, aes(x = site_type)) +
  geom_bar() +
  ggtitle("Histogram of Site Type") +
  xlab("Site Type") +
  ylab("Number of Observations") +
  theme_minimal()

# 3.5 Histograms
# Change the color of the bars

ggplot(data = data, aes(x = site_type)) +
  geom_bar(col = "black", fill = "white") +
  ggtitle("Histogram of Site Type") +
  xlab("Site Type") +
  ylab("Number of Observations") +
  theme_minimal()

# 3.6 Boxplot
# Add elevation as another variable to make a boxplot

ggplot(data = data, aes(x = site_type, y = elevation)) +
  geom_boxplot(col = "black", fill = "white") +
  ggtitle("Boxplot of Site Type") +
  xlab("Site Type") +
  ylab("Elevation (m)") +
  theme_minimal()

# 3.7 Boxplot
# Make the elevation log-elevation to highlight the differences between the sites

ggplot(data = data, aes(x = site_type, y = log(elevation))) +
  geom_boxplot(col = "black", fill = "white") +
  ggtitle("Boxplot of Site Type") +
  xlab("Site Type") +
  ylab("log Elevation (m)") +
  theme_minimal()

# 3.8 Scatterplot
# Change site_type to distance_to_nearest river to make the graph a scatterplot

ggplot(data = data, aes(x = distance_to_nearest_river, y = elevation)) +
  geom_point(col = "black", fill = "white") +
  ggtitle("Scatterplot of Site Information") +
  xlab("Distance to Nearest River (km)") +
  ylab("Elevation (m)") +
  theme_minimal()

# 3.9 Scatterplot
# Convert the distance_to_nearest_river to numeric to remove the NA values

ggplot(data = data, aes(x = as.numeric(distance_to_nearest_river), y = elevation)) +
  geom_point(col = "black", fill = "white") +
  ggtitle("Scatterplot of Site Information") +
  xlab("Distance to Nearest River (km)") +
  ylab("Number of Observations") +
  theme_minimal()

# 3.10 Scatterplot
# Apply the log transformation on the elevation again and add a smoothing function

ggplot(data = data, aes(x = as.numeric(distance_to_nearest_river), y = log(elevation))) +
  geom_point(col = "black", fill = "white") +
  geom_smooth(method = "lm", se = FALSE, col = "red") +
  ggtitle("Scatterplot of Site Information") +
  xlab("Distance to Nearest River (km)") +
  ylab("Number of Observations") +
  theme_minimal()
