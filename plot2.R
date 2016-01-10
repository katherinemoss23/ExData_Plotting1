## this code opens "household_power_consumption.txt" from present working
## directory, reads in the data from 1st and 2nd Feb 2007 and plots the
## Global Active Power over these 2 days.  The graph is displayed
## to screen and written to file "plot2.png" in pwd.

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

## display line plot of Global Active Power against time to screen
with(powerSubset, plot(datetime, Global_active_power, type="l",
	ylab="Global Active Power (kilowatts)", xlab=""))

## copy graph to file
dev.copy(png, file="plot2.png")
dev.off()