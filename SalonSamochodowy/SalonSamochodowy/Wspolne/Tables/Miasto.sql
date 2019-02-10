CREATE TABLE [Wspolne].[Miasto] (
    [MiastoId]   INT           NOT NULL,
    [MiastoKey]  INT           NOT NULL,
    [NazwaMista] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([MiastoId] ASC),
    UNIQUE NONCLUSTERED ([NazwaMista] ASC)
);



