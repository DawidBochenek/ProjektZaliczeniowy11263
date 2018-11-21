CREATE TABLE [Hr].[Zespol] (
    [ZespolId]  INT          NOT NULL,
    [ZespolKey] INT          IDENTITY (1, 1) NOT NULL,
    [Nazwa]     NVARCHAR (1) NOT NULL,
    PRIMARY KEY CLUSTERED ([ZespolId] ASC),
    UNIQUE NONCLUSTERED ([Nazwa] ASC)
);

