## Reading from MySQL

Install Packages install.packages("RMySQL")

library(RMySQL)

# Connecting and listing databases
ucscDb <- dbConnect(MySQL(),user="genome", host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);

# Connecting to hg19 and listing tables
hg19 <- dbConnect(MySQL(),user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)

# Get dimensions of a specific table
dbListFields(hg19,"affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

# Read from the table
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

# Select a specific subset
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)

affyMisSmall <- fetch(query,n=10); dbClearResult(query);

dim(affyMisSmall)

# Don't forget to close the connection!
dbDisconnect(hg19)

## Connect DB Local

library(RMySQL)
dbConnect(MySQL(), host="127.0.0.1", port= 3306, user="root", password = "Rbeto133!$", dbname="sakila")
