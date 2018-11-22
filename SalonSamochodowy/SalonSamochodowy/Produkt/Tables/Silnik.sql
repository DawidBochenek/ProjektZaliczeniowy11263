CREATE TABLE [Produkt].[Silnik] (
    [SilnikId]        INT            NOT NULL,
    [SilnikKey]       INT            IDENTITY (1, 1) NOT NULL,
    [Nazwa]           NVARCHAR (25)  NOT NULL,
    [PojemnoscCcm]    DECIMAL (6, 2) NOT NULL,
    [IloscKm]         SMALLINT       NULL,
    [RodzajSilnikaId] INT            NULL,
    PRIMARY KEY CLUSTERED ([SilnikId] ASC),
    FOREIGN KEY ([RodzajSilnikaId]) REFERENCES [Produkt].[RodzajSilnika] ([RodzajSilnikaId]) ON DELETE SET NULL
);





