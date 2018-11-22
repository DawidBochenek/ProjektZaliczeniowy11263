CREATE TABLE [Serwis].[Zamowienie] (
    [ZamowienieId]        INT  NOT NULL,
    [ZamowienieKey]       INT  IDENTITY (1, 1) NOT NULL,
    [StatusyZamowienieId] INT  NULL,
    [KlientId]            INT  NOT NULL,
    [PracownikId]         INT  NOT NULL,
    [DataZlozenia]        DATE NOT NULL,
    [DataZakonczenia]     DATE NULL,
    PRIMARY KEY CLUSTERED ([ZamowienieId] ASC),
    FOREIGN KEY ([KlientId]) REFERENCES [Produkt].[Klient] ([KlientId]),
    FOREIGN KEY ([PracownikId]) REFERENCES [Hr].[Pracownik] ([PracownikId]),
    FOREIGN KEY ([StatusyZamowienieId]) REFERENCES [Serwis].[StatusyZamowienie] ([StatusyZamowienieId]) ON DELETE SET NULL
);

