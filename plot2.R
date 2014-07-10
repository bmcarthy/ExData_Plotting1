fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./exdata_data_household_power_consumption.zip", method="curl")

unzip("exdata_data_household_power_consumption.zip", unzip="internal")

infile <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.strings=c("?"), colClasses=c(rep("character",2),rep("numeric",7)))
subinfile <- subset(infile, infile$Date == "1/2/2007" | infile$Date == "2/2/2007")
subinfile$Time <- paste(subinfile$Date,subinfile$Time)
subinfile$Time <- strptime(subinfile$Time, "%d/%m/%Y %H:%M:%S")

par(cex.axis=.7, cex.lab=.7)
plot (subinfile$Time, subinfile$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png, width = 480, height = 480, file = "plot2.png") 
dev.off()