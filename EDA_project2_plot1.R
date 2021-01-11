#dplyr method
#data % > %
#  group_by(lgID) % > %
#  summarise(mean_run = mean(HR))

NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
#SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

data <- subset(NEI, year %in% c(1999,2002,2005,2008))
plotdata <- aggregate(x=data$Emissions, by=list(data$year), FUN=sum)

png("CP2plot1.png", width=1040, height=480)
plot(plotdata$Group.1,plotdata$x,xlab="Year",type="l",ylab="Total PM25 Emissions",main="Total yearly emissions",ylim=c(3000000,8000000))
dev.off()