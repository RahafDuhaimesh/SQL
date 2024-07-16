CREATE DATABASE SchoolSystem;
GO

USE SchoolSystem;
GO
-- The relation between Teachers and TeachersDetails: one-to-one
-- The relation between Teachers and Courses: one-to-many
-- The relation between Teachers and Students: many-to-many
CREATE TABLE Teachers (
    ID INT PRIMARY KEY,
    TeacherName VARCHAR(30)
);

CREATE TABLE TeachersDetails (
    ID INT PRIMARY KEY,
    Teachers_ID INT FOREIGN KEY REFERENCES Teachers(ID),
    Major VARCHAR(50),
    Salary FLOAT
);

CREATE TABLE Courses 
(
ID int primary key,
CourseName varchar(30),
CourseWeight int,
Teachers_ID int FOREIGN KEY REFERENCES Teachers(ID),
);

CREATE TABLE Students 
(
ID int primary key,
StudentName varchar (30),
Email varchar(50)
);

CREATE TABLE StudentsSchedule 
(
ID INT PRIMARY KEY,
Students_ID INT FOREIGN KEY REFERENCES Students(ID),
StudentName varchar (30),
Courses_ID INT FOREIGN KEY REFERENCES Courses(ID),
CourseName varchar(30),
TeacherName varchar(30),
);
ALTER TABLE StudentsSchedule
DROP COLUMN TeacherName;

INSERT INTO Teachers VALUES
      (5078,'Eng.Rahaf'),
	  (5079,'Eng.Rana'),
	  (5080,'Eng.Lara'),
	  (5081,'Eng.Sarah'),
	  (5082,'Eng.Dana')

INSERT INTO TeachersDetails VALUES
      (1,5078,'Web Development',300),
	  (2,5079,'Front End',300),
	  (3,5080,'Back End',560),
	  (4,5081,'Cyber',980),
	  (5,5082,'Flutter',330)

INSERT INTO Courses VALUES
      (123,'C#',3 ,5080 ),
	  (1230,'C# Lab',1 , 5079),
	  (234,'Cyber Sequrity',3, 5081),
	  (345,'Full-Stack',6, 5078),
	  (3450,'Full-Stack Lab',2, 5078),
	  (566,'Flutter',6, 5082),
	  (5660,'Flutter Lab' , 2 , 5079)

INSERT INTO Students VALUES
      (22,'Sarah','Sarah@gmail.com'),
	  (42,'Sonia','Sonia@gmail.com'),
	  (62,'Salam','Salam@gmail.com'),
	  (72,'Doaa', 'Doaa@gmail.com'),
	  (82,'Zain', 'Zain@gmail.com'),
	  (92,'Zaina','Zaina@gmail.com'),
	  (52,'Julia','Julia@gmail.com'),
	  (32,'Ishraaq','Ishraaq@gmail.com'),
	  (44,'Duha', 'Duha@gmail.com')

INSERT INTO StudentsSchedule VALUES
      (1, 22, 'Sarah',123,'C#'),
	  (2, 22,'Sarah',1230 ,'C# Lab'),
	  (3,42,'Sonia',123,'C#'),
	  (4,62, 'Salam',234,'Cyber Sequrity'),
	  (5,72, 'Doaa',345,'Full-Stack'),
	  (6,72,'Doaa', 3450,'Full-Stack Lab'),
	  (7,72,'Doaa', 123,'C#'),
	  (8,82, 'Zain',345,'Full-Stack'),
	  (9,92,'Zaina',566, 'Flutter'),
	  (10,52 ,'Julia',5660,'Flutter Lab' ),
	  (11,32,'Ishraaq',5660,'Flutter Lab' ),
	  (12,44 ,'Duha',345,'Full-Stack'),
	  (13,44 ,'Duha',5660,'Flutter Lab')