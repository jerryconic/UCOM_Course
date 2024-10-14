USE [db01]

GO
CREATE NONCLUSTERED COLUMNSTORE INDEX NCCI_Person ON dbo.Person
(
	BusinessEntityID, PersonType, NameStyle, Title, FirstName, MiddleName, LastName,
	Suffix, EmailPromotion, ModifiedDate
)
GO

CREATE CLUSTERED COLUMNSTORE INDEX CCI_Products 
ON dbo.Products 


GO

SELECT FirstName FROM dbo.Person
WHERE FirstName='Ken'

SELECT * FROM dbo.Products;

