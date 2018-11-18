CREATE TABLE [Produkt].[Model] (
    [ModelId]       INT          NOT NULL,
    [Nazwa]         NVARCHAR (1) NOT NULL,
    [TypNadwoziaId] INT          NULL,
    [SegmentId]     INT          NULL,
    [SilnikId]      INT          NULL,
    [Pakiet]        INT          NULL,
    [Rocznik]       DATE         NULL,
    [SurrogateKey]  INT          IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY CLUSTERED ([ModelId] ASC)
);

