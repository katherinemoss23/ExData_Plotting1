## this code opens "household_power_consumption.txt" from present working
## directory, reads in the data from 1st and 2nd Feb 2007 and produces 4
## graphs using this data.  The graphs are 1. Histogram of Global Active Power.
## 2. Voltage over time.  3. Variation in 3 Sub metering measures over time.
## 4. Global Reactive Power over time.  The graphs are written to file
## "plot4.png" in pwd.

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

## open png file with white background
png("plot4.png", bg="white")

## set display so that the 4 graphs are displayed in a 2x2 array
par(mfrow=c(2,2))

## Graph 1:  Global Active Power histogram
with(powerSubset, plot(datetime, Global_active_power, type="l",
	ylab="Global Active Power", xlab=""))

## Graph 2:  Voltage over time
with(powerSubset, plot(datetime, Voltage, type="l"))

## Graph 3:  Energy sub metering measures over time
with(powerSubset, plot(datetime, Sub_metering_1, type="l",
	ylab="Energy sub metering", xlab=""))
with(powerSubset, points(datetime, Sub_metering_2, col="red", type="l"))
with(powerSubset, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1",
	"Sub_metering_2", "Sub_metering_3"), lwd=1, bty="n")

## Graph 4:  Voltage over time
with(powerSubset, plot(datetime, Global_reactive_power, type="l"))

## close png file
dev.off()