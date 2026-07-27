Step 1: Top Revenue Customers using ROW_NUMBER()
Business Question

Who are the company top revenue-generating customers?

Business Objective

Assign a unique rank to every customer based on lifetime revenue to identify the highest-value customers.

SELECT
    gender,
    Contract,
    InternetService,
    tenure,
    MonthlyCharges,
    TotalCharges,

    ROW_NUMBER() OVER
    (
        ORDER BY TotalCharges DESC
    ) AS CustomerRank

FROM Stg_Customer_Churn;

 Observation

Each customer receives a unique rank according to their lifetime revenue.

 Business Impact

Identifies the company  highest-value customers.

 Recommended Action

Provide premium support and exclusive loyalty offers to top-ranked customers.

Step 2: Revenue Ranking using RANK()
Business Question

How do customers rank based on lifetime revenue while allowing ties?

Business Objective

Identify customers with equal revenue using ranking.

SELECT

gender,
Contract,
InternetService,
TotalCharges,

RANK() OVER
(
ORDER BY TotalCharges DESC
) AS RevenueRank

FROM Stg_Customer_Churn;

 Observation

Customers with the same lifetime revenue receive the same rank.

 Business Impact

Useful for identifying equally valuable customers.

 Recommended Action

Design retention campaigns for all customers within the highest revenue ranks.

Step 3: Monthly Charges Ranking using DENSE_RANK()
Business Question

Which customers pay the highest monthly charges?

Business Objective

Rank customers according to their monthly subscription fees.

SELECT

Contract,
InternetService,
MonthlyCharges,

DENSE_RANK() OVER
(
ORDER BY MonthlyCharges DESC
) AS MonthlyChargeRank

FROM Stg_Customer_Churn;

Observation

Ranks customers based on recurring monthly payments without gaps in ranking.

 Business Impact

Higher-paying customers generally contribute more recurring revenue.

 Recommended Action

Offer premium services and proactive customer support to these customers.

Step 4: Running Revenue using Window Function
Business Question

How does cumulative customer revenue increase across customers?

Business Objective

Calculate running revenue using SQL window functions.

SELECT

TotalCharges,

SUM(TotalCharges)
OVER
(
ORDER BY TotalCharges
) AS RunningRevenue

FROM Stg_Customer_Churn;

 Observation

Shows cumulative revenue generated as customers are ordered by lifetime revenue.

 Business Impact

Helps understand revenue concentration and cumulative business growth.

 Recommended Action

Use cumulative revenue analysis for executive reporting and revenue forecasting.

Step 5: Average Revenue by Contract using PARTITION BY
Business Question

How does each customer revenue compare to the average revenue of their contract type?

Business Objective

Calculate contract-level average revenue using SQL window functions.

SELECT

Contract,

TotalCharges,

AVG(TotalCharges)
OVER
(
PARTITION BY Contract
) AS AvgContractRevenue

FROM Stg_Customer_Churn;

 Observation

Compares each customer lifetime revenue with the average revenue of their contract group.

 Business Impact

Identifies customers who contribute above or below the average revenue for their contract type.

 Recommended Action

Focus upselling and retention efforts on below-average customers while rewarding above-average customers.

Step 6: Previous Customer Revenue using LAG()
Business Question

How does each customer's lifetime revenue compare with the previous customer's revenue?

Business Objective

Compare customer revenue with the previous record to identify revenue differences.

SELECT
    Contract,
    InternetService,
    TotalCharges,

    LAG(TotalCharges,1)
    OVER
    (
        ORDER BY TotalCharges
    ) AS PreviousRevenue

FROM Stg_Customer_Churn;

 Observation

Displays the previous customer lifetime revenue alongside the current customer revenue.

 Business Impact

Helps analyse revenue progression and identify sudden increases or decreases between customers.

 Recommended Action

Investigate significant revenue gaps to understand customer purchasing behaviour.

Step 7: Next Customer Revenue using LEAD()
Business Question

What is the next customer lifetime revenue?

Business Objective

Compare current customer revenue with the next customer revenue.

SELECT

Contract,
InternetService,
TotalCharges,

LEAD(TotalCharges,1)
OVER
(
ORDER BY TotalCharges
) AS NextRevenue

FROM Stg_Customer_Churn;

 Observation

Shows the revenue of the next customer based on ascending lifetime revenue.

 Business Impact

Useful for analysing customer value progression and identifying revenue clusters.

 Recommended Action

Use this information to segment customers with similar spending behaviour.

Step 8: Customer Segmentation using NTILE()
Business Question

How can customers be divided into revenue quartiles?

Business Objective

Segment customers into four equal revenue groups.

SELECT

Contract,
InternetService,
TotalCharges,

NTILE(4)
OVER
(
ORDER BY TotalCharges DESC
) AS RevenueQuartile

FROM Stg_Customer_Churn;

Observation

Customers are divided into four revenue-based groups.

 Business Impact

Allows the business to identify premium, medium-value, and low-value customer segments.

 Recommended Action

Create personalised marketing campaigns for each customer segment.

Step 9: Above Average Revenue Customers using CTE
Business Question

Which customers generate above-average lifetime revenue?

Business Objective

Identify customers whose lifetime revenue exceeds the company average.

WITH RevenueCTE AS
(
SELECT
    Contract,
    InternetService,
    TotalCharges,
    AVG(TotalCharges) OVER() AS CompanyAverageRevenue

FROM Stg_Customer_Churn
)

SELECT *

FROM RevenueCTE

WHERE TotalCharges > CompanyAverageRevenue

ORDER BY TotalCharges DESC;

Observation

Displays customers whose lifetime revenue is greater than the overall company average.

 Business Impact

High-value customers contribute significantly to business profitability.

 Recommended Action

Provide premium services, loyalty rewards, and personalised retention programmes.

Step 10: High-Risk Customer Analysis using Multiple CTEs
Business Question

Which customer segments have both high churn and high revenue?

Business Objective

Identify valuable customer groups that require immediate retention efforts.

WITH ChurnCustomers AS
(
SELECT *

FROM Stg_Customer_Churn

WHERE Churn = 1
),

RevenueSummary AS
(
SELECT

Contract,

InternetService,

COUNT(*) AS ChurnedCustomers,

ROUND(AVG(TotalCharges),2) AS AvgRevenueLost

FROM ChurnCustomers

GROUP BY

Contract,

InternetService
)

SELECT *

FROM RevenueSummary

ORDER BY AvgRevenueLost DESC;

 Observation

Identifies customer segments with the highest average revenue loss due to churn.

Business Impact

These customer groups represent the greatest financial risk to the business.

 Recommended Action

Prioritise proactive retention campaigns, personalised offers, and enhanced customer support for these high-value segments.

Step 11: Create Customer Churn Summary View
Business Question

Can we create a reusable view to monitor customer churn by contract type?

Business Objective

Create a reusable SQL View for reporting and Power BI dashboards.

CREATE VIEW vw_ChurnSummary
AS
SELECT
    Contract,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnCustomers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS ChurnRate
FROM Stg_Customer_Churn
GROUP BY Contract;

SELECT *
FROM vw_ChurnSummary;

 Observation

The view provides a reusable summary of customer churn by contract type.

 Business Impact

Eliminates the need to rewrite complex SQL queries for every report.

 Recommended Action

Use this view as the data source for Power BI dashboards and management reports.

Step 12: Create Revenue Analysis View
Business Question

Can we build a reusable revenue analysis view?

Business Objective

Create a reusable SQL View for analysing customer revenue.

CREATE VIEW vw_RevenueAnalysis
AS
SELECT
    Contract,
    InternetService,
    COUNT(*) AS Customers,
    ROUND(SUM(TotalCharges),2) AS TotalRevenue,
    ROUND(AVG(TotalCharges),2) AS AvgRevenue
FROM Stg_Customer_Churn
GROUP BY
    Contract,
    InternetService;

	SELECT *
FROM vw_RevenueAnalysis
ORDER BY TotalRevenue DESC;

 Observation

Provides revenue analysis across contract types and internet services.

 Business Impact

Supports strategic revenue planning and service profitability analysis.

 Recommended Action

Use this view in Power BI for revenue dashboards.

Step 13: Stored Procedure – Contract-wise Churn Report
Business Question

Can managers generate a churn report for a specific contract type?

Business Objective

Create a reusable stored procedure with a contract parameter.

CREATE PROCEDURE usp_ContractChurnReport
    @ContractType NVARCHAR(50)
AS
BEGIN

SELECT
    Contract,
    COUNT(*) AS Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnCustomers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS ChurnRate

FROM Stg_Customer_Churn

WHERE Contract = @ContractType

GROUP BY Contract;

END;

EXEC usp_ContractChurnReport
@ContractType='Month-to-month';

 Observation

Managers can analyse churn for any contract without modifying SQL.

 Business Impact

Makes reporting dynamic and reusable.

 Recommended Action

Schedule this procedure for automated monthly reports.

Step 14: Stored Procedure – Internet Service Revenue Report
Business Question

Which internet service generates the highest revenue?

Business Objective

Create a reusable revenue report filtered by internet service.

CREATE PROCEDURE usp_ServiceRevenueReport
    @InternetService NVARCHAR(50)
AS
BEGIN

SELECT

InternetService,

COUNT(*) AS Customers,

ROUND(SUM(TotalCharges),2) AS TotalRevenue,

ROUND(AVG(TotalCharges),2) AS AvgRevenue

FROM Stg_Customer_Churn

WHERE InternetService=@InternetService

GROUP BY InternetService;

END;

EXEC usp_ServiceRevenueReport
@InternetService='Fiber optic';

Observation

Provides revenue information for a chosen internet service.

 Business Impact

Helps managers evaluate the financial performance of individual services.

 Recommended Action

Monitor high-performing and low-performing services regularly.