USE Northwind;

SELECT OrderID, OrderDate,
ROW_NUMBER() OVER (ORDER BY OrderID) AS rno
FROM dbo.Orders;

WITH Ord
AS
(
SELECT OrderID, OrderDate,
ROW_NUMBER() OVER (ORDER BY OrderID) AS rno
FROM dbo.Orders
)
SELECT * FROM Ord
WHERE rno BETWEEN 81 AND 100;

SELECT CategoryID, ProductID, ProductName, UnitPrice,
RANK() OVER (ORDER BY UnitPrice DESC) AS rnk,
DENSE_RANK() OVER (ORDER BY UnitPrice DESC) AS d_rnk
FROM dbo.Products

SELECT CategoryID, ProductID, ProductName, UnitPrice,
RANK() OVER (PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS rnk
FROM dbo.Products;

SELECT ProductID, ProductName, UnitPrice,
NTILE(5) OVER (ORDER BY UnitPrice DESC) AS PriceType
FROM dbo.Products

--SQL 2012

SELECT CategoryID, ProductID, ProductName, UnitPrice,
SUM(UnitPrice) OVER (ORDER BY ProductID) AS RunningTotal
FROM dbo.Products;


SELECT CategoryID, ProductID, ProductName, UnitPrice,
SUM(UnitPrice) OVER (ORDER BY UnitPrice
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM dbo.Products;


SELECT CategoryID, ProductID, ProductName, UnitPrice,
AVG(UnitPrice) OVER (ORDER BY UnitPrice
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingAverage
FROM dbo.Products;

SELECT CategoryID, ProductID, ProductName, UnitPrice,
SUM(UnitPrice) OVER () AS Total_All
FROM dbo.Products;

SELECT CategoryID, ProductID, ProductName, UnitPrice,
(SELECT SUM(UnitPrice) FROM dbo.Products) AS Total_All
FROM dbo.Products;


SELECT CategoryID, ProductID, ProductName, UnitPrice,
SUM(UnitPrice) OVER () AS Total_All,
SUM(UnitPrice) OVER (PARTITION BY CategoryID) AS Total_Category
FROM dbo.Products;