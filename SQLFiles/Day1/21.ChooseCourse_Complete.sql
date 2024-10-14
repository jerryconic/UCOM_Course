/*
USE master;

DROP DATABASE IF EXISTS ChooseCourse;

CREATE DATABASE ChooseCourse
GO
USE ChooseCourse;

CREATE TABLE dbo.Student
(
student_id int CONSTRAINT PK_Student PRIMARY KEY,
student_name nvarchar(20) NOT NULL,
email nvarchar(50) NOT NULL
);

CREATE TABLE dbo.ChooseCourse
(
choose_id int CONSTRAINT PK_ChooseCourse PRIMARY KEY,
student_id int,
course_id int
);

CREATE TABLE dbo.Course
(
coruse_id int CONSTRAINT PK_Course PRIMARY KEY,
course_year smallint,
course_semister tinyint,
subject_id int,
room_id int,
professor_id int
);

CREATE TABLE dbo.Subject
(
subject_id int CONSTRAINT PK_Subject PRIMARY KEY,
subject_name nvarchar(20) NOT NULL,
grade decimal(2, 1)
);

CREATE TABLE dbo.Classroom
(
room_id int CONSTRAINT PK_Classroom PRIMARY KEY,
room_name nvarchar(20),
floor_no tinyint
);

CREATE TABLE dbo.Professor
(
professor_id int CONSTRAINT PK_Professor PRIMARY KEY,
professor_name nvarchar(20) NOT NULL
);

GO

ALTER TABLE dbo.Student
ADD CONSTRAINT UQ_Student_email
UNIQUE(email);
GO
GO

ALTER TABLE dbo.ChooseCourse ADD CONSTRAINT
	FK_ChooseCourse_Student FOREIGN KEY(student_id) 
	REFERENCES dbo.Student(student_id) 
		ON UPDATE  NO ACTION 
		ON DELETE  NO ACTION 
GO
----------------------------------------------------------
*/
USE ChooseCourse;

ALTER TABLE dbo.Course ADD CONSTRAINT FK_Course_Subject 
FOREIGN KEY(subject_id) 
REFERENCES dbo.Subject(subject_id) 
	ON UPDATE  NO ACTION 
	ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Course ADD CONSTRAINT FK_Course_Classroom 
FOREIGN KEY(room_id) 
REFERENCES dbo.Classroom(room_id) 
	ON UPDATE  NO ACTION 
	ON DELETE  NO ACTION 	
GO
ALTER TABLE dbo.Course ADD CONSTRAINT FK_Course_Professor 
FOREIGN KEY(professor_id) 
REFERENCES dbo.Professor(professor_id) 
	ON UPDATE  NO ACTION 
	ON DELETE  NO ACTION 
	
GO

ALTER TABLE dbo.ChooseCourse ADD CONSTRAINT FK_ChooseCourse_Course 
FOREIGN KEY(course_id) 
REFERENCES dbo.Course(coruse_id) 
	ON UPDATE  NO ACTION 
	ON DELETE  NO ACTION 
	
GO

ALTER TABLE dbo.Course
ADD CONSTRAINT CK_Course_course_year 
CHECK(course_year BETWEEN 2000 AND 2100);
GO

ALTER TABLE dbo.Course
ADD CONSTRAINT CK_Course_course_semister
CHECK(course_semister IN (1, 2));
GO

ALTER TABLE dbo.Subject
ADD CONSTRAINT CK_Subject_score
CHECK(grade BETWEEN 0 AND 4);
GO

ALTER TABLE dbo.Classroom
ADD CONSTRAINT CK_Classroom
CHECK(floor_no BETWEEN 1 AND 10);
GO

--------------------

EXECUTE sp_addextendedproperty N'MS_Description', N'學生基本資料', N'SCHEMA', N'dbo', N'TABLE', N'Student', NULL, NULL
EXECUTE sp_addextendedproperty N'MS_Description', N'學生編號', N'SCHEMA', N'dbo', N'TABLE', N'Student', N'COLUMN', N'student_id'
EXECUTE sp_addextendedproperty N'MS_Description', N'學生姓名', N'SCHEMA', N'dbo', N'TABLE', N'Student', N'COLUMN', N'student_name'
EXECUTE sp_addextendedproperty N'MS_Description', N'電子郵件信箱', N'SCHEMA', N'dbo', N'TABLE', N'Student', N'COLUMN', N'email'
GO