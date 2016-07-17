## Reading XML

library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

## Directly access parts of the XML document

rootNode[[1]]

## Extract parts of the file

xmlSApply(rootNode, xmlValue)

## Get the items on the menu and prices

xpathSApply(rootNode,"//zipcode", xmlValue)
xpathSApply(rootNode,"//name", xmlValue)
xpathSApply(rootNode,"//price", xmlValue)

## Extract content by attributes 

fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl,useInternal=TRUE)
scores <- xpathSApply(doc,"//li[@class='score']",xmlValue)
teams <- xpathSApply(doc,"//li[@class='team-name']",xmlValue)



### Quizz Week 1

## Q4

fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
sum(as.numeric(xpathSApply(rootNode,"//zipcode", xmlValue)) == 21231)