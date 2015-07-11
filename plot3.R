data <- read.table("household_power_consumption.txt", sep = ";", header=T,as.is = T)
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
doc<- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
power <- as.numeric(doc$Global_active_power)
DateTime <- as.POSIXct(paste(doc$Date, doc$Time), format = "%Y-%m-%d %H:%M:%S")
png(filename="plot3.png")
plot(DateTime, doc$Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering")

points(DateTime, doc$Sub_metering_2, type="l", ylab="Global Active Power (kilowatts)", col = "red")

points(DateTime, doc$Sub_metering_3, type="l", ylab="Global Active Power (kilowatts)", col="blue")

legend("topright", lty=c(1,1,1), lwd=2,col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()