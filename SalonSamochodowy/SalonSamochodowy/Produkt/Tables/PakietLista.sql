CREATE TABLE [Produkt].[PakietLista] (
    [PakietId]       INT NOT NULL,
    [PakietKey]      INT IDENTITY (1, 1) NOT NULL,
    [WyposzazenieId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([PakietId] ASC, [WyposzazenieId] ASC),
    FOREIGN KEY ([WyposzazenieId]) REFERENCES [Produkt].[Wyposzazenie] ([WyposzazenieId])
);





