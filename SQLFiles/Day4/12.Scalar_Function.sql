USE Northwind;

GO
CREATE FUNCTION dbo.Fact(@n tinyint)
RETURNS decimal(38, 0)
AS
BEGIN
	DECLARE @i tinyint =1;
	DECLARE @result decimal(38, 0) = 1;
	WHILE @i <= @n
	BEGIN
		SET @result = @result * @i;
		SET @i = @i + 1;
	END
    RETURN @result
END
GO

SELECT dbo.Fact(1)
SELECT dbo.Fact(2)
SELECT dbo.Fact(3)
SELECT dbo.Fact(4)
SELECT dbo.Fact(5)
SELECT dbo.Fact(6)
SELECT dbo.Fact(7)
SELECT dbo.Fact(8)
SELECT dbo.Fact(9)
SELECT dbo.Fact(10)
GO

DECLARE @i tinyint = 1;
WHILE @i <= 33
BEGIN
	PRINT CONCAT(@i, '! = ', dbo.Fact(@i));
	SET @i = @i + 1;
END

SELECT RAND();
SELECT GETDATE();
SELECT SUSER_ID(), USER_ID();
