CREATE TABLE [Serwis].[CennikUslugi] (
    [CennikUslugiId]  INT   NOT NULL,
    [CennikUslugiKey] INT   IDENTITY (1, 1) NOT NULL,
    [UslugiId]        INT   NULL,
    [DataObowOd]      DATE  NULL,
    [DataObowDo]      DATE  NULL,
    [Cena]            MONEY NULL,
    PRIMARY KEY CLUSTERED ([CennikUslugiId] ASC),
    FOREIGN KEY ([UslugiId]) REFERENCES [Serwis].[Uslugi] ([UslugiId]) ON DELETE SET NULL
);

