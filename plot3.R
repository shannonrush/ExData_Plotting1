## plot3.R 
##
## This script uses UC Irvine Machine Learning Repository 
## Individual household electric power consumption Data Set
## made available from the Coursera website for this course. 
## This data was downloaded on May 5, 2014 around 12pm Mountain Time
## and saved to the data directory in this repository. 
##
## This script plots the Energy sub metering over the dates 2007-02-01 and 2007-02-02 
## and saves it as a PNG file with the name plot3.png
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
png("plot3.png",type="quartz")

# Create the plot for Sub_metering_1 
plot(power.data$datetime, power.data$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab="")

# Add Sub_metering_2 data
lines(power.data$datetime, power.data$Sub_metering_2, type="l", col="red")

# Add Sub_metering_3 data
lines(power.data$datetime, power.data$Sub_metering_3, type="l", col="blue")

# Add Legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=1)

# Close the device and create the PNG file
dev.off()