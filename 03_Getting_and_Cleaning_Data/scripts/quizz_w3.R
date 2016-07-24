library(dplyr)
library(plyr)
library(tidyr)
library(data.table)
library(jpeg)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, destfile = "./data/data_quizz_w3.csv")
data_quizz_w3 <- tbl_df(read.csv("./data/data_quizz_w3.csv"))

# Question 01

agricultureLogical <- data_quizz_w3$ACR == '3' & data_quizz_w3$AGS == '6'
head(which(agricultureLogical),3)


# Question 02

url2 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
download.file(url2, destfile = "./data/w3.jpg" , mode = 'wb')
quizz_w3 = readJPEG(dest2, native = TRUE)
quantile(quizz_w3, probs = c(0.3, 0.8))

# Question 03

url_rank <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
dest_rank <- './data/q3_rank.csv'
url_edu <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
dest_edu <- './data/q3_edu.csv'
download.file(url_rank, destfile = dest_rank, mode= 'wb')
download.file(url_edu, destfile = dest_edu, mode = 'wb')
rank <- fread(dest_rank, skip=4, nrows=190, select = c(1,2,4,5), col.names = c("CountryCode", "Rank", "Economy", "Total"))
edu <- fread(dest_edu)
df_merge <- merge(rank, edu, by.x = "CountryCode", by.y = "CountryCode" )

nrow(df_merge)
head(arrange(df_merge, desc(Rank)),13)

# Question 04

income_avg <- group_by(df_merge, Group = `Income Group`)
OECD <- income_avg[income_avg$`Income Group` == "High income: OECD",]
nonOECD <- income_avg[income_avg$`Income Group` == "High income: nonOECD",]
summarise(OECD, average = mean(Rank))
summarise(nonOECD, average = mean(Rank))
# OR 
df_merge[,mean(Rank), by = 'Income Group']

# Question 05

q5 <- tbl_df(df_merge)
q5 <- q5[q5$`Income Group` == "Lower middle income",]
nrow(q5[q5$Rank <= 38,])