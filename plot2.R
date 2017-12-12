##Reading data
power<- read.csv2("household_power_consumption.txt")
power$Date <- as.Date(as.character(power$Date), format = "%d/%m/%Y")
power <- power[power$Date < "2007-02-03", ]
power <- power[power$Date > "2007-01-31", ]

##Changing classes of data
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
x <- paste(power$Date, power$Time)
x <- strptime(x, "%Y-%m-%d %H:%M:%S")

##Making plot
plot(x, power$Global_active_power, type="n",xlab= " ", ylab="Global Active Power (kilowatts).")
lines(x, power$Global_active_power)

##Create PNG of graph
dev.copy(png, file ="plot2.png")
dev.off()