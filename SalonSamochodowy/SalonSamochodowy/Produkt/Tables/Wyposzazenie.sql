CREATE TABLE [Produkt].[Wyposzazenie] (
    [WyposzazenieId]   INT           NOT NULL,
    [WyposzazenieKey]  INT           IDENTITY (1, 1) NOT NULL,
    [Nazwa]            NVARCHAR (30) NOT NULL,
    [TypWyposazeniaId] INT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([WyposzazenieId] ASC),
    FOREIGN KEY ([TypWyposazeniaId]) REFERENCES [Produkt].[TypWyposazenia] ([TypWyposazeniaId]),
    UNIQUE NONCLUSTERED ([Nazwa] ASC)
);



