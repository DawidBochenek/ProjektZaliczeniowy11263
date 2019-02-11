CREATE TABLE [Serwis].[HistoriaZamowienie] (
    [ZamowienieId]      INT            NOT NULL,
    [StatusId]          INT            NOT NULL,
    [PracownikId]       INT            NOT NULL,
    [DataWpisu]         DATE           NULL,
    [ModyfikowanyPrzez] NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ZamowienieId] ASC, [StatusId] ASC, [PracownikId] ASC),
    FOREIGN KEY ([PracownikId]) REFERENCES [Hr].[Pracownik] ([PracownikId]),
    FOREIGN KEY ([StatusId]) REFERENCES [Serwis].[StatusyZamowienie] ([StatusyZamowienieId]),
    FOREIGN KEY ([ZamowienieId]) REFERENCES [Serwis].[Zamowienie] ([ZamowienieId])
);


GO

create trigger [Serwis].Trigger2HistoriaZamowienie on Serwis.HistoriaZamowienie
after update, insert
as
begin
insert into Serwis.HistoriaZamowienie (ZamowienieId,StatusId,PracownikId,DataWpisu,ModyfikowanyPrzez)
select i.ZamowienieId,i.StatusId,i.PracownikId,GETDATE(),SUSER_NAME()
from Serwis.HistoriaZamowienie as t
inner join inserted i on t.ZamowienieId=i.ZamowienieId
end
GO




create trigger [Serwis].TriggerHistoriaZamowienie on Serwis.HistoriaZamowienie
after update, insert
as
begin
insert into Serwis.HistoriaZamowienie (ZamowienieId,StatusId,PracownikId,DataWpisu)
select i.ZamowienieId,i.StatusId,i.PracownikId,GETDATE()
from Serwis.HistoriaZamowienie as t
inner join inserted i on t.ZamowienieId=i.ZamowienieId
end