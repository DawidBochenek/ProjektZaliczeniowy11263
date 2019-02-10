CREATE TABLE [Serwis].[Uslugi] (
    [UslugiId]    INT           NOT NULL,
    [UslugiKey]   INT           IDENTITY (1, 1) NOT NULL,
    [NazwaUslugi] NVARCHAR (60) NULL,
    [TypId]       INT           NULL,
    PRIMARY KEY CLUSTERED ([UslugiId] ASC),
    FOREIGN KEY ([TypId]) REFERENCES [Serwis].[TypUslugi] ([TypUslugiId]) ON DELETE SET NULL
);







