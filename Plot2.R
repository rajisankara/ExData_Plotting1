## Exploratory Analysis Project 1-Plot2.R
## Using Individual household electric power consumption Data Set. Data is downloaded and placed in working directory

setwd("C:/Raji Data/Coursera DataScience/Exploratory Analysis/Project 1")
dataFile <- "household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Extract data for only two days
DataforTwoDays <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 


## Combine data and time into one variable

datetime <- strptime(paste(DataforTwoDays$Date, DataforTwoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(DataforTwoDays$Global_active_power) 

## Plot the graph as png file

png("plot2.png", width=480, height=480) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off() 

