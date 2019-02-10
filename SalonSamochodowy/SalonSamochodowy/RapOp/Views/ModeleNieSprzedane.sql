CREATE VIEW rapOp.ModeleNieSprzedane 
AS
SELECT m.ModelId,m.Nazwa,m.Rocznik FROM Produkt.Model as m
LEFT JOIN Produkt.Zamownienie as zam on m.ModelId=zam.ModelId 
WHERE ZamownienieId is null