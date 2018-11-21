CREATE TABLE [Produkt].[Cennik] (
    [CennikId]          INT   NOT NULL,
    [CennikKey]         INT   IDENTITY (1, 1) NOT NULL,
    [ModelId]           INT   NOT NULL,
    [DataDodania]       DATE  NOT NULL,
    [DataObowiazywania] DATE  NOT NULL,
    [CenaNominalna]     MONEY NULL,
    PRIMARY KEY CLUSTERED ([CennikId] ASC),
    FOREIGN KEY ([ModelId]) REFERENCES [Produkt].[Model] ([ModelId])
);



