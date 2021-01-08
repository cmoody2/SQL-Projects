USE Library_CheckOut;
GO

CREATE PROC dbo.uspGet_Number_of_Book_Copies_From_Sharpstown @BookTitle
NVARCHAR(50)
AS
SELECT Number_of_copies, Title, BranchName
FROM BOOK_COPIES
INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
WHERE BranchName = 'Sharpstown' AND Title = @BookTitle
GO
EXEC dbo.uspGet_Number_of_Book_Copies_From_Sharpstown @BookTitle = 'The Lost Tribe';