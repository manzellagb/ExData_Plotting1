#import data
datadt<-read.table(file="./household_power_consumption.txt", sep=";", header=TRUE,
                  na.strings="?", stringsAsFactors = FALSE)
#change column names because it was giving me problems
colnames(datadt)[1:2]<-c("date_measured", "time_measured")
#convert it to a df
datadt<-as.data.frame(datadt)
#combine date and time objects into a datetime column
datadt$date_measured<-as.Date(datadt$date_measured, format="%d/%m/%Y")
datadt$datetime<-as.POSIXct(paste(datadt$date_measured, datadt$time_measured),
                            format="%Y-%m-%d %H:%M:%S")
newdata<-datadt[datadt$datetime >"2007-02-01" & datadt$datetime<"2007-02-03",]
newdata<-na.omit(newdata)
write.csv(newdata, "filtereddata.csv")

#now can start plotting!!
png("plot1.png")

#plot 1 is to create a histogram of global active power
with(newdata,
hist(Global_active_power, col="red",
     main="Global Active Power", xlab="Global active power (killowatts)",
     ylab="Frequency"))


dev.off()
