/*
USE master;
DROP DATABASE IF EXISTS db01;

CREATE DATABASE db01;
GO
USE db01;

SELECT *
INTO dbo.Products
FROM Northwind.dbo.Products;

SELECT *
INTO dbo.Customers
FROM Northwind.dbo.Customers;

SELECT *
INTO dbo.Orders
FROM Northwind.dbo.Orders;

SELECT *
INTO dbo.OrderDetails
FROM Northwind.dbo.[Order Details];

SELECT *
INTO dbo.Employees
FROM Northwind.dbo.Employees;

GO

CREATE TABLE dbo.Person
(
	BusinessEntityID int NOT NULL,
	PersonType nchar(2) NOT NULL,
	NameStyle nvarchar(50) NOT NULL,
	Title nvarchar(8),
	FirstName nvarchar(50) NOT NULL,
	MiddleName nvarchar(50),
	LastName nvarchar(50) NOT NULL,
	Suffix nvarchar(10),
	EmailPromotion int NOT NULL,
	AdditionalContactInfo xml,
	Demographics xml,
	rowguid uniqueidentifier ROWGUIDCOL  NOT NULL,
	ModifiedDate datetime NOT NULL
 ) 
GO


INSERT INTO dbo.Person(BusinessEntityID ,PersonType ,NameStyle ,Title ,FirstName ,MiddleName,
LastName, Suffix, EmailPromotion, AdditionalContactInfo, Demographics, rowguid, ModifiedDate)
SELECT BusinessEntityID, PersonType, NameStyle, Title, FirstName, MiddleName,
LastName, Suffix, EmailPromotion, AdditionalContactInfo, Demographics, rowguid, ModifiedDate
FROM AdventureWorks.Person.Person

GO
*/

USE db01;

SELECT * FROM dbo.Person
WHERE BusinessEntityID = 1001;


SELECT *
FROM dbo.Orders
WHERE OrderID = 10400

SELECT e.EmployeeID, e.FirstName,
	SUM(od.Quantity*od.UnitPrice) AS Total
FROM dbo.Employees e
INNER JOIN dbo.Orders o
	ON e.EmployeeID = o.EmployeeID
INNER JOIN dbo.OrderDetails od
	ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1997 AND MONTH(o.OrderDate) = 1
GROUP BY e.EmployeeID, e.FirstName;

CREATE UNIQUE CLUSTERED INDEX CX_Employee
ON dbo.Employees(EmployeeID);

CREATE UNIQUE CLUSTERED INDEX CX_OrderID
ON dbo.Orders(OrderID);

CREATE UNIQUE CLUSTERED INDEX CX_OrderID_ProductID
ON dbo.[OrderDetails](OrderID, ProductID);

ALTER TABLE dbo.Orders
ADD Yr AS YEAR(OrderDate),
    Mn AS MONTH(OrderDate);

CREATE NONCLUSTERED INDEX IX_Yr_Mn
ON dbo.Orders(Yr, Mn)
INCLUDE(OrderDate, EmployeeID)