Customer Churn Analytics & Retention Intelligence Platform

Built an end-to-end Customer Churn Analytics & Retention Intelligence Platform across 7,043 customers, quantifying a 26.5% churn rate and approximately $2.86M revenue loss against ~$16.06M total revenue.

Implemented advanced SQL for customer segmentation, revenue quartiles, high-risk/high-value analysis, reusable reporting views and parameterized procedures; developed and evaluated predictive churn models

Achieving 91.92% ROC-AUC with Random Forest; and translated analytical findings into an executive Power BI dashboard and risk-based retention strategy.

Executive Dashboard

## 📊 Executive Dashboard

<p align="center">
  <img src="https://github.com/manamratnakumar/Customer-Churn-Prediction-and-Retention-Analytics/blob/main/Screen%20Shots/Screenshot%202026-08-10%20130802.png" width="100%">
</p>

Analyzed 7,043 customers to quantify a 26.5% churn rate, evaluate revenue exposure, identify high-risk/high-value customer segments, build predictive churn models, and translate the findings into an executive

Power BI retention dashboard.

Executive Overview:

Customer churn was analyzed not simply as a customer-count problem, but as a customer-value and revenue-risk problem.

The project analyzes 7,043 customer records, with approximately 26.5% of the customer base identified as churned.

That means the analysis is dealing with a customer-retention exposure of roughly:

1.87K churned customers

and approximately:

5.17K retained customers

These are approximate values derived from the verified 7,043-record base and 26.5% churn rate; the SQL source reports the percentage directly.

The project therefore focuses on:

WHO IS CHURNING?

        ↓
WHY ARE THEY CHURNING?

        ↓
WHAT CUSTOMER SEGMENTS ARE AT RISK?

        ↓
HOW MUCH VALUE IS EXPOSED?

        ↓
WHO SHOULD BE PRIORITIZED?

        ↓
WHAT RETENTION ACTION SHOULD BE TAKEN?



 Problem Statement :

 Business Challenge

A 26.5% churn rate means customer retention represents a material business problem rather than a minor reporting metric.

The project investigates churn across:

Contract

Internet service

Payment method

Tenure

Monthly charges

Customer demographics

Family status

Support interactions

Customer lifetime revenue

The analysis then connects those dimensions to revenue exposure and customer value.

The SQL business-analysis layer specifically calculates churn rates by contract, payment method, internet service, tenure and monthly-charge category.

Business Objective

Build an analytical decision-support platform capable of moving from:

26.5% Churn

to:

Churn Drivers → Revenue Risk → Predictive Risk → Retention Priority

Executive KPI Snapshot

KPI	                                              Project Result

Customer Base                                    	7,043

Overall Churn Rate	                              26.5%

Approx. Churned Customers	                        1.87K

Approx. Retained Customers	                      5.17K

Average Monthly Charges	                          64.76

Average Tenure	                                  32.37 months

Total Revenue	                                    $16.06M

Revenue Lost to Churn	                            $2.86M

Revenue Exposure	                                17.8% of total revenue

The customer-base and churn figures are directly supported by the SQL analysis; the revenue/KPI figures above reflect the values shown in your submitted Power BI dashboard.

The revenue-loss calculation is explicitly implemented in SQL as churned-customer count, total revenue lost and average revenue lost per churned customer.

Enterprise Solution Architecture:

                  
                         7,043 CUSTOMER RECORDS
                              │
                              ↓
                     DATA QUALITY LAYER
                              │
              ┌───────────────┴───────────────┐
              ↓                               ↓
        SQL ANALYTICS                     PYTHON
              │                               │
      Business Analysis                 EDA / Cleaning
      Advanced SQL                     Feature Engineering
      Revenue Analysis                 Machine Learning
      Segmentation                     Model Evaluation
              │                               │
              └───────────────┬───────────────┘
                              ↓
                     ANALYTICAL INTELLIGENCE
                              │
            ┌─────────────────┼─────────────────┐
            ↓                 ↓                 ↓
        CHURN RISK       REVENUE RISK      CUSTOMER VALUE
            │                 │                 │
            └─────────────────┼─────────────────┘
                              ↓
                     EXECUTIVE POWER BI
                              ↓
                     RETENTION STRATEGY

                     

Data Quality

The SQL validation layer was designed to establish a reliable analytical foundation before business analysis.

Validation includes:

Customer record count

NULL checks

Category validation

Contract validation

Internet-service validation

Payment-method validation

Negative monthly-charge detection

Negative total-charge detection

Invalid tenure detection

Invalid support-ticket detection

### 🔎 SQL Data Quality Validation

<p align="center">
  <img src="https://github.com/manamratnakumar/Customer-Churn-Prediction-and-Retention-Analytics/blob/main/Screen%20Shots/Data%20Cleaning%20SQL.png" width="100%">
</p>

Enterprise Data Quality Principle:

Raw Data

   ↓
   
Validation

   ↓
   
Quality Controls

   ↓
   
Trusted Analytical Dataset

   ↓
   
Business Decisions

Customer Analytics:

Customer Base:

7,043 customers

This becomes the denominator for the project's major customer KPIs.

Churn Exposure

26.5% churn

Approximately 1.87K customers are therefore represented by the churn rate.

### 📊 Customer Churn Distribution

<p align="center">
  <img src="https://github.com/manamratnakumar/Customer-Churn-Prediction-and-Retention-Analytics/blob/main/Screen%20Shots/Churn%20Distrubution%20SQL.png" width="100%">
</p>

Business significance

This establishes churn as a major commercial KPI rather than merely a machine-learning target.

Contract Intelligence:

The analysis evaluates churn by contract type and identifies the most vulnerable plans.

 📈 Contract-Level Churn Analysis

<p align="center">
  <img src="https://github.com/manamratnakumar/Customer-Churn-Prediction-and-Retention-Analytics/blob/main/Screen%20Shots/Contract%20Type%20with%20highest%20distribution.SQL.png" width="100%">
</p>

Key enterprise insight

Month-to-month customers are identified as the primary retention-risk segment.

The project therefore moves from:

Contract → Churn

to:

Contract → Retention Strategy

Recommended action

Contract-conversion incentives

Loyalty rewards

Personalized pricing

Longer-term commitment offers

Service Intelligence:

Churn is evaluated across internet-service categories using:

Total Customers
+
Churned Customers
+
Churn Rate

The SQL analysis specifically calculates churn rate by internet service.

🌐 Service-Level Churn Analysis

<p align="center">
  <img src="https://github.com/manamratnakumar/Customer-Churn-Prediction-and-Retention-Analytics/blob/main/Screen%20Shots/Service%20Inteeligence.SQL.png" width="100%">
</p>

 Internet Service Churn Analysis

<p align="center">
  <img src="https://github.com/manamratnakumar/Customer-Churn-Prediction-and-Retention-Analytics/blob/main/Screen%20Shots/Internet%20Service%20with%20highest%20churn%20Rate.SQL.png" width="100%">
</p>

Enterprise implication

A high-churn service segment becomes a candidate for:

Service-quality investigation

Pricing review

Customer-experience analysis

Support improvement

Retention offers

Customer Lifecycle Intelligence:

Customers are segmented into:

Lifecycle               	Definition
New	                      ≤ 12 months
Regular                   13–36 months
Loyal	                    > 36 months

The SQL analysis calculates churn rate across these lifecycle groups.

Enterprise insight

Retention should not be treated as a single campaign.

NEW
→ Onboarding

REGULAR
→ Engagement & Upsell

LOYAL
→ Loyalty & Value Protection

Revenue Intelligence:

The project explicitly calculates:

Churned Customers
Revenue Lost
Average Revenue Lost per Churned Customer

 Revenue Loss Analysis

<p align="center">
  <img src="https://github.com/manamratnakumar/Customer-Churn-Prediction-and-Retention-Analytics/blob/main/Screen%20Shots/Average%20Revenue%20Lost.SQL.png" width="100%">
</p>

Power BI dashboard reports approximately:

$16.06M Total Revenue

and approximately:

$2.86M Revenue Lost

That implies approximately:

17.8% revenue exposure

based on the dashboard values.

Customer Value Intelligence:

The advanced SQL layer segments customers into four revenue quartiles using NTILE(4).

### 💰 Revenue Loss Analysis

<p align="center">
  <img src="https://github.com/manamratnakumar/Customer-Churn-Prediction-and-Retention-Analytics/blob/main/Screen%20Shots/Average%20Revenue%20Lost.SQL.png" width="100%">
</p>

















                     












                        
                                     
     




















