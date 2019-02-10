CREATE TABLE [Serwis].[SzczegolyZamowienia] (
    [ZamowienieID] INT NOT NULL,
    [UslugaId]     INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ZamowienieID] ASC, [UslugaId] ASC),
    FOREIGN KEY ([UslugaId]) REFERENCES [Serwis].[Uslugi] ([UslugiId])
);

