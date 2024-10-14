USE Northwind;

DECLARE @n AS int=0;
SET @n = 50;
SELECT @n AS num;
PRINT @n;
GO

DECLARE @n1 AS int, @n2 AS int;
SELECT @n1 = 50, @n2 = 60;
SELECT @n1 AS num_1, @n2 AS num_2;
PRINT @n1 + @n2;
GO

DECLARE @n AS int=0;
--SET @n = 50;
SELECT @n AS num;
PRINT @n;
GO

DECLARE @s varchar --varchar(1), char, varchar, nchar, nvarchar
SET @s = 'ABCD';
SELECT @s as string
GO

SELECT CAST(123 as char); --char(30), char, varchar, nchar, nvarchar
SELECT CONVERT(char, 123);

--1234567890123456789012345678901234567890--
--123                           --
SELECT DATALENGTH(CONVERT(char, 123))
GO


SELECT FirstName, LastName
FROM dbo.Employees
WHERE EmployeeID = 5;
GO

DECLARE @f_name nvarchar(30), @l_name nvarchar(30);
SELECT @f_name = FirstName, @l_name = LastName
FROM dbo.Employees
WHERE EmployeeID = 5;
SELECT @f_name + ' ' + @l_name AS emp_name
GO
/*
DECLARE @rec_count int;
SELECT @rec_count = COUNT(*)
FROM dbo.Orders
WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) = 1;
SELECT @rec_count AS Order_Count;

*/

DECLARE @rec_count int;
SET @rec_count = 
(
SELECT COUNT(*)
FROM dbo.Orders
WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) = 1
);
SELECT @rec_count AS Order_Count;
