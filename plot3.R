#import data that was already filtered in plot1.R
datadt<-read.csv("./filtereddata.csv")
datadt$datetime<-as.POSIXct(paste(datadt$date_measured, datadt$time_measured),
                                        format="%Y-%m-%d %H:%M:%S")
png("plot3.png")

plot(datadt$datetime, datadt$Sub_metering_1,
     ylab="Energy sub metering", xlab="",type="n")
lines(datadt$datetime, datadt$Sub_metering_1)
lines(datadt$datetime, datadt$Sub_metering_2, col="red")
lines(datadt$datetime, datadt$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1",
                                                           "Sub_metering_2",
                                                           "Sub_metering_3"))
dev.off()