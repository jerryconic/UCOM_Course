USE Northwind;
DECLARE @sql nvarchar(1000);
SET @sql = N'SELECT * FROM dbo.Employees';
EXECUTE(@sql);
GO
SELECT * FROM dbo.Products
GO
DECLARE @name nvarchar(100), @sql nvarchar(1000);
--SET @name = N'Nancy';
--SET @name = N'xxx'' OR 1=1;--';
SET @name = N'xxx'';UPDATE dbo.Products SET UnitPrice = 999 WHERE ProductID=1;--';
SET @sql = N'SELECT * FROM dbo.Employees
			 WHERE FirstName = N''' + @name + '''';
PRINT @sql;
--EXECUTE(@sql);
GO


UPDATE dbo.Products SET UnitPrice = 18 WHERE ProductID=1

GO

DECLARE @name nvarchar(100), @sql nvarchar(1000);
--SET @name = N'Nancy';
--SET @name = N'xxx'' OR 1=1;--';
SET @name = N'xxx'';UPDATE dbo.Products SET UnitPrice = 999 WHERE ProductID=1;--';
SET @sql = N'SELECT * FROM dbo.Employees WHERE FirstName = @FirstName';
EXEC sp_executesql @statement=@sql,
					@params = N'@FirstName nvarchar(100)',
					@FirstName = @name;

GO
SELECT * FROM dbo.Products
