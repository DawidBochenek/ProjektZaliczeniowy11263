CREATE TABLE [Produkt].[Marka] (
    [MarkaId]  INT           NOT NULL,
    [MarkaKey] INT           IDENTITY (1, 1) NOT NULL,
    [NazwaSkr] NVARCHAR (8)  NULL,
    [NazwaDl]  NVARCHAR (25) NULL,
    PRIMARY KEY CLUSTERED ([MarkaId] ASC)
);





