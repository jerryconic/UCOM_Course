USE db01;


SELECT EmployeeID, FirstName, LastName
INTO dbo.Employee
FROM Northwind.dbo.Employees;
GO


CREATE VIEW dbo.EmpAll
AS
SELECT * FROM dbo.Employee;
GO

SELECT * FROM dbo.EmpAll;

GO

ALTER TABLE dbo.Employee
ADD Title nvarchar(20)
GO

SELECT * FROM dbo.Employee;

SELECT * FROM dbo.EmpAll;

EXEC sp_helptext 'dbo.EmpAll'

EXEC sp_refreshview 'dbo.EmpAll';

SELECT * FROM dbo.EmpAll;
