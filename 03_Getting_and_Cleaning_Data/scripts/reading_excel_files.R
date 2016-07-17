## Reading Excel files

## Packages and Install

install.packages("rJava")
library("rJava")
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_91')

install.packages("xlsx")
library(xlsx)

install.packages("data.table")

## Chheck if file exists

if(!file.exists("data")){
        dir.create("data")
}

## Downloaded file Excel
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD" # https
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl,destfile="./data/cameras.xlsx",method="auto", mode = "wb")

## Assignment data
dateDownloaded <- date()

## Reading files xlsx

cameraData <- read.xlsx("./data/cameras.xlsx", sheetIndex = 1, header = TRUE)
head(cameraData)

### Quizz Week 1 ###

## Q3

download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx ", destfile = "./q3.xlsx", mode = "wb", method = "auto")
dat <- read.xlsx("q3.xlsx", startRow = 18, endRow = 23, sheetIndex = 1, header = TRUE)
sum(dat$Zip*dat$Ext,na.rm=T) 

## Q5

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./q5.csv", mode = "wb", method = "auto")
DT <- fread("q5.csv")