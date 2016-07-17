## Check if file exists

if(!file.exists("data")){
        dir.create("data")
}

## Downloading files and create directory

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
dir.create(path = "./data")
download.file(fileUrl, destfile = "./data/cameras.csv", method = "auto")
list.files("/data")

## Read files 

cameraData <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
head(cameraData)