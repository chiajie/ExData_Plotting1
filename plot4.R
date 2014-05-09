// extracting data from file
install.packages("sqldf")
library("sqldf")
sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
dframe <- read.csv2.sql("household_power_consumption.txt", sql)

//converting Date and Time to date/time classes
dframe <- transform(dframe, Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

//constructing histogram as png file with parameters as specified
png(file = "plot4.png", 480, 480)
par(mfcol = c(2,2))
plot(dframe[,2], dframe[,3], type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")
plot(dframe[,2], dframe[,7], type = 'n', xlab = "", ylab = "Energy sub metering")
lines(dframe[,2], dframe[,7], col = 'black')
lines(dframe[,2], dframe[,8], col = 'red')
lines(dframe[,2], dframe[,9], col = 'blue')
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = 'n', lty = 1, col = c('black', 'red', 'blue'))
plot(dframe[,2], dframe[,5], type = 'l', xlab = "datetime", ylab = "Voltage")
plot(dframe[,2], dframe[,4], type = 'l', xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
