library(XML)
library(httr)
url <- "https://scholar.google.com/citations?user=lIy8BEkAAAAJ&hl=en"
con = url("https://dr-chuck.com")#pass url of page which you want to scrape
htmlcode = readLines(con)
close(con)
htmlcode
#url <- "https://dr-chuck.com"
#html <- htmlTreeParse(url, useInternalNodes=T)
#xpathSApply(html, "//Warship", xmlValue)
html = GET(url)
webpagecontent = content(html, as="text")
parsedcontent = htmlParse(webpagecontent, asText=TRUE)
xpathSApply(parsedcontent, "//title", xmlValue)
pg = GET("http://httpbin.org/basic-auth/user/passwd", authenticate("user", "passwd"))
pg
wows = handle("https://asia.wows-numbers.com/player/2025681261,LovedayK/")
wr = GET(handle=wows, path="//winrate")
wr
pr = GET(handle=wows, path="//performance-rating")
pr
