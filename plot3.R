setwd("./Coursera/DataScience Specialization/4-Exploratory Data Analysis/tarea1") 

datos <- read.table(file="household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?") 

sample <- datos[datos$Date %in% c("1/2/2007","2/2/2007"),]
date_time <-strptime(paste(sample$Date, sample$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
final_sample<- cbind(date_time, sample)


#plot3
plot(final_sample$date_time, final_sample$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(final_sample$date_time, final_sample$Sub_metering_2, col="red")
lines(final_sample$date_time, final_sample$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")

dev.copy(png,file="plot3.png")
dev.off()

