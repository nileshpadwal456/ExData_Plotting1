data <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)
subData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
## 1
plot1 <- as.numeric(subData$Global_active_power)
days <- strptime(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot1, xlab="", ylab="Global Active Power", type="l")

## 2
plot2 <- as.numeric(subData$Voltage)
days <- strptime(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot2, xlab="datetime", ylab="Voltage", type="l")

## 3
plot3a <- as.numeric(subData$Sub_metering_1)
plot3b <- as.numeric(subData$Sub_metering_2)
plot3c <- as.numeric(subData$Sub_metering_3)
days <- strptime(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot3a, type="n", xlab="", ylab="Energy sub metering")
points(days, plot3a, type="l", col="black")
points(days, plot3b, type="l", col="red")
points(days, plot3c, type="l", col="blue")
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## 4
plot4 <- as.numeric(subData$Global_reactive_power)
days <- strptime(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot4, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()
