#import data that was already filtered in plot1.R
datadt<-read.csv("./filtereddata.csv")
datadt$datetime<-as.POSIXct(paste(datadt$date_measured, datadt$time_measured),
                                        format="%Y-%m-%d %H:%M:%S")
png("plot4.png")
par(mfcol=c(2,2), mar=c(4,4,2,2))

#plot1
plot(datadt$datetime, datadt$Global_active_power, ylab="Global Active power (kilowatts)",
     xlab="", type="n", mgp=c(2,1,0))
             
lines(y=datadt$Global_active_power,x=datadt$datetime)
#plot2
plot(datadt$datetime, datadt$Sub_metering_1,
     ylab="Energy sub metering", xlab="",type="n")
lines(datadt$datetime, datadt$Sub_metering_1)
lines(datadt$datetime, datadt$Sub_metering_2, col="red")
lines(datadt$datetime, datadt$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"),bty="n", legend=c("Sub_metering_1",
                                                           "Sub_metering_2",
                                                           "Sub_metering_3"), xjust=1)
#plot3

plot(datadt$datetime, datadt$Voltage, ylab="Voltage",
     xlab="datetime", type="n", mgp=c(2,1,0))
lines(datadt$datetime, datadt$Voltage)

#plot4

plot(datadt$datetime, datadt$Global_reactive_power, ylab="Global Reactive Power (kilowatts)",
     xlab="datetime", type="n",mgp=c(2,1,0))
lines(datadt$datetime, datadt$Global_reactive_power)

dev.off()
