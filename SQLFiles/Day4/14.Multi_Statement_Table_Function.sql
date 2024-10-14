USE Northwind;
GO
DROP FUNCTION IF EXISTS dbo.StringTable
GO
CREATE FUNCTION dbo.StringTable(@s nvarchar(max))
RETURNS @tbl TABLE(ch nchar(1))
AS
BEGIN
	DECLARE @i int = 1;
	WHILE @i <= LEN(@s)
	BEGIN
		INSERT INTO @tbl(ch) VALUES(SUBSTRING(@s, @i, 1));
		SET @i = @i + 1;
	END
    RETURN 
END
GO

EXEC sp_helptext 'dbo.StringTable';

SELECT * FROM dbo.StringTable('Hello world!');
GO

DECLARE @tbl AS TABLE(id int PRIMARY KEY);
DECLARE @n int = 1;
WHILE @n <= 100
BEGIN 
	INSERT INTO @tbl(id) VALUES(@n)
	SET @n = @n + 1;
END;
SELECT * FROM @tbl t LEFT JOIN dbo.Products p
	ON t.id = p.ProductID;

GO

DROP TABLE IF EXISTS #tmp;

DECLARE @n int = 1;
CREATE TABLE #tmp(id int PRIMARY KEY)
WHILE @n <= 100
BEGIN 
	INSERT INTO #tmp(id) VALUES(@n)
	SET @n = @n + 1;
END;
GO

SELECT * FROM #tmp t LEFT JOIN dbo.Products p
	ON t.id = p.ProductID;