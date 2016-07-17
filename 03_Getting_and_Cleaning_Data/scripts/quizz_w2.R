## Week 2 Quiz
packages <- c("data.table", "sqldf")
sapply(packages, require, character.only=TRUE, quietly=TRUE)
setInternet2(TRUE)

## Question 01

library(httr)
require(httpuv)
require(jsonlite)


# 1. Find OAuth settings for github:
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
myapp <- oauth_app("github", "db05faecaf079212371f", "76600a3308682a23756578fea2f16fe172aa1474")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(rep)
content(req)

# 5. Get data
rep <- content(req)
nRepo <- length(rep)
repoName <- "datasharing"

# 6. Search Repository
for(i in 1:nRepo) {
        if(rep[[i]]$name == repoName)
        print(rep[[i]]$created_at)
}

## Question 02

library(sqldf)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "./data/w2q2.csv")
acs <- read.csv("./data/w2q2.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")


## Question 03

unique(acs$AGEP)
sqldf("select distinct AGEP from acs")

## Question 04

con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)
close(con)

nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])

## Question 05

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url, destfile = "./data/w2q5.for")
data_q5 <- read.fwf("./data/w2q5.for", widths=c(10,5,4,4,5,4,4,5,4,4,5,4,4), skip=4)
sum(data_q5$V6)