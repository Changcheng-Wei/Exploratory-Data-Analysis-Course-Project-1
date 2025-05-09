# Coursera Data Science: Exploratory Data Analysis
# Course Project 1
# Plot 3
# Load necessary libraries
library(dplyr)
library(ggplot2)
library(lubridate)
library(tidyr)
# load the data
data <- read.table(".\\household_power_consumption.txt", header = T,sep = ";", na.strings = "?")
# Convert the Date column to Date type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# Filter the data for the specified dates
data <- data %>% filter(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Convert the Time column to POSIXct type
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
data$DateTime
# Convert Sub_metering columns to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
summary(data)
# Create the scatterplot
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
# Save the scatterplot as a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()