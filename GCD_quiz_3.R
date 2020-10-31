
#question 1
urlq1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(urlq1, destfile="GDC_quiz3_dataset1.csv")
ds1<-read.csv("GDC_quiz3_dataset1.csv")
head(ds1, n=3)
agricultureLogical<-(with(ds1,ds1$ACR == 3 & ds1$AGS == 6))
which(agricultureLogical)

#question 2
library(jpeg)
ds2<-readJPEG("getdata_jeff.jpg", native = TRUE)
quantile(ds2,probs=c(0.3,0.8))

#question 3-5
library(dplyr)
library(plyr)
urlgdp<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
urledu<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(urlgdp, destfile="GDC_quiz3_dataset2.csv")
download.file(urledu, destfile="GDC_quiz3_dataset3.csv")
ds3<-read.csv("GDC_quiz3_dataset2.csv")
ds4<-read.csv("GDC_quiz3_dataset3.csv")
ds3 <- ds3[-(1:4), ]
colnames(ds3) = c("CountryCode", "rank", "x1", "name", "GDP", "abc", "x5", "x6", "x7", "x8")
ds5<-merge(ds3, ds4, by.x = "CountryCode", by.y = "CountryCode")
ds5$rank <- as.integer(ds5$rank) 
ds5<-arrange(ds5, desc(rank))
s1<-filter(ds5, Income.Group == "High income: OECD")
sum(s1$rank, na.rm=TRUE)/nrow(s1)
s2<-filter(ds5, Income.Group == "High income: nonOECD")
sum(s2$rank, na.rm=TRUE)/nrow(s2)
quantile(ds5$rank, na.rm=TRUE, prob = seq(0, 1, length = 5))
ds5<-arrange(ds5, rank)
tally(filter(head(ds5, 38), Income.Group == "Lower middle income"))