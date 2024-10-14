USE master;

DROP DATABASE IF EXISTS db01;

CREATE DATABASE db01;
GO

USE db01;

CREATE TABLE dbo.Employee
(
emp_id int IDENTITY(1, 1) PRIMARY KEY,
emp_name nvarchar(20)
);

GO

CREATE TRIGGER dbo.trg_Employee
   ON dbo.Employee
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM inserted;
	SELECT * FROM deleted;
END
GO


INSERT INTO dbo.Employee(emp_name) VALUES('aaa'), ('bbb'), ('ccc');

UPDATE dbo.Employee SET emp_name = 'XXX';

DELETE FROM dbo.Employee;
GO
DISABLE TRIGGER dbo.trg_Employee ON dbo.Employee;
ENABLE TRIGGER dbo.trg_Employee ON dbo.Employee;

--DROP TRIGGER dbo.trg_Employee

SELECT * FROM sys.triggers;

USE AdventureWorks;

SELECT SCHEMA_NAME(o.schema_id) + '.' + o.name AS table_name, 
SCHEMA_NAME(o.schema_id) + '.' + t.name AS trigger_name, t.* FROM sys.triggers t
INNER JOIN sys.objects o
	ON t.parent_id = o.object_id

SELECT 
CONCAT('EXEC sp_helptext ''', SCHEMA_NAME(o.schema_id) + '.' + t.name, '''') AS trigger_name, t.* FROM sys.triggers t
INNER JOIN sys.objects o
	ON t.parent_id = o.object_id

EXEC sp_helptext 'HumanResources.dEmployee'
EXEC sp_helptext 'Person.iuPerson'
EXEC sp_helptext 'Purchasing.iPurchaseOrderDetail'
EXEC sp_helptext 'Purchasing.uPurchaseOrderDetail'
EXEC sp_helptext 'Purchasing.uPurchaseOrderHeader'
EXEC sp_helptext 'Sales.iduSalesOrderDetail'
EXEC sp_helptext 'Sales.uSalesOrderHeader'
EXEC sp_helptext 'Purchasing.dVendor'
EXEC sp_helptext 'Production.iWorkOrder'
EXEC sp_helptext 'Production.uWorkOrder'

USE db01;

CREATE TABLE dbo.EmployeeHistory
(
emp_id int,
emp_name nvarchar(20),
delete_time datetime DEFAULT GETDATE()
);
GO

CREATE TRIGGER dbo.trg_EmployeeHistory
   ON  dbo.Employee
   AFTER DELETE,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.EmployeeHistory(emp_id, emp_name)
	SELECT emp_id, emp_name FROM deleted;
END
GO

DISABLE TRIGGER dbo.trg_Employee ON dbo.Employee;


INSERT INTO dbo.Employee(emp_name) VALUES('aaa'), ('bbb'), ('ccc');
SELECT * FROM dbo.Employee;
SELECT * FROM dbo.EmployeeHistory;


UPDATE dbo.Employee SET emp_name = 'XXX';
SELECT * FROM dbo.Employee;
SELECT * FROM dbo.EmployeeHistory;

DELETE FROM dbo.Employee;
SELECT * FROM dbo.Employee;
SELECT * FROM dbo.EmployeeHistory;

DISABLE TRIGGER dbo.trg_EmployeeHistory ON dbo.Employee;
GO
CREATE TRIGGER dbo.trg_EmployeeLimit
   ON  dbo.Employee
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT * FROM inserted
		WHERE emp_name LIKE '%admin%')
		THROW 50000, 'cannot insert admin',  1
END
GO
TRUNCATE TABLE dbo.Employee

INSERT INTO dbo.Employee(emp_name) VALUES('aaa'), ('bbb'), ('ccc');

UPDATE dbo.Employee SET emp_name = 'XXX';

SELECT * FROM dbo.Employee;

INSERT INTO dbo.Employee(emp_name) VALUES('aaa'), ('bbb'), ('ccc');

INSERT INTO dbo.Employee(emp_name) VALUES('admin');

INSERT INTO dbo.Employee(emp_name) VALUES('aaa'), ('bbb'), ('ccc');

SELECT * FROM dbo.Employee;

INSERT INTO dbo.Employee(emp_name) VALUES('aaa'), ('bbb'), ('xxxadminxxx');

INSERT INTO dbo.Employee(emp_name) VALUES('aaa'), ('bbb'), ('ccc');

SELECT * FROM dbo.Employee;

UPDATE dbo.Employee
SET emp_name = 'admin'
WHERE emp_id = 1;

DISABLE TRIGGER dbo.trg_EmployeeLimit ON dbo.Employee;
GO
CREATE TRIGGER dbo.trg_Employee_Instead_Of
   ON  dbo.Employee
   INSTEAD OF INSERT, DELETE, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM inserted;
	SELECT * FROM deleted;
END
GO


SELECT * FROM dbo.Employee;

INSERT INTO dbo.Employee(emp_name) VALUES('000'), ('111'), ('222');

UPDATE dbo.Employee SET emp_name = 'Modified'

DELETE FROM dbo.Employee;

SELECT * FROM dbo.Employee;
