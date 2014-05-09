// extracting data from file
install.packages("sqldf")
library("sqldf")
sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
dframe <- read.csv2.sql("household_power_consumption.txt", sql)

//converting Date and Time to date/time classes
dframe <- transform(dframe, Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

//constructing lineplot as png file with parameters as specified
png(file = "plot2.png", 480, 480)
plot(dframe[,2], dframe[,3], type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()