USE Northwind;
GO


CREATE FUNCTION dbo.Top3Order(@yr int, @mn int, @eid int)
RETURNS TABLE AS RETURN
(
    SELECT TOP(3)
	OrderID, OrderDate, CustomerID, EmployeeID
	FROM dbo.Orders
	WHERE YEAR(OrderDate) = @yr
	AND MONTH(OrderDate) = @mn
	AND EmployeeID = @eid
	ORDER BY OrderID DESC
)
GO

SELECT * FROM dbo.Top3Order(1997, 1, 1);