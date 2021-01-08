
CREATE PROCEDURE dbo.uspGetAddress4 @CityName NVARCHAR(30) OUTPUT
AS
SELECT City FROM Person.Address
WHERE AddressID = 38 AND PostalCode = 48226
GO
DECLARE @CityName NVARCHAR(30)
EXEC dbo.uspGetAddress4 @CityName = @CityName OUTPUT
PRINT @CityName
