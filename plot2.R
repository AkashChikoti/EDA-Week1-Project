# Set the working directory to the folder where you are working and load the dependent libraries
setwd("C:/Users/Abhinav/Desktop/Data Science/Exploratory Data Analysis")
library(lubridate)

# Unzipping the downloaded file
unzip("exdata_data_household_power_consumption.zip")

# Reading the data into R workspace
housePowerConsume <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", comment.char = "")

# Creating a new column DateTime of date class using Date and Time columns
housePowerConsume$DateTime <- dmy_hms(paste(housePowerConsume$Date,housePowerConsume$Time,sep = " "))

# Subseting the data for the days 1st and 2nd Feb of 2007
housePowerConsume <- subset(housePowerConsume, DateTime >= as.Date("2007-02-01") & DateTime < as.Date("2007-02-03"))

# Loading the graphics device PNG (default width and height is 480 pixels)
png(filename = "plot2.png")

# Plotting the line chart
plot(x = housePowerConsume$DateTime, y = housePowerConsume$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Closing graphics device
dev.off()