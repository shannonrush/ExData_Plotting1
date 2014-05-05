## plot1.R 
##
## This script uses UC Irvine Machine Learning Repository 
## Individual household electric power consumption Data Set
## made available from the Coursera website for this course. 
## This data was downloaded on May 5, 2014 around 12pm Mountain Time
## and saved to the data directory in this repository. 
##
## This script uses the data from the dates 2007-02-01 and 2007-02-02 
## to create a histogram of Global Active Power (kilowatts) frequency
## and saves it as a PNG file with the name plot1.png
##
# Unzip the data file and read the data from the text file
unzip("data/power.zip", exdir="data")
data <- read.table("data/household_power_consumption.txt", header=T, sep=";", na.strings="?")

# Subset the two dates we want to explore
valid.dates <- c("1/2/2007", "2/2/2007")
power.data <- subset(data, Date %in% valid.dates)

# Open the PNG graphic device
png("plot1.png",type="quartz")

# Create the histogram
hist(power.data$Global_active_power, main="Global Active Power",
                                     xlab="Global Active Power (kilowatts)",
                                     col="red")

# Close the device and create the PNG file
dev.off()
