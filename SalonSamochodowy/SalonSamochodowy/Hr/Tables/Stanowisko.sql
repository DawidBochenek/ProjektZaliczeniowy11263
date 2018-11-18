CREATE TABLE [Hr].[Stanowisko] (
    [StanowiskoId] INT          NOT NULL,
    [Nazwa]        NVARCHAR (1) NOT NULL,
    [SurrogateKey] INT          IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY CLUSTERED ([StanowiskoId] ASC),
    UNIQUE NONCLUSTERED ([Nazwa] ASC)
);

