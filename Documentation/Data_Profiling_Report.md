# Data Profiling Report

## Dataset Overview

* Dataset Name: Customer Churn Dataset
* Total Rows: 7,043
* Total Columns: 23
* Target Variable: Churn
* Primary Key: customerID
* File Type: Excel (.xlsx)

## Column Categories

### Identifier

* customerID

### Demographic Features

* gender
* SeniorCitizen
* Partner
* Dependents

### Service Features

* PhoneService
* MultipleLines
* InternetService
* OnlineSecurity
* OnlineBackup
* DeviceProtection
* TechSupport
* StreamingTV
* StreamingMovies

### Billing Features

* Contract
* PaperlessBilling
* PaymentMethod
* MonthlyCharges
* TotalCharges

### Support Features

* numAdminTickets
* numTechTickets

### Target Feature

* Churn

## Target Variable

The target variable contains two values:

* Yes
* No

This is a binary classification problem.

## Initial Business Hypotheses

1. Customers with month-to-month contracts are more likely to churn.
2. Customers with higher monthly charges have higher churn risk.
3. Customers with shorter tenure are more likely to churn.
4. Customers without tech support are more likely to churn.
5. Customers with more technical support tickets have higher churn probability.
