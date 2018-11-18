CREATE TABLE [Produkt].[Wyposzazenie] (
    [WyposzazenieId]   INT           NOT NULL,
    [Nazwa]            NVARCHAR (30) NOT NULL,
    [TypWyposazeniaId] INT           NULL,
    [SurrogateKey]     INT           IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY CLUSTERED ([WyposzazenieId] ASC),
    UNIQUE NONCLUSTERED ([Nazwa] ASC)
);

