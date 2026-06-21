## 📊 Project

### 1. Sales Daily Product Report — Power BI Dashboard
A daily operational sales dashboard built on the AdventureWorks dataset for sales managers, category managers, and demand planners.

<img width="1286" height="722" alt="Sales Dashboard" src="https://github.com/user-attachments/assets/1c78a611-514d-4bab-93b9-1dfdd7ff87d3" />

#### 📌 Project Summary
This report provides instant answers to key operational questions:
- What did we sell today vs recent performance?
- Which products are driving volume and revenue?
- Is today’s performance normal, good, or concerning?
- What is the average price per unit?

#### 🛠️ Tools Used
- **Power BI Desktop** – Report design, DAX measures, data modelling
- **SQL Server (T-SQL)** – ETL process + validation queries
- **AdventureWorks 2025** – Sample relational database

#### ✨ Key Features
- KPI Cards (Sales, Orders, Daily % Change)
- 30-Day Trend Line Chart
- Top 10 Products by Order Volume & Sales (Clustered Bar Chart)
- Daily % Change Indicators with arrows
- Dynamic Report Date

#### ✅ Data Validation
All key figures were independently validated with raw SQL queries (see `/sql` folder).

#### 📐 Key DAX Measures
- Sales - Latest Reporting Date
- Sales - Last 30 Days
- Orders - Latest Reporting Date
- Average Order Value

[View SQL Validation Queries →](./sql)
