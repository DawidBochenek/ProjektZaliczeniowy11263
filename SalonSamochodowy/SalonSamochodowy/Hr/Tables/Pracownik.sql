CREATE TABLE [Hr].[Pracownik] (
    [PracownikId]      INT          NOT NULL,
    [PracownikKey]     INT          IDENTITY (1, 1) NOT NULL,
    [Imie]             NVARCHAR (1) NOT NULL,
    [Nazwisko]         NVARCHAR (1) NOT NULL,
    [DataUrodzenia]    DATE         NOT NULL,
    [DataZatrudnienia] DATE         NOT NULL,
    [PESEL]            SMALLINT     NOT NULL,
    [Adres]            NVARCHAR (1) NOT NULL,
    [Miasto]           NVARCHAR (1) NOT NULL,
    [KodPocztowy]      NVARCHAR (6) NOT NULL,
    [Kraj]             NVARCHAR (1) NOT NULL,
    [Telefon]          NVARCHAR (1) NOT NULL,
    [StanowiskoId]     INT          NULL,
    [ZespolId]         INT          NULL,
    [Przelozony]       INT          NULL,
    PRIMARY KEY CLUSTERED ([PracownikId] ASC),
    FOREIGN KEY ([Przelozony]) REFERENCES [Hr].[Pracownik] ([PracownikId]),
    FOREIGN KEY ([StanowiskoId]) REFERENCES [Hr].[Stanowisko] ([StanowiskoId]) ON DELETE SET NULL,
    FOREIGN KEY ([ZespolId]) REFERENCES [Hr].[Zespol] ([ZespolId]) ON DELETE SET NULL,
    UNIQUE NONCLUSTERED ([PESEL] ASC)
);



