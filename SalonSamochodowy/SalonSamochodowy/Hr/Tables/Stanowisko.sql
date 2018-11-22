CREATE TABLE [Hr].[Stanowisko] (
    [StanowiskoId]  INT           NOT NULL,
    [StanowiskoKey] INT           IDENTITY (1, 1) NOT NULL,
    [Nazwa]         NVARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([StanowiskoId] ASC),
    UNIQUE NONCLUSTERED ([Nazwa] ASC)
);





