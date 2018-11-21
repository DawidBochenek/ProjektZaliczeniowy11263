CREATE TABLE [Serwis].[Uslugi] (
    [UslugiId]    INT          NOT NULL,
    [UslugiKey]   INT          IDENTITY (1, 1) NOT NULL,
    [NazwaUslugi] NVARCHAR (1) NOT NULL,
    PRIMARY KEY CLUSTERED ([UslugiId] ASC)
);

