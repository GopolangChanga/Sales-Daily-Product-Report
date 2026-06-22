# SQL Validation Queries

These queries were used to independently validate 
the figures shown in the Power BI dashboard against 
the raw source tables in AdventureWorks_Presentation.

## Files

### validation_top10_by_product.sql
Validates the Top 10 products by sales for a single 
reporting date (2014-06-30). Results were cross-checked 
against the Power BI "Top 10 product by sale" bar chart 
and "Top 10 product by order" table.

### validation_top10_by_date.sql
Validates daily total sales and order quantities across 
dates. Results were cross-checked against the Power BI 
"Last 30 days sale" trend line chart and KPI cards.
