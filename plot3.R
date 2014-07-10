fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./exdata_data_household_power_consumption.zip", method="curl")

unzip("exdata_data_household_power_consumption.zip", unzip="internal")

infile <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.strings=c("?"), colClasses=c(rep("character",2),rep("numeric",7)))
subinfile <- subset(infile, infile$Date == "1/2/2007" | infile$Date == "2/2/2007")
subinfile$Time <- paste(subinfile$Date,subinfile$Time)
subinfile$Time <- strptime(subinfile$Time, "%d/%m/%Y %H:%M:%S")

par(cex.axis=.85, cex.lab=.85)

with (subinfile, plot (Time, Sub_metering_1, type="n",xlab="",ylab="Energy sub metering"))
with (subinfile, points (Time, Sub_metering_1, type="l"))
with (subinfile, points (Time, Sub_metering_2, type="l", col="red"))
with (subinfile, points (Time, Sub_metering_3, type="l", col="blue"))
legend("topright",text.width=45000, y.intersp=1.25, lty=1, col = c("black", "red", "blue"), cex=.75, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, width = 480, height = 480, file = "plot3.png") 
dev.off()