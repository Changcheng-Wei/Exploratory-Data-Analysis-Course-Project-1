# Coursera Data Science: Exploratory Data Analysis
# Course Project 1
# The plot is saved as "plot4.png" in the working directory.
# The plot shows the four plots in a 2x2 grid as required.
# The first plot shows the Global Active Power over time.
# The second plot shows the Voltage over time.
# The third plot shows the Energy sub metering over time with a legend.
# The fourth plot shows the Global Reactive Power over time.
# Plot 4
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
# Combine Date and Time into a single datetime column
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
# Convert the Sub_metering columns to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Convert the Global_active_power, Global_reactive_power, and Voltage columns to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)

#Create the scatterplot

par(mfrow = c(2, 2))
# Plot 1
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# Plot 2
plot(data$datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# Plot 3
plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")
# Plot 4
plot(data$datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
# Save the plot as a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480) 
# Close the PNG device
dev.off()
# Clean up
rm(data)

