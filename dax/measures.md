# DAX Measures

Naming convention followed: `[Metric] - [Context/Qualifier]`

---

## Sales - Latest Reporting Date
Total sales filtered to the most recent reporting date, 
excluding records with blank purchase order numbers.

```dax
Sales = 
VAR LatestDate = [vmaxdate]
RETURN
    CALCULATE (
        [TotalSalesAmount],
        REMOVEFILTERS ( Date_Dim ),
        Date_Dim[Date] = LatestDate
    )

TotalSalesAmount = 
SUMX( 'SalesOrderHeader_Fact', COALESCE([SubTotal], 0) + COALESCE([TaxAmt], 0) + COALESCE([Freight], 0) )

vmaxdate = 
CALCULATE(
    MAX(Date_Dim[Date]),
    ALL(Date_Dim)
)

```

---

## Sales - Last 30 Days
Daily 30-day sales totals, used to drive the trend line chart.

```dax
SalesLast30Days = 
CALCULATE(
    [TotalDuePerProduct],
    Filter(Date_Dim, Date_Dim[MonthNumber] = [vmaxmonthnum])
    )

TotalDuePerProduct = 
SUMX(
    'SalesOrderDetail_Fact',
    VAR CurrentLineTotal = 'SalesOrderDetail_Fact'[LineTotal]

    VAR OrderSubtotal = 
        CALCULATE(
            SUM('SalesOrderDetail_Fact'[LineTotal]),
            ALLEXCEPT('SalesOrderDetail_Fact', 'SalesOrderDetail_Fact'[SalesOrderID])
        )

    VAR OrderTotalDue = RELATED('SalesOrderHeader_Fact'[TotalDue])
    
    RETURN
        OrderTotalDue * DIVIDE(CurrentLineTotal, OrderSubtotal, 0)
)

vmaxmonthnum = Maxx(Date_Dim, Max(Date_Dim2[MonthNumber]))

```

---

## Orders - Latest Reporting Date
Total number of orders filtered to the most recent reporting date.

```dax
TotalOrder = 
CALCULATE(
    [TotalOrders],
        FILTER(Date_Dim, Date_Dim[Date] = [vmaxdate])
    )

vmaxdate = 
CALCULATE(
    MAX(Date_Dim[Date]),
    ALL(Date_Dim)
)
```

---

## Average Order Value
Total sales divided by total orders for the reporting date.
Surfaces the revenue generated per order on average.

```dax
AvgPricePerUnit = Divide([SalesPerProduct], [TotalOrder], 0)

SalesPerProduct = 
VAR LatestDate = [vmaxdate]
RETURN
CALCULATE(
    [TotalDuePerProduct],
    ALL(Date_Dim[Date]),
    Date_Dim[Date] = LatestDate,
    VALUES(Product_Dim[BaseProductName])
)

[TotalOrder] --The expression is above
```

---

## Latest Reporting Date
Returns the most recent date available in the dataset.
Used as a reference variable across multiple measures.

```dax
vmaxdate = 
CALCULATE(
    MAX(Date_Dim[Date]),
    ALL(Date_Dim)
)
```

## Sales Change Percentage
Returns the growth percentage

```dax
SalesChange% = DIVIDE(
    ( [Sales] - [PreviousDaySales] ) ,
    [PreviousDaySales]
)

Sales = 
VAR LatestDate = [vmaxdate]
RETURN
    CALCULATE (
        [TotalSalesAmount],
        REMOVEFILTERS ( Date_Dim ),
        Date_Dim[Date] = LatestDate
    )

PreviousDaySales = 
VAR PreviousDate = [vprevday]
RETURN
IF(
    NOT ISBLANK(PreviousDate),
    CALCULATE(
        [TotalSalesAmount],
        REMOVEFILTERS(Date_Dim[Date]),  -- Remove filters from the Date column specifically
        Date_Dim[Date] = PreviousDate
    ),
    BLANK()
)
```
