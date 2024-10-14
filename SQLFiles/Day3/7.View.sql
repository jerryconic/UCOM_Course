USE Northwind;

SELECT * FROM dbo.Employees;

SELECT EmployeeID, LastName + ' ' + FirstName, Title
FROM dbo.Employees
ORDER BY LastName;

GO

CREATE VIEW dbo.EmployeeInfo
AS
SELECT TOP(100) PERCENT
EmployeeID, LastName + ' ' + FirstName AS EmployeeName, Title
FROM dbo.Employees
ORDER BY LastName
GO

SELECT * FROM dbo.EmployeeInfo


GO

CREATE VIEW dbo.EmpTotal
AS
SELECT e.EmployeeID, e.FirstName,
	SUM(od.Quantity*od.UnitPrice) AS Total
FROM dbo.Employees e
INNER JOIN dbo.Orders o
	ON e.EmployeeID = o.EmployeeID
INNER JOIN dbo.[Order Details] od
	ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1997 AND MONTH(o.OrderDate) = 1
GROUP BY e.EmployeeID, e.FirstName
GO

SELECT * FROM dbo.EmployeeInfo
SELECT * FROM dbo.EmpTotal


GO

ALTER VIEW dbo.EmployeeInfo
WITH ENCRYPTION
AS
SELECT TOP(100) PERCENT
EmployeeID, LastName + ' ' + FirstName AS EmployeeName, Title
FROM dbo.Employees
ORDER BY LastName
GO

EXEC sp_help 'dbo.EmpTotal'
EXEC sp_helptext 'dbo.EmpTotal'

EXEC sp_help 'dbo.EmployeeInfo'
EXEC sp_helptext 'dbo.EmployeeInfo'
GO

DROP VIEW IF EXISTS dbo.EmployeeInfo;
GO

CREATE VIEW dbo.EmployeeInfo
AS
SELECT TOP(100) PERCENT
EmployeeID, LastName + ' ' + FirstName AS EmployeeName, Title
FROM dbo.Employees
ORDER BY LastName
GO
