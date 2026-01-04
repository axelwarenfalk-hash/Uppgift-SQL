SELECT *
FROM Sales.SalesTerritory

SELECT *
FROM Sales.Customer

SELECT *
FROM Sales.SalesOrderHeader soh

SELECT 
    st.Name AS Region,
    COUNT(DISTINCT soh.CustomerID) AS UniqueCustomers,
    SUM(soh.SubTotal) AS TotalRevenue
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
INNER JOIN Sales.SalesTerritory st ON c.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY TotalRevenue DESC
