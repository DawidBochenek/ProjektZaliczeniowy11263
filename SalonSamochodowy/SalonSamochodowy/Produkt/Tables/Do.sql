CREATE TABLE [Produkt].[Do] (
    [DoId]        INT           NOT NULL,
    [DoKey]       INT           IDENTITY (1, 1) NOT NULL,
    [Seria]       NVARCHAR (12) NOT NULL,
    [WydanyPrzez] NVARCHAR (45) NOT NULL,
    [WaznyDo]     DATE          NULL,
    PRIMARY KEY CLUSTERED ([DoId] ASC),
    UNIQUE NONCLUSTERED ([Seria] ASC)
);







