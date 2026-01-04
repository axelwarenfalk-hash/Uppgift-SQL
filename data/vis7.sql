SELECT *
FROM Sales.Store

SELECT *
FROM Sales.Customer

SELECT *
FROM Sales.SalesOrderHeader soh

SELECT *
FROM Sales.SalesTerritory

-- Fråga 1
SELECT
    st.Name,
    COUNT(soh.SalesOrderID) AS TotalOrderNumber,
    SUM(soh.SubTotal) AS TotalRevenue,
    SUM(soh.SubTotal) / COUNT(soh.SalesOrderID) AS AOV
FROM Sales.SalesTerritory st
INNER JOIN Sales.SalesOrderHeader soh ON st.TerritoryID = soh.TerritoryID
INNER JOIN Sales.Customer sc ON soh.CustomerID = sc.CustomerID
GROUP BY st.Name
ORDER BY AOV DESC

-- Fråga 2
SELECT
    st.Name AS Region,
    CASE WHEN sc.StoreID IS NULL THEN 'Private' ELSE 'Business' END AS CustomerType,
    COUNT(soh.SalesOrderID) AS TotalOrderNumber,
    SUM(soh.SubTotal) AS TotalRevenue,
    SUM(soh.SubTotal) / COUNT(soh.SalesOrderID) AS AOV
FROM Sales.SalesTerritory st
INNER JOIN Sales.SalesOrderHeader soh ON st.TerritoryID = soh.TerritoryID
INNER JOIN Sales.Customer sc ON soh.CustomerID = sc.CustomerID
GROUP BY st.Name, CASE WHEN sc.StoreID IS NULL THEN 'Private' ELSE 'Business' END
ORDER BY AOV DESC

-- Slå ihop båda
SELECT
    st.Name AS Region,
    COUNT(soh.SalesOrderID) AS TotalOrderNumber,
    SUM(soh.SubTotal) AS TotalRevenue,
    SUM(soh.SubTotal) / COUNT(soh.SalesOrderID) AS AOV,
    SUM(CASE WHEN sc.StoreID IS NULL THEN soh.SubTotal END) / 
    COUNT(CASE WHEN sc.StoreID IS NULL THEN soh.SalesOrderID END) AS AOVPrivate,
    SUM(CASE WHEN sc.StoreID IS NOT NULL THEN soh.SubTotal END) / 
    COUNT(CASE WHEN sc.StoreID IS NOT NULL THEN soh.SalesOrderID END) AS AOVBusiness
FROM Sales.SalesTerritory st
INNER JOIN Sales.SalesOrderHeader soh ON st.TerritoryID = soh.TerritoryID
INNER JOIN Sales.Customer sc ON soh.CustomerID = sc.CustomerID
GROUP BY st.Name
ORDER BY AOV DESC
