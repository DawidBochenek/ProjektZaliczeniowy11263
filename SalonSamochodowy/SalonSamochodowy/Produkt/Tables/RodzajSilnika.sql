CREATE TABLE [Produkt].[RodzajSilnika] (
    [RodzajSilnikaId] INT           NOT NULL,
    [Nazwa]           NVARCHAR (12) NOT NULL,
    [Opis]            NVARCHAR (1)  NULL,
    PRIMARY KEY CLUSTERED ([RodzajSilnikaId] ASC),
    UNIQUE NONCLUSTERED ([Nazwa] ASC)
);

