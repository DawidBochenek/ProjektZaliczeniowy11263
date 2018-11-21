create function dbo.GetEaster(@year int)
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