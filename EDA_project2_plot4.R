NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")
mergedData <- merge(NEI, SCC, by="SCC")

library(ggplot2)

plotdata <- mergedData[grepl("coal", mergedDataC$Short.Name, ignore.case=TRUE), ]

yeardata <- aggregate(Emissions ~ year, plotdata, sum)

png("CP2plot4.png", width=640, height=480)
g <- ggplot(yeardata, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()