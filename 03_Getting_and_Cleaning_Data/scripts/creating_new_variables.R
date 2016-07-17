## Download Files

fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")

# Creating sequences

s1 <- seq(1,10,by=2)
s1

s2 <- seq(1,10,length=3)
s2

x <- c(1,3,8,25,100)
seq(along = x)

# Subsetting variables

restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

# Creating binary variables

restData$Wrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$Wrong, restData$zipCode < 0)

# Creating categorical variables

restData$Groups = cut(restData$zipCode, breaks=quantile(restData$zipCode))
table(restData$Groups)
table(restData$Groups, restData$zipCode)

# Easing cutting
install.packages("Hmisc")
library(Hmisc)

restData$Groups = cut2(restData$zip, g=4)
table(restData$Groups)

# Creating factor variables

restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

# Levels of factor variables

yesno <- sample(c("yes","no"), size=10, replace = TRUE)
yesnofac <- factor(yesno, levels = c("yes","no"))
relevel(yesnofac, ref="yes")
as.numeric(yesnofac)

# Use the mutate function

library(Hmisc)
library(plyr)

restData2 <- mutate(restData, zipGroups=cut2(zipCode, g=4))
table(restData2$zipGroups)
