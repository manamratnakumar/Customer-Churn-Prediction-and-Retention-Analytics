Step 1: Contract Type with Highest Churn Rate
Business Question

Which contract type experiences the highest customer churn rate?

Business Objective

Identify the contract plans most vulnerable to customer churn so that targeted retention strategies can be developed.

SELECT
    Contract,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnCustomers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS ChurnRate
FROM Stg_Customer_Churn
GROUP BY Contract
ORDER BY ChurnRate DESC;

 Observation

The query compares churn rates across different contract types and identifies which plan loses the highest percentage of customers.

 Business Impact

A high churn rate in a particular contract type reduces recurring revenue and increases customer acquisition costs.

 Recommended Action

Offer personalised discounts and loyalty rewards to customers on high-risk contract plans to encourage longer commitments.

Step 2: Payment Method with Highest Churn Rate
Business Question

Which payment method is associated with the highest customer churn?

Business Objective

Determine whether payment behaviour influences customer retention.



SELECT
    PaymentMethod,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnCustomers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS ChurnRate
FROM Stg_Customer_Churn
GROUP BY PaymentMethod
ORDER BY ChurnRate DESC;

 Observation

The analysis highlights which payment methods have the highest percentage of churning customers.

Business Impact

Payment friction or inconvenient billing methods may contribute to customer dissatisfaction and cancellations.

Recommended Action

Promote automatic payment methods and simplify payment processes for customers using higher-risk payment options.

Step 3: Step 3: Internet Service with Highest Churn Rate
Business Question

Which internet service has the highest customer churn rate?

Business Objective

Identify which internet service experiences the highest customer churn to improve service quality and customer retention.

SELECT
    InternetService,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnCustomers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS ChurnRate
FROM Stg_Customer_Churn
GROUP BY InternetService
ORDER BY ChurnRate DESC;

Observation

The analysis compares churn rates across different internet service types and highlights the service with the highest customer attrition.

 Business Impact

A higher churn rate within a specific internet service indicates potential issues with service quality, pricing, or customer satisfaction.

 Recommended Action

Conduct customer satisfaction surveys, improve network performance, and provide retention offers for customers using the highest-risk internet 
service.

Step 4: Tenure Group with Highest Churn
Business Question

Which customer tenure group has the highest churn rate?

Business Objective

Determine whether new or long-term customers are more likely to leave the company.

SELECT
CASE
    WHEN tenure <= 12 THEN 'New'
    WHEN tenure <= 36 THEN 'Regular'
    ELSE 'Loyal'
END AS TenureGroup,

COUNT(*) AS TotalCustomers,

SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnCustomers,

ROUND(
100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END)/COUNT(*),2
) AS ChurnRate

FROM Stg_Customer_Churn

GROUP BY
CASE
    WHEN tenure <= 12 THEN 'New'
    WHEN tenure <= 36 THEN 'Regular'
    ELSE 'Loyal'
END

ORDER BY ChurnRate DESC;

 Observation

The analysis identifies which customer lifecycle stage experiences the highest churn.

 Business Impact

High churn among new customers indicates weak onboarding, while high churn among loyal customers suggests declining customer satisfaction.

 Recommended Action

Implement onboarding programmes for new customers and personalised engagement campaigns for long-term customers.

Step 5: Monthly Charge Category with Highest Churn
Business Question

Which monthly charge category experiences the highest customer churn?

Business Objective

Understand whether pricing influences customer churn.

SELECT

CASE
WHEN MonthlyCharges < 35 THEN 'Low'
WHEN MonthlyCharges < 70 THEN 'Medium'
ELSE 'High'
END AS ChargeCategory,

COUNT(*) AS TotalCustomers,

SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnCustomers,

ROUND(
100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END)/COUNT(*),2
) AS ChurnRate

FROM Stg_Customer_Churn

GROUP BY

CASE
WHEN MonthlyCharges < 35 THEN 'Low'
WHEN MonthlyCharges < 70 THEN 'Medium'
ELSE 'High'
END

ORDER BY ChurnRate DESC;

Observation

The query compares churn across customers paying low, medium, and high monthly charges.

 Business Impact

Customers paying higher monthly charges may have greater expectations regarding service quality and value.

 Recommended Action

Review pricing strategies and offer value-added services or discounts for customers with higher monthly charges.

Step 6: Revenue Lost Due to Customer Churn ⭐
Business Question

How much revenue has been lost due to customers who churned?

Business Objective

Calculate the financial impact of customer churn on the business.

SELECT
    COUNT(*) AS ChurnedCustomers,
    ROUND(SUM(TotalCharges),2) AS RevenueLost,
    ROUND(AVG(TotalCharges),2) AS AvgRevenueLostPerCustomer
FROM Stg_Customer_Churn
WHERE Churn = 1;

 Observation

The analysis calculates the total revenue lost due to customers who have discontinued the service.

 Business Impact

Every churned customer reduces recurring revenue and increases customer acquisition costs. High revenue loss indicates the need for stronger retention strategies.

 Recommended Action

Identify high-value customers before they churn and provide personalised offers, loyalty rewards, or proactive support.

Step 7: Revenue by Contract Type
Business Question

Which contract type generates the highest revenue?

Business Objective

Identify the most profitable contract plans.

SELECT
    Contract,
    COUNT(*) AS Customers,
    ROUND(SUM(TotalCharges),2) AS TotalRevenue,
    ROUND(AVG(TotalCharges),2) AS AvgRevenue
FROM Stg_Customer_Churn
GROUP BY Contract
ORDER BY TotalRevenue DESC;

 Observation

The query compares revenue generated across different contract types.

 Business Impact

Understanding which contract generates the highest revenue helps prioritise marketing and retention efforts.

 Recommended Action

Promote long-term contracts through discounts and loyalty programmes.

Step 8: High-Value Customer Segments
Business Question

Which customer segments generate the highest revenue?

Business Objective

Identify profitable customer groups based on contract type and internet service.

SELECT
    Contract,
    InternetService,
    COUNT(*) AS Customers,
    ROUND(SUM(TotalCharges),2) AS TotalRevenue,
    ROUND(AVG(TotalCharges),2) AS AvgRevenue
FROM Stg_Customer_Churn
GROUP BY
    Contract,
    InternetService
ORDER BY TotalRevenue DESC;

 Observation

Shows which combinations of contract type and internet service contribute the highest revenue.

 Business Impact

Identifying profitable customer segments helps allocate marketing budgets more effectively.

 Recommended Action

Focus retention campaigns and premium services on high-value customer segments.

Step 9: Support Tickets vs Customer Churn
Business Question

Do customers with more support tickets churn more frequently?

Business Objective

Determine whether customer support interactions influence churn.

SELECT
    Churn,
    COUNT(*) AS Customers,
    ROUND(AVG(numAdminTickets),2) AS AvgAdminTickets,
    ROUND(AVG(numTechTickets),2) AS AvgTechTickets
FROM Stg_Customer_Churn
GROUP BY Churn;

 Observation

The query compares average administrative and technical support requests between retained and churned customers.

 Business Impact

Frequent support requests may indicate unresolved service issues that increase the likelihood of churn.

 Recommended Action

Improve issue resolution times and proactively follow up with customers who submit multiple support tickets.

Step 10: High-Risk Customer Segments
Business Question

Which customer segments have the highest number of churned customers?

Business Objective

Identify customer groups that should be prioritised for retention campaigns.

SELECT
    Contract,
    InternetService,
    PaymentMethod,
    COUNT(*) AS ChurnedCustomers
FROM Stg_Customer_Churn
WHERE Churn = 1
GROUP BY
    Contract,
    InternetService,
    PaymentMethod
ORDER BY ChurnedCustomers DESC;

Observation

The analysis identifies combinations of contract type, internet service, and payment method with the highest number of churned customers.

 Business Impact

Understanding high-risk customer profiles enables targeted interventions before customers leave the company.

 Recommended Action

Implement personalised retention campaigns, contract upgrade offers, and proactive customer support for these high-risk segments.

Step 11: Loyal Customer Profile
Business Question

What are the characteristics of loyal customers who stay with the company?

Business Objective

Identify the profile of long-term customers to support retention strategies.

SELECT
    Contract,
    InternetService,
    COUNT(*) AS LoyalCustomers,
    ROUND(AVG(tenure),2) AS AvgTenure,
    ROUND(AVG(MonthlyCharges),2) AS AvgMonthlyCharges,
    ROUND(AVG(TotalCharges),2) AS AvgLifetimeRevenue
FROM Stg_Customer_Churn
WHERE Churn = 0
GROUP BY
    Contract,
    InternetService
ORDER BY AvgLifetimeRevenue DESC;

 Observation

The analysis identifies customer segments with long tenure and high lifetime revenue.

 Business Impact

Loyal customers provide stable recurring revenue and reduce customer acquisition costs.

 Recommended Action

Design loyalty programmes and exclusive benefits for customers with similar characteristics.

Step 12: Senior Citizen Churn Analysis
Business Question

Do senior citizens churn more frequently than other customers?

Business Objective

Compare churn behaviour between senior and non-senior customers.

SELECT
    SeniorCitizen,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnCustomers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS ChurnRate
FROM Stg_Customer_Churn
GROUP BY SeniorCitizen;

 Observation

The analysis compares churn rates between senior and non-senior customers.

 Business Impact

If senior customers churn at a higher rate, they may require tailored products or additional support.

 Recommended Action

Introduce simplified plans, dedicated customer support, and personalised communication for senior customers.

Step 13: Partner & Dependents Analysis
Business Question

Does family status influence customer churn?

Business Objective

Determine whether customers with partners or dependents are more likely to stay.

SELECT
    Partner,
    Dependents,
    COUNT(*) AS Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnCustomers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS ChurnRate
FROM Stg_Customer_Churn
GROUP BY
    Partner,
    Dependents
ORDER BY ChurnRate DESC;

 Observation

The analysis evaluates churn across different family status combinations.

 Business Impact

Family-related customer segments may have different retention patterns and service needs.

 Recommended Action

Develop family-oriented service bundles and loyalty incentives for households.

Step 14: High-Value Customers at Risk
Business Question

Which high-revenue customers have already churned?

Business Objective

Identify the most valuable customers the company has lost.

SELECT TOP 10
    Contract,
    InternetService,
    PaymentMethod,
    tenure,
    MonthlyCharges,
    TotalCharges
FROM Stg_Customer_Churn
WHERE Churn = 1
ORDER BY TotalCharges DESC;

 Observation

The query highlights the highest-value customers who have left the company.

 Business Impact

Losing high-value customers has a significant impact on profitability and future recurring revenue.

 Recommended Action

Implement an early-warning churn prediction system to identify similar customers before they leave.

Step 15: Executive KPI Summary
Business Question

What are the company key customer retention and revenue metrics?

Business Objective

Provide executives with a single summary of the most important business KPIs.

SELECT
    COUNT(*) AS TotalCustomers,

    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers,

    SUM(CASE WHEN Churn = 0 THEN 1 ELSE 0 END) AS RetainedCustomers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS ChurnRate,

    ROUND(SUM(TotalCharges),2) AS TotalRevenue,

    ROUND(AVG(MonthlyCharges),2) AS AvgMonthlyCharges,

    ROUND(AVG(TotalCharges),2) AS AvgCustomerLifetimeValue,

    ROUND(AVG(tenure),2) AS AvgCustomerTenure
FROM Stg_Customer_Churn;

 Observation

The query provides a consolidated summary of customer volume, churn, revenue, and customer value.

 Business Impact

Executives can monitor business performance using a single KPI report, enabling faster strategic decision-making.

Recommended Action

Publish these KPIs in the Power BI Executive Dashboard and monitor them monthly to measure the effectiveness of retention initiatives.

