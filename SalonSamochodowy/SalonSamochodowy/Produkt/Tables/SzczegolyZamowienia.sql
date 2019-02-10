CREATE TABLE [Produkt].[SzczegolyZamowienia] (
    [ZamowienieId]   INT NOT NULL,
    [WyposzazenieId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ZamowienieId] ASC, [WyposzazenieId] ASC),
    FOREIGN KEY ([WyposzazenieId]) REFERENCES [Produkt].[Wyposzazenie] ([WyposzazenieId])
);

