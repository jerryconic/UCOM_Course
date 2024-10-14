USE Northwind;
GO

DECLARE @tbl AS TABLE(
id int IDENTITY(1, 1),
data nvarchar(20)
);

INSERT INTO @tbl(data) VALUES('aaa'),('bbb'),('ccc'),('ddd');

SELECT * FROM @tbl;
GO
