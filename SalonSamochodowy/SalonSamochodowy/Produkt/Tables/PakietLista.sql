CREATE TABLE [Produkt].[PakietLista] (
    [PakietId]       INT NULL,
    [PakietKey]      INT IDENTITY (1, 1) NOT NULL,
    [WyposzazenieId] INT NULL,
    FOREIGN KEY ([WyposzazenieId]) REFERENCES [Produkt].[Wyposzazenie] ([WyposzazenieId]) ON DELETE SET NULL
);



