# Coursera Data Science: Exploratory Data Analysis
# Course Project 1
# Plot 2
# The histogram is saved as "plot2.png" in the working directory.
# The histogram shows the distribution of Global Active Power for the specified dates.
# The x-axis represents the Global Active Power in kilowatts, and the y-axis represents the frequency of occurrences.
# The histogram is colored in red, and the title is "Global Active Power".
# The x-axis label is "Global Active Power (kilowatts)", and the y-axis label is "Frequency".
# The histogram is created with 50 breaks to show the distribution of the data.
# Load necessary libraries
library(dplyr)
library(ggplot2)
library(lubridate)
library(tidyr)
# load the data
data <- read.table(".\\household_power_consumption.txt", header = T,sep = ";", na.strings = "?")
# Convert the Date column to Date type
data$Date <- dmy(data$Date)
# Filter the data for the specified dates
data <- data %>% filter(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
# Convert the Time column to POSIXct type
data$Time <- hms(data$Time)
# Combine Date and Time columns into a single DateTime column
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
# Create the histogram
hist(data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "red", 
     breaks = 50)
# Save the histogram as a PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
# Close the graphics device

