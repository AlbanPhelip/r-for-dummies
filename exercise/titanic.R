######## Exercise ########
#### Preparing ####
library(magrittr)
library(ggplot2)
library(dplyr)
filter <- dplyr::filter

#### Read the data ####
titanic <- read.csv("./Documents/AXA/Training\ Session/R/r-for-dummies/data/data_titanic.csv", header = T, sep = ",")

#### Exploration ####
# Get the name and fare of the people that paid their tickets more than $200

# What is the percentage of people under 18 that survived ?

# Which class has the most percentage of survivor ?

# What is the average age of the people ?

# What is the average age of the people by depending of if they survived (you may want to use group_by) ?

#### Plots ####
# Plot a histogram of the age

# Compare this histogram depending on if they survived or not (tip : add '+ facet_grid(survived ~ .)' to your line)

# Plot density

# Plot a histogram for the fare and compare people who survied and people who don't

# Plot a box plot of the repartition of the age depending on if they survived

# Do the same thing but with the fare

#### Machine Learning ####
train <- read.csv("./Documents/AXA/Training\ Session/R/r-for-dummies/data/data_titanic_train.csv", header = T, sep = ",")
test <- read.csv("./Documents/AXA/Training\ Session/R/r-for-dummies/data/data_titanic_test.csv", header = T, sep = ",")

# Have fun and build the best model you can !

# Test you model ! (to make this piece of code work name you model 'model') 
predict <- rep(0,nrow(test))
predict[predict(model, newdata = test, type  ="response") > 0.5]  <- 1
1 - sum((as.integer(test$survived)-as.integer(predict))^2)/nrow(test)
