# Coursera Data Science: Exploratory Data Analysis
# Course Project 1
# The scatterplot shows the energy sub metering for the specified dates.
# The x-axis represents the DateTime, and the y-axis represents the energy sub metering.
# The lines are colored in black, red, and blue for Sub_metering_1, Sub_metering_2, and Sub_metering_3 respectively.
# The legend is placed in the top right corner of the plot.
# The scatterplot is created with lines connecting the points to show the trend over time.
# The x-axis label is empty, and the y-axis label is "Energy sub metering".
# The scatterplot is created with the specified colors and line types for each sub metering.
# The scatterplot is saved as a PNG file with a width and height of 480 pixels.
# Plot 3
# Load necessary libraries
library(dplyr)
library(ggplot2)
library(lubridate)
library(tidyr)
# load the data
data <- read.table(".\\household_power_consumption.txt", header = T,sep = ";", na.strings = "?")
summary(data)
# Convert the Date column to Date type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# Filter the data for the specified dates
data <- data %>% filter(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Check the structure of the data
str(data)

# Convert the Time column to POSIXct type
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
# Create the scatterplot
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
# Save the scatterplot as a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
# Close the graphics device
dev.off()
# Clean up
rm(data)