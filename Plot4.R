## Exploratory Analysis Project 1-Plot4.R
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
globalReActivePower <- as.numeric(DataforTwoDays$Global_reactive_power)

Voltage <- as.numeric(DataforTwoDays$Voltage) 

subMetering1 <- as.numeric(DataforTwoDays$Sub_metering_1) 
subMetering2 <- as.numeric(DataforTwoDays$Sub_metering_2) 
subMetering3 <- as.numeric(DataforTwoDays$Sub_metering_3) 


## Plot the graph as png file
## Creating the plot 
png("plot4.png", width=480, height=480) 

# create  two by two rows for 4 plots 
par(mfcol=c(2,2)) 


# First plot 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power") 

# Second plot 
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering") 
lines(datetime, subMetering2, col="red") 
lines(datetime, subMetering3, col="blue") 
legend("topright", legend=c("subMetering1", "subMetering2", "subMetering3"), col=c("black", "red", "blue"), lwd= 1, bty="n") 

# Third Plot 
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage") 


# Fourth plot 
plot(datetime, globalReActivePower, type="l", xlab="datetime", ylab="Global_reactive_power") 

dev.off() 
