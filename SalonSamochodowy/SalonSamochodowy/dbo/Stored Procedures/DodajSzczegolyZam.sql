CREATE PROCEDURE DodajSzczegolyZam
@ZamowienieID int,
@ProduktID int,
@Ilosc int

AS
BEGIN
INSERT INTO SzczeolyZamowienia
VALUES (@ZamowienieID, @ProduktID, @Ilosc)

END