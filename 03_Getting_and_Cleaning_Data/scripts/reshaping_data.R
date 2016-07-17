# The goals is tydi data
# 1- Each variable forms a column
# 2- Each observation forms a row
# 3- Each table/file stores data about one kind of observation 

# Starting with rasphaping
library(reshape2)
head(mtcars)

# Melting data frames

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname","gear", "cyl"), measure.vars = c("mpg","hp"))

head(carMelt)
tail(carMelt)

# Casting data frame

cylData <- dcast(carMelt, cyl ~ variable)
cylData

cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData

# Averaging values

head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)
tapply(InsectSprays$count, InsectSprays$spray, nchar, simplify = FALSE)
?tapply()

# Another way - split

spIns <- split(InsectSprays$count, InsectSprays$spray)
spIns

# Another way - apply

sprCount <- lapply(spIns, sum) # Summing each different sprays across that list - OR
sprCount <- lapply(split(InsectSprays$count, InsectSprays$spray), sum)
sprCount

# Another way - combine

unlist(sprCount)
sapply(spIns, sum)

# Another way - plyr package

ddply(InsectSprays,.(spray), summarize, SUM=sum(count))

# Creating new variable

splySums <- ddply(InsectSprays,.(spray), summarize, sum=ave(count, FUN=sum))