download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./powerfile.zip")
unzip("./powerfile.zip")
electricPower <- read.table("./household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)
electricPower$Date <- strptime(paste(electricPower$Date,electricPower$Time), "%d/%m/%Y %H:%M:%S")
d1 <-strptime("2007/02/01", "%Y/%m/%d")
d2 <-strptime("2007/02/03", "%Y/%m/%d")
febElectricPower <- electricPower[electricPower$Date > d1 & electricPower$Date < d2,]
png("./plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(febElectricPower$Date, febElectricPower$Global_active_power, type="l" , main="", xlab="", col=1, ylab="Global Active Power")
plot(febElectricPower$Date, febElectricPower$Voltage, type="l" , main="", xlab="datetime", col=1, ylab="Voltage")

par(mar=c(4,4,4,4))
plot(febElectricPower$Date, febElectricPower$Sub_metering_1, type="l" , main="", xlab="", col=1, ylab="Energy sub metering")
lines(febElectricPower$Date, febElectricPower$Sub_metering_2, type="l" ,col=2 )
lines(febElectricPower$Date, febElectricPower$Sub_metering_3, type="l" ,col=4)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c(1,2,4) ,lty = 1)

plot(febElectricPower$Date, febElectricPower$Global_reactive_power, type="l" , main="", xlab="datetime", col=1, ylab="Global_Reactive_Power")

dev.off()
