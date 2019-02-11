CREATE TABLE [Hr].[KartaCzasuPracyDni] (
    [PracownikId] INT             NOT NULL,
    [MiesiacId]   INT             NOT NULL,
    [Dzien]       INT             NOT NULL,
    [ObecnoscId]  INT             NOT NULL,
    [Od]          DECIMAL (10, 2) NULL,
    [Do]          DECIMAL (10, 2) NULL,
    [Nadgodziny]  DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([PracownikId] ASC, [MiesiacId] ASC, [Dzien] ASC),
    FOREIGN KEY ([ObecnoscId]) REFERENCES [Hr].[ObecnoscId] ([ObecnoscId]),
    FOREIGN KEY ([PracownikId]) REFERENCES [Hr].[Pracownik] ([PracownikId])
);

