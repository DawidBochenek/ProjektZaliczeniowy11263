CREATE TABLE [Produkt].[Silnik] (
    [SilnikId]        INT            NOT NULL,
    [Nazwa]           NVARCHAR (1)   NOT NULL,
    [PojemnoscCcm]    DECIMAL (6, 2) NOT NULL,
    [SurrogateKey]    INT            IDENTITY (1, 1) NOT NULL,
    [IloscKm]         SMALLINT       NULL,
    [RodzajSilnikaId] INT            NULL,
    PRIMARY KEY CLUSTERED ([SilnikId] ASC)
);

