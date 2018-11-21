
-- Funkcja zwraca listę dni wolnych od pracy na podany rok
create function dbo.GetHolidays(@year int)
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