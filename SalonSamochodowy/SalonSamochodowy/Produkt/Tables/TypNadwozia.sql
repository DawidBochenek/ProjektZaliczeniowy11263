CREATE TABLE [Produkt].[TypNadwozia] (
    [TypNadwoziaId]  INT           NOT NULL,
    [TypNadwoziaKey] INT           IDENTITY (1, 1) NOT NULL,
    [Nazwa]          NVARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([TypNadwoziaId] ASC)
);





