# Read in the source data file

hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

# Add a new column in date / time based on the Date & Time columns
hpc$DateTime<-strptime(paste(hpc$Date, hpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Selecting the relevant data for the exercise
hpc2<-with(hpc, subset(hpc, hpc$DateTime >= as.POSIXct('2007-02-01 00:00:00')))
hpc3<-with(hpc2, subset(hpc2, hpc2$DateTime < as.POSIXct('2007-02-03 00:00:00')))


# Opening a png device to write the file
png(filename = "plot4.png", width = 480, height = 480)

# Drawing the histogram
#hist(hpc3$Global_active_power, main = "Global Active Power", 
#     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# Drawing the plots
par(mfrow=c(2,2)) # 2x2 matrix of plots

#plot #1
plot(hpc3$DateTime, hpc3$Global_active_power, type="l", xlab = "" ,ylab = "Global Active Power")

#plot #2
plot(hpc3$DateTime, hpc3$Voltage, type="l", xlab = "datetime" ,ylab = "Voltage")

#plot #3
plot(hpc3$DateTime, hpc3$Sub_metering_1, type="l", xlab = "" ,ylab = "Energy sub metering")
par(new="T")
plot(hpc3$DateTime, hpc3$Sub_metering_2, type="l", col = "red", ylim=c(0,40), xlab="", ylab="", yaxt="n")
par(new="T")
plot(hpc3$DateTime, hpc3$Sub_metering_3, type="l", col = "blue", ylim=c(0,40), xlab="", ylab="", yaxt="n")
legend("topright", bty = "n", lty=c(1,1),col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot #4
plot(hpc3$DateTime, hpc3$Global_reactive_power, type="l", xlab = "datetime" ,ylab = "Global_reactive_power")

# Closing the png device
dev.off()







