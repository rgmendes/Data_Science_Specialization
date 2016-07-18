# Load the dplyr package
install.packages("dplyr")
library(dplyr)

# Select
chicago <- readRDS("./data/chicago.rds")
dim(chicago)
str(chicago)

head(select(chicago, 1:5))
names(chicago)[1:3]
head(select(chicago, city:dptp))

head(select(chicago, -(city:dptp))) # Equivalent base R
i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])

# Filter

chic.f <- filter(chicago, pm25tmean2 > 30)
head(select(chic.f, 1:3, pm25tmean2), 10)

chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(select(chic.f, 1:3, pm25tmean2, tmpd), 10)

# Arrange

# Reordering rows of a data frame 
# (while preserving correspondingorder of other columns) 
# is normally a pain to do in R.

chicago <- arrange(chicago, date)
head(select(chicago, date, pm25tmean2), 3)
tail(select(chicago, date, pm25tmean2), 3)

chicago <- arrange(chicago, desc(date))
head(select(chicago, date, pm25tmean2), 3)
tail(select(chicago, date, pm25tmean2), 3)

