USE [Keyboards];

/*------------------------
	TABLE Designers
--------------------------*/
CREATE TABLE Designers (
	designer_id INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	designer_name VARCHAR(50) NOT NULL,
	designer_website VARCHAR(100) NOT NULL,
	country VARCHAR(50) NOT NULL
);

/*this inserts records(tuple;row)*/
INSERT INTO Designers
	(designer_name, designer_website, country)
	VALUES
	('RAMA', 'https://rama.works/', 'Australia'),
	('OneFiveNine', 'https://store.projectkeyboard.com/', 'Japan'),
	('Norbauer', 'https://shop.norbauer.com/', 'United States'),
	('Dixie Mech', 'https://dixiemech.com/', 'United States'),
	('NovelKeys', 'https://novelkeys.xyz/', 'United States')
;


/*----------------------------------
	TABLE Keyboards
------------------------------------*/

CREATE TABLE Keyboards (
	keyboard_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	keyboard_name VARCHAR(100) NOT NULL,
	keyboard_designer INT NOT NULL CONSTRAINT fk_designer_id FOREIGN KEY REFERENCES Designers(designer_id) ON UPDATE CASCADE ON DELETE CASCADE,
	keyboard_price MONEY NOT NULL,
	country VARCHAR(50) NOT NULL
);

/*this inserts records(tuple;row)*/
INSERT INTO Keyboards
	(keyboard_name, keyboard_designer, keyboard_price, country)
	VALUES
	('M60-A', 100, 360, 'Australia'),
	('U80-A SEQ2', 100, 480, 'Australia'),
	('NK65 RFP Edition', 104, 190, 'United States'),
	('Bauer', 103, 560, 'United States'),
	('Kepler', 101, 850, 'Japan')
;

/*----------------------------------------
	QUERY STATEMENT
------------------------------------------*/

SELECT * FROM Designers
	INNER JOIN Keyboards ON Keyboards.country = Designers.country
	WHERE Designers.country = 'Australia'
;


