/*
================================
	1. Creating the Database
================================
*/

CREATE DATABASE Library_System;

/*
================================
	2. Creating the Tables
================================
*/

CREATE TABLE Authors (
    Author_Id  int IDENTITY (1,1) NOT NULL PRIMARY KEY,
    Name nvarchar(255) NOT NULL,
    Nationality nvarchar(255),
);

CREATE TABLE Books (
    Id int IDENTITY (1,1) NOT NULL PRIMARY KEY,
    ISBN nvarchar(255) NOT NULL UNIQUE,
    Category nvarchar(255),
	Name nvarchar(255),
	Author_Id  int NOT NULL,
    Available_Copies int NOT NULL,
	CONSTRAINT FK_AuthorBook FOREIGN KEY (Author_Id)
    REFERENCES Authors(Author_Id)
);
 
 CREATE TABLE Reader_Status (
	Reader_Type nvarchar (255) NOT NULL PRIMARY KEY,
	Books_Number int NOT NULL,
	Days_Limit int NOT NULL,
);

CREATE TABLE Reader (
    Reader_Id int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Reader_Type nvarchar (255) NOT NULL,
    Name nvarchar (255)  NOT NULL,
	Phone int NOT NULL,
	CONSTRAINT FK_ReaderType FOREIGN KEY (Reader_Type)
    REFERENCES Reader_Status (Reader_Type)
);

CREATE TABLE Librarian(
	Librarian_Id int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Name nvarchar (255)  NOT NULL,
	Password int NOT NULL UNIQUE,
	Phone int NOT NULL,
	Salary int NOT NULL
);

CREATE TABLE Borrow_Information(
	Borrow_Id int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Borrow_Date date NOT NULL,
	Return_Date date NOT NULL,
	Reader_Id int NOT NULL,
	ISBN nvarchar(255) NOT NULL,
	Librarian_Id int NOT NULL
	CONSTRAINT FK_ReaderID FOREIGN KEY (Reader_Id)
    REFERENCES Reader (Reader_Id),
	CONSTRAINT FK_BookISBN FOREIGN KEY (ISBN)
    REFERENCES Books (ISBN),
	CONSTRAINT FK_LibrarianID FOREIGN KEY (Librarian_Id)
    REFERENCES Librarian (Librarian_Id)
	
);


/*
================================
	3. Filling the Tables
================================
*/

/* Filling the Authors */

INSERT INTO Authors (Name, Nationality)
VALUES ('George Orwell', 'English');

INSERT INTO Authors (Name, Nationality)
VALUES ('Stephen Covey', 'American');

INSERT INTO Authors (Name, Nationality)
VALUES ('Charles Dickens', 'English ');

INSERT INTO Authors (Name, Nationality)
VALUES ('William Shakespeare', 'English ');

/* Showing the 4 Authors*/

SELECT * FROM Authors

/* Filling the books */

INSERT INTO Books(ISBN, Category,Name,Author_Id,Available_Copies)
VALUES ('1-78730-254-7','Novel','Nineteen Eighty-Four',1,5);

INSERT INTO Books (ISBN, Category,Name,Author_Id,Available_Copies)
VALUES ('1-78730-244-2','Political Fiction','Animal Farm',1,4);

INSERT INTO Books (ISBN, Category,Name,Author_Id,Available_Copies)
VALUES ('1-65520-241-2','Self-help','The 7 Habits of Highly Effective People',2,7);

INSERT INTO Books (ISBN, Category,Name,Author_Id,Available_Copies)
VALUES ('1-54020-290-2','Novel','Oliver Twist',3,15);

INSERT INTO Books(ISBN, Category,Name,Author_Id,Available_Copies)
VALUES ('1-53080-500-5','Novel','The Old Curiosity Shop',3,1);

INSERT INTO Books (ISBN, Category,Name,Author_Id,Available_Copies)
VALUES ('1-53020-402-5','Novel','The Mystery of Edwin Drood',3,3);

INSERT INTO Books (ISBN, Category,Name,Author_Id,Available_Copies)
VALUES ('1-23020-002-8','Tragedy Essay','King Lear',4,9);

INSERT INTO Books (ISBN, Category,Name,Author_Id,Available_Copies)
VALUES ('1-25000-905-6','Drama','The Complete Works of Shakespeare',4,12);

INSERT INTO Books (ISBN, Category,Name,Author_Id,Available_Copies)
VALUES ('1-19820-102-2','Tragedy','Hamlet',4,18);

INSERT INTO Books (ISBN, Category,Name,Author_Id,Available_Copies)
VALUES ('1-13020-120-0','Tragedy','Romeo and Juliet',4,25);


/* Showing the 10 Books*/

SELECT * FROM Books


/* Filling the Reader_Status */

INSERT INTO Reader_Status(Reader_Type, Books_Number, Days_Limit)
VALUES ('Teacher', 8, 10)

INSERT INTO Reader_Status(Reader_Type, Books_Number, Days_Limit)
VALUES ('Student', 5, 7)

/* Showing the 2 Status*/

SELECT * FROM Reader_Status

/* Filling the Reader */

INSERT INTO Reader(Reader_Type, Name, Phone)
VALUES ('Teacher', 'Ahmed Mohamed', '01202646484')

INSERT INTO Reader(Reader_Type, Name, Phone)
VALUES ('Teacher', 'Belal Mohamed', '01005686754')

INSERT INTO Reader(Reader_Type, Name, Phone)
VALUES ('Teacher', 'Ali Yasser', '01102746789')

INSERT INTO Reader(Reader_Type, Name, Phone)
VALUES ('Student', 'Amr Gaber', '01213985189')

INSERT INTO Reader(Reader_Type, Name, Phone)
VALUES ('Student', 'Adham Mohsen', '01546370011')

/* Showing the 5 Readers*/

SELECT * FROM Reader


/* Filling the Librarian */

INSERT INTO Librarian(Name, Password, Phone, Salary)
VALUES ('Ramy Mohamed', '85523345', '01055894642', 3200)

INSERT INTO Librarian(Name, Password, Phone, Salary)
VALUES ('Yousef Ahmed', '94565699', '01244781100', 2800)

/* Showing the 2 Librarians*/

SELECT * FROM Librarian


/* Filling the Borrow_Information */

INSERT INTO Borrow_Information (Borrow_Date, Return_Date, Reader_Id, ISBN,Librarian_Id)
VALUES ('2020-5-20', '2020-5-28', 2,'1-19820-102-2',1)

INSERT INTO Borrow_Information (Borrow_Date, Return_Date, Reader_Id, ISBN,Librarian_Id)
VALUES ('2020-6-2', '2020-6-7', 4,'1-78730-254-7',1)

INSERT INTO Borrow_Information (Borrow_Date, Return_Date, Reader_Id, ISBN,Librarian_Id)
VALUES ('2020-5-15', '2020-5-20', 4,'1-78730-244-2',2)

INSERT INTO Borrow_Information (Borrow_Date, Return_Date, Reader_Id, ISBN,Librarian_Id)
VALUES ('2020-4-10', '2020-4-15', 5,'1-65520-241-2',2)

INSERT INTO Borrow_Information (Borrow_Date, Return_Date, Reader_Id, ISBN,Librarian_Id)
VALUES ('2020-5-2', '2020-5-10', 3,'1-78730-254-7',2)

INSERT INTO Borrow_Information (Borrow_Date, Return_Date, Reader_Id, ISBN,Librarian_Id)
VALUES ('2020-6-2', '2020-6-10', 2,'1-13020-120-0',1)

INSERT INTO Borrow_Information (Borrow_Date, Return_Date, Reader_Id, ISBN,Librarian_Id)
VALUES ('2020-6-2', '2020-6-10', 2,'1-23020-002-8',1)

INSERT INTO Borrow_Information (Borrow_Date, Return_Date, Reader_Id, ISBN,Librarian_Id)
VALUES ('2020-5-28', '2020-6-3', 3,'1-78730-244-2',1)

INSERT INTO Borrow_Information (Borrow_Date, Return_Date, Reader_Id, ISBN,Librarian_Id)
VALUES ('2020-5-28', '2020-6-3', 3,'1-25000-905-6',1)

INSERT INTO Borrow_Information (Borrow_Date, Return_Date, Reader_Id, ISBN,Librarian_Id)
VALUES ('2020-4-15', '2020-4-20', 5,'1-19820-102-2',2)

INSERT INTO Borrow_Information (Borrow_Date, Return_Date, Reader_Id, ISBN,Librarian_Id)
VALUES ('2020-6-1', '2020-6-9', 1,'1-54020-290-2',2)

INSERT INTO Borrow_Information (Borrow_Date, Return_Date, Reader_Id, ISBN,Librarian_Id)
VALUES ('2020-6-5', '2020-6-13', 1,'1-53020-402-5',1)


/* Showing the 12 Borrow Processes*/

SELECT * FROM Borrow_Information



/*
===========================================================
	4. Select Statements using Different Functions
===========================================================
*/

/* 1.How to Count number of Borrow processes? */

SELECT COUNT(*) FROM Borrow_Information

/* 2. How to know the number of available books' copies? */

SELECT SUM(Available_Copies) FROM Books

/* 3.How to Find the book that has maximum number of copies? */

SELECT * FROM Books WHERE Available_Copies IN (SELECT MAX(Available_Copies) FROM Books  );

/* 4.How to Find the book that has maximum number of copies? */

SELECT * FROM Books WHERE Available_Copies IN (SELECT MIN(Available_Copies) FROM Books  );

/* 5. how to Find the average number of the whole books? */

SELECT AVG(Books.Id) FROM Books 

/* 6. How to make all the books name in lower case? */

SELECT LOWER(Books.Name) FROM Books

/* 7. How to make all the authors name in upper case? */

SELECT UPPER(Authors.Name) FROM Authors

/* 8.How to get the day of every borrow process? */

SELECT DAY(Borrow_Information.Borrow_Date) FROM Borrow_Information


/* 9. How to get the month of every borrow process? */

SELECT MONTH(Borrow_Information.Borrow_Date) FROM Borrow_Information

/* 10. How to get the year of every borrow process? */

SELECT YEAR(Borrow_Information.Borrow_Date) FROM Borrow_Information

/* 11. How to get the Length of the books' ISBN? */

SELECT LEN(Books.ISBN) FROM Books

/* 12. How to re-format the phone numbers? */

SELECT FORMAT(Reader.Phone, '0##-###-###-##') FROM Reader

/* 13. How to set the Salary of librarians to be float? */

SELECT CONVERT(float, Librarian.Salary)FROM Librarian

/* 14. How to know if the books' ISBN is null or not? */

SELECT ISNULL(NULL, Books.ISBN) FROM Books

/* 15. How to combine the books category after its name? */

SELECT CONCAT(Books.Name,' is a ' ,Books.Category)FROM Books

/* 16. How to know which book id is rare or available? */

SELECT IIF(Books.Available_Copies < 5, 'Rare Copy', 'Available copy') FROM Books 

/* 17. How to make the books' ISBN shorter and replace the rest with "..."? */

SELECT STUFF(Books.ISBN, 8, 13, '...') FROM Books

/* 18. How to reverse the authors' nationality? */

SELECT REVERSE(Authors.Nationality)FROM Authors

/* 19. How to replace the space between the authors' first and last name with "-"? */

SELECT REPLACE(Authors.Name,' ', '-')FROM Authors

/* 20. How to return the password of the librarian as string? */

SELECT STR(Librarian.Password)FROM Librarian



/*
===========================================================
	5. Select Statements using Sub Query
===========================================================
*/

/* Select all readers that done a borrow process afeter the date "2020-06-01" */ 

SELECT * FROM Reader WHERE Reader_Id IN (SELECT Reader_Id FROM Borrow_Information WHERE Borrow_Date > '2020-06-01') ;

/* Select all the books that the available copies is more than 10 */ 

SELECT * FROM Books WHERE Id IN (SELECT Id FROM Books WHERE Available_Copies > 10) ;

/* Select the number of books that Ahmed Mohamed can borrow at a time */ 

SELECT Books_Number FROM Reader_Status WHERE Reader_Type IN (SELECT Reader_Type FROM Reader WHERE Name = 'Ahmed Mohamed') ;


/*
===========================================================
	6. Select Statements using Count and Group Functions
===========================================================
*/


/*
***
	• Count function: selecting how many books that we have for William Shakespeare
***
*/

SELECT COUNT(Author_Id) FROM Books WHERE Author_Id = 4;

/*
***
	• Group by function: selecting the last borrow that every reader has done 
***
*/

SELECT Reader_Id, MAX(Borrow_Date) FROM Borrow_Information GROUP BY Reader_Id


/*
===========================================================
	7. Select Statements using different joins
===========================================================
*/

/* Left Join the readers into the borrow restriction days and book numbers   */

SELECT Reader.Name, Reader.Phone, Reader_Status.Days_Limit, Reader_Status.Books_Number 
FROM Reader Left JOIN Reader_Status 
ON Reader.Reader_Type = Reader_Status.Reader_Type

/* Right Join the author information into every book  */

SELECT Books.Name, Authors.Name, Authors.Nationality 
FROM Books RIGHT JOIN Authors 
ON Books.Author_Id = Authors.Author_Id

/* full Join*/

SELECT Librarian.Librarian_Id, Borrow_Information.Borrow_Id
FROM Librarian
FULL OUTER JOIN Borrow_Information
ON Librarian.Librarian_Id = Borrow_Information.Borrow_Id
ORDER BY Borrow_Information.Borrow_Id;

/*inner Join*/

SELECT Librarian.Librarian_Id, Borrow_Information.Borrow_Id
FROM Librarian
INNER JOIN Borrow_Information 
ON Librarian.Librarian_Id = Borrow_Information.Borrow_Id
ORDER BY Borrow_Information.Borrow_Id;

/* Another right Join */

SELECT Borrow_Information.Borrow_Date, Librarian.Name 
FROM Borrow_Information RIGHT JOIN Librarian 
ON Borrow_Information.Librarian_Id = Librarian.Librarian_Id


/*
===============================================
	8.Update Statments
===============================================
*/


/* 1. Updating the category of the book of id = 7 */

UPDATE Books SET Category = 'Tragedy' WHERE Id = 7;

/* 2. Updating the Days_Limit of the Students*/

UPDATE Reader_Status SET Days_Limit = 5 WHERE Reader_Type = 'Student';

/* 3. Updating the Days_Limit of the Teachers*/

UPDATE Reader_Status SET Days_Limit = 8  WHERE Reader_Type = 'Teacher';


/* 4. Updating the available copies of book of id 5 to be 0 */

UPDATE Books SET Available_Copies = 0  WHERE Id = 5;

/* 5. Updating the phone of reader of id 1*/

UPDATE Reader SET Phone = 01270903789 WHERE Reader_Id = 1;


/*
	=====================================
		9.Delete Statements 
	=====================================
*/



/* 1. Deleting The Borrow information of Steven Covey's Book*/

DELETE FROM Borrow_Information WHERE ISBN = '1-65520-241-2';

/* 2. Deleting The Books of Steven Covey*/

DELETE FROM Books WHERE Author_Id = 2;

/* 3. Deleting The author of American Nationality who is Steven Covey*/

DELETE FROM Authors WHERE Nationality = 'American';

/* 4. Deleting The Borrow information that the librarian of id = 2 has done*/

DELETE FROM Borrow_Information WHERE Librarian_Id = 1;

/* 5. Deleting The Librarian of the librarian Ramy Mohamed*/

DELETE FROM Librarian WHERE Name = 'Ramy Mohamed';



