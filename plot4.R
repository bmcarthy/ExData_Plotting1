fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./exdata_data_household_power_consumption.zip", method="curl")

unzip("exdata_data_household_power_consumption.zip", unzip="internal")

infile <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.strings=c("?"), colClasses=c(rep("character",2),rep("numeric",7)))
subinfile <- subset(infile, infile$Date == "1/2/2007" | infile$Date == "2/2/2007")
subinfile$Time <- paste(subinfile$Date,subinfile$Time)
subinfile$Time <- strptime(subinfile$Time, "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2), cex.axis=.85, cex.lab=.85, mar=c(4,4,2.5,1))

plot (subinfile$Time, subinfile$Global_active_power, type="l",xlab="",ylab="Global Active Power")

plot (subinfile$Time, subinfile$Voltage, type="l",xlab="datetime",ylab="Voltage")
 
with (subinfile, plot (Time, Sub_metering_1, type="n",xlab="",ylab="Energy sub metering"))
with (subinfile, points (Time, Sub_metering_1, type="l"))
with (subinfile, points (Time, Sub_metering_2, type="l", col="red"))
with (subinfile, points (Time, Sub_metering_3, type="l", col="blue"))
legend("topright",text.width=80000, y.intersp=1.25, bty="n", lty=1, col = c("black", "red", "blue"), cex=.60, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot (subinfile$Time, subinfile$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png, width = 480, height = 480, file = "plot4.png") 
dev.off()
