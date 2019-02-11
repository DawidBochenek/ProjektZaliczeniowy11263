CREATE TABLE [Hr].[KartaCzasuPracy] (
    [PracownikId]    INT             NOT NULL,
    [MiesiacId]      INT             NOT NULL,
    [iloscDni]       INT             NULL,
    [IloscNadgodzin] DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([PracownikId] ASC, [MiesiacId] ASC),
    FOREIGN KEY ([PracownikId]) REFERENCES [Hr].[Pracownik] ([PracownikId])
);

