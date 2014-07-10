fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./exdata_data_household_power_consumption.zip", method="curl")

unzip("exdata_data_household_power_consumption.zip", unzip="internal")

infile <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.strings=c("?"), colClasses=c(rep("character",2),rep("numeric",7)))
subinfile <- subset(infile, infile$Date == "1/2/2007" | infile$Date == "2/2/2007")

par(cex.main=.85, cex.axis=.7, cex.lab=.7)
hist(subinfile$Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png, width = 480, height = 480, file = "plot1.png") 
dev.off()