SELECT *
FROM Sales.SalesOrderHeader

SELECT 
    FORMAT(OrderDate, 'yyyy-MM') AS YearMonth,
    SUM(SubTotal) AS Revenue
FROM Sales.SalesOrderHeader
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY YearMonth
