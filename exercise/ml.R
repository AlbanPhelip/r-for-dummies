######## Machine Learning ########
#### Preparing ####
data(iris)
library(magrittr)
library(dplyr)
filter <- dplyr::filter

#### GLM ####
setosa <- iris %>% filter(Species == "setosa")
model <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = setosa)
summary(model)
predict(model, setosa)

#### K-means ####
modelKM <- kmeans(iris[, -5], center = 3)
summary(modelKM)
table(modelKM$cluster, iris$Species) %>% prop.table
