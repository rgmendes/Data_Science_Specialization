## Download Files

fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")
head(restData)
summary(restData)
str(restData)

# Quantiles of quantitative variables
quantile(restData$councilDistrict, na.rm = TRUE)

# Make Table

table(restData$zipCode, useNA = "ifany")
table(restData$councilDistrict, restData$zipCode)

# Check for missing values

sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

# Row and Column sums

colSums(is.na(restData))
all(colSums(is.na(restData))==0)

# Values with specific characteristics

table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),]
head(restData[restData$zipCode %in% c("21212","21213"),])

# Cross tabs

data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt

# Flat tables

names(warpbreaks)
warpbreaks$replicate <- rep(1:9, len = 54)
names(warpbreaks)
xt <- xtabs(breaks ~., data = warpbreaks)
xt
ftable(xt)

# Size of a data set

fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units="Mb")

