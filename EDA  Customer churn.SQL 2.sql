Step 1: Total Customers
Business Question

How many customers are currently subscribed to the company services?

Business Objective

Determine the total customer base available for analysis.

SELECT COUNT(*) AS Total_Customers
FROM Stg_Customer_Churn;

 Observation

The company currently has 7,043 active customer records available for analysis.

 Business Impact

Understanding the total customer base is essential for calculating KPIs such as churn rate, customer lifetime value, and revenue.

 Recommended Action

Use this customer count as the baseline for all future business metrics and performance reports.

Step 2: Churn Distribution
Business Question

How many customers stayed and how many churned?

Business Objective

Understand the distribution of retained and churned customers.

SELECT
Churn,
COUNT(*) AS Customers
FROM Stg_Customer_Churn
GROUP BY Churn;

Observation

The results show the number of customers who remained with the company versus those who discontinued the service.

Business Impact

A large churn population directly reduces recurring revenue and increases customer acquisition costs.

Recommended Action

Prioritise analysing churned customers to identify common characteristics and improve retention strategies.

Step 3: Customer Churn Rate
Business Question

What percentage of customers have churned?

Business Objective

Measure the overall churn rate.

SELECT
COUNT(*) AS TotalCustomers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS ChurnCustomers,
ROUND(
100.0*SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),2
) AS ChurnRate
FROM Stg_Customer_Churn;

Observation

Approximately 26.5% of customers have churned.

 Business Impact

A churn rate above 20% indicates a significant loss of recurring revenue and may signal customer satisfaction or service issues.

 Recommended Action

Develop customer retention programmes focusing on high-risk customer groups identified in later analyses.

Step 4: Gender Distribution
Business Question

How is the customer base distributed by gender?

Business Objective

Understand customer demographics.

SELECT
gender,
COUNT(*) AS Customers
FROM Stg_Customer_Churn
GROUP BY gender;

 Observation

The customer base is distributed between male and female customers.

 Business Impact

Balanced demographics indicate broad market reach, while an imbalance may reveal opportunities for targeted marketing.

 Recommended Action

Use demographic insights to personalise campaigns and customer engagement strategies.

Step 5: Senior Citizen Distribution
Business Question

What proportion of customers are senior citizens?

Business Objective

Analyse customer age segments.

SELECT
SeniorCitizen,
COUNT(*) AS Customers
FROM Stg_Customer_Churn
GROUP BY SeniorCitizen;

 Observation

The dataset categorises customers into senior citizens and non-senior citizens.

 Business Impact

Different age groups may have different service expectations and churn behaviours.

 Recommended Action

Develop tailored products and support services for senior citizens where appropriate.

Step 6: Contract Distribution
Business Question

Which contract type is most popular?

Business Objective

Identify customer contract preferences.

SELECT
Contract,
COUNT(*) AS Customers
FROM Stg_Customer_Churn
GROUP BY Contract
ORDER BY Customers DESC;

 Observation

Month-to-month contracts typically account for the largest customer segment.

 Business Impact

Customers on short-term contracts are generally more likely to switch providers.

 Recommended Action

Encourage customers to move to one-year or two-year contracts through loyalty incentives and promotional pricing.

Step 7: Internet Service Distribution
Business Question

Which internet service has the highest customer adoption?

Business Objective

Understand service popularity.

SELECT
InternetService,
COUNT(*) AS Customers
FROM Stg_Customer_Churn
GROUP BY InternetService
ORDER BY Customers DESC;

 Observation

The analysis identifies the most widely used internet service.

 Business Impact

The largest service segment has the greatest influence on customer satisfaction and business revenue.

Recommended Action

Focus investment on maintaining and improving the quality of the most popular service.

Step 8: Payment Method Distribution
Business Question

Which payment methods do customers prefer?

Business Objective

Understand customer payment behaviour.

SELECT
PaymentMethod,
COUNT(*) AS Customers
FROM Stg_Customer_Churn
GROUP BY PaymentMethod
ORDER BY Customers DESC;

Observation

Customers use multiple payment methods, with some being significantly more popular.

 Business Impact

Payment convenience can influence customer satisfaction and renewal behaviour.

 Recommended Action

Promote secure automatic payment methods through incentives and simplified enrolment.

Step 9: Revenue by Contract
Business Question

Which contract type generates the most revenue?

Business Objective

Identify the company highest-value contract segment.

SELECT
Contract,
SUM(TotalCharges) AS Revenue
FROM Stg_Customer_Churn
GROUP BY Contract
ORDER BY Revenue DESC;

 Observation

Long-term contracts generally generate more lifetime revenue than short-term contracts.

 Business Impact

Revenue concentration within long-term contracts highlights the value of customer retention.

 Recommended Action

Increase conversion of month-to-month customers into annual contracts.

Step 10: Churn by Contract
Business Question

Which contract type experiences the highest churn?

Business Objective

Identify the most vulnerable customer segment.

SELECT
Contract,
Churn,
COUNT(*) AS Customers
FROM Stg_Customer_Churn
GROUP BY Contract, Churn;

Observation

Month-to-month customers typically have the highest churn levels.

Business Impact

Short-term customers represent the greatest retention risk.

Recommended Action

Launch proactive retention campaigns targeting month-to-month subscribers before contract renewal.

Step 11: Average Monthly Charges
Business Question

What is the average monthly charge paid by customers?

Business Objective

Determine the average monthly revenue generated per customer.

SELECT
ROUND(AVG(MonthlyCharges),2) AS AvgMonthlyCharges
FROM Stg_Customer_Churn;

 Observation

The query calculates the average monthly subscription fee paid by customers.

 Business Impact

Understanding the average monthly charge helps evaluate pricing strategies and estimate recurring monthly revenue.

 Recommended Action

Compare this average across different customer segments (contract type, internet service, tenure) to identify opportunities for 
pricing optimisation.

Step 12: Average Total Charges
Business Question

What is the average lifetime revenue generated per customer?

Business Objective

Measure the average customer lifetime value based on total charges.

SELECT
ROUND(AVG(TotalCharges),2) AS AvgTotalCharges
FROM Stg_Customer_Churn;

 Observation

This query measures the average amount each customer has spent since joining the company.

 Business Impact

Customers with higher lifetime spending contribute significantly to business profitability.

 Recommended Action

Identify characteristics of high-value customers and create loyalty programmes to retain them.

Step 13: Average Customer Tenure
Business Question

How long do customers stay with the company on average?

Business Objective

Measure average customer loyalty.

SELECT
ROUND(AVG(tenure),2) AS AvgTenure
FROM Stg_Customer_Churn;

 Observation

The average tenure indicates how long customers typically remain subscribed.

 Business Impact

Longer customer relationships generally lead to higher lifetime revenue and lower acquisition costs.

 Recommended Action

Develop retention strategies for customers with lower tenure to increase long-term loyalty.

Step 14: Revenue by Internet Service
Business Question

Which internet service generates the highest revenue?

Business Objective

Compare revenue generated across internet service categories.

SELECT
InternetService,
ROUND(SUM(TotalCharges),2) AS TotalRevenue
FROM Stg_Customer_Churn
GROUP BY InternetService
ORDER BY TotalRevenue DESC;

Step 15: Average Monthly Charges by Contract Type
Business Question

How do monthly charges vary across different contract types?

Business Objective

Compare average monthly charges between contract plans.

SELECT
Contract,
ROUND(AVG(MonthlyCharges),2) AS AvgMonthlyCharges
FROM Stg_Customer_Churn
GROUP BY Contract
ORDER BY AvgMonthlyCharges DESC;

 Observation

The analysis compares the average monthly subscription fee across different contract types.

 Business Impact

Differences in monthly charges help explain customer purchasing behaviour and revenue generation across contract plans.

 Recommended Action

If long-term contracts have lower monthly charges, highlight the savings in marketing campaigns to encourage customers to switch
from month-to-month plans.