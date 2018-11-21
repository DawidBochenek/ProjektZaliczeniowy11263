CREATE TABLE [Produkt].[Klient] (
    [KlientId]           INT          NOT NULL,
    [KlientKey]          INT          IDENTITY (1, 1) NOT NULL,
    [KlientImiePierwsze] NVARCHAR (1) NOT NULL,
    [KlientImieDrugie]   NVARCHAR (1) NOT NULL,
    [KlientNazwisko]     NVARCHAR (1) NOT NULL,
    [DataDodania]        DATE         NOT NULL,
    [Telefon]            SMALLINT     NOT NULL,
    [EmailId]            NVARCHAR (1) NOT NULL,
    [DowodOsobistyId]    INT          NULL,
    PRIMARY KEY CLUSTERED ([KlientId] ASC),
    FOREIGN KEY ([DowodOsobistyId]) REFERENCES [Produkt].[Do] ([DoId]) ON DELETE SET NULL
);

