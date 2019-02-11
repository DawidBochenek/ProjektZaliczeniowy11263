CREATE TABLE [Serwis].[HistoriaZamowienia] (
    [HistoriaZamowieniaId] INT  NOT NULL,
    [ZamowienieId]         INT  NOT NULL,
    [StatusId]             INT  NOT NULL,
    [PracownikId]          INT  NOT NULL,
    [DataZmiany]           DATE NULL,
    PRIMARY KEY CLUSTERED ([HistoriaZamowieniaId] ASC, [ZamowienieId] ASC),
    FOREIGN KEY ([PracownikId]) REFERENCES [Hr].[Pracownik] ([PracownikId]),
    FOREIGN KEY ([StatusId]) REFERENCES [Serwis].[StatusyZamowienie] ([StatusyZamowienieId]),
    FOREIGN KEY ([ZamowienieId]) REFERENCES [Serwis].[Zamowienie] ([ZamowienieId])
);

ZamowienieId]) REFERENCES [Serwis].[Zamowienie] ([ZamowienieId])
);




GO
