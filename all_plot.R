setwd("./Coursera/DataScience Specialization/4-Exploratory Data Analysis/tarea1") 

datos <- read.table(file="household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?") 

sample <- datos[datos$Date %in% c("1/2/2007","2/2/2007"),]
date_time <-strptime(paste(sample$Date, sample$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
final_sample<- cbind(date_time, sample)

#plot 1
hist(final_sample$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png")
dev.off()

#plot 2
plot(final_sample$date_time, final_sample$Global_active_power, col="black",  type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()

#plot3
plot(final_sample$date_time, final_sample$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(final_sample$date_time, final_sample$Sub_metering_2, col="red")
lines(final_sample$date_time, final_sample$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")

dev.copy(png,file="plot3.png")
dev.off()

#plot4
par(mfrow=c(2,2))
plot(final_sample$date_time, final_sample$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(final_sample$date_time, final_sample$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(final_sample$date_time, final_sample$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(final_sample$date_time, final_sample$Sub_metering_2, type="l", col="red")
lines(final_sample$date_time, final_sample$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, bty="n", col=c("black","red","blue"))
plot(final_sample$date_time, final_sample$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,file="plot4.png")
dev.off()