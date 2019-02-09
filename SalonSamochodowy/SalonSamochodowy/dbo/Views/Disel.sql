CREATE VIEW [Disel] AS  
SELECT s.Nazwa, s.PojemnoscCcm, s.IloscKm, rs.Nazwa AS TypPaliwa FROM Produkt.Silnik AS s
LEFT JOIN Produkt.RodzajSilnika AS rs ON s.RodzajSilnikaId=rs.RodzajSilnikaId
WHERE rs.RodzajSilnikaId = 2