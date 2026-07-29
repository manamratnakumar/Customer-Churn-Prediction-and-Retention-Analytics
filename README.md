# Customer-Churn-Prediction-and-Retention-Analytics

End-to-End Customer Churn Analysis & Prediction

SQL Server | Python | Machine Learning | Power BI

A complete end-to-end analytics solution that transforms raw telecom customer data into actionable business insights and predictive intelligence using SQL Server, Python, Machine Learning, and Power BI.

Project Overview:

Customer churn is one of the most significant challenges faced by subscription-based businesses. Losing existing customers not only reduces recurring revenue but also increases customer acquisition costs and impacts long-term profitability.

This project demonstrates a complete data analytics workflow designed to help businesses understand customer behaviour, identify churn drivers, predict customer attrition, and support data-driven retention strategies.

Starting with raw customer data, the project progresses through SQL-based data preparation, business analysis, Python-driven exploratory analysis, feature engineering, machine learning, and concludes with an interactive Power BI dashboard for executive decision-making.


Business Problem:

The telecom company wants to answer critical business questions such as:

Why are customers leaving?

Which customers are at the highest risk of churn?

Which services contribute most to churn?

Which customer segments generate the highest revenue?

How much revenue is lost because of churn?

Which customers should be targeted for retention campaigns?

How can business decisions reduce churn and improve profitability?

Project Objectives:

Clean and validate raw customer data.

Perform comprehensive exploratory data analysis.

Identify key churn drivers.

Analyse customer behaviour and revenue patterns.

Build predictive machine learning models.

Measure business KPIs and customer lifetime value.

Deliver interactive dashboards for business stakeholders.

Generate actionable business recommendations.

End-to-End Analytics Architecture

                          Raw Telecom Customer Dataset
                                       │
                                       ▼
                             SQL Server Database
                                       │
                                       ▼
                        Data Cleaning & Validation
                                       │
                                       ▼
                     Exploratory Data Analysis (EDA)
                                       │
                                       ▼
                       Business Performance Analysis
                                       │
                                       ▼
              Advanced SQL Analytics (CTEs • Views • Window Functions)
                                       │
                                       ▼
                              Python Data Analysis
                                       │
                                       ▼
                             Feature Engineering
                                       │
                                       ▼
                          Machine Learning Modelling
                                       │
                                       ▼
                     Model Evaluation & Business Insights
                                       │
                                       ▼
                    Interactive Power BI Executive Dashboard


                    Technology Stack
Category	                                    Technologies
Database	                                    SQL Server
Query Language                               	SQL
Programming	                                  Python
Data Analysis                                	Pandas, NumPy
Data Visualization                          	Matplotlib
Machine Learning	                            Scikit-learn
Business Intelligence	                        Power BI
Version Control	                              Git & GitHub

Repository Structure

Customer-Churn-Analysis

│

├── Dataset

│

├── SQL

│   ├── 01_Database_Setup.sql

│   ├── 02_Data_Cleaning.sql

│   ├── 03_Exploratory_Data_Analysis.sql

│   ├── 04_Business_Analysis.sql

│   ├── 05_Advanced_SQL.sql

│

├── Python

│   ├── 01_Data_Cleaning.ipynb

│   ├── 02_EDA.ipynb

│   ├── 03_Feature_Engineering.ipynb

│   ├── 04_Model_Building.ipynb

│   └── 05_Model_Evaluation.ipynb

│
├── PowerBI

│   ├── Customer_Churn.pbix

│   └── Dashboard_Screenshots

│
├── Images

├── Reports

└── README.md

Project Workflow

1. Database Development:

Database creation

Data import

Schema validation

Data quality verification

2. SQL Data Preparation:

Performed comprehensive data cleaning including:

Missing value analysis

Duplicate detection

Data validation

Data standardisation

Data quality verification

Business rule validation

3. Exploratory Data Analysis:

Analysed customer behaviour through SQL and Python to identify patterns across:

Customer demographics

Contract types

Internet services

Monthly charges

Customer tenure

Payment methods

Customer support activity

Revenue distribution

Churn trends

4. Business Analysis:

Developed business-focused SQL analyses to answer strategic questions related to:

Customer churn

Revenue loss

Customer lifetime value

Customer segmentation

High-value customers

High-risk customers

Executive KPIs

Retention opportunities

5. Advanced SQL:

Implemented advanced SQL techniques including:

Window Functions

Common Table Expressions (CTEs)

Ranking Functions

Views

Stored Procedures

Analytical Queries

Performance-focused reporting

6. Feature Engineering:

Prepared data for predictive modelling through:

Label Encoding

Feature Transformation

Feature Scaling

Correlation Analysis

Feature Selection

Train-Test Split

7. Machine Learning

Built and evaluated multiple classification models:

Logistic Regression

Decision Tree

Random Forest

Performance evaluation included:

Accuracy

Precision

Recall

F1 Score

ROC-AUC

Confusion Matrix

8. Power BI Dashboard

Designed an executive dashboard to monitor:

Customer Churn Rate

Revenue Performance

Customer Lifetime Value

Customer Segmentation

Revenue Loss

High-Risk Customers

Contract Analysis

Internet Service Analysis

Payment Method Analysis

Business Insights Generated

This project provides answers to important business questions, including:

Which customer segments have the highest churn rate?

Which contract types are associated with the highest retention?

Which internet services contribute most to churn?

How much revenue is lost due to customer attrition?

Which customers generate the highest lifetime value?

Which payment methods show higher churn?

Which customers should be prioritised for retention strategies?

Business Recommendations

Based on the analysis:

Promote long-term contracts to reduce churn.

Prioritise retention campaigns for high-value customers.

Improve support for customers with frequent service issues.

Offer personalised incentives to high-risk customers.

Monitor customer lifetime value to maximise retention ROI.

Use predictive modelling to proactively identify churn risks.

Skills Demonstrated:

SQL Database Design

SQL Data Cleaning

Exploratory Data Analysis

Business Analysis

Advanced SQL

Window Functions

Common Table Expressions (CTEs)

Data Visualisation

Python Programming

Feature Engineering

Machine Learning

Model Evaluation

Power BI Dashboard Design

DAX

Data Storytelling

Business Intelligence:

Future Enhancements

Deploy the churn prediction model as a web application.

Automate data refresh and reporting pipelines.

Integrate cloud-based data storage.

Add real-time monitoring dashboards.

Enhance model performance through hyperparameter tuning.
