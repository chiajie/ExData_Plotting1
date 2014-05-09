// extracting data from file
install.packages("sqldf")
library("sqldf")
sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
dframe <- read.csv2.sql("household_power_consumption.txt", sql)

//converting Date and Time to date/time classes
dframe <- transform(dframe, Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

//constructing line plot as png file with parameters as specified
png(file = "plot3.png", 480, 480)
plot(dframe[,2], dframe[,7], type = 'n', xlab = "", ylab = "Energy sub metering")
lines(dframe[,2], dframe[,7], col = 'black')
lines(dframe[,2], dframe[,8], col = 'red')
lines(dframe[,2], dframe[,9], col = 'blue')
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c('black', 'red', 'blue'))
dev.off()
