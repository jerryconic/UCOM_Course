USE master;

CREATE DATABASE db01;
GO
USE db01;

CREATE TABLE dbo.Employee
(
	emp_id int CONSTRAINT PK_Employee PRIMARY KEY,
	emp_name nvarchar(20), 

    --Period columns and PERIOD FOR SYSTEM_TIME definition
    stime datetime2 GENERATED ALWAYS AS ROW START,
    etime datetime2 GENERATED ALWAYS AS ROW END,
    PERIOD FOR SYSTEM_TIME(stime, etime)
)
WITH
(
    SYSTEM_VERSIONING = ON 
    (
        --If HISTORY_TABLE does not exists, default table will be created.
        HISTORY_TABLE = dbo.EmployeeHistory
    )
)

GO

INSERT INTO dbo.Employee(emp_id, emp_name)
VALUES(1, 'John'), (2, 'Peter'), (3, 'Linda'), (4, 'Alice');

SELECT * FROM dbo.Employee;

SELECT emp_id, emp_name, SWITCHOFFSET(stime, '+08:00') AS stime, etime FROM dbo.Employee;

WAITFOR DELAY '0:0:10';

UPDATE dbo.Employee
SET emp_name = 'Nick'
WHERE emp_id = 3;

SELECT emp_id, emp_name, SWITCHOFFSET(stime, '+08:00') AS stime, etime FROM dbo.Employee;
SELECT emp_id, emp_name, SWITCHOFFSET(stime, '+08:00') AS stime, SWITCHOFFSET(etime, '+08:00') AS etime FROM dbo.EmployeeHistory;

WAITFOR DELAY '0:0:10';

DELETE FROM dbo.Employee
WHERE emp_id = 4;

SELECT emp_id, emp_name, SWITCHOFFSET(stime, '+08:00') AS stime, etime FROM dbo.Employee;
SELECT emp_id, emp_name, SWITCHOFFSET(stime, '+08:00') AS stime, SWITCHOFFSET(etime, '+08:00') AS etime FROM dbo.EmployeeHistory;

GO

SELECT * FROM dbo.Employee
SELECT * FROM dbo.EmployeeHistory

SELECT * FROM dbo.Employee
FOR SYSTEM_TIME AS OF '2024-02-20 03:29:27.3810359'

--Linda Update => Nick
SELECT * FROM dbo.Employee
FOR SYSTEM_TIME AS OF '2024-02-20 03:31:00.5784676'

--DELETE Alice
SELECT * FROM dbo.Employee
FOR SYSTEM_TIME AS OF '2024-02-20 03:32:30.3307776'


SELECT * FROM dbo.Employee
FOR SYSTEM_TIME FROM '2024-02-20 03:29:27.3810359' TO '2024-02-20 03:31:00.5784676'

SELECT * FROM dbo.Employee
FOR SYSTEM_TIME BETWEEN '2024-02-20 03:29:27.3810359' AND '2024-02-20 03:31:00.5784676'

SELECT * FROM dbo.Employee
FOR SYSTEM_TIME CONTAINED IN( '2024-02-20 03:29:27.3810359', '2024-02-20 03:31:00.5784676')

SELECT * FROM dbo.Employee
FOR SYSTEM_TIME ALL


DROP TABLE dbo.EmployeeHistory
DROP TABLE dbo.Employee

DELETE FROM dbo.EmployeeHistory
UPDATE dbo.EmployeeHistory SET emp_name = 'xxx';
INSERT INTO dbo.EmployeeHistory(emp_id,emp_name)
     VALUES(9,'xxx')
GO

TRUNCATE TABLE dbo.Employee

ALTER TABLE dbo.Employee
SET (SYSTEM_VERSIONING=OFF)

ALTER TABLE dbo.Employee
SET (SYSTEM_VERSIONING=ON(HISTORY_TABLE=dbo.EmployeeHistory))


