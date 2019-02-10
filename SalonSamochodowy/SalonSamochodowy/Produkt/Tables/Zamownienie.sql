CREATE TABLE [Produkt].[Zamownienie] (
    [ZamownienieId]    INT   NOT NULL,
    [ZamownienieKey]   INT   IDENTITY (1, 1) NOT NULL,
    [KlientId]         INT   NOT NULL,
    [PracownikId]      INT   NOT NULL,
    [CenaSprzedazy]    MONEY NULL,
    [DataZlozenia]     DATE  NULL,
    [DataOdbioru]      DATE  NULL,
    [StatusRealizacji] BIT   NULL,
    [StatusPlatnosci]  BIT   NULL,
    [ModelId]          INT   NULL,
    [PakietId]         INT   NULL,
    PRIMARY KEY CLUSTERED ([ZamownienieId] ASC),
    CHECK ([CenaSprzedazy]>(0)),
    CHECK ([CenaSprzedazy]>(0)),
    FOREIGN KEY ([KlientId]) REFERENCES [Produkt].[Klient] ([KlientId]),
    FOREIGN KEY ([ModelId]) REFERENCES [Produkt].[Model] ([ModelId]),
    FOREIGN KEY ([PakietId]) REFERENCES [Produkt].[Pakiet] ([PakietId]),
    FOREIGN KEY ([PracownikId]) REFERENCES [Hr].[Pracownik] ([PracownikId])
);



