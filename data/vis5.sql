SELECT *
FROM Production.ProductCategory

SELECT *
FROM Production.ProductSubcategory

SELECT *
FROM Production.Product

SELECT *
FROM Sales.SalesOrderDetail

SELECT TOP 10
    pp.Name AS ProductName,
    pc.Name AS ProductGroup,
    SUM(sod.LineTotal) AS TotalRevenue
FROM Production.Product pp
INNER JOIN Sales.SalesOrderDetail sod ON pp.ProductID = sod.ProductID
LEFT JOIN Production.ProductSubcategory psc ON pp.ProductSubcategoryID = psc.ProductSubcategoryID
LEFT JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pp.Name, pc.Name
ORDER BY TotalRevenue DESC


