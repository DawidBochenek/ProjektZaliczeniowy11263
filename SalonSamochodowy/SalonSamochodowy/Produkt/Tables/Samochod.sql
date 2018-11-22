CREATE TABLE [Produkt].[Samochod] (
    [SamochodId]   INT           NOT NULL,
    [SamochodKey]  INT           IDENTITY (1, 1) NOT NULL,
    [NrVin]        NVARCHAR (45) NOT NULL,
    [ModelId]      INT           NULL,
    [ZamowienieId] INT           NULL,
    PRIMARY KEY CLUSTERED ([SamochodId] ASC),
    FOREIGN KEY ([ModelId]) REFERENCES [Produkt].[Model] ([ModelId]),
    FOREIGN KEY ([ZamowienieId]) REFERENCES [Produkt].[Zamownienie] ([ZamownienieId])
);

