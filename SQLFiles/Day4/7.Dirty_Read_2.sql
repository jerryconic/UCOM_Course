USE db01;



SELECT * FROM dbo.Test;  --�|�QLock

SELECT * FROM dbo.Test WITH(NOLOCK);

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

dbcc useroptions;

SELECT * FROM dbo.Test;  --���|�QLock
