

CREATE VIEW rapOp.ListaSprzedanychMarek AS

SELECT mark.NazwaSkr AS Marka, SUM(CenaSprzedazy) as SumarycznaKwotaSprzedazy, COUNT(mark.NazwaSkr) AS IloscZamowien FROM Produkt.Zamownienie as zam
LEFT JOIN Produkt.Model as m on zam.ModelId=m.ModelId
LEFT JOIN Produkt.Marka as mark on m.MarkaId=mark.MarkaId
GROUP BY mark.NazwaSkr