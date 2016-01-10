## this code opens "household_power_consumption.txt" from present working
## directory, reads in the data from 1st and 2nd Feb 2007 and plots a histogram
## of the Global Active Power over these 2 days.  The histogram is displayed
## to screen and written to file "plot1.png" in pwd.

## read in data from "household_power_consumption.txt" in pwd
inFile <- "household_power_consumption.txt"
powerData <- read.table(inFile, sep=";", header=TRUE, na.strings="?",
	colClasses=c("character", "character", "numeric", "numeric", 
	"numeric", "NULL", "numeric", "numeric", "numeric"))

## take subset of data relating to 1st and 2nd Feb 2007
powerSubset <- subset(powerData, Date=="1/2/2007" | Date=="2/2/2007" )
rm(powerData)

## plot histogram of Global Active Power to screen
with(powerSubset, hist(Global_active_power, breaks=15, 
	xlab="Global Active Power (kilowatts)", main="Global Active Power", 
	col="red"))

## copy histogram to file
dev.copy(png, file="plot1.png")
dev.off()