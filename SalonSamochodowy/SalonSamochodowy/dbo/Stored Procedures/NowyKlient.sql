CREATE PROCEDURE NowyKlient

@KlientId int,
@KlientKey int,
@KlientImiePierwsze nvarchar (20),
@KlientImieDrugie nvarchar (20),
@KlientNazwisko nvarchar (35),
@DataDodania date,
@Telefon int,
@EmailId nvarchar (45),
@DowodOsobistyId int
AS
BEGIN
SET IDENTITY_INSERT Produkt.Klient ON
INSERT INTO Produkt.Klient (KlientId,KlientKey,KlientImiePierwsze,KlientImieDrugie,KlientNazwisko,DataDodania,Telefon,EmailId,DowodOsobistyId)
VALUES (@KlientId,@KlientKey,@KlientImiePierwsze,@KlientImieDrugie,@KlientNazwisko,@DataDodania,@Telefon,@EmailId,@DowodOsobistyId);
END