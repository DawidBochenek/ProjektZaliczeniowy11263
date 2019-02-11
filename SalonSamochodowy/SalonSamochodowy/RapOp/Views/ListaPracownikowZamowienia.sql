Create view rapOp.ListaPracownikowZamowienia
AS

SELECT hrp.PracownikId,hrp.Imie,hrp.Nazwisko,z.WartosSprzedazy,z.IloscZamowien FROM Hr.Pracownik as hrp  with (readuncommitted)
RIGHT JOIN (SELECT zam.PracownikId, SUM(zam.CenaSprzedazy)AS WartosSprzedazy ,COUNT(zam.ZamownienieId) AS IloscZamowien FROM Produkt.Zamownienie as zam
GROUP BY zam.PracownikId) as z on hrp.PracownikId=z.PracownikId