USE Northwind;
--1997/1 每位員工最後三張訂單
--       某位(EmployeeID=1)
SELECT TOP(3)
	OrderID, OrderDate, EmployeeID, CustomerID
FROM dbo.Orders
WHERE YEAR(OrderDate) = 1997
AND MONTH(OrderDate) = 1
AND EmployeeID = 1
ORDER BY OrderID DESC;


SELECT e.EmployeeID, e.FirstName,
o.*
FROM dbo.Employees e
CROSS APPLY
(
SELECT TOP(3)
	OrderID, OrderDate, EmployeeID, CustomerID
FROM dbo.Orders
WHERE YEAR(OrderDate) = 1997
AND MONTH(OrderDate) = 1
AND EmployeeID = e.EmployeeID
ORDER BY OrderID DESC
) o;


SELECT e.EmployeeID, e.FirstName,
o.*
FROM dbo.Employees e
OUTER APPLY
(
SELECT TOP(3)
	OrderID, OrderDate, EmployeeID, CustomerID
FROM dbo.Orders
WHERE YEAR(OrderDate) = 1997
AND MONTH(OrderDate) = 1
AND EmployeeID = e.EmployeeID
ORDER BY OrderID DESC
) o

SELECT e.EmployeeID, e.FirstName,
o.*
FROM dbo.Employees e
OUTER APPLY dbo.Top3Order(1997, 1, e.EmployeeID) o;