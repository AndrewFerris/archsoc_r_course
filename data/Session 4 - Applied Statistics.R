### Session 4 - Applied Statistics

# 4.0 Yesterday's Recap
# Read in today's data and check the class of each variable, convert survey_tract, collection_type and visibility to factor and then make a histogram of visibility and a scatterplot of han_sherds vs. pop_index_han

data <- read.delim("/Users/andrewferris/Downloads/ceramics.txt",
                   sep = ",",
                   header = FALSE,
                   stringsAsFactors = FALSE)

names(data) <- c("collection_unit_id",
                 "survey_tract",
                 "team",
                 "collection_unit_no",
                 "site_no",
                 "visibility",
                 "area",
                 "collection_type",
                 "number_circles",
                 "total_sherds",
                 "laohushan_sherds",
                 "zhukaigou_sherds",
                 "warring_states_sherds",
                 "han_sherds",
                 "liao_sherds",
                 "yuan_sherds",
                 "total_ssd",
                 "laohushan_ssd",
                 "zhukaigou_ssd",
                 "warring_states_ssd",
                 "han_ssd",
                 "liao_ssd",
                 "yuan_ssd",
                 "pop_index_laohuhshan",
                 "pop_index_zhukaigou",
                 "pop_index_warring_states",
                 "pop_index_han",
                 "pop_index_liao",
                 "pop_index_yuan")

for(i in 1:ncol(data)){
  print(names(data[i]))
  print(class(data[,i]))
}

sapply(data, class)

data$survey_tract <- as.factor(data$survey_tract)
data$visibility <- as.factor(data$visibility)
data$collection_type <- as.factor(data$collection_type)

if("ggplot2" %in% installed.packages()){
  update.packages("ggplot2")
  library(ggplot2)
} else {
  install.packages("ggplot2")
  library(ggplot2)
}

ggplot(data = data, aes(x = visibility, fill = visibility)) +
  geom_bar() +
  theme_minimal() +
  ggtitle("Histogram of Visibility", subtitle = "Liangcheng Settlement Dataset") +
  xlab("Visibility") +
  ylab("Frequency") +
  theme_minimal()

ggplot(data = data, aes(x = pop_index_han, y = han_sherds)) +
  geom_point() +
  ggtitle("Scatterplot of Han Ceramics", subtitle = "Liangcheng Settlement Dataset") +
  xlab("Han Population Index") +
  ylab("Number of Han Sherds") +
  theme_minimal()

# 4.1 T-Test
# Test whether the average of total sherds can be equal to 8

summary(data$total_sherds)

ggplot(data = data, aes(x = total_sherds)) +
  geom_histogram(binwidth = 5) +
  ggtitle("Histogram of Total Sherds") +
  xlab("Total Sherds") +
  ylab("Frequency") +
  theme_minimal()

t_test <- t.test(data$total_sherds, mu = 8)
t_test

# 4.2 T-Test
# Compare the Warring States Sherds with the Liao Sherds to see if they have the same on average

summary(data$warring_states_sherds)
summary(data$liao_sherds)

ggplot() +
  geom_histogram(data = data, aes(x = warring_states_sherds), fill = "blue", alpha = 0.4, binwidth = 1) +
  geom_histogram(data = data, aes(x = liao_sherds), fill = "red", alpha = 0.4, binwidth = 1) +
  ggtitle("Histogram of Sherds", subtitle = "Blue = Warring State, Red = Liao") +
  xlab("Sherds") +
  ylab("Frequency") +
  theme_minimal()

ggplot() +
  geom_histogram(data = data, aes(x = log(warring_states_sherds)), fill = "blue", alpha = 0.4, binwidth = 1) +
  geom_histogram(data = data, aes(x = log(liao_sherds)), fill = "red", alpha = 0.4, binwidth = 1) +
  ggtitle("Histogram of Sherds", subtitle = "Blue = Warring State, Red = Liao") +
  xlab("Sherds") +
  ylab("Frequency") +
  theme_minimal()

t_test <- t.test(data$warring_states_sherds, data$liao_sherds)
t_test

# 4.3 ANOVA
# Test whether total_sherds is the same for each level of visibility

tapply(data$total_sherds, data$visibility, summary)

ggplot(data = data, aes(y = total_sherds, x = visibility, fill = visibility)) +
  geom_boxplot() +
  ggtitle("Boxplot of Total Sherds") +
  xlab("Visibility") +
  ylab("Number of Total Sherds") +
  theme_minimal()

anova <- aov(data$total_sherds ~ data$visibility, data = data)
anova
summary(anova)

# 4.4 ANOVA
# Test whether the overall surface sherd density is the same for each collection type

tapply(data$total_ssd, data$collection_type, summary)

ggplot(data = data, aes(x = collection_type, y = total_ssd, fill = collection_type)) +
  geom_boxplot() +
  ggtitle("Boxplot of Surface Sherd Density") +
  xlab("Collection Type") +
  ylab("Total Surface Sherd Density") +
  theme_minimal()

anova <- aov(data$total_ssd ~ data$collection_type, data = data)
anova
summary(anova)

# 4.5 Regression
# Compare the relationship between all the metrics for the Han variables

summary(data[,c(14, 21, 27)])

cor(data[,c(14, 21, 27)])

ggplot(data = data, aes(x = han_sherds)) +
  geom_histogram(binwidth = 1) +
  ggtitle("Histogram of Han Sherds") +
  xlab("Han Sherds") +
  ylab("Frequency") +
  theme_minimal()

ggplot(data = data, aes(x = han_ssd)) +
  geom_histogram(binwidth = 0.2) +
  ggtitle("Histogram of Han Surface Density") +
  xlab("Han Surface Density") +
  ylab("Frequency") +
  theme_minimal()

ggplot(data = data, aes(x = pop_index_han)) +
  geom_histogram(binwidth = 0.2) +
  ggtitle("Histogram of Han Population Index") +
  xlab("Han Population Index") +
  ylab("Frequency") +
  theme_minimal()

model <- lm(data$han_sherds ~ data$han_ssd + data$pop_index_han, data = data)
model
summary(model)
plot(model)
