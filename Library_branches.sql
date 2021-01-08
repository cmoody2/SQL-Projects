CREATE DATABASE Library_CheckOut;
GO

USE Library_CheckOut;

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT NOT NULL PRIMARY KEY IDENTITY(100,1),
	BranchName VARCHAR(100) NOT NULL,
	Address VARCHAR(100) NOT NULL
);

CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE BOOKS (
	BookID INT NOT NULL PRIMARY KEY IDENTITY(2000,1),
	Title VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE BOOK_AUTHORS (
	Book_ID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(50) NOT NULL PRIMARY KEY,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(10) NOT NULL,
);

CREATE TABLE BOOK_LOANS (
	BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

CREATE TABLE BORROWER (
	CardNo INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(10) NOT NULL
);


INSERT INTO LIBRARY_BRANCH
	(BranchName, Address)
	VALUES
	('Sharpstown', '1818 SE Lockhart St Portland, OR 97214'),
	('Harpy Books', '920 N Lombart Ave Portland, OR 97215'),
	('Powells Books', '1010 Hawthorne Blvd Portland, OR 97214'),
	('George Hamilton Bookstore', '514 E Lancaster St Portland, OR 97280'),
	('The Looking Glass Books', '900 W Burnside St Portland, OR 97238'),
	('Couch Books', '822 E Couch St Portland, OR 97215')
;

INSERT INTO BORROWER
	(Name, Address, Phone)
	VALUES
	('Samuel Baker', '1515 W Burnside St Portland, OR 97280', '5042245858'),
	('Jennifer Stultz', '897 E Salmon St Portland, OR 97214', '5035678899'),
	('Jason Ludwig', '1818 SE Belmont Ave Portland, OR 97214', '7608932200'),
	('Kimberly Vanhouser', '1616 W Burnside St Portland, OR 97280', '2017879956'),
	('Farouk Patel', '818 NE Vancouver Blvd Portland, OR 97222', '9097787841'),
	('Erik Gross', '310 SW 4th Ave Suite 200 Portland, OR 97204', '5032066915'),
	('Christian Thompson', '710 W Lancaster St Portland, OR 97229', '7026687759'),
	('Trish Gourd', '555 SE Main St Portland, OR 97215', '5034431919')
;

INSERT INTO PUBLISHER
	(PublisherName, Address, Phone)
	VALUES
	('Col-Tab Inc', '1919 SE Belmont St Portland, OR 97214', '5032332248'),
	('Peanutbutter Publishing', '945 SW Main St Portland, OR 97226', '5032224440'),
	('Timber Press Inc', '133 SW 2nd Ave #450 Portland, OR 97215', '5032272878'),
	('Microcosm Publishing', '2752 N Williams Ave Portland, OR 97222', '5037992698'),
	('Tavern Books', 'Union Station 800 NW 6th Ave Portland, OR 97221', '5038905043'),
	('Inkwater Press', '6750 SW Franklin St suite c Portland, OR 97214', '5039686777'),
	('Craigmore Creations', '2900 SE Stark St Portland, OR 97214', '5034779562'),
	('Sunnycroft Books', '4110 SE Hawthorne Blvd #749 Portland, OR 97215', '5034789979'),
	('Alpha Book Publisher', '569 Rosa Parks Ave Vancouver, WA 98005', '3608890714'),
	('Projekt', '1729 SW Taylor St #2 Portland, OR 97213', '5035178528')
;

SELECT * FROM BOOKS

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Inkwater Press'),
	('Grimms Complete Fairytales', 'Peanutbutter Publishing'),
	('Star Wars Aftermath', 'Inkwater Press'),
	('Star Wars Aftermath Life Debt', 'Inkwater Press'),
	('Star Wars Aftermath Empires End', 'Inkwater Press'),
	('String City', 'Tavern Books'),
	('The Industrial Design Reference + Specification Book', 'Col-Tab Inc'),
	('The Tower of Nero', 'Timber Press Inc'),
	('Dandelion', 'Craigmore Creations'),
	('Leave the World Behind', 'Sunnycroft Books'),
	('The Return', 'Alpha Book Publisher'),
	('Modern Comfort Food: A Barefoot Contessa Cookbook', 'Microcosm Publishing'),
	('Midnight Sun', 'Projekt'),
	('A Promised Land', 'Tavern Books'),
	('Poems 1962-2012', 'Sunnycroft Books'),
	('A Time for Mercy', 'Inkwater Press'),
	('The Searcher', 'Col-Tab Inc'),
	('Rage', 'Col-Tab Inc'),
	('Anxious People', 'Peanutbutter Publishing'),
	('Creepy Carrots!', 'Microcosm Publishing'),
	('Troubles in Paradise', 'Craigmore Creations')
;

INSERT INTO BOOK_AUTHORS
	(Book_ID, AuthorName)
	VALUES
	(2068, 'Chuck Wendig'),
	(2069, 'Chuck Wendig'),
	(2070, 'Chuck Wendig'),
	(2071, 'Graham Edwards'),
	(2082, 'Claudia Gray'),
	(2074, 'Sarah Ivers'),
	(2076, 'Nicholas Sparks'),
	(2077, 'Ina Garten'),
	(2078, 'Stephenie Meyer'),
	(2079, 'Barack Obama')
;

SELECT * FROM BORROWER;

INSERT INTO BOOK_COPIES
	(Number_Of_Copies, BookID, BranchID)
	VALUES
	(10, 2066, 100),
	(5, 2067, 103),
	(3, 2068, 104),
	(25, 2069, 105),
	(20, 2070, 102),
	(100, 2071, 101),
	(14, 2072, 101),
	(10, 2073, 104),
	(5, 2074, 105),
	(20, 2075, 101),
	(13, 2076, 102),
	(9, 2077, 103),
	(80, 2078, 100),
	(44, 2079, 102),
	(34, 2080, 100),
	(15, 2081, 102),
	(55, 2082, 103),
	(44, 2083, 102),
	(39, 2084, 104),
	(78, 2085, 100),
	(90, 2086, 104)
;

INSERT INTO BOOK_LOANS 
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(2077, 103, 5, '2020-09-14', '2020-09-29'),
	(2081, 102, 3, '2020-09-18', '2020-10-01'),
	(2082, 103, 1, '2020-08-19', '2020-08-29'),
	(2086, 104, 2, '2020-06-30', '2020-07-15'),
	(2071, 101, 5, '2020-09-10', '2020-09-22'),
	(2066, 100, 4, '2020-10-01', '2020-10-19'),
	(2075, 101, 7, '2020-05-22', '2020-06-05'),
	(2085, 100, 6, '2020-01-10', '2020-01-22'),
	(2079, 102, 2, '2020-03-05', '2020-03-22'),
	(2068, 104, 1, '2020-08-18', '2020-09-01'),
	(2070, 102, 4, '2020-09-05', '2020-09-22')
;

SELECT *
FROM BOOK_LOANS
FULL OUTER JOIN BORROWER ON BOOK_LOANS.CardNo = BORROWER.CardNo
FULL OUTER JOIN BOOKS ON BOOK_LOANS.BookID = BOOKS.BookID;


SELECT BOOKS.Title, BOOK_AUTHORS.AuthorName
FROM BOOKS
LEFT JOIN BOOK_AUTHORS ON BOOKS.BookID = BOOK_AUTHORS.Book_ID; 
