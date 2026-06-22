# Sales Daily Product Report — Power BI Dashboard

A daily operational sales dashboard built on the AdventureWorks dataset for sales managers, category managers, and demand planners.

<img width="1286" height="722" alt="Sales Dashboard" src="https://github.com/user-attachments/assets/1c78a611-514d-4bab-93b9-1dfdd7ff87d3" />

---

## 📌 Project Summary

This report provides instant answers to key operational questions:
- What did we sell today vs recent performance?
- Which products are driving volume and revenue?
- Is today’s performance normal, good, or concerning?
- What is the average price per unit?

---

## 🛠️ Tools Used

- **Power BI Desktop** – Report design, DAX measures, data modelling
- **SQL Server (T-SQL)** – ETL process + validation queries
- **AdventureWorks 2025** – Sample relational database

---

## ✨ Key Features

- KPI Cards (Sales, Orders, Daily % Change)
- 30-Day Trend Line Chart
- Top 10 Products by Order Volume & Sales (Clustered Bar Chart)
- Daily % Change Indicators with arrows
- Dynamic Report Date

---

## ✅ Data Validation

Every key total and ranking shown in the Power BI report was cross-checked against equivalent SQL queries run directly on the underlying fact/dimension tables — not just trusted from the visual layer. This included:
- Total daily sales and order counts
- Top 10 products by order volume and by sales amount
- Price-per-unit calculations (Sales ÷ Orders) per product

See the [`/sql`](./sql) folder for the validation queries and the [`/sql/README.md`](./sql/README.md) for notes on what each one checks.

---

## 📐 Key DAX Measures

Measures follow a consistent naming convention: `[Metric] - [Context/Qualifier]` (e.g., `Sales - Latest Reporting Date`, `Sales - Last 30 Days`). Full measure list and logic documented in [`/dax/measures.md`](./dax/measures.md).

Highlights:
- Sales - Latest Reporting Date
- Sales - Last 30 Days
- Orders - Latest Reporting Date
- Average Order Value

---

## 📁 Repository Structure

\```
adventureworks-sales-daily-report/
├── README.md
├── powerbi/
│   └── Sales_Daily_Product_Report.pbix
├── sql/
│   ├── validation_top10_by_date.sql
│   ├── validation_top10_by_product.sql
│   └── README.md
├── dax/
│   └── measures.md
├── screenshots/
│   ├── dashboard_overview.png
│   ├── trend_chart.png
│   └── top_products.png
└── docs/
    └── data_model.png
\```

---

## 📊 Screenshots

|
- KPI Card: Sales

<img width="317" height="100" alt="image" src="https://github.com/user-attachments/assets/11922331-aa9d-4617-a492-72a8be37bd2a" />


|
- KPI Card: Daily % Change

<img width="305" height="107" alt="image" src="https://github.com/user-attachments/assets/c6441300-49be-4775-92d7-980493ad78ed" />


|
- KPI Card: Orders

<img width="302" height="92" alt="image" src="https://github.com/user-attachments/assets/c12a28ca-21c0-4e18-b0ad-ebafbd4c247d" />


|
- 30-Day Sale Trend Line Chart

<img width="1732" height="762" alt="image" src="https://github.com/user-attachments/assets/2f48e69c-dd66-4fd2-bf37-d58c2afacf1e" />


|
- Top 10 Products by Order Volume & Sales Clustered Bar Chart

<img width="1282" height="717" alt="image" src="https://github.com/user-attachments/assets/ddd9c5b2-81e9-414c-a622-594917d2a612" />


|
- Top 10 Products by Order Volume & Average Order Value Table

<img width="612" height="447" alt="image" src="https://github.com/user-attachments/assets/d66ea090-0957-4ba7-b9bb-f1701e97835d" />


|
- Dynamic Report Date Indicator

<img width="290" height="77" alt="image" src="https://github.com/user-attachments/assets/1ae6a573-4f35-477b-a417-5dab12d5712d" />


---

## 🔭 Next Steps / Possible Improvements

- Add sales breakdown by product category and sales territory
- Build a companion executive summary report (weekly/monthly rollup vs. this daily operational view)
- Add ETL queries to sql/ folder
- Add power bi snowflake data model

---

## 📄 License

This project uses Microsoft's publicly available AdventureWorks sample dataset for educational/portfolio purposes.

