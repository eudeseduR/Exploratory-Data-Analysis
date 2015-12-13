setwd("~/Documents/Coursera/Data Science/04 - Exploratory Data Analysis/Project 1")

dataset <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)
View(dataset)

datefilter <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]
View(datefilter)

newdatetime <- strptime(paste(datefilter$Date, datefilter$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

plot(newdatetime, as.numeric(datefilter$Global_active_power), type="l", xlab="", ylab="Global Active Power")
plot(newdatetime, as.numeric(datefilter$Voltage), type="l", xlab="datetime", ylab="Voltage")

plot(newdatetime, as.numeric(datefilter$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(newdatetime, as.numeric(datefilter$Sub_metering_2), type="l", col="red")
lines(newdatetime, as.numeric(datefilter$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"))

plot(newdatetime, as.numeric(datefilter$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()