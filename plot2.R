### Using libraries necessary for the code ###
library(lubridate) ## manipulating dates ##
library(dplyr) ## manipulating datasets ##

### Downloading and unzipping relevant file ###

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileurl, destfile = "household_power_consumption.zip" , method = "auto")

unzip("household_power_consumption.zip" )

## Reading into a table ##

hpc <- read.table("household_power_consumption.txt" , header = TRUE, sep = ";", na.strings = "?") 

hpc <- filter(hpc,Date %in% c("1/2/2007" ,"2/2/2007" ))

## Converting date to date format and adding datetime ##
hpc$Date <- dmy(hpc$Date)
hpc$datetime <- ymd_hms(paste(hpc$Date,hpc$Time))


#### Plot 2 ####

png("Plot 2.png") ### Default 480 X 480 pixels ###

with(hpc, plot(datetime, Global_active_power, xlab = "" , ylab = "Global Active Power (kilowatts)" , type = "l" ))

dev.off()

