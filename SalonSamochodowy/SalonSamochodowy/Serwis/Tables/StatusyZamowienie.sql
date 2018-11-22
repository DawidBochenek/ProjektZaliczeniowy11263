CREATE TABLE [Serwis].[StatusyZamowienie] (
    [StatusyZamowienieId]   INT          NOT NULL,
    [StatusyZamownienieKey] INT          IDENTITY (1, 1) NOT NULL,
    [NazaStatusu]           NVARCHAR (1) NOT NULL,
    PRIMARY KEY CLUSTERED ([StatusyZamowienieId] ASC)
);

