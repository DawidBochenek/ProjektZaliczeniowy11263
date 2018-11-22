CREATE TABLE [Hr].[Wyplaty] (
    [PracownikId] INT NOT NULL,
    [WyplatyKey]  INT IDENTITY (1, 1) NOT NULL,
    [WynId]       INT NOT NULL,
    [PremieId]    INT NULL,
    FOREIGN KEY ([PremieId]) REFERENCES [Hr].[Premie] ([PremieId]),
    FOREIGN KEY ([WynId]) REFERENCES [Hr].[WynagrodzeniaPracwonika] ([WynId])
);



