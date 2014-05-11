data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=T,stringsAsFactors=F)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
feb07data<-subset(data,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
feb07data$datetime<-paste(feb07data$Date,feb07data$Time)
feb07data$datetime<-strptime(feb07data$datetime,"%Y-%m-%d %H:%M:%S")
png("plot4.png")
par(mfrow=c(2,2))

with(feb07data, plot(datetime,Global_active_power, xlab="",ylab="Global Active Power (kilowatts)",type="n"))
with(feb07data, lines(datetime,Global_active_power))

with(feb07data, plot(datetime,Voltage, xlab="datetime",ylab="Voltage",type="n"))
with(feb07data, lines(datetime,Voltage))

with(feb07data, plot(datetime,Sub_metering_1, xlab="",ylab="Energy sub metering",type="n"))
with(feb07data, lines(datetime,Sub_metering_1))
with(feb07data, lines(datetime,Sub_metering_2,col="red"))
with(feb07data, lines(datetime,Sub_metering_3,col="blue"))
legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(feb07data, plot(datetime,Global_reactive_power, xlab="datetime",ylab="Global_reactive_power",type="n"))
with(feb07data, lines(datetime,Global_reactive_power))
dev.off()