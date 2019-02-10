
CREATE VIEW rapOp.Cennik
AS
-- Skrócona informacja dot. obowiązjącego cennika usług 

SELECT cu.UslugiId,cu.DataObowOd,cu.DataObowDo, tu.NazwaUslugi AS TypUslugi,su.NazwaUslugi,cu.Cena  FROM Serwis.CennikUslugi cu
LEFT JOIN Serwis.Uslugi as su on  cu.UslugiId=su.UslugiId
LEFT JOIN Serwis.TypUslugi as tu on su.TypId=tu.TypUslugiId