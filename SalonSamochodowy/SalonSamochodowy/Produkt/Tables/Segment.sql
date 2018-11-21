CREATE TABLE [Produkt].[Segment] (
    [SegmentId]  INT      NOT NULL,
    [SegmentKey] INT      IDENTITY (1, 1) NOT NULL,
    [Nazwa]      CHAR (1) NOT NULL,
    PRIMARY KEY CLUSTERED ([SegmentId] ASC),
    UNIQUE NONCLUSTERED ([Nazwa] ASC)
);

