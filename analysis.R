# Load necessary libraries
library(tidyverse)
library(lubridate)
library(caret)

# Read in the Bitcoin data
bitcoin_data <- read_csv("Bitcoin Data/bitcoin_data.csv", 
                         col_types = cols(Date = col_date(format = "%m/%d/%Y"), 
                                          Open = col_number(), High = col_number(), 
                                          Low = col_number(), Close = col_number(), 
                                          `Adj Close` = col_number(), Volume = col_number(), 
                                          Daily_Range = col_number(), Price_Change = col_number()))

# Create new features: Percentage change and lag variables
bitcoin_data <- bitcoin_data %>%
  mutate(
    Percentage_Change = (Close - lag(Close)) / lag(Close) * 100,  # Calculate percentage change
    Volatility = High - Low,  # Calculate daily volatility
    Lag_Close = lag(Close, 1),  # Lagged closing price
    Lag_Volume = lag(Volume, 1) # Lagged volume
  ) %>%
  drop_na()  # Remove rows with NA values (due to lag)

# Linear Regression Model: Predict Percentage Change using Volume and Daily Range
lm_model <- lm(Percentage_Change ~ Volume + Daily_Range + Lag_Close + Lag_Volume, data = bitcoin_data)

# Print summary of linear model
summary(lm_model)

# Diagnostic Plots for Linear Regression
# Residual plot
plot(lm_model$residuals, main = "Residuals Plot", ylab = "Residuals", xlab = "Index")
abline(h = 0, col = "red")

# Histogram of residuals
hist(lm_model$residuals, main = "Histogram of Residuals", xlab = "Residuals", col = "lightblue")

# Q-Q plot of residuals
qqnorm(lm_model$residuals, main = "Q-Q Plot of Residuals")
qqline(lm_model$residuals, col = "red")

# ANOVA Model: Check if Volatility impacts Percentage Change
bitcoin_data <- bitcoin_data %>%
  mutate(Volatility_Category = ifelse(Volatility > median(Volatility), "High", "Low"))

anova_model <- aov(Percentage_Change ~ Volatility_Category, data = bitcoin_data)
summary(anova_model)

# Boxplot to visualize Percentage Change by Volatility Category
ggplot(bitcoin_data, aes(x = Volatility_Category, y = Percentage_Change)) +
  geom_boxplot() +
  labs(title = "Percentage Change by Volatility Category", x = "Volatility Category", y = "Percentage Change") +
  theme_minimal()

# Visualize Actual vs Predicted for Linear Model
ggplot(bitcoin_data, aes(x = Percentage_Change, y = lm_model$fitted.values)) +
  geom_point() +
  labs(title = "Actual vs Predicted Percentage Change", 
       x = "Actual Percentage Change", y = "Predicted Percentage Change") +
  theme_minimal()

# Save cleaned dataset for Tableau use
write_csv(bitcoin_data, "bitcoin_data_cleaned.csv")

# Additional visualizations: Plotting Bitcoin Price and Volume over Time
ggplot(bitcoin_data, aes(x = Date)) +
  geom_line(aes(y = Close, color = "Price"), size = 1) +
  geom_line(aes(y = Volume / max(Volume) * max(Close), color = "Volume"), size = 1, linetype = "dashed") +
  labs(title = "Bitcoin Price and Volume Over Time", 
       y = "Price (left) / Volume (right)", x = "Date") +
  scale_color_manual(values = c("Price" = "blue", "Volume" = "red")) +
  theme_minimal()

lm_model_interaction <- lm(Percentage_Change ~ Volume * Daily_Range + Lag_Close + Lag_Volume, data = bitcoin_data)
summary(lm_model_interaction)


write.csv(bitcoin_data, "bitcoin_data_cleaned.csv", row.names = FALSE)
