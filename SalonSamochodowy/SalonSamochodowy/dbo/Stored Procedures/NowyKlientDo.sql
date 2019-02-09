CREATE PROCEDURE NowyKlientDo

@DoId int,
@DoKey int,
@Seria nvarchar(12),
@WydanyPrzez nvarchar(45),
@WaznyDo date
AS
BEGIN

SET IDENTITY_INSERT Produkt.Do ON
INSERT INTO Produkt.Do (DoId,DoKey,Seria,WydanyPrzez,WaznyDo)
VALUES (@DoId,@DoKey,@Seria,@WydanyPrzez,@WaznyDo)

END