CREATE TABLE [Produkt].[CennikWyposzazenia] (
    [CennikWypoId]          INT   NOT NULL,
    [CennikWyposzazeniaKey] INT   IDENTITY (1, 1) NOT NULL,
    [WyposzazenieId]        INT   NOT NULL,
    [ModelId]               INT   NOT NULL,
    [DataDodania]           DATE  NOT NULL,
    [DataObowiazywania]     DATE  NOT NULL,
    [CenaNominalna]         MONEY NULL,
    PRIMARY KEY CLUSTERED ([CennikWypoId] ASC),
    FOREIGN KEY ([ModelId]) REFERENCES [Produkt].[Model] ([ModelId]),
    FOREIGN KEY ([WyposzazenieId]) REFERENCES [Produkt].[Wyposzazenie] ([WyposzazenieId])
);



