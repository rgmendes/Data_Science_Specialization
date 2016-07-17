## Using data.table

library(data.table)

# Data Frame
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)

# Data Table
DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)

DT[c(1:3)]
DT[,list(mean(x), sum(z))]
DT[,table(y)]

## Add new Columns

DT[,w:=z^2]

DT2 <- DT

DT[,y:="2"]

## Multiple Operations

DT[, m:= {tmp <- (x+z); log2(tmp+5)}]