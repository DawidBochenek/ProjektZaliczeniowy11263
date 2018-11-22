CREATE TABLE [Produkt].[Model] (
    [ModelId]       INT           NOT NULL,
    [ModelKey]      INT           IDENTITY (1, 1) NOT NULL,
    [MarkaId]       INT           NULL,
    [Nazwa]         NVARCHAR (30) NOT NULL,
    [TypNadwoziaId] INT           NULL,
    [SegmentId]     INT           NULL,
    [SilnikId]      INT           NULL,
    [PakietId]      INT           NULL,
    [Rocznik]       INT           NULL,
    PRIMARY KEY CLUSTERED ([ModelId] ASC),
    FOREIGN KEY ([MarkaId]) REFERENCES [Produkt].[Marka] ([MarkaId]) ON DELETE SET NULL,
    FOREIGN KEY ([PakietId]) REFERENCES [Produkt].[Pakiet] ([PakietId]) ON DELETE SET NULL,
    FOREIGN KEY ([SegmentId]) REFERENCES [Produkt].[Segment] ([SegmentId]) ON DELETE SET NULL,
    FOREIGN KEY ([SilnikId]) REFERENCES [Produkt].[Silnik] ([SilnikId]) ON DELETE SET NULL,
    FOREIGN KEY ([TypNadwoziaId]) REFERENCES [Produkt].[TypNadwozia] ([TypNadwoziaId]) ON DELETE SET NULL
);









