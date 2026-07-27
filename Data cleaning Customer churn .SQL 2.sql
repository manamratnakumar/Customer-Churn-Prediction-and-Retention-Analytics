Step 1: Total Records
Business Question

How many customer records are available?

Business Objective

Verify that the dataset has been imported successfully.

SELECT COUNT(*) AS Total_Customers
FROM Stg_Customer_Churn;

Business Insight

Confirms that all customer records are available for analysis.

Step 2: Check NULL Values
Business Question

Are there any missing values in the dataset?

Business Objective

Identify NULL values before analysis.

SELECT
SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS Gender,
SUM(CASE WHEN SeniorCitizen IS NULL THEN 1 ELSE 0 END) AS SeniorCitizen,
SUM(CASE WHEN Partner IS NULL THEN 1 ELSE 0 END) AS Partner,
SUM(CASE WHEN Dependents IS NULL THEN 1 ELSE 0 END) AS Dependents,
SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS Tenure,
SUM(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END) AS MonthlyCharges,
SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END) AS TotalCharges,
SUM(CASE WHEN Churn IS NULL THEN 1 ELSE 0 END) AS Churn
FROM Stg_Customer_Churn;

Business Insight

Confirms whether the dataset is complete and ready for analysis.

Step 3: Check Gender Values
Business Question

Are gender values consistent?

Business Objective

Validate customer gender categories.

SELECT
gender,
COUNT(*) AS Customers
FROM Stg_Customer_Churn
GROUP BY gender;

Business Insight

Ensures only valid gender categories exist.

Step 4: Check Contract Types

SELECT
Contract,
COUNT(*) AS Customers
FROM Stg_Customer_Churn
GROUP BY Contract;

Business Insight

Validates customer contract categories.

Step 5: Check Internet Service

SELECT
InternetService,
COUNT(*) AS Customers
FROM Stg_Customer_Churn
GROUP BY InternetService;

Business Insight

Confirms valid internet service categories.

Step 6: Check Payment Methods

SELECT
PaymentMethod,
COUNT(*) AS Customers
FROM Stg_Customer_Churn
GROUP BY PaymentMethod;

Business Insight

Validates payment method categories.

Step 7: Validate Monthly Charges

SELECT *
FROM Stg_Customer_Churn
WHERE MonthlyCharges < 0;

Business Insight

Checks for invalid negative monthly charges.

Step 8: Validate Total Charges

SELECT *
FROM Stg_Customer_Churn
WHERE TotalCharges < 0;

Business Insight

Checks for invalid negative total charges.

Step 9: Validate Tenure

SELECT *
FROM Stg_Customer_Churn
WHERE tenure < 0;

Business Insight

Ensures all tenure values are valid.

Step 10: Validate Support Tickets

SELECT *
FROM Stg_Customer_Churn
WHERE numAdminTickets < 0
   OR numTechTickets < 0;

Business Insight

Ensures support ticket counts are valid.