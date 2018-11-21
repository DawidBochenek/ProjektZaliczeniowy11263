CREATE TABLE [Produkt].[TypWyposazenia] (
    [TypWyposazeniaId]  INT           NOT NULL,
    [TypWyposazeniaKey] INT           IDENTITY (1, 1) NOT NULL,
    [Nazwa]             NVARCHAR (25) NOT NULL,
    PRIMARY KEY CLUSTERED ([TypWyposazeniaId] ASC),
    UNIQUE NONCLUSTERED ([Nazwa] ASC)
);



