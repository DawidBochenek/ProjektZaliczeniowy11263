CREATE TABLE [Produkt].[Klient] (
    [KlientId]           INT           NOT NULL,
    [KlientKey]          INT           IDENTITY (1, 1) NOT NULL,
    [KlientImiePierwsze] NVARCHAR (20) NOT NULL,
    [KlientImieDrugie]   NVARCHAR (20) NOT NULL,
    [KlientNazwisko]     NVARCHAR (35) NOT NULL,
    [DataDodania]        DATE          NOT NULL,
    [Telefon]            INT           NOT NULL,
    [EmailId]            NVARCHAR (45) NOT NULL,
    [DowodOsobistyId]    INT           NULL,
    PRIMARY KEY CLUSTERED ([KlientId] ASC),
    FOREIGN KEY ([DowodOsobistyId]) REFERENCES [Produkt].[Do] ([DoId]) ON DELETE SET NULL,
    UNIQUE NONCLUSTERED ([DowodOsobistyId] ASC)
);







