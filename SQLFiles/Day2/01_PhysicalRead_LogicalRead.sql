SET STATISTICS IO ON;

USE AdventureWorks;

SELECT * FROM Person.Person;

/*
Table 'Person'. Scan count 1, logical reads 3821, physical reads 3, page server reads 0, read-ahead reads 3866, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

Table 'Person'. Scan count 1, logical reads 3821, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

*/