CREATE TABLE [Hr].[Pracownik] (
    [PracownikId]      INT           NOT NULL,
    [PracownikKey]     INT           IDENTITY (1, 1) NOT NULL,
    [Imie]             NVARCHAR (15) NOT NULL,
    [Nazwisko]         NVARCHAR (45) NOT NULL,
    [DataUrodzenia]    DATE          NOT NULL,
    [DataZatrudnienia] DATE          NOT NULL,
    [PESEL]            INT           NOT NULL,
    [Adres]            NVARCHAR (25) NOT NULL,
    [Miasto]           INT           NOT NULL,
    [KodPocztowy]      NVARCHAR (6)  NOT NULL,
    [Kraj]             NVARCHAR (25) NOT NULL,
    [Telefon]          NVARCHAR (20) NOT NULL,
    [StanowiskoId]     INT           NULL,
    [ZespolId]         INT           NULL,
    [Przelozony]       INT           NULL,
    PRIMARY KEY CLUSTERED ([PracownikId] ASC),
    FOREIGN KEY ([Przelozony]) REFERENCES [Hr].[Pracownik] ([PracownikId]),
    FOREIGN KEY ([StanowiskoId]) REFERENCES [Hr].[Stanowisko] ([StanowiskoId]) ON DELETE SET NULL,
    FOREIGN KEY ([ZespolId]) REFERENCES [Hr].[Zespol] ([ZespolId]) ON DELETE SET NULL,
    CONSTRAINT [Miasto] FOREIGN KEY ([Miasto]) REFERENCES [Wspolne].[Miasto] ([MiastoId]),
    UNIQUE NONCLUSTERED ([PESEL] ASC)
);









