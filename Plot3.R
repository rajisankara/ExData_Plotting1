## Exploratory Analysis Project 1-Plot3.R
## Using Individual household electric power consumption Data Set. Data is downloaded and placed in working directory

setwd("C:/Raji Data/Coursera DataScience/Exploratory Analysis/Project 1")
dataFile <- "household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Extract data for only two days
DataforTwoDays <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 


## Combine data and time into one variable
datetime <- strptime(paste(DataforTwoDays$Date, DataforTwoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  


## Coerce the varaibles to numeric
globalActivePower <- as.numeric(DataforTwoDays$Global_active_power) 

subMetering1 <- as.numeric(DataforTwoDays$Sub_metering_1) 
subMetering2 <- as.numeric(DataforTwoDays$Sub_metering_2) 
subMetering3 <- as.numeric(DataforTwoDays$Sub_metering_3) 


## Plot the graph as png file
png("plot3.png", width=480, height=480) 
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 
dev.off() 
