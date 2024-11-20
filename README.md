# **Bitcoin Price Analysis and Predictive Model**

## **Table of Contents**

1. [Introduction](#Introduction)
2. [ASK: Understanding the Problem](#ASK-Understanding-the-Problem)
3. [PREPARE: Data Collection and Cleaning](#PREPARE-Data-Collection-and-Cleaning)
4. [PROCESS: Exploratory Data Analysis (EDA)](#PROCESS-Exploratory-Data-Analysis-EDA)
5. [PROCESS: Building the Predictive Model](#PROCESS-Building-the-Predictive-Model)
6. [SHARE: Model Performance and Evaluation](#SHARE-Model-Performance-and-Evaluation)
7. [ACT: What's Next?](#ACT-Whats-Next)
8. [Reflection](#Reflection)
9. [Tools Used](#Tools-Used)
10. [Conclusion](#Conclusion)

---

## **Introduction**

As a Junior Data Analyst with a keen interest in cryptocurrency, I sought to understand the factors influencing Bitcoin's price movements. This project involved analyzing Bitcoin’s price data from 2014 to 2022 and developing a predictive model to forecast future closing prices. 

Leveraging **Google Sheets**, **R**, and **Tableau**, I analyzed historical Bitcoin price data to uncover insights and create a predictive model. Below, I break down the steps I followed using the **ASK, PREPARE, PROCESS, SHARE, and ACT** framework to guide the analysis.

---

## **ASK: Understanding the Problem**

The primary goal of this project was to predict Bitcoin’s future price movements based on historical data. More specifically, I aimed to predict the **closing price** of Bitcoin by considering various features such as the **opening price**, **high price**, **low price**, **volume**, and **percentage change** between the opening and closing prices.

I focused on answering the following key questions:
- **What factors influence Bitcoin's price movements?**
- **Can historical data provide enough insight to build a reliable predictive model?**
- **What external factors, such as market events or global crises, could impact Bitcoin’s volatility and price trends?**

By addressing these questions, I hoped to better understand the dynamics behind Bitcoin’s pricing behavior and its potential for future predictions.

---

## **PREPARE: Data Collection and Cleaning**

### **Data Sources**
I gathered the dataset from Kaggle, which provides a comprehensive collection of Bitcoin’s daily prices (Open, High, Low, Close) and other relevant metrics spanning from 2014 to 2022. This dataset also included trading volumes, which provided additional context for understanding price changes.

### **Data Cleaning**
The data was cleaned and preprocessed to ensure it was in a usable format for analysis:
1. **Removing Missing Values**: I ensured that the dataset was free from any null or missing values, maintaining data integrity.
2. **Feature Creation**: I derived new features such as **Price Change %** to represent the daily change between opening and closing prices, which would offer a better indication of price volatility.
3. **Data Splitting**: The dataset was divided into:
   - **Training Set (80%)**: Used for training the predictive model.
   - **Testing Set (20%)**: Used to evaluate the performance of the model.

This preprocessing step ensured that I had a clean and representative dataset to work with.

---

## **PROCESS: Exploratory Data Analysis (EDA)**

To uncover insights from the Bitcoin price data, I used **Tableau** for visual exploration. EDA helped me better understand trends, patterns, and key factors influencing Bitcoin's price movements. 

### **Key Insights from EDA:**
1. **Bitcoin’s Average Closing Price (2017-2021)**:
   The analysis revealed that between 2017 and 2021, Bitcoin experienced its most significant price surges. The surge during **2017**, peaking close to **$20,000**, and **2020-2021**, where Bitcoin touched new all-time highs, demonstrated how Bitcoin was gaining more mainstream recognition and adoption.

   **Insight**: Bitcoin's rapid price increase from 2017 to 2021 could be attributed to rising institutional investments, the growing interest in decentralized finance (DeFi), and more widespread media coverage. This was the "golden period" for Bitcoin, showcasing its potential as both a store of value and a speculative asset.

   **Chart 1: Bitcoin Price Surge (2017-2021)**  
   ![bitcoin price and volume over time_update](https://github.com/user-attachments/assets/01161255-ba7b-4f61-ad44-f9c4fca430cf)

2. **Price Change Percentage**:
   One of the most noticeable patterns was Bitcoin’s **volatility**, particularly during the years **2017-2021**. Bitcoin's **Price Change %** chart exhibited dramatic spikes in price during these years, followed by steep corrections. This volatility could often be attributed to external events and market sentiment.

   **Insight**: Such volatility often correlates with speculative bubbles and market corrections, especially during high hype periods (e.g., 2017 bull run) and when major economic events occurred, such as the **COVID-19 pandemic** in 2020.

   **Chart 2: Daily Price Change Percentage**  
   ![Bitcoin Daily Range 2014-2022 (2)](https://github.com/user-attachments/assets/e1294e56-874b-428e-bf8d-e1de19510dc5)

---

## **PROCESS: Building the Predictive Model**

I built a **Linear Regression** model in **R** to predict Bitcoin’s closing price based on the features identified earlier: **Opening price**, **High price**, **Low price**, **Volume**, and **Price Change %**.

### **Model Setup**:
1. **Data Splitting**: I split the data into training and testing sets to train and evaluate the model’s performance.
2. **Model Training**: The model was trained using the training set (80% of the data), and various regression techniques were employed to predict Bitcoin’s closing price.
3. **Model Evaluation**: The model’s performance was evaluated using metrics like **Mean Absolute Error (MAE)** and **Root Mean Squared Error (RMSE)**, which gave insight into the accuracy of the predictions.
   
![actual vs predicted close prices](https://github.com/user-attachments/assets/108817a8-0680-4396-85bb-5ef21d3ff31f)

---

## **SHARE: Model Performance and Evaluation**

### **Model Results**:
The model provided a reasonable approximation, though there was still significant room for improvement:
- **Mean Absolute Error (MAE)**: The model’s predictions were off by **$171.16** on average.
- **Root Mean Squared Error (RMSE)**: The RMSE was **$360.34**, indicating that while the model performed decently, there were instances where the predictions were significantly off.

![Actual vs Predicted Closing Prices](https://github.com/user-attachments/assets/ef22865c-5714-448e-8e3d-8a123dcdb8c0)  
*Chart 4: Actual vs Predicted Closing Prices*  
*This chart compares the predicted Bitcoin closing prices to actual closing prices for the test dataset.*

### **Tableau Dashboard**:
The interactive **Tableau dashboard** helped visualize the key trends and predictions. The dashboard included:
- Bitcoin’s historical price trends.
- Key events that influenced price movements, such as **COVID-19** and the **rise of Ethereum** and other cryptocurrencies.
- The model’s predictions compared to actual closing prices.

![Bitcoin_Dashboard](https://github.com/user-attachments/assets/6da64ade-0917-499b-be40-702e27d13671)  
*Chart 5: Tableau Dashboard*  
*The dashboard visualizes trends and compares the actual and predicted Bitcoin closing prices over time.*

---

## **ACT: What's Next?**

### **Future Improvements**:
While the linear regression model provided a reasonable starting point, there are several avenues for further improvement:
1. **Neural Networks**: Given Bitcoin’s volatile nature, a **Neural Network** could better capture non-linear relationships and more complex patterns within the data.
2. **Random Forest or XGBoost**: These ensemble methods might help in modeling feature interactions and improve predictive accuracy by capturing both linear and non-linear patterns.

### **External Factors**:
Additionally, the rise of other cryptocurrencies like **Ethereum** and the growing adoption of **Decentralized Finance (DeFi)** could have long-term impacts on Bitcoin’s dominance and price. Events like **government regulations** and **global financial crises** (e.g., the COVID-19 pandemic) will likely continue to influence Bitcoin’s market behavior and must be considered in future models.

---

## **Reflection**

### **Key Learnings**:
This project allowed me to dive deeper into Bitcoin’s price behavior, combining my interest in cryptocurrency with my analytical skills. I learned how to clean and preprocess data, build predictive models, and interpret complex.
