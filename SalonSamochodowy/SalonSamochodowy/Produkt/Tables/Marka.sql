CREATE TABLE [Produkt].[Marka] (
    [MarkaId]  INT          NOT NULL,
    [MarkaKey] INT          IDENTITY (1, 1) NOT NULL,
    [NazwaSkr] NVARCHAR (8) NOT NULL,
    [NazwaDl]  NVARCHAR (1) NOT NULL,
    PRIMARY KEY CLUSTERED ([MarkaId] ASC),
    UNIQUE NONCLUSTERED ([NazwaSkr] ASC)
);



