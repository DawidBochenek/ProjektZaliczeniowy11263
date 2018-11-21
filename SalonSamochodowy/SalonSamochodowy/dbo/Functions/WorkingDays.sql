
CREATE FUNCTION dbo.WorkingDays
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