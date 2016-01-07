setwd("C:/Users/JEB/Desktop/Coursera")
file<-read.csv("household_power_consumption.txt",
               sep=";", na.strings="?")
dates<-subset(file, file$Date=="1/2/2007" | file$Date=="2/2/2007")
x<-paste(dates$Date, dates$Time)
newcol<-strptime(x, format="%d/%m/%Y %H:%M:%S")
png("./plot3.png", width = 480, height = 480)
plot(newcol, dates$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub metering")
lines(newcol, dates$Sub_metering_2, type="l", col="red")
lines(newcol, dates$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", 
      "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()