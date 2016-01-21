######## Graphs ######## 
data(iris)

#### Basics graphics ####
# Plot function
plot(iris[,-5])
plot(iris$Petal.Length, iris$Petal.Width)

# Hist function
hist(iris$Petal.Length)

# Box plot
boxplot(Sepal.Length ~ Species, data = iris)

#### ggplot2 ####
library(ggplot2)
# ggplot(data, aes(x = ... //aesthetics caracteristics)) + plot_function() + ...

#### Plot function ####
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) + geom_point()

p <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species))
p + geom_point(size = 4, alpha = 0.5)
p + geom_point(size = 7, alpha = 1) + scale_color_manual(values = c("black", "green", "blue"))


#### Histogram ####
# We'll plot the Petal.Lenght of the Species versicolor 
versicolor <- iris %>% filter(Species == "versicolor")

# Basic plot
ggplot(versicolor, aes(x=Petal.Length)) + geom_histogram()

# More cool
h <- ggplot(versicolor, aes(x=Petal.Length))
h + geom_histogram(binwidth=0.1, origin = 3, fill="lightblue", colour="blue", alpha = 0.5) + ggtitle("Petal length of Versicolor")

#### Density ####
h <- ggplot(iris, aes(x=Sepal.Width, colour = as.factor(Species)))
h + geom_line(stat="density")

#### Box Plot ####
ggplot(iris, aes(x=Species, y=Petal.Length)) + geom_boxplot(fill = "lightblue", colour = "black")