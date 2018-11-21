CREATE TABLE [Produkt].[Pakiet] (
    [PakietId]  INT           NOT NULL,
    [PakietKey] INT           IDENTITY (1, 1) NOT NULL,
    [Nazwa]     NVARCHAR (15) NOT NULL,
    PRIMARY KEY CLUSTERED ([PakietId] ASC),
    UNIQUE NONCLUSTERED ([Nazwa] ASC)
);



