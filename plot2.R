setwd("C:/Users/JEB/Desktop/Coursera")
file<-read.csv("household_power_consumption.txt",
               sep=";", na.strings="?")
dates<-subset(file, file$Date=="1/2/2007" | file$Date=="2/2/2007")
x<-paste(dates$Date, dates$Time)
newcol<-strptime(x, format="%d/%m/%Y %H:%M:%S")
plot(newcol, dates$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()