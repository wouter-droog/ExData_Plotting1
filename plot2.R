
library(sqldf)
library(lubridate)

# read data for 2 specified dates
data <- read.csv.sql("household_power_consumption.txt","select * from file where Date in ('1/2/2007','2/2/2007')", sep=";", header=T)

# create a DataTime variable of classes "POSIXlt" and "POSIXct" representing calendar dates and times
data$DateTime <- dmy(data$Date)+hms(data$Time)


# create plot on screen device
plot(Global_active_power ~ DateTime, data, type = "l", xlab="", ylab="Global Active Power (kilowatts)")


# copy the plot to the png device and save it
dev.copy(png, file= "plot2.png", width=480,height=480,units='px')
# close png device
x<-dev.off()


