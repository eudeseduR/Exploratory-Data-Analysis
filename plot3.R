setwd("~/Documents/Coursera/Data Science/04 - Exploratory Data Analysis/Project 1")

dataset <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)
View(dataset)

datefilter <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]
View(datefilter)

newdatetime <- strptime(paste(datefilter$Date, datefilter$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(newdatetime, as.numeric(datefilter$Sub_metering_1), type="l", xlab="", ylab="Energy Submetering")
lines(newdatetime, as.numeric(datefilter$Sub_metering_2), type="l", col="red")
lines(newdatetime, as.numeric(datefilter$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()