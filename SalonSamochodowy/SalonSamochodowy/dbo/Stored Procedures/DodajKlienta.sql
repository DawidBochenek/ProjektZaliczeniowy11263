CREATE PROCEDURE DodajKlienta
@ImieKlienta nvarchar (15),
@Nazwisko nvarchar (25),
@AdresUlica nvarchar (25),
@NrLokalu nvarchar (15),
@Miasto int,
@KodPocztowy nvarchar (20),
@Email nvarchar (250),
@Telefon nvarchar (20),
@KategoriaID int,
@OpiekunKlienta int

AS
BEGIN
	INSERT Klienci
VALUES (@ImieKlienta, @Nazwisko, @AdresUlica, @NrLokalu, @Miasto, @KodPocztowy, @Email, @Telefon, @KategoriaID, @OpiekunKlienta)
END