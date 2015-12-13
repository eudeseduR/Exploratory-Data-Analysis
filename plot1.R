setwd("~/Documents/Coursera/Data Science/04 - Exploratory Data Analysis/Project 1")

dataset <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)
View(dataset)

datefilter <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]
View(datefilter)

hist(as.numeric(datefilter$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()