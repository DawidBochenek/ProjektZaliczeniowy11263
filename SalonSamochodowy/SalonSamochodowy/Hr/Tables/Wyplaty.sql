CREATE TABLE [Hr].[Wyplaty] (
    [PracownikId]  INT NOT NULL,
    [MiesiacRokId] INT NOT NULL,
    [WynId]        INT NOT NULL,
    [WyplatyKey]   INT IDENTITY (1, 1) NOT NULL,
    [PremieId]     INT NULL,
    PRIMARY KEY CLUSTERED ([PracownikId] ASC, [MiesiacRokId] ASC),
    FOREIGN KEY ([PremieId]) REFERENCES [Hr].[Premie] ([PremieId]),
    FOREIGN KEY ([WynId]) REFERENCES [Hr].[WynagrodzeniaPracwonika] ([WynId])
);





