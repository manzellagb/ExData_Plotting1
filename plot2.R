#import data that was already filtered in plot1.R
datadt<-read.csv("./filtereddata.csv")
datadt$datetime<-as.POSIXct(paste(datadt$date_measured, datadt$time_measured),
  
                                                      format="%Y-%m-%d %H:%M:%S")
png("plot2.png")
plot(datadt$datetime, datadt$Global_active_power, ylab="Global Active power (killowats)",
     xlab="", type="n")
lines(y=datadt$Global_active_power,x=datadt$datetime)

dev.off()
