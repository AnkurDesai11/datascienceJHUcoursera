library(lubridate)
energydata <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep =";", na.strings="?", stringsAsFactors=FALSE, dec=".")
febdata<-subset(energydata, Date == "1/2/2007" | Date == "2/2/2007")
febdata$Global_active_power<-as.numeric(febdata$Global_active_power)

#febdata$Time<-strptime(febdata$Time, format="%H:%M:%S")
#febdata[1:1440,"Time"] <- format(febdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
#febdata[1441:2880,"Time"] <- format(febdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#Better way to avoid above 3 steps would be to
#Making a POSIXct date capable of being filtered and graphed by time of day
#febdata[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
timeperiod<-strptime(paste(febdata$Date, febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(timeperiod, febdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()