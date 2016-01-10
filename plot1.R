## this code opens "household_power_consumption.txt" from present working
## directory, reads in the data from 1st and 2nd Feb 2007 and plots a histogram
## of the Global Active Power over these 2 days.  The histogram is 
## written to file "plot1.png" in pwd.

## read in data from "household_power_consumption.txt" in pwd
inFile <- "household_power_consumption.txt"
powerData <- read.table(inFile, sep=";", header=TRUE, na.strings="?",
	colClasses=c("character", "character", "numeric", "numeric", 
	"numeric", "NULL", "numeric", "numeric", "numeric"))

## take subset of data relating to 1st and 2nd Feb 2007
powerSubset <- subset(powerData, Date=="1/2/2007" | Date=="2/2/2007" )
rm(powerData)

## open png file with white background
png("plot1.png", bg="white")

## plot histogram of Global Active Power to png file
with(powerSubset, hist(Global_active_power, breaks=15, 
	xlab="Global Active Power (kilowatts)", main="Global Active Power", 
	col="red"))

## close png file
dev.off()