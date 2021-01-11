NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
#SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")
#mergedData <- merge(NEI, SCC, by="SCC")

library(ggplot2)

plotdata <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

yeardata <- aggregate(Emissions ~ year + fips, plotdata, sum)
yeardata$fips[yeardatas$fips=="24510"] <- "Baltimore, MD"
yeardata$fips[yeardata$fips=="06037"] <- "Los Angeles, CA"

png("CP2plot6.png", width=1040, height=480)
g <- ggplot(yeardata, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()