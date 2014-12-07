# Read in the source data file

hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

# Add a new column in date / time based on the Date & Time columns
hpc$DateTime<-strptime(paste(hpc$Date, hpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Selecting the relevant data for the exercise
hpc2<-with(hpc, subset(hpc, hpc$DateTime >= as.POSIXct('2007-02-01 00:00:00')))
hpc3<-with(hpc2, subset(hpc2, hpc2$DateTime < as.POSIXct('2007-02-03 00:00:00')))


# Opening a png device to write the file
png(filename = "plot1.png", width = 480, height = 480)

# Drawing the histogram
hist(hpc3$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# Closing the png device
dev.off()




