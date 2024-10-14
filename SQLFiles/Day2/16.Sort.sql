USE Northwind;

SELECT * FROM dbo.Employees;

SELECT EmployeeID, LastName FROM dbo.Employees;

SELECT * FROM dbo.Products;

SELECT ProductID, ProductName FROM dbo.Products;

SELECT ProductID, ProductName, UnitPrice FROM dbo.Products;

SELECT ProductID, ProductName, UnitPrice FROM dbo.Products
ORDER BY UnitPrice;

USE [db01]
GO

CREATE UNIQUE CLUSTERED INDEX CX_ProductID 
ON dbo.Products(ProductID)
WITH (PAD_INDEX = ON, FILLFACTOR = 90)

GO

SELECT * FROM dbo.Orders;

USE [db01]

GO

CREATE NONCLUSTERED INDEX IX_OrderDate 
ON dbo.Orders(OrderDate)


GO


SELECT * FROM dbo.Orders
WHERE OrderDate = '1997-1-1';
