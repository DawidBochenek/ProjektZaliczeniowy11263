CREATE TABLE [Produkt].[TypNadwozia] (
    [SegmentId]    INT          NOT NULL,
    [Nazwa]        NVARCHAR (1) NOT NULL,
    [SurrogateKey] INT          IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY CLUSTERED ([SegmentId] ASC)
);

