USE master;
GO

DROP DATABASE IF EXISTS CustomerChurnDB;
GO

CREATE DATABASE CustomerChurnDB;
GO

USE CustomerChurnDB;
GO

SELECT COUNT(*) AS Total_Customers
FROM dbo.Stg_Customer_Churn;

SELECT TOP 10 *
FROM dbo.Stg_Customer_Churn;

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

EXEC sp_rename
'[Customer_Churn_Cleaned 2]',
'Stg_Customer_Churn';

SELECT name
FROM sys.tables;

SELECT *
FROM Stg_Customer_Churn;

SELECT COUNT(*)
FROM Stg_Customer_Churn;

SELECT
    customerID,
    COUNT(*) AS Duplicate_Count
FROM Stg_Customer_Churn
GROUP BY customerID
HAVING COUNT(*) > 1;

SELECT

SUM(CASE WHEN customerID IS NULL THEN 1 ELSE 0 END) AS CustomerID,

SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS Gender,

SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS Tenure,

SUM(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END) AS MonthlyCharges,

SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END) AS TotalCharges,

SUM(CASE WHEN Churn IS NULL THEN 1 ELSE 0 END) AS Churn

FROM Stg_Customer_Churn;

EXEC sp_help 'Stg_Customer_Churn';

SELECT *
FROM Stg_Customer_Churn
WHERE numAdminTickets < 0
   OR numTechTickets < 0;
