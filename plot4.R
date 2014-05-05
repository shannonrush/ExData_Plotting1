## plot4.R 
##
## This script uses UC Irvine Machine Learning Repository 
## Individual household electric power consumption Data Set
## made available from the Coursera website for this course. 
## This data was downloaded on May 5, 2014 around 12pm Mountain Time
## and saved to the data directory in this repository.
##
## This script creates the following 4 plots and saves them as a grid
## in a PNG file called plot4.png:
## Global Active Power over time
## Voltage over time
## Energy sub metering over time
## Global reactive power over time
##
# Unzip the data file and read the data from the text file
unzip("data/power.zip", exdir="data")
data <- read.table("data/household_power_consumption.txt", header=T, 
                   sep=";", 
                   na.strings="?")

# Subset the two dates we want to explore
valid.dates <- c("1/2/2007", "2/2/2007")
power.data <- subset(data, Date %in% valid.dates)

# Create a new datetime variable
power.data$datetime <- paste(power.data$Date, power.data$Time)

# Convert the datetime string to Date
power.data$datetime <- strptime(power.data$datetime, "%d/%m/%Y %R")

# Open the PNG graphic device
png("plot4.png",type="quartz")

# Set the plot grid as 2 rows and 2 columns 
par(mfrow=(c(2,2)))

# Create top left plot: Global Active Power over time
plot(power.data$datetime, power.data$Global_active_power, type="l",
     ylab="Global Active Power", xlab="")

# Create top right plot: Voltage over time
plot(power.data$datetime, power.data$Voltage, type="l",
     ylab="Voltage", xlab="datetime")

# Create bottom left plot: Energy sub metering over time
#
# Create the plot for Sub_metering_1 
plot(power.data$datetime, power.data$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab="")

# Add Sub_metering_2 data
lines(power.data$datetime, power.data$Sub_metering_2, type="l", col="red")

# Add Sub_metering_3 data
lines(power.data$datetime, power.data$Sub_metering_3, type="l", col="blue")

# Add Legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=1, bty="n")

# Create bottom right plot: Global reactive power over time
plot(power.data$datetime, power.data$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab="datetime")

# Close the device and create the PNG file
dev.off()