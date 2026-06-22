
--1. /* ============================================================
   Query: Top 30 Daily Total Due Allocation by Date
   Source: AdventureWorks_Presentation
   Output: Top 30 records, ranked by Date (desc) then by the 
           calculated TotalDue percentage (desc)
   ============================================================ */

SELECT TOP 30
     [Date]
    ,ROUND(SUM([TotalDue] * ([LineTotal] / LTperOrder)), 3) AS "TDueperProd_%"  
        -- Allocates each order's TotalDue proportionally to each 
        -- line item, based on that line's share of the order's 
        -- total LineTotal, then sums across the date
FROM 
(
    -- ------------------------------------------------------------
    -- Subquery: Build line-item level dataset with order-level 
    -- and product-level attributes joined in, plus a window 
    -- function to calculate each order's total LineTotal 
    -- (needed for proportional allocation in the outer query)
    -- ------------------------------------------------------------
    SELECT 
        [OrderQty]
       ,[BaseProductName]
       ,[OrderDate] AS [Date]
       ,[PurchaseOrderNumber]
       ,[ListPrice]
       ,[TotalDue]
       ,[LineTotal]
       ,SUM([LineTotal]) OVER (PARTITION BY [SalesOID]) AS LTperOrder
        -- Sum of LineTotal across all line items within the same 
        -- order (SalesOID), used as the denominator for calculating 
        -- each line item's share of the order

    FROM [AdventureWorks_Presentation].[dbo].[SalesOrderDetail_Fact] AS SOD_F

    -- Join order header data (TotalDue, OrderDate, etc.) 
    -- using SalesOrderID; aliased as SalesOID for clarity downstream
    LEFT JOIN (
        SELECT *, [SalesOrderID] AS [SalesOID] 
        FROM [AdventureWorks_Presentation].[dbo].[SalesOrderHeader_Fact]
    ) AS SOH_F
        ON SOD_F.[SalesOrderID] = SOH_F.[SalesOrderID]

    -- Join product dimension to bring in product attributes 
    -- (e.g., BaseProductName, ListPrice)
    LEFT JOIN (
        SELECT * 
        FROM [AdventureWorks_Presentation].[dbo].[Product_Dim]
    ) AS Prod_D
        ON SOD_F.[ProductID] = Prod_D.[ProductID]

) AS A

-- Aggregate to one row per date
GROUP BY [Date]

-- Show most recent dates first; within each date, 
-- prioritize the highest TotalDue allocation share
ORDER BY [Date] DESC, "TDueperProd_%" DESC
;


