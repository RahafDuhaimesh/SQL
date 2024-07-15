CREATE DATABASE Library;
GO

USE Library;
GO

CREATE TABLE Books
(
BookID int ,
Title varchar (100),
AuthorID  int primary key,
PublishedYear int,
CopiesAvailable int,
BookCategory varchar(50)
)
GO

CREATE TABLE Authors
(
AuthorID int FOREIGN KEY REFERENCES Books(AuthorID),
FirstName  varchar (30),
LastName varchar (30),
BirthYear int,
)
GO

INSERT INTO Books VALUES 
(1,'Pride and Prejudice',3456, 1909,400,'Romance'),
(2,'1984',4567, 1900,420,'Politics'),
(3,'Crime and Punishment',5678, 1850,200,'Drama'),
(4,'One Hundred Years of Solitude',7890, 1909,333,'Drama'),
(5,'The Odyssey',0123,1788,324,'Drama');

INSERT INTO Authors VALUES 
(3456,'Jane','Austen', 1800),
(4567,'George', 'Orwell',1920),
(5678,'Fyodor' ,'Dostoevsky', 1820),
(7890,'Gabriel García', 'Márquez', 1780),
(0123, 'Homer','noa',1500)

-- To show all data
SELECT * FROM Books;
SELECT * FROM Authors;

-- To show only the author name and book title
SELECT Books.Title , Authors.FirstName , Authors.LastName
FROM Books
INNER JOIN Authors
ON Authors.AuthorID = Books.AuthorID;

-- MIN. Copies
SELECT MIN(CopiesAvailable)
FROM Books;

-- MAX. Copies
SELECT MAX(CopiesAvailable)
FROM Books;

-- AVG.
SELECT AVG(PublishedYear)
FROM Books;

-- SUM
SELECT SUM(CopiesAvailable)
FROM Books;

-- count of books tiltes in our library
SELECT COUNT(*)
FROM Books;

-- delete the rows 
DELETE FROM Books;
DELETE FROM Authors;