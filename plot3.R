## this code opens "household_power_consumption.txt" from present working
## directory, reads in the data from 1st and 2nd Feb 2007 and plots the
## 3 Sub metering measures over these 2 days.  The graph is displayed
## to screen and written to file "plot3.png" in pwd.

## read in data from "household_power_consumption.txt" in pwd
inFile <- "household_power_consumption.txt"
powerData <- read.table(inFile, sep=";", header=TRUE, na.strings="?",
	colClasses=c("character", "character", "numeric", "numeric", 
	"numeric", "NULL", "numeric", "numeric", "numeric"))

## take subset of data relating to 1st and 2nd Feb 2007
powerSubset <- subset(powerData, Date=="1/2/2007" | Date=="2/2/2007" )
rm(powerData)

## create a new variable datetime which creates a POSIXlt object from 
## the character strings Date and Time
powerSubset$datetime <- strptime(paste(powerSubset$Date,powerSubset$Time),
	"%d/%m/%Y%H:%M:%S")

## create graph showing how the 3 different Sub metering measures vary
## over time.  Add legend.  Display to screen.
with(powerSubset, plot(datetime, Sub_metering_1, type="l",
	ylab="Energy sub metering", xlab=""))
with(powerSubset, points(datetime, Sub_metering_2, col="red", type="l"))
with(powerSubset, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1",
	"Sub_metering_2", "Sub_metering_3"), lwd=1)

## copy graph to file
dev.copy(png, file="plot3.png")
dev.off()
