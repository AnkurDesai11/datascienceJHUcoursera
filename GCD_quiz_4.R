#question 1
urlq1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(urlq1, destfile="GCD_quiz4_dataset1.csv")
ds1<-read.csv("GCD_quiz4_dataset1.csv")
splitnames<-strsplit(names(ds1), "wgtp")
splitnames[[123]]

#question 2
urlq2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(urlq2, destfile="GCD_quiz4_dataset2.csv")
ds2<-read.csv("GCD_quiz4_dataset2.csv")
names(ds2)
ds2gdp<-suppressWarnings(as.numeric(gsub("\\,", "", ds2$X.3)))
sum(ds2gdp, na.rm=TRUE)/nrow(ds2)

#question 4 - using ds2 from before
urlq3<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(urlq3, destfile="GCD_quiz4_dataset3.csv")
ds3<-read.csv("GCD_quiz4_dataset3.csv")
ds4 <- ds2[-(1:4), ]
colnames(ds4) = c("CountryCode", "rank", "x1", "name", "GDP", "abc", "x5", "x6", "x7", "x8")
ds5<-merge(ds3, ds4, by.x = "CountryCode", by.y = "CountryCode")
length(grep("^(Fiscal year end: June)", ds5$Special.Notes))

#question 5
library(lubridate)
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
length(grep("^2012", sampleTimes))
sampletimes2012<-sampleTimes[grep("^2012", sampleTimes)]
sampletimes2012<-ymd(sampletimes2012)
sampletimes2012weekday<-wday(sampletimes2012)
length(sampletimes2012weekday[sampletimes2012weekday==2])