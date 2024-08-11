CREATE DATABASE SMS;
GO

USE SMS;
GO
-- Relations:
--(1-m): (Students & FamilyInformation)
--(1-1): 
--(m-m): (Students & Courses )
CREATE TABLE Students 
(
ID INT PRIMARY KEY IDENTITY(1,1),
StudentName VARCHAR(50),
StudentDateOfBirth DATE,
AddressOfStudent VARCHAR(255)
);

CREATE TABLE FamilyInformation
(
ID INT PRIMARY KEY IDENTITY(1,1),
Student_ID INT Foreign KEY REFERENCES Students(ID),
FatherName VARCHAR(255)
);

CREATE TABLE Courses
(
ID INT PRIMARY KEY IDENTITY(1,1),
CourseName VARCHAR(255),
CourseDescription VARCHAR(255),
Resources VARCHAR(255)
);
CREATE TABLE StudentsInCourses
(
ID INT PRIMARY KEY IDENTITY(1,1),
Student_ID INT Foreign KEY REFERENCES Students(ID),
Course_ID INT Foreign KEY REFERENCES Courses(ID),
);
CREATE TABLE Classes
(
ID INT PRIMARY KEY IDENTITY(1,1),
Course_ID INT Foreign KEY REFERENCES Courses(ID),
RoomNumber INT,
Schedule VARCHAR(255)

);
INSERT INTO Classes (Course_ID,RoomNumber,Schedule) VALUES 
(1,222,'DAILY'),
(2,333,'DAILY'),
(3,444,'DAILY');

CREATE TABLE Assignments
(
ID INT PRIMARY KEY IDENTITY(1,1),
Student_ID INT Foreign KEY REFERENCES Students(ID),
Course_ID INT Foreign KEY REFERENCES Courses(ID),
AssignmentName VARCHAR(255),
AssignmentDescription VARCHAR(255),
DueDate DATE,
Status VARCHAR(30)
);

CREATE TABLE Attendance
(
ID INT PRIMARY KEY IDENTITY(1,1),
Student_ID INT Foreign KEY REFERENCES Students(ID),
AttendanceDate DATE,
TypeOfAbsence VARCHAR(255),
Reason VARCHAR(255)
);

-- Q2
SELECT * FROM Courses WHERE CourseName='C++';

-- Q3
ALTER TABLE Students
ADD Email VARCHAR(255);

--Q4
INSERT INTO Students VALUES
('Demaa','2024-04-02','Amman','d@gmail.com');

--Q5
SELECT * FROM Students 
JOIN FamilyInformation ON Students.ID = FamilyInformation.Student_ID;

--Q6
SELECT * FROM StudentsInCourses WHERE StudentsInCourses.Course_ID= 1;

--Q7
SELECT Student_ID FROM Assignments WHERE Assignments.Status='pass' AND Assignments.AssignmentName='Task';

--Q8
SELECT Student_ID FROM Attendance WHERE AttendanceDate < '2024-07-01';

--Q9
SELECT Students.StudentName, COUNT(Attendance.TypeOfAbsence) AS NUMBER
FROM Students
JOIN Attendance ON Students.ID = Attendance.Student_ID
WHERE Attendance.TypeOfAbsence = 'absence'
GROUP BY Students.StudentName
HAVING COUNT(Attendance.TypeOfAbsence) >= 4;
