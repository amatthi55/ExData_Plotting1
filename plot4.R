par(mfrow = c(2,2))

##Reading data set
power<- read.csv2("household_power_consumption.txt")
power$Date <- as.Date(as.character(power$Date), format = "%d/%m/%Y")
power <- power[power$Date < "2007-02-03", ]
power <- power[power$Date > "2007-01-31", ]
##Changing classes of data 
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
x <- paste(power$Date, power$Time)
x <- strptime(x, "%Y-%m-%d %H:%M:%S")
power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))

##Plot 1
plot(x, power$Global_active_power, type="n",xlab= " ", ylab="Global Active Power (kilowatts).")
lines(x, power$Global_active_power)

##Plot 2
power$Voltage <- as.numeric(as.character(power$Voltage))
plot(x, power$Voltage, type = "n", xlab = "Date Time", ylab= "Voltage")
lines(x, power$Voltage)

##Plot 3
power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))
plot(x, power$Sub_metering_1, type = "n", xlab= " ", ylab= "Energy sub metering")
lines(x, power$Sub_metering_1)
lines(x, power$Sub_metering_2, col = "red")
lines(x, power$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col= c("black", "red", "blue"), legend =c("Sub metering 1", "Sub metering 2","Sub metering 3"))

##Plot 4
power$Global_reactive_power <- as.numeric(as.character(power$Global_reactive_power))
plot(x, power$Global_reactive_power, type ="n", ylab= "Global Reactive Power", xlab = "Date Time")
lines(x, power$Global_reactive_power)

##Create PNG file of graph
dev.copy(png, file ="plot4.png")
dev.off()
