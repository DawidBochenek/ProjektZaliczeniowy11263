
CREATE PROCEDURE DodajSzczegolyZam
@ZamowienieId int,
@WyposzazenieId int

AS
BEGIN
SET IDENTITY_INSERT Produkt.Zamownienie  ON
INSERT INTO Produkt.SzczegolyZamowienia (ZamowienieId,WyposzazenieId)
VALUES (@ZamowienieId,@WyposzazenieId)
DECLARE @Suma money



SET @Suma = (SELECT CenaSprzedazy FROM Produkt.Zamownienie WHERE ZamownienieId=@ZamowienieId)+
(SELECT SUM(CENA) FROM Produkt.SzczegolyZamowienia as p
LEFT JOIN Produkt.Wyposzazenie as w ON p.WyposzazenieId=w.WyposzazenieId)

UPDATE Produkt.Zamownienie
SET CenaSprzedazy =@Suma
WHERE ZamownienieId=@ZamowienieId
END