library(lubridate)
energydata <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep =";", na.strings="?", stringsAsFactors=FALSE, dec=".")
febdata<-subset(energydata, Date == "1/2/2007" | Date == "2/2/2007")

febdata$Global_active_power<-as.numeric(febdata$Global_active_power)
febdata$Sub_metering_1<-as.numeric(febdata$Sub_metering_1)
febdata$Sub_metering_2<-as.numeric(febdata$Sub_metering_2)
febdata$Sub_metering_3<-as.numeric(febdata$Sub_metering_3)
febdata$Global_reactive_power<-as.numeric(febdata$Global_reactive_power)
febdata$Voltage<-as.numeric(febdata$Voltage)

timeperiod<-strptime(paste(febdata$Date, febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(timeperiod, febdata$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(timeperiod, febdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(timeperiod, febdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(timeperiod, febdata$Sub_metering_2, type="l", col="red")
lines(timeperiod, febdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(timeperiod, febdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()