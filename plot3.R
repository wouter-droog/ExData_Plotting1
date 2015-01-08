
library(sqldf)
library(lubridate)

# read data for 2 specified dates
data <- read.csv.sql("household_power_consumption.txt","select * from file where Date in ('1/2/2007','2/2/2007')", sep=";", header=T)

# create a DataTime variable of classes "POSIXlt" and "POSIXct" representing calendar dates and times
data$DateTime <- dmy(data$Date)+hms(data$Time)


# create plot on screen device
plot(Sub_metering_1 ~ DateTime, data, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"),lty="solid")


# copy the plot to the png device and save it
dev.copy(png, file= "plot3.png", width=480,height=480,units='px')

# close png device
x<-dev.off()







