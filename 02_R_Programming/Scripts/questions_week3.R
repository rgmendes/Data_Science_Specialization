
### QUESTION 01 - WEEK 3 ###
tapply(iris$Sepal.Length, iris$Species, mean)

### QUESTION 02 - WEEK 3 ###
apply(iris[,1:4],2, mean)

### QUESTION 03 - WEEK 3 ###
tapply(mtcars$mpg, mtcars$cyl, mean)

### QUESTION 04 - WEEK 3 ###
mean(mtcars[mtcars$cyl == "8",]$hp) - mean(mtcars[mtcars$cyl == "4",]$hp)