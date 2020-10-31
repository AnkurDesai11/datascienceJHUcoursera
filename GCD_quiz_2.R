#question 1
#https://stackoverflow.com/questions/30819293/authorization-code-for-github-api-used-in-r- more info
#Check Hadley Wickham's forked demo repo
library(httr)
library(httpuv)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github", key = "Iv1.068f3a9edb17780b", secret = "c6396f204aeb110962d337d93335ab4baf36607d")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
content(req)

for(i in 1:30){
  if(content(req)[[i]]$name=="datasharing"){
    n<-i
  }
}
content(req)[[n]]$created_at



#questions 2 & 3

library(sqldf)
options(sqldf.driver = "SQLite")#It doesn't seem like you need to load the RMySQL library when using sqldf, since you have already read the data into memory, which seems to be the problem here
#Instead of unlaoding the RMySql package, explicitly set the sqldf default driver option to SQLite before calling the sqldf function
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile="GCD_quiz2_dataset1.csv")
acs <- read.csv("GCD_quiz2_dataset1.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select distinct AGEP from acs")



#question 4

webPage = url("http://biostat.jhsph.edu/~jleek/contact.html")
webPagehtml = readLines(webPage)
close(webPage)
webPagehtml
nchar(webPagehtml[10])
nchar(webPagehtml[20])
nchar(webPagehtml[30])
nchar(webPagehtml[100])



#question 5
#https://github.com/lgreski/datasciencectacontent/blob/master/markdown/cleaningData-week2Q5.md - question 5 guide

theColumns <- c("week","nino1and2sst","nino1and2ssta","nino3sst","nino3ssta","nino34sst","nino34ssta","nino4sst","nino4ssta")

#https://stackoverflow.com/questions/14383710/read-fixed-width-text-file - widths ie ***magic goes here***
#method1
originalSource <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(originalSource,"./data/wksst8110.for")
fileURL <- "./data/wksst8110.for"
theAddresses <- c(12, 7, 4, 9, 4, 9, 4, 9, 4) #(*** magic goes here ***)# set addresses for fixed length fortran-style input file 
mydata <- read.fortran("getdata_wksst8110.for",widths=theAddresses,skip = 4)
colnames(mydata) <- theColumns

#method2
fwfCols <- c(12, 7, 4, 9, 4, 9, 4, 9, 4)#(*** magic goes here ***)
mydata2 <- read.fwf("getdata_wksst8110.for", widths=fwfCols, skip=4, col.names=theColumns)

#method3
library(readr)
readrData <- read_fwf("getdata_wksst8110.for", fwf_cols(12, 7, 4, 9, 4, 9, 4, 9, 4),skip=4)

#continuing using method2
sum(mydata2[,4])