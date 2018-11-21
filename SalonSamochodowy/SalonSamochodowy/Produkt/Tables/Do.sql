CREATE TABLE [Produkt].[Do] (
    [DoId]        INT          NOT NULL,
    [DoKey]       INT          IDENTITY (1, 1) NOT NULL,
    [Seria]       NVARCHAR (1) NOT NULL,
    [WydanyPrzez] NVARCHAR (1) NOT NULL,
    [WaznyDo]     DATE         NULL,
    PRIMARY KEY CLUSTERED ([DoId] ASC)
);

