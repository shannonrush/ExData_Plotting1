## plot2.R 
##
## This script uses UC Irvine Machine Learning Repository 
## Individual household electric power consumption Data Set
## made available from the Coursera website for this course. 
## This data was downloaded on May 5, 2014 around 12pm Mountain Time
## and saved to the data directory in this repository. 
##
## This script plots the Global Active Power over the dates 2007-02-01 and 2007-02-02 
## and saves it as a PNG file with the name plot2.png
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
png("plot2.png",type="quartz")

# Create the line plot
plot(power.data$datetime, power.data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Close the device and create the PNG file
dev.off()