CREATE TABLE [Produkt].[TypNadwozia] (
    [TypNadwoziaId]  INT          NOT NULL,
    [TypNadwoziaKey] INT          IDENTITY (1, 1) NOT NULL,
    [Nazwa]          NVARCHAR (1) NOT NULL,
    PRIMARY KEY CLUSTERED ([TypNadwoziaId] ASC)
);



