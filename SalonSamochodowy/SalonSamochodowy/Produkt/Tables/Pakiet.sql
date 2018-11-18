CREATE TABLE [Produkt].[Pakiet] (
    [PakietId]     INT           NOT NULL,
    [Nazwa]        NVARCHAR (15) NOT NULL,
    [SurrogateKey] INT           IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY CLUSTERED ([PakietId] ASC),
    UNIQUE NONCLUSTERED ([Nazwa] ASC)
);

