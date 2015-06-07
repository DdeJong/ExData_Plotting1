setwd("~/R/exdata")
#load data
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
#convert Date column from factor to date class
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
#subset for 01-02-2007 and 02-02-2007
data<-subset(data, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"))
#plot1
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
with(data, hist(Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power",cex.lab=0.8,cex.axis=0.8))
dev.copy(png, file="plot1.png",width=480,height=480)
dev.off()