########  R  ########
#### Basic stuff ####
# Calcul
1+1

# Assign variable
x = 42
y <- 43 # (alt + -)
44 -> z

# Basic computation
sum(x, y, z)

#### Data Types ####
# Number
sqrt(x)
x^2

# String
a <- "abc"

# Boolean
2 + 2 == 5
b <- TRUE
b == T

# Vectors
vec <- c(x, y, z) # c for "combine"
vec == 42:44
vec[2]
mean(vec)
sd(vec)

# Factors (enum)
myFactor <- factor(c("yes", "no", "no", "yes", "no"))
levels(myFactor)

# Matrix
myMatrix <- matrix(data = c(1, 2, 3, 4, 5, 6), nrow = 2)
myMatrix

colnames(myMatrix) <- c("a", "b", "c")
rownames(myMatrix) <- c("x", "y")
myMatrix

myMatrix[2, 3]
myMatrix["y", "c"]
myMatrix[, 1]
myMatrix[, "a"]