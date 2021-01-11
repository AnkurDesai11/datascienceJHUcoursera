NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")
#mergedData <- merge(NEI, SCC, by="SCC")

library(ggplot2)

subsetNEI  <- NEI[NEI$fips=="24510", ]
plotdata <- aggregate(Emissions ~ year + type, subsetNEI, sum)

png("CP2plot3.png", width=640, height=480)
g <- ggplot(plotdata, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()