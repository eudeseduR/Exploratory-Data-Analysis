setwd("~/Documents/Coursera/Data Science/04 - Exploratory Data Analysis/Project 1")

dataset <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)
View(dataset)

datefilter <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]
View(datefilter)

newdatetime <- strptime(paste(datefilter$Date, datefilter$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(newdatetime, as.numeric(datefilter$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()