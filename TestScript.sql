USE [SalonSamochodowy]
GO
/****** Object:  Schema [Hr]    Script Date: 2018-12-30 15:34:54 ******/
CREATE SCHEMA [Hr]
GO
/****** Object:  Schema [Produkt]    Script Date: 2018-12-30 15:34:54 ******/
CREATE SCHEMA [Produkt]
GO
/****** Object:  Schema [RapOp]    Script Date: 2018-12-30 15:34:54 ******/
CREATE SCHEMA [RapOp]
GO
/****** Object:  Schema [Serwis]    Script Date: 2018-12-30 15:34:54 ******/
CREATE SCHEMA [Serwis]
GO
/****** Object:  UserDefinedFunction [dbo].[GetEaster]    Script Date: 2018-12-30 15:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GetEaster](@year int)
returns Date
as begin
	declare @Easter date
	declare @a int, @b int, @c int, @d int, @e int, @f int, @g int,
			@h int, @i int, @k int, @l int, @m int, @p int, @n int

	set @a = @year % 19
	set @b = @year / 100
	set @c = @year % 100

	set @d = @b / 4
	set @e = @b % 4

	set @f = (@b + 8) / 25
	set @g = (@b - @f + 1) / 3
	set @h = (19 * @a + @b - @d - @g + 15) % 30
	
	set @i = @c / 4
	set @k = @c % 4

	set @l = (32 + 2*@e + 2*@i - @h - @k) % 7 
	set @m = (@a + 11 * @h + 22 * @l) / 451

	set @p = (@h + @l - 7 * @m + 114) % 31
	set @p = @p + 1

	set @n = (@h + @l - 7 * @m + 114) / 31

	set @Easter = DATEFROMPARTS(@year, @n, @p)

	return @Easter


end

GO
/****** Object:  UserDefinedFunction [dbo].[GetHolidays]    Script Date: 2018-12-30 15:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Funkcja zwraca listę dni wolnych od pracy na podany rok
create function [dbo].[GetHolidays](@year int)
returns @Dates table (HolidayDate date, HolidayName nvarchar(100))
as 
begin
	declare @Easter date
	set @Easter = dbo.GetEaster(@year)

	insert into @Dates values
		(DATEFROMPARTS(@year, 1, 1),	'Nowy Rok'),
		(DATEFROMPARTS(@year, 1, 6),	'Trzech Króli (Objawienie Pańskie)'),
		(@Easter,						'Wielkanoc'),
		(dateadd(day, 1, @Easter),		'Poniedziałek Wielkanocny'),
		(DATEFROMPARTS(@year, 5, 1),	'Międzynarodowe Święto Pracy'),
		(DATEFROMPARTS(@year, 5, 3),	'Święto Konstytucji 3 Maja'),
		(dateadd(day, 60, @Easter),		'Boże Ciało'),
		(DATEFROMPARTS(@year, 8, 15),	'Święto Wojska Polskiego, Wniebowzięcie Najświętszej Maryi Panny'),
		(DATEFROMPARTS(@year, 11, 1),	'Wszystkich Świętych'),
		(DATEFROMPARTS(@year, 11, 11),	'Narodowe święto Niepodległości'),
		(DATEFROMPARTS(@year, 12, 25),	'Boże Narodzenie (pierwszy dzień)'),
		(DATEFROMPARTS(@year, 12, 26),	'Boże Narodzenie (drugi dzień)')
	return
end

GO
/****** Object:  UserDefinedFunction [dbo].[WorkingDays]    Script Date: 2018-12-30 15:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[WorkingDays]
(
	@StartDate datetime,
	@EndDate datetime
)
RETURNS int
AS
BEGIN
DECLARE @days int
 
DECLARE @SatName nvarchar(100),@SunName nvarchar(100)
 
-- niezależnie od języka traktujemy sobotę i niedzielę jako dzień wolny
SELECT @SatName = DATENAME(dw,5), @SunName = DATENAME(dw,6)
 
SELECT @days = DATEDIFF(d,@StartDate ,@EndDate ) - DATEDIFF(wk,@StartDate ,@EndDate ) * 2 
- CASE 
    WHEN DATENAME(dw, @StartDate) <> @SatName AND DATENAME(dw, @EndDate) = @SatName THEN 1 
    WHEN DATENAME(dw, @StartDate) = @SatName AND DATENAME(dw, @EndDate) <> @SatName THEN -1 
  ELSE 0 END
- (SELECT COUNT(*) FROM dbo.GetHolidays(year(@StartDate)) WHERE HolidayDate BETWEEN @StartDate AND @EndDate 
		AND DATENAME(dw, HolidayDate) <> @SatName 
		AND DATENAME(dw, HolidayDate) <> @SunName)
 
RETURN (@days)
 
END

GO
/****** Object:  Table [Hr].[Pracownik]    Script Date: 2018-12-30 15:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[Pracownik](
	[PracownikId] [int] NOT NULL,
	[PracownikKey] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [nvarchar](15) NOT NULL,
	[Nazwisko] [nvarchar](45) NOT NULL,
	[DataUrodzenia] [date] NOT NULL,
	[DataZatrudnienia] [date] NOT NULL,
	[PESEL] [int] NOT NULL,
	[Adres] [nvarchar](25) NOT NULL,
	[Miasto] [nvarchar](25) NOT NULL,
	[KodPocztowy] [nvarchar](6) NOT NULL,
	[Kraj] [nvarchar](25) NOT NULL,
	[Telefon] [nvarchar](20) NOT NULL,
	[StanowiskoId] [int] NULL,
	[ZespolId] [int] NULL,
	[Przelozony] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PracownikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PESEL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[Premie]    Script Date: 2018-12-30 15:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[Premie](
	[PremieId] [int] NOT NULL,
	[PremieKey] [int] IDENTITY(1,1) NOT NULL,
	[PracownikId] [int] NULL,
	[PremiaMnoznik] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[PremieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[Stanowisko]    Script Date: 2018-12-30 15:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[Stanowisko](
	[StanowiskoId] [int] NOT NULL,
	[StanowiskoKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StanowiskoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[Typ]    Script Date: 2018-12-30 15:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[Typ](
	[TypId] [int] NOT NULL,
	[TypKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[WynagrodzeniaPracwonika]    Script Date: 2018-12-30 15:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[WynagrodzeniaPracwonika](
	[WynId] [int] NOT NULL,
	[WynagrodzeniaKey] [int] IDENTITY(1,1) NOT NULL,
	[PracownikId] [int] NULL,
	[MiesiacRokId] [int] NOT NULL,
	[OkresOd] [date] NULL,
	[OkresDo] [date] NULL,
	[WartoscWynagrodzenia] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[WynId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[Wyplaty]    Script Date: 2018-12-30 15:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[Wyplaty](
	[PracownikId] [int] NOT NULL,
	[MiesiacRokId] [int] NOT NULL,
	[WynId] [int] NOT NULL,
	[WyplatyKey] [int] IDENTITY(1,1) NOT NULL,
	[PremieId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PracownikId] ASC,
	[MiesiacRokId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[Zespol]    Script Date: 2018-12-30 15:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[Zespol](
	[ZespolId] [int] NOT NULL,
	[ZespolKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ZespolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Cennik]    Script Date: 2018-12-30 15:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Cennik](
	[CennikId] [int] NOT NULL,
	[CennikKey] [int] IDENTITY(1,1) NOT NULL,
	[ModelId] [int] NOT NULL,
	[DataDodania] [date] NOT NULL,
	[DataObowiazywania] [date] NOT NULL,
	[CenaNominalna] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[CennikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[CennikWyposzazenia]    Script Date: 2018-12-30 15:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[CennikWyposzazenia](
	[CennikWypoId] [int] NOT NULL,
	[CennikWyposzazeniaKey] [int] IDENTITY(1,1) NOT NULL,
	[WyposzazenieId] [int] NOT NULL,
	[ModelId] [int] NOT NULL,
	[DataDodania] [date] NOT NULL,
	[DataObowiazywania] [date] NOT NULL,
	[CenaNominalna] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[CennikWypoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Do]    Script Date: 2018-12-30 15:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Do](
	[DoId] [int] NOT NULL,
	[DoKey] [int] IDENTITY(1,1) NOT NULL,
	[Seria] [nvarchar](12) NOT NULL,
	[WydanyPrzez] [nvarchar](45) NOT NULL,
	[WaznyDo] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Klient]    Script Date: 2018-12-30 15:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Klient](
	[KlientId] [int] NOT NULL,
	[KlientKey] [int] IDENTITY(1,1) NOT NULL,
	[KlientImiePierwsze] [nvarchar](20) NOT NULL,
	[KlientImieDrugie] [nvarchar](20) NOT NULL,
	[KlientNazwisko] [nvarchar](35) NOT NULL,
	[DataDodania] [date] NOT NULL,
	[Telefon] [int] NOT NULL,
	[EmailId] [nvarchar](45) NOT NULL,
	[DowodOsobistyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[KlientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Marka]    Script Date: 2018-12-30 15:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Marka](
	[MarkaId] [int] NOT NULL,
	[MarkaKey] [int] IDENTITY(1,1) NOT NULL,
	[NazwaSkr] [nvarchar](8) NULL,
	[NazwaDl] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[MarkaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Model]    Script Date: 2018-12-30 15:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Model](
	[ModelId] [int] NOT NULL,
	[ModelKey] [int] IDENTITY(1,1) NOT NULL,
	[MarkaId] [int] NULL,
	[Nazwa] [nvarchar](30) NOT NULL,
	[TypNadwoziaId] [int] NULL,
	[SegmentId] [int] NULL,
	[SilnikId] [int] NULL,
	[PakietId] [int] NULL,
	[Rocznik] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Pakiet]    Script Date: 2018-12-30 15:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Pakiet](
	[PakietId] [int] NOT NULL,
	[PakietKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PakietId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[PakietLista]    Script Date: 2018-12-30 15:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[PakietLista](
	[PakietId] [int] NOT NULL,
	[PakietKey] [int] IDENTITY(1,1) NOT NULL,
	[WyposzazenieId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PakietId] ASC,
	[WyposzazenieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[RodzajSilnika]    Script Date: 2018-12-30 15:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[RodzajSilnika](
	[RodzajSilnikaId] [int] NOT NULL,
	[RodzajSilnikaKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](12) NOT NULL,
	[Opis] [nvarchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[RodzajSilnikaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Samochod]    Script Date: 2018-12-30 15:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Samochod](
	[SamochodId] [int] NOT NULL,
	[SamochodKey] [int] IDENTITY(1,1) NOT NULL,
	[NrVin] [nvarchar](45) NOT NULL,
	[ModelId] [int] NULL,
	[ZamowienieId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SamochodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Segment]    Script Date: 2018-12-30 15:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Segment](
	[SegmentId] [int] NOT NULL,
	[SegmentKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SegmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Silnik]    Script Date: 2018-12-30 15:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Silnik](
	[SilnikId] [int] NOT NULL,
	[SilnikKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](25) NOT NULL,
	[PojemnoscCcm] [decimal](6, 2) NOT NULL,
	[IloscKm] [smallint] NULL,
	[RodzajSilnikaId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SilnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[TypNadwozia]    Script Date: 2018-12-30 15:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[TypNadwozia](
	[TypNadwoziaId] [int] NOT NULL,
	[TypNadwoziaKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypNadwoziaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[TypWyposazenia]    Script Date: 2018-12-30 15:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[TypWyposazenia](
	[TypWyposazeniaId] [int] NOT NULL,
	[TypWyposazeniaKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypWyposazeniaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Wyposzazenie]    Script Date: 2018-12-30 15:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Wyposzazenie](
	[WyposzazenieId] [int] NOT NULL,
	[WyposzazenieKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](30) NOT NULL,
	[TypWyposazeniaId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[WyposzazenieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Zamownienie]    Script Date: 2018-12-30 15:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Zamownienie](
	[ZamownienieId] [int] NOT NULL,
	[ZamownienieKey] [int] IDENTITY(1,1) NOT NULL,
	[KlientId] [int] NOT NULL,
	[PracownikId] [int] NOT NULL,
	[CenaSprzedazy] [money] NULL,
	[DataZlozenia] [date] NULL,
	[DataOdbioru] [date] NULL,
	[StatusRealizacji] [bit] NOT NULL,
	[StatusPlatnosci] [bit] NOT NULL,
	[ModelId] [int] NULL,
	[PakietId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ZamownienieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Serwis].[CennikUslugi]    Script Date: 2018-12-30 15:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Serwis].[CennikUslugi](
	[CennikUslugiId] [int] NOT NULL,
	[CennikUslugiKey] [int] IDENTITY(1,1) NOT NULL,
	[UslugiId] [int] NULL,
	[DataObowOd] [date] NULL,
	[DataObowDo] [date] NULL,
	[Cena] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[CennikUslugiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Serwis].[StatusyZamowienie]    Script Date: 2018-12-30 15:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Serwis].[StatusyZamowienie](
	[StatusyZamowienieId] [int] NOT NULL,
	[StatusyZamownienieKey] [int] IDENTITY(1,1) NOT NULL,
	[NazaStatusu] [nvarchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusyZamowienieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Serwis].[Uslugi]    Script Date: 2018-12-30 15:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Serwis].[Uslugi](
	[UslugiId] [int] NOT NULL,
	[UslugiKey] [int] IDENTITY(1,1) NOT NULL,
	[NazwaUslugi] [nvarchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UslugiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Serwis].[Zamowienie]    Script Date: 2018-12-30 15:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Serwis].[Zamowienie](
	[ZamowienieId] [int] NOT NULL,
	[ZamowienieKey] [int] IDENTITY(1,1) NOT NULL,
	[StatusyZamowienieId] [int] NULL,
	[KlientId] [int] NOT NULL,
	[PracownikId] [int] NOT NULL,
	[DataZlozenia] [date] NOT NULL,
	[DataZakonczenia] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ZamowienieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Produkt].[Wyposzazenie] ADD  DEFAULT ((1)) FOR [TypWyposazeniaId]
GO
ALTER TABLE [Hr].[Pracownik]  WITH CHECK ADD FOREIGN KEY([Przelozony])
REFERENCES [Hr].[Pracownik] ([PracownikId])
GO
ALTER TABLE [Hr].[Pracownik]  WITH CHECK ADD FOREIGN KEY([StanowiskoId])
REFERENCES [Hr].[Stanowisko] ([StanowiskoId])
ON DELETE SET NULL
GO
ALTER TABLE [Hr].[Pracownik]  WITH CHECK ADD FOREIGN KEY([ZespolId])
REFERENCES [Hr].[Zespol] ([ZespolId])
ON DELETE SET NULL
GO
ALTER TABLE [Hr].[Premie]  WITH CHECK ADD FOREIGN KEY([PracownikId])
REFERENCES [Hr].[Pracownik] ([PracownikId])
GO
ALTER TABLE [Hr].[WynagrodzeniaPracwonika]  WITH CHECK ADD FOREIGN KEY([PracownikId])
REFERENCES [Hr].[Pracownik] ([PracownikId])
GO
ALTER TABLE [Hr].[Wyplaty]  WITH CHECK ADD FOREIGN KEY([PremieId])
REFERENCES [Hr].[Premie] ([PremieId])
GO
ALTER TABLE [Hr].[Wyplaty]  WITH CHECK ADD FOREIGN KEY([WynId])
REFERENCES [Hr].[WynagrodzeniaPracwonika] ([WynId])
GO
ALTER TABLE [Produkt].[Cennik]  WITH CHECK ADD FOREIGN KEY([ModelId])
REFERENCES [Produkt].[Model] ([ModelId])
GO
ALTER TABLE [Produkt].[CennikWyposzazenia]  WITH CHECK ADD FOREIGN KEY([ModelId])
REFERENCES [Produkt].[Model] ([ModelId])
GO
ALTER TABLE [Produkt].[CennikWyposzazenia]  WITH CHECK ADD FOREIGN KEY([WyposzazenieId])
REFERENCES [Produkt].[Wyposzazenie] ([WyposzazenieId])
GO
ALTER TABLE [Produkt].[Klient]  WITH CHECK ADD FOREIGN KEY([DowodOsobistyId])
REFERENCES [Produkt].[Do] ([DoId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[Model]  WITH CHECK ADD FOREIGN KEY([MarkaId])
REFERENCES [Produkt].[Marka] ([MarkaId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[Model]  WITH CHECK ADD FOREIGN KEY([PakietId])
REFERENCES [Produkt].[Pakiet] ([PakietId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[Model]  WITH CHECK ADD FOREIGN KEY([SegmentId])
REFERENCES [Produkt].[Segment] ([SegmentId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[Model]  WITH CHECK ADD FOREIGN KEY([SilnikId])
REFERENCES [Produkt].[Silnik] ([SilnikId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[Model]  WITH CHECK ADD FOREIGN KEY([TypNadwoziaId])
REFERENCES [Produkt].[TypNadwozia] ([TypNadwoziaId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[PakietLista]  WITH CHECK ADD FOREIGN KEY([WyposzazenieId])
REFERENCES [Produkt].[Wyposzazenie] ([WyposzazenieId])
GO
ALTER TABLE [Produkt].[Samochod]  WITH CHECK ADD FOREIGN KEY([ModelId])
REFERENCES [Produkt].[Model] ([ModelId])
GO
ALTER TABLE [Produkt].[Samochod]  WITH CHECK ADD FOREIGN KEY([ZamowienieId])
REFERENCES [Produkt].[Zamownienie] ([ZamownienieId])
GO
ALTER TABLE [Produkt].[Silnik]  WITH CHECK ADD FOREIGN KEY([RodzajSilnikaId])
REFERENCES [Produkt].[RodzajSilnika] ([RodzajSilnikaId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[Wyposzazenie]  WITH CHECK ADD FOREIGN KEY([TypWyposazeniaId])
REFERENCES [Produkt].[TypWyposazenia] ([TypWyposazeniaId])
GO
ALTER TABLE [Produkt].[Zamownienie]  WITH CHECK ADD FOREIGN KEY([KlientId])
REFERENCES [Produkt].[Klient] ([KlientId])
GO
ALTER TABLE [Produkt].[Zamownienie]  WITH CHECK ADD FOREIGN KEY([ModelId])
REFERENCES [Produkt].[Model] ([ModelId])
GO
ALTER TABLE [Produkt].[Zamownienie]  WITH CHECK ADD FOREIGN KEY([PakietId])
REFERENCES [Produkt].[Pakiet] ([PakietId])
GO
ALTER TABLE [Produkt].[Zamownienie]  WITH CHECK ADD FOREIGN KEY([PracownikId])
REFERENCES [Hr].[Pracownik] ([PracownikId])
GO
ALTER TABLE [Serwis].[CennikUslugi]  WITH CHECK ADD FOREIGN KEY([UslugiId])
REFERENCES [Serwis].[Uslugi] ([UslugiId])
ON DELETE SET NULL
GO
ALTER TABLE [Serwis].[Zamowienie]  WITH CHECK ADD FOREIGN KEY([KlientId])
REFERENCES [Produkt].[Klient] ([KlientId])
GO
ALTER TABLE [Serwis].[Zamowienie]  WITH CHECK ADD FOREIGN KEY([PracownikId])
REFERENCES [Hr].[Pracownik] ([PracownikId])
GO
ALTER TABLE [Serwis].[Zamowienie]  WITH CHECK ADD FOREIGN KEY([StatusyZamowienieId])
REFERENCES [Serwis].[StatusyZamowienie] ([StatusyZamowienieId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[Zamownienie]  WITH CHECK ADD CHECK  (([CenaSprzedazy]>(0)))
GO
