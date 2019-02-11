CREATE TABLE [Serwis].[HistoriaZamowienia] (
    [ZamowienieId] INT  NOT NULL,
    [StatusId]     INT  NOT NULL,
    [PracownikId]  INT  NOT NULL,
    [DataZmiany]   DATE NULL,
    PRIMARY KEY CLUSTERED ([ZamowienieId] ASC, [StatusId] ASC, [PracownikId] ASC),
    FOREIGN KEY ([PracownikId]) REFERENCES [Hr].[Pracownik] ([PracownikId]),
    FOREIGN KEY ([StatusId]) REFERENCES [Serwis].[StatusyZamowienie] ([StatusyZamowienieId]),
    FOREIGN KEY ([ZamowienieId]) REFERENCES [Serwis].[Zamowienie] ([ZamowienieId])
);


GO
create trigger Serwis.TriggerHistoriaAudyt on Serwis.HistoriaZamowienia
after update, insert
as
begin
insert into Serwis.HistoriaAudyt
(ZamowienieId,PracownikId,StatusId,DataZmiany,AktualizowanePrzez,AktualizowanoDnia)
select i.ZamowienieId,i.PracownikId,i.StatusId,i.DataZmiany, SUSER_NAME(),GETDATE()
from Serwis.HistoriaZamowienia as t
inner join inserted i on t.ZamowienieId=i.ZamowienieId
end