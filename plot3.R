setwd("~/R/exdata")
#load data
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
#convert Date column from factor to date class
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
#subset for 01-02-2007 and 02-02-2007
data<-subset(data, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"))
#change some classes and settings
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
data$datetime<-paste(data$Date, data$Time)
data$datetime<-strptime(data$datetime, "%Y-%m-%d %H:%M:%S")
backup<-Sys.getlocale('LC_TIME')
Sys.setlocale('LC_TIME', 'C')
#plot3
with(data, plot(datetime, Sub_metering_1, type="l",xlab="",ylab="Energy Sub Metering",cex.lab=0.8,cex.axis=0.8))
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5),col=c("black","red","blue"),cex=.7)
dev.copy(png, file="plot3.png",width=480,height=480)
dev.off()
#reset time settings
Sys.setlocale('LC_TIME', backup)
remove(backup)