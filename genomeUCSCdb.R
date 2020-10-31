library(RMySQL)
ucscDb <- dbConnect(MySQL(),user = "genome",host = "genome-mysql.soe.ucsc.edu", dbname="hgcentral")
result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);
result
hg19 <- dbConnect(MySQL(),user = "genome",host = "genome-mysql.soe.ucsc.edu", db="hg19")
allTables <- dbListTables(hg19)
length(allTables)
allTables[263:300]
dbListFields(hg19, "drBlastTab")
dbGetQuery(hg19, "select count(*) from drBlastTab")
drbtTable <- dbReadTable(hg19, "drBlastTab")
head(drbtTable)
query <- dbSendQuery(hg19, "select * from drBlastTab where aliLength between 150 and 250")
aLq <- fetch(query)
quantile(aLq$aliLength)
dbDisconnect(hg19)