CREATE TABLE [Serwis].[TypUslugi] (
    [TypUslugiId]  INT           NOT NULL,
    [TypUslugiKey] INT           NULL,
    [NazwaUslugi]  NVARCHAR (60) NOT NULL,
    PRIMARY KEY CLUSTERED ([TypUslugiId] ASC)
);

