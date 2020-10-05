library(xlsx)
library(dplyr)
library(XML)
library(data.table)
#question1&2
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile="GCD_quiz1_dataset.csv")
dataset <- read.csv("GCD_quiz1_dataset.csv")
head(dataset)
myds <- tbl_df(dataset)
tally(myds , VAL==24)
#question3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile="GCD_quiz1_dataset2.xlsx")
dataset2 <- read.xlsx("GCD_quiz1_dataset2.xlsx", sheetIndex=1,  header = TRUE, rowIndex = 18:23, colIndex = 7:15)
dat<-dataset2
sum(dat$Zip*dat$Ext,na.rm=T)
#question4
doc <- xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", useInternal=TRUE) #xmlTreeParse doesnt support https use http instead
rootNode <- xmlRoot(doc)
xmlName(rootNode)
zips <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zips=="21231")
#question5
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile="GCD_quiz1_dataset4.csv")
dataset4 <- fread("GCD_quiz1_dataset4.csv")
DT <- dataset4
mean(DT$pwgtp15,by=DT$SEX)
DT[,mean(pwgtp15),by=SEX]#fastest
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
tapply(DT$pwgtp15,DT$SEX,mean)
sapply(split(DT$pwgtp15,DT$SEX),mean)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]