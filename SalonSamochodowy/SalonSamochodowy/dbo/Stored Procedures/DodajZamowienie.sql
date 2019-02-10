CREATE PROCEDURE DodajZamowienie
@KlientID int,
@Oblsugujacy int,
@DataZamowienia date,
@CenaNominalna decimal (8,2),
@WartpscRabatu decimal (8,2),
@DoZaplaty decimal (8,2)

AS
BEGIN

INSERT Zamowienie
VALUES (@KlientID, @Oblsugujacy, @DataZamowienia, @CenaNominalna, @WartpscRabatu , @DoZaplaty)

END