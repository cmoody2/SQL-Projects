
USE [School];
GO

-- Create table Classes
CREATE TABLE Classes (
	Class_ID INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	Class_Name VARCHAR(50) NOT NULL
);


-- Create table Students
CREATE TABLE Students (
	Student_ID INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	Student_Name VARCHAR(100) NOT NULL,
);


-- Create table Instructors
CREATE TABLE Instructors (
	Instructor_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Instructor_Name VARCHAR(100) NOT NULL
);


-- ADD columns Student_Class_ID and Student_Instructor_ID to table Students
ALTER TABLE Students ADD Student_Class_ID INT, Student_Instructor_ID INT;


-- ADD Foreign key to column Student_Instructor_ID
ALTER TABLE Students 
ADD CONSTRAINT fk_Instructor_ID
FOREIGN KEY (Student_Instructor_ID) REFERENCES Instructors(Instructor_ID) ON UPDATE CASCADE ON DELETE CASCADE;


-- Insert records into Classes table
INSERT INTO Classes
	(Class_Name)
	VALUES
	('Software Developer Boot Camp'),
	('C# Boot Camp')
;


-- Insert records into Students table
INSERT INTO Students
	(Student_Name)
	VALUES
	('Jason Marrow'),
	('Keith Harding'),
	('Sarah Ludwig'),
	('Samantha Lang'),
	('Jafet Bahr'),
	('Monica Johnson')
;


-- Insert records into Instructors table
INSERT INTO Instructors
	(Instructor_Name)
	VALUES
	('Mr. Hoffman'),
	('Ms. Little')
;


-- UPDATE fields in Students table for Students_Class_ID WHERE Student_ID is 1002, 1003, 1004 and 1005
UPDATE Students
SET Student_Class_ID = 100
WHERE Student_ID >= 1002;

-- UPDATE fields in Students table for Student_Class_ID where Student_ID is 1000 and 1001
UPDATE Students
SET Student_Class_ID = 101
WHERE Student_ID < 1002;


-- UPDATE fields in Students table for Student_Instructor_ID where Student_ID is 1002, 1003, 1004 and 1005
UPDATE Students
SET Student_Instructor_ID = 2
WHERE Student_ID >= 1002;


-- UPDATE fields in Students table for Student_Instructor_ID where Student_ID is 1000 and 1001
UPDATE Students
SET Student_Instructor_ID = 1
WHERE Student_ID < 1002;


SELECT Instructor_Name AS 'Instructors'
FROM Instructors;

SELECT Student_Name AS 'Students'
FROM Students ORDER BY Student_Name ASC;

SELECT Class_Name, Instructors.Instructor_Name, Students.Student_Name
FROM Classes
	INNER JOIN Students ON Class_ID = Student_Class_ID
	INNER JOIN Instructors ON Student_Instructor_ID = Instructor_ID
	WHERE Class_ID = Student_Class_ID
;
