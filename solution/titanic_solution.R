######## Exercise ########
#### Preparing ####
library(magrittr)
library(ggplot2)
library(dplyr)
filter <- dplyr::filter

#### Read the data ####
titanic <- read.csv("./Documents/AXA/Training\ Session/R/r-for-dummies/data/data_titanic.csv", header = T, sep = ",")

#### Exploration ####
# Get the name and fare of the people that paid their tickets more than $250
titanic %>% filter(fare > 250) %>% select(name, fare)

# What is the percentage of people under 18 that survived ?
titanic %>% 
  filter(age < 18) %>% 
  select(survived) %>% 
  table %>% 
  prop.table %>% 
  .["1"]

# Which class has the most percentage of survivor ?
table(titanic$pclass, titanic$survived) %>% prop.table(margin = 1) %>% .[, "1"] %>% which.max

# What is the average age of the people ?
titanic %>% filter(!is.na(age)) %>% .$age %>% mean
titanic$age %>% na.exclude %>% mean

# What is the average age of the people by depending of if they survived (you may want to use group_by and be careful of the missing value of the age) ?
titanic %>% 
  filter(!is.na(age)) %>% 
  select(age, survived) %>% 
  group_by(survived) %>% 
  summarise(mean(age))

#### Plots ####
# Plot a histogram of the age
h <- ggplot(titanic, aes(x=age))
h + geom_histogram(binwidth=5, origin = 0, fill="lightblue", colour="blue", alpha = 0.5) + ggtitle("Age of people on the Titanic")

# Compare this histogram depending on if they survived or not (tip : add '+ facet_grid(survived ~ .)' to your line)
h + geom_histogram(binwidth=2, origin = 0, fill="lightblue", colour="blue", alpha = 0.5) + facet_grid(survived ~ .)

# Plot density
h <- ggplot(titanic, aes(x=age, colour = as.factor(survived)))
h + geom_line(stat="density")

# Plot a histogram for the fare and compare people who survied and people who don't
h <- ggplot(titanic, aes(x=fare))
h + geom_histogram(binwidth=10, origin = 0, fill="lightblue", colour="blue", alpha = 0.5) + ggtitle("Price people on the Titanic payed their tickets")
h + geom_histogram(binwidth=10, origin = 0, fill="lightblue", colour="blue", alpha = 0.5) + facet_grid(survived ~ .)

# Plot a box plot of the repartition of the age depending on if they survived
ggplot(titanic, aes(x=as.factor(survived), y=age)) + geom_boxplot(fill = "lightblue", colour = "black")

# Do the same thing but with the fare
ggplot(titanic, aes(x=as.factor(survived), y=fare)) + geom_boxplot(fill = "lightblue", colour = "black")

#### Machine Learning ####
train <- read.csv("./Documents/AXA/Training\ Session/R/r-for-dummies/data/data_titanic_train.csv", header = T, sep = ",")
test <- read.csv("./Documents/AXA/Training\ Session/R/r-for-dummies/data/data_titanic_test.csv", header = T, sep = ",")

model <- glm(survived ~ sex + pclass + age, data=train, family=binomial)


# Result #
predict <- rep(0,nrow(test))
predict[predict(model, newdata = test, type  ="response") > 0.5]  <- 1
1 - sum((as.integer(test$survived)-as.integer(predict))^2)/nrow(test)
