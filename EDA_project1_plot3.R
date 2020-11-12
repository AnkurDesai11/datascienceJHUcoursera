library(lubridate)
energydata <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep =";", na.strings="?", stringsAsFactors=FALSE, dec=".")
febdata<-subset(energydata, Date == "1/2/2007" | Date == "2/2/2007")

febdata$Global_active_power<-as.numeric(febdata$Global_active_power)
febdata$Sub_metering_1<-as.numeric(febdata$Sub_metering_1)
febdata$Sub_metering_2<-as.numeric(febdata$Sub_metering_2)
febdata$Sub_metering_3<-as.numeric(febdata$Sub_metering_3)

timeperiod<-strptime(paste(febdata$Date, febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png("plot3.png", width=480, height=480)

plot(timeperiod, febdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(timeperiod, febdata$Sub_metering_2, type="l", col="red")
lines(timeperiod, febdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()