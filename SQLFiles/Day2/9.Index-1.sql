USE db01;

SET STATISTICS IO ON;

SELECT * FROM dbo.Orders;

SELECT * FROM Northwind.dbo.Orders;


SELECT * FROM dbo.Orders
WHERE OrderID = 10400;

SELECT * FROM Northwind.dbo.Orders
WHERE OrderID = 10400;

GO
CREATE UNIQUE CLUSTERED INDEX CX_OrderID 
ON dbo.Orders(OrderID)
GO


SELECT * FROM dbo.Orders
WHERE OrderID = 10400;

SELECT * FROM Northwind.dbo.Orders
WHERE OrderID = 10400;


SELECT * FROM dbo.Orders
WHERE OrderDate = '1997-1-1';
GO

CREATE NONCLUSTERED INDEX IX_OrderDate 
ON dbo.Orders(OrderDate)
GO

SELECT * FROM dbo.Orders
WHERE OrderDate = '1997-1-1';
GO
SELECT * FROM dbo.Orders WITH(INDEX(0))
WHERE OrderDate = '1997-1-1';
GO


SELECT * FROM dbo.Orders
WHERE OrderDate BETWEEN '1997-1-1' AND '1997-1-5';


SELECT * FROM dbo.Orders
WHERE OrderDate BETWEEN '1997-1-1' AND '1997-1-31';

SELECT * FROM dbo.Orders WITH(INDEX(IX_OrderDate))
WHERE OrderDate BETWEEN '1997-1-1' AND '1997-1-31';


SELECT OrderID, OrderDate FROM dbo.Orders
WHERE OrderDate BETWEEN '1997-1-1' AND '1997-1-31';


SELECT OrderID, OrderDate, EmployeeID, CustomerID FROM dbo.Orders
WHERE OrderDate BETWEEN '1997-1-1' AND '1997-1-31';

GO

CREATE NONCLUSTERED INDEX IX_OrderDate
ON dbo.Orders(OrderDate)
INCLUDE(CustomerID,EmployeeID) 
WITH (DROP_EXISTING = ON)
GO

SELECT OrderID, OrderDate, EmployeeID, CustomerID FROM dbo.Orders
WHERE OrderDate BETWEEN '1997-1-1' AND '1997-1-31';


SELECT OrderID, OrderDate, EmployeeID, CustomerID FROM dbo.Orders
WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) = 1;

ALTER TABLE dbo.Orders
ADD yr AS YEAR(OrderDate),
    mn AS MONTH(OrderDate);
GO

CREATE NONCLUSTERED INDEX IX_yr_mn 
ON dbo.Orders(yr,mn)
INCLUDE(CustomerID,EmployeeID,OrderDate) 

GO

SELECT OrderID, OrderDate, EmployeeID, CustomerID FROM dbo.Orders
WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) = 1;
