##Reading data
power<- read.csv2("household_power_consumption.txt")
power$Date <- as.Date(as.character(power$Date), format = "%d/%m/%Y")
power <- power[power$Date < "2007-02-03", ]
power <- power[power$Date > "2007-01-31", ]
##Changing class of data
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
##Creating Histogram
hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)", main= "Global Active Power", col = "red")
##Creating png of graph 
dev.copy(png, file ="plot1.png")
dev.off()