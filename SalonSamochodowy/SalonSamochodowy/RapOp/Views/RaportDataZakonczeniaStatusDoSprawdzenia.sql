CREATE VIEW rapOp.RaportDataZakonczeniaStatusDoSprawdzenia
AS

SELECT z.ZamowienieId,sz.NazaStatusu,z.KlientId,kl.KlientImiePierwsze,kl.KlientNazwisko,kl.Telefon,z.PracownikId,p.Imie AS ImiePracownika,p.Nazwisko AS NazwiskoPracownika,z.DataZlozenia,z.DataZakonczenia FROM Serwis.Zamowienie AS z
LEFT JOIN Serwis.StatusyZamowienie AS sz ON z.StatusyZamowienieId=sz.StatusyZamowienieId
LEFT JOIN Hr.Pracownik AS p ON z.PracownikId=p.PracownikId
LEFT JOIN Produkt.Klient as kl on z.KlientId=kl.KlientId
WHERE DataZakonczenia is not null AND z.StatusyZamowienieId <6 OR z.StatusyZamowienieId >6