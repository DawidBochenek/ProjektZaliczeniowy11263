CREATE TABLE [Serwis].[HistoriaAudyt] (
    [AudytId]            INT            IDENTITY (1, 1) NOT NULL,
    [ZamowienieId]       INT            NULL,
    [StatusId]           INT            NULL,
    [PracownikId]        INT            NULL,
    [DataZmiany]         DATE           NULL,
    [AktualizowanePrzez] NVARCHAR (128) NULL,
    [AktualizowanoDnia]  DATE           NULL,
    PRIMARY KEY CLUSTERED ([AudytId] ASC)
);

