CREATE TABLE [Produkt].[Cennik] (
    [CennikId]          INT   NOT NULL,
    [ModelId]           INT   NOT NULL,
    [DataDodania]       DATE  NOT NULL,
    [DataObowiazywania] DATE  NOT NULL,
    [CenaNominalna]     MONEY NULL,
    [SurrogateKey]      INT   IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY CLUSTERED ([CennikId] ASC)
);

