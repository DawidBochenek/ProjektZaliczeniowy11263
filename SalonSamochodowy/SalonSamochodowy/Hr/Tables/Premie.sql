CREATE TABLE [Hr].[Premie] (
    [PremieId]      INT          NOT NULL,
    [PremieKey]     INT          IDENTITY (1, 1) NOT NULL,
    [PracownikId]   INT          NULL,
    [PremiaMnoznik] DECIMAL (18) NULL,
    PRIMARY KEY CLUSTERED ([PremieId] ASC),
    FOREIGN KEY ([PracownikId]) REFERENCES [Hr].[Pracownik] ([PracownikId])
);

