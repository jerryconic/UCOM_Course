USE db01;

SET STATISTICS IO ON;

SELECT * FROM dbo.Person
WHERE BusinessEntityID = 1001;
--2.05858

GO
CREATE UNIQUE CLUSTERED INDEX CX_BusinessEntityID 
ON dbo.Person(BusinessEntityID)


GO

SELECT * FROM dbo.Person
WHERE BusinessEntityID = 1001;

SELECT * FROM dbo.Person WITH(INDEX(0))
WHERE BusinessEntityID = 1001;



SELECT * FROM dbo.Person
WHERE FirstName = 'Ken';


SELECT * FROM dbo.Person
WHERE BusinessEntityID <= 100

GO

CREATE NONCLUSTERED INDEX IX_FirstName 
ON dbo.Person(FirstName)


GO

SELECT * FROM dbo.Person
WHERE FirstName = 'Ken';

SELECT BusinessEntityID, FirstName, LastName, MiddleName, Title
FROM dbo.Person
WHERE FirstName = 'Ken';
GO

CREATE NONCLUSTERED INDEX IX_FirstName
ON dbo.Person(FirstName)
INCLUDE(Title,MiddleName,LastName) 
WITH (DROP_EXISTING = ON)

GO

SELECT BusinessEntityID, FirstName, LastName, MiddleName, Title
FROM dbo.Person
WHERE FirstName = 'Ken';
GO


CREATE NONCLUSTERED INDEX IX_FirstName
ON dbo.Person(FirstName, LastName)
INCLUDE(Title,MiddleName) 
WITH (DROP_EXISTING = ON)
GO

SELECT BusinessEntityID, FirstName, LastName, MiddleName, Title
FROM dbo.Person
WHERE FirstName = 'Ken' AND LastName = 'Myer';

SELECT *
FROM dbo.Person
WHERE FirstName = 'Ken' 

SELECT *
FROM dbo.Person
WHERE LastName = 'Myer';


SELECT BusinessEntityID, FirstName, LastName, MiddleName, Title
FROM dbo.Person
WHERE FirstName = 'Ken' OR LastName = 'Myer';
GO
CREATE NONCLUSTERED INDEX IX_LastName 
ON dbo.Person(LastName)
INCLUDE(Title,FirstName,MiddleName)


GO

SELECT BusinessEntityID, FirstName, LastName, MiddleName, Title
FROM dbo.Person
WHERE FirstName = 'Ken' OR LastName = 'Myer';
GO


SELECT BusinessEntityID, FirstName, LastName, MiddleName, Title
FROM dbo.Person
ORDER BY FirstName, LastName;


SELECT BusinessEntityID, FirstName, LastName, MiddleName, Title
FROM dbo.Person
ORDER BY FirstName DESC, LastName DESC;

SELECT BusinessEntityID, FirstName, LastName, MiddleName, Title
FROM dbo.Person
ORDER BY FirstName ASC, LastName DESC;

SELECT BusinessEntityID, FirstName, LastName, MiddleName, Title
FROM dbo.Person
ORDER BY FirstName DESC, LastName ASC;

USE [db01]
GO
ALTER INDEX [CX_BusinessEntityID] ON [dbo].[Person] REBUILD PARTITION = ALL 
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

ALTER INDEX [CX_BusinessEntityID] ON [dbo].[Person] REORGANIZE  WITH ( LOB_COMPACTION = ON )
GO
ALTER INDEX ALL ON [dbo].[Person] REBUILD PARTITION = ALL 
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

ALTER INDEX ALL ON [dbo].[Person] REORGANIZE  WITH ( LOB_COMPACTION = ON )
