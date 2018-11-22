CREATE TABLE [Hr].[WynagrodzeniaPracwonika] (
    [WynId]                INT   NOT NULL,
    [WynagrodzeniaKey]     INT   IDENTITY (1, 1) NOT NULL,
    [PracownikId]          INT   NULL,
    [MiesiacRokId]         INT   NOT NULL,
    [OkresOd]              DATE  NULL,
    [OkresDo]              DATE  NULL,
    [WartoscWynagrodzenia] MONEY NULL,
    PRIMARY KEY CLUSTERED ([WynId] ASC),
    FOREIGN KEY ([PracownikId]) REFERENCES [Hr].[Pracownik] ([PracownikId])
);





