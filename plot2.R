setwd("~/R/exdata")
#load data
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
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
#plot2
with(data, plot(datetime, Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)",cex.lab=0.8,cex.axis=0.8))
dev.copy(png, file="plot2.png",width=480,height=480)
dev.off()
#reset time settings
Sys.setlocale('LC_TIME', backup)
remove(backup)