setwd("./Coursera/DataScience Specialization/4-Exploratory Data Analysis/tarea1") 

datos <- read.table(file="household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?") 

sample <- datos[datos$Date %in% c("1/2/2007","2/2/2007"),]
date_time <-strptime(paste(sample$Date, sample$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
final_sample<- cbind(date_time, sample)


#plot 2
plot(final_sample$date_time, final_sample$Global_active_power, col="black",  type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()
