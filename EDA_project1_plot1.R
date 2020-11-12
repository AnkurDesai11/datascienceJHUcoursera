library(lubridate)
energydata <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep =";", na.strings="?", stringsAsFactors=FALSE, dec=".")
febdata<-subset(energydata, Date == "1/2/2007" | Date == "2/2/2007")

febdata$Global_active_power<-as.numeric(febdata$Global_active_power)

png("plot1.png", width=480, height=480)
hist(febdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
