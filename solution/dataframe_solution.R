######## Dataframe ########
#### Data package ####
data()
data(iris)
iris

#### Read and write ####
read.csv("/path/to/file", header = T, sep = ",")
write.csv(iris, "./Desktop/iris.csv", row.names = F)

#### Data exploration ####
# You can access data just as the matrix. One difference though:
# You can select a variable like this
iris$Sepal.Length

# summary function
summary(iris)

# Mean
mean(iris$Sepal.Length)

# Quantile
quantile(iris$Sepal.Length, 0.25)

# Filter lines
# Get lines where Petal.Length > 6
iris[iris$Petal.Length > 6,]

# Get Sepal.Length where Petal.Length > 6
iris[iris$Petal.Length > 6,]$Sepal.Length

# Get Sepal.Length and Sepal.Width where Petal.Length > 6
iris[iris$Petal.Length > 6,][, c("Sepal.Length", "Sepal.Width")]

# Beurk !

#### Package dplyr is here to help us ####
library(dplyr)

# Un-shadowing function
filter <- dplyr::filter

# Let's do the same thing
# Get lines where Petal.Length > 6
filter(iris, Petal.Length > 6)

# Get Sepal.Length where Petal.Length > 6
select(filter(iris, Petal.Length > 6), Sepal.Length)

# Get Sepal.Length and Sepal.Width where Petal.Length > 6
select(filter(iris, Petal.Length > 6), Sepal.Length, Sepal.Width)

# Well more readable, okay. But come on that's still complicated

#### Package magrittr is here to help us ####
library(magrittr)

# Let's do the same thing, again !
# Get lines where Petal.Length > 6
iris %>% filter(., Petal.Length > 6)
iris %>% filter(Petal.Length > 6)

# Get Sepal.Length where Petal.Length > 6
iris %>% filter(Petal.Length > 6) %>% select(Sepal.Length)

# Get Sepal.Length and Sepal.Width where Petal.Length > 6
iris %>% 
  filter(Petal.Length > 6) %>% 
  select(Sepal.Length, Sepal.Width)

# Reminder, here is what we had : 
iris[iris$Petal.Length > 6,][, c("Sepal.Length", "Sepal.Width")]

# Add a column
iris <- cbind(iris, product = (iris$Sepal.Length * iris$Sepal.Width * iris$Petal.Length * iris$Petal.Width))
iris <- iris %>% cbind(sum = (.$Sepal.Length + .$Sepal.Width + .$Petal.Length + .$Petal.Width))

greaterThan6 <- function(value) {
  if(value > 6) T
  else F
}

iris$greaterThan6 <- iris$Sepal.Length %>% lapply(greaterThan6)


#### Small exercise ####
# What is the highest Sepal.Length for each Species ?
iris %>% filter(Species == "virginica") %>% select(Sepal.Length) %>% max
iris %>% filter(Species == "setosa") %>% select(Sepal.Length) %>% max
iris %>% filter(Species == "versicolor") %>% select(Sepal.Length) %>% max

# And how about the average ?
iris %>% filter(Species == "virginica") %>% .[, "Sepal.Length"] %>% mean
iris %>% filter(Species == "setosa") %>% .[, "Sepal.Length"] %>% mean
iris %>% filter(Species == "versicolor") %>% .[, "Sepal.Length"] %>% mean


# With purrr
library(purrr)
iris %>% split(.$Species) %>% map(. %>% select(Sepal.Length) %>% max)
iris %>% split(.$Species) %>% map(. %>% .[, "Sepal.Length"] %>% mean)


iris %>% split(.$Species) %>% map(. %>% select(Sepal.Length) %>% colMeans)


