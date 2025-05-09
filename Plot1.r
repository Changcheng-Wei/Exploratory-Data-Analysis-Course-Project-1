# Coursera Data Science: Exploratory Data Analysis
# Course Project 1
# Plot 1
# The histogram is saved as "plot1.png" in the working directory.
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
getwd()
# load the data
data <- read.table(".\\household_power_consumption.txt", header = T,sep = ";", na.strings = "?")
# Convert the Date column to Date type
data$Date <- dmy(data$Date)
# Filter the data for the dates 2007-02-01 and 2007-02-02
filtered_data <- data %>%
  filter(Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")) %>%
  mutate(DateTime = dmy_hms(paste(Date, Time))) %>%
  select(-Date, -Time)
# Convert the Global_active_power column to numeric
filtered_data$Global_active_power <- as.numeric(filtered_data$Global_active_power)
# Create the histogram
png("plot1.png", width = 480, height = 480)
with (filtered_data, {
  hist(Global_active_power, 
       col = "red", 
       main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)", 
       ylab = "Frequency", 
       breaks = 50)
})
# Close the PNG device
dev.off()
