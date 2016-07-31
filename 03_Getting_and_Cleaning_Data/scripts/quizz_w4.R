# Question 01

url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url1, destfile = "./data/data_w4q1.csv")
df_w4q1 <- read.csv("./data/data_w4q1.csv")

strsplit(names(df_w4q1), "wgtp")[123]

# Question 02

library(data.table)
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
dest2 <- "./data/data_w4q2.csv"
download.file(url2, destfile = dest2, mode = 'wb')
df_w4q2 <- fread(dest2, skip = 4, nrow = 190, select = c(1,2,4,5), col.names = c("CountryCode","Rank","countryNames","USdollars"))
df_w4q2$USdollars <- as.numeric(gsub(",","",df_w4q2$USdollars))
head(df_w4q2)
mean(df_w4q2$USdollars)

# Question 03

df_w4q2[grep("^United", df_w4q2$countryNames),]

# Question 04

library(data.table)
url4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
dest4 <- "./data/data_w4q4.csv"
download.file(url4, destfile = dest4, mode = 'wb')
df_w4q4 <- fread(dest4, skip = 4, nrow = 190, select = c(1,2,4,5), col.names = c("CountryCode","Rank","countryNames","USdollars"))

url5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
dest5 <- "./data/data_w4q41.csv"
download.file(url5, destfile = dest5, mode = 'wb')
df_w4q41 <- read.csv(dest5)
df_w4_merge <- merge(df_w4q4,df_w4q41, by.x = "CountryCode", by.y = "CountryCode")
nrow(df_w4_merge[grep("Fiscal year end: June", df_w4_merge$Special.Notes),])

# Question 05

install.packages("quantmod")
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
sampleTimes <- ymd(sampleTimes)
sum(year(sampleTimes) == 2012)
sum(year(sampleTimes) == 2012 & wday(sampleTimes) == 2)


