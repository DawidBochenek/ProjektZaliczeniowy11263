CREATE TABLE [Hr].[Wyplaty] (
    [PracownikId] INT NOT NULL,
    [WyplatyKey]  INT IDENTITY (1, 1) NOT NULL,
    [WynId]       INT NOT NULL,
    PRIMARY KEY CLUSTERED ([PracownikId] ASC),
    FOREIGN KEY ([WynId]) REFERENCES [Hr].[WynagrodzeniaPracwonika] ([WynId])
);

