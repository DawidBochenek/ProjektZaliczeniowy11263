CREATE TABLE [Hr].[Typ] (
    [TypId]  INT          NOT NULL,
    [TypKey] INT          IDENTITY (1, 1) NOT NULL,
    [Nazwa]  NVARCHAR (6) NOT NULL,
    PRIMARY KEY CLUSTERED ([TypId] ASC)
);

