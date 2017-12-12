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

##Making Plot
plot(x, power$Sub_metering_1, type = "n", xlab= " ", ylab= "Energy sub metering")
lines(x, power$Sub_metering_1)
lines(x, power$Sub_metering_2, col = "red")
lines(x, power$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col= c("black", "red", "blue"), legend =c("Sub metering 1", "Sub metering 2","Sub metering 3"))
##Creating PNG of graph
dev.copy(png, file ="plot3.png")
dev.off()