SELECT *
FROM Sales.SalesOrderHeader

SELECT 
    FORMAT(OrderDate, 'yyyy') AS Years,
    COUNT(DISTINCT SalesOrderId) AS UniqueOrders,
    SUM(SubTotal) AS TotalRevenue
FROM Sales.SalesOrderHeader
GROUP BY FORMAT(OrderDate, 'yyyy')
ORDER BY Years
