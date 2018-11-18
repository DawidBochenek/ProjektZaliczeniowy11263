CREATE TABLE [Produkt].[Marka] (
    [MarkaId]      INT          NOT NULL,
    [NazwaSkr]     NVARCHAR (8) NOT NULL,
    [NazwaDl]      NVARCHAR (1) NOT NULL,
    [SurrogateKey] INT          IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY CLUSTERED ([MarkaId] ASC),
    UNIQUE NONCLUSTERED ([NazwaSkr] ASC)
);

