# Install necessary libraries (if not already installed)
install.packages("tidyverse")
install.packages("lubridate")
install.packages("zoo")

# Load libraries
library(tidyverse)
library(lubridate)
library(zoo)

# Data Preparation:
# Convert the Date column to Date type
bitcoin_data$Date <- as.Date(bitcoin_data$Date, format = "%m/%d/%Y")

# Create a Price Change Percentage column
bitcoin_data$Price_Change_Percent <- (bitcoin_data$Close - bitcoin_data$Open) / bitcoin_data$Open * 100

# Split the data into training (80%) and testing (20%) sets
set.seed(42)  # for reproducibility
train_index <- sample(1:nrow(bitcoin_data), 0.8 * nrow(bitcoin_data))
train_data <- bitcoin_data[train_index, ]
test_data <- bitcoin_data[-train_index, ]

# Install the 'zoo' package if not already installed
if (!require(zoo)) {
  install.packages("zoo")
  library(zoo)
}

# Now you can use rollmean
test_data$moving_average_30 <- rollmean(test_data$Close, 30, fill = NA, align = "right")

# Assuming `test_data` is your dataset

# Add moving average and lag features
test_data$moving_average_30 <- rollmean(test_data$Close, 30, fill = NA, align = "right")
test_data$lag_close_1 <- lag(test_data$Close, 1)  # 1-day lag of Close price
test_data$lag_close_5 <- lag(test_data$Close, 5)  # 5-day lag of Close price
test_data$lag_close_7 <- lag(test_data$Close, 7)  # 7-day lag of Close price

# Remove rows with NA values (after lag calculation)
test_data <- na.omit(test_data)

# Split data into train and test sets (80% train, 20% test)
train_size <- floor(0.8 * nrow(test_data))
train_data <- test_data[1:train_size, ]
test_data <- test_data[(train_size + 1):nrow(test_data), ]