SELECT
    customerID,
    COUNT(*) AS DuplicateCount
FROM Stg_Customer_Churn
GROUP BY customerID
HAVING COUNT(*) > 1;

SELECT DISTINCT gender
FROM Stg_Customer_Churn;

SELECT COUNT(*) AS Total_Customers
FROM Stg_Customer_Churn;
DROP TABLE IF EXISTS Stg_Customer_Churn;
EXEC sp_help 'Stg_Customer_Churn';

DROP TABLE Stg_Customer_Churn;
MultipleLines      VARCHAR(50),
OnlineSecurity     VARCHAR(50),
OnlineBackup       VARCHAR(50),
DeviceProtection   VARCHAR(50),
TechSupport        VARCHAR(50),
StreamingTV        VARCHAR(50),
StreamingMovies    VARCHAR(50),