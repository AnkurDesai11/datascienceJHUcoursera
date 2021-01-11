NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
#SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

data <- subset(NEI, fips == "24510") #year %in% c(1999,2002,2005,2008) & 
plotdata <- aggregate(x=data$Emissions, by=list(data$year), FUN=sum)

png("CP2plot2.png", width=1040, height=480)
plot(plotdata$Group.1,plotdata$x,xlab="Year",type="l",ylab="Total PM25 Emissions in Baltimore",main="Total yearly emissions in Baltimore")
dev.off()